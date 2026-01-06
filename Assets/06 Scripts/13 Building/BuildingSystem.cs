using System.Collections.Generic;
using UnityEngine;

public class BuildingSystem : MonoBehaviour
{
    public enum Mode { None, Build, Destroy }

    [Header("Build Item")]
    [SerializeField] private BuildItemSO currentItem;

    [Header("Raycast")]
    [SerializeField] private Camera cam;
    [SerializeField] private LayerMask groundMask = ~0;
    [SerializeField] private LayerMask overlapMask = ~0;
    [SerializeField] private float maxDistance = 50f;

    [Header("Preview")]
    [SerializeField] private Material previewMaterial;
    [SerializeField] private Color validColor = new Color(0f, 1f, 0f, 0.35f);
    [SerializeField] private Color invalidColor = new Color(1f, 0f, 0f, 0.35f);
    [SerializeField] private Color destroyColor = new Color(1f, 0f, 0f, 0.5f);

    [Header("Rotation")]
    [SerializeField] private float rotationIncrement = 45f;
    [SerializeField] private KeyCode rotateKey = KeyCode.R;

    [Header("Snapping")]
    [SerializeField] private bool enableSnapping = true;
    [SerializeField] private float snapGridSize = 1f;
    [SerializeField] private bool snapToWorldGrid = true;

    [Header("Snap Toggle")]
    [SerializeField] private KeyCode toggleSnapKey = KeyCode.V;
    [SerializeField] private bool startWithSnappingOn = true;

    [Header("Ground Support Check")]
    [SerializeField] private bool requireGroundSupport = true;
    [SerializeField] private float supportRayDistance = 0.5f;

    private PreviewGroundSupport supportCheck;
    private bool snapToggledOn;


    private BuildingPreview preview;
    private Mode currentMode = Mode.None;
    private bool inputCooldown;
    private float currentRotation = 0f;

    [SerializeField] private bool destroyDebug = true;

    // --- Destroy-mode highlighting (FIXED) ---
    private PlacedBuilding highlightedBuilding;

    private struct RendererRestore
    {
        public Renderer renderer;
        public Material[] originalSharedMaterials;
    }

    private readonly List<RendererRestore> restoreCache = new List<RendererRestore>(32);
    private Material destroyMaterialInstance;

    // Reuse buffer to avoid allocations
    private RaycastHit[] rayHits = new RaycastHit[32];
    private int ignoreRaycastLayerMask;

    public Mode CurrentMode => currentMode;
    public BuildItemSO CurrentItem => currentItem;

    private void Awake()
    {
        if (cam == null) cam = Camera.main;

        snapToggledOn = startWithSnappingOn;

        int ignoreLayer = LayerMask.NameToLayer("Ignore Raycast");
        ignoreRaycastLayerMask = (ignoreLayer >= 0) ? ~(1 << ignoreLayer) : ~0;

        // One shared instance for destroy highlight
        if (previewMaterial != null)
        {
            destroyMaterialInstance = new Material(previewMaterial);
            ApplyDestroyColor(destroyMaterialInstance, destroyColor);
        }
    }

    private void OnDestroy()
    {
        if (destroyMaterialInstance != null)
            Destroy(destroyMaterialInstance);
    }

    private void Update()
    {
        switch (currentMode)
        {
            case Mode.Build:
                UpdateBuildMode();
                break;
            case Mode.Destroy:
                UpdateDestroyMode();
                break;
        }

        if (InputHandler.Pressed(GameAction.GameplayMouseRightClick))
            ExitAllModes();

        inputCooldown = false;
    }

    public void EnterBuildMode()
    {
        if (currentItem == null || currentItem.prefab == null) return;

        ExitDestroyMode();
        currentMode = Mode.Build;
        inputCooldown = true;
        currentRotation = 0f;
        CreatePreview();
    }

    public void ExitBuildMode()
    {
        if (currentMode == Mode.Build)
            currentMode = Mode.None;

        DestroyPreview();
    }

    public void EnterDestroyMode()
    {
        ExitBuildMode();
        currentMode = Mode.Destroy;
        inputCooldown = true;

        // Make sure we have a highlight material instance
        if (destroyMaterialInstance == null && previewMaterial != null)
        {
            destroyMaterialInstance = new Material(previewMaterial);
            ApplyDestroyColor(destroyMaterialInstance, destroyColor);
        }
    }

    public void ExitDestroyMode()
    {
        if (currentMode == Mode.Destroy)
        {
            ClearHighlight();
            currentMode = Mode.None;
        }
    }

    public void ExitAllModes()
    {
        ExitBuildMode();
        ExitDestroyMode();
    }

    public void SetBuildItem(BuildItemSO item)
    {
        currentItem = item;
        currentRotation = 0f;
        if (currentMode == Mode.Build)
        {
            DestroyPreview();
            CreatePreview();
        }
    }

    // ---------------- BUILD MODE (unchanged except it calls your existing methods) ----------------
    private void UpdateBuildMode()
    {
        if (preview == null) return;

        if (Input.GetKeyDown(toggleSnapKey) && IsSnapOptionAvailable())
        {
            snapToggledOn = !snapToggledOn;
        }

        if (Input.GetKeyDown(rotateKey))
        {
            currentRotation += rotationIncrement;
            if (currentRotation >= 360f) currentRotation -= 360f;
        }

        if (!TryGetSurfacePoint(out Vector3 point, out Vector3 normal))
        {
            preview.gameObject.SetActive(false);
            return;
        }

        if (IsSnappingActiveForCurrentItem())
        {
            point = ApplySnapping(point, normal);
        }

        preview.gameObject.SetActive(true);

        Quaternion baseRotation = Quaternion.FromToRotation(Vector3.up, normal);
        Quaternion userRotation = Quaternion.AngleAxis(currentRotation, normal);
        preview.transform.position = point;
        preview.transform.rotation = baseRotation * userRotation;

        bool validSurface = IsSurfaceValid(normal);
        bool noOverlap = !preview.HasOverlap();

        bool supported = true;
        if (requireGroundSupport && supportCheck != null)
            supported = supportCheck.HasSupport();

        /// Check resource requirements
        bool hasResources = HasRequiredResources();

        bool canPlace = validSurface && noOverlap && supported && hasResources;

        preview.SetColor(canPlace ? validColor : invalidColor);

        if (!inputCooldown && canPlace && InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
            Place();
    }

    /// Check if player has all required resources for current building
    bool HasRequiredResources()
    {
        if (currentItem == null || currentItem.requiredResources == null || currentItem.requiredResources.Length == 0)
            return true;

        foreach (var requirement in currentItem.requiredResources)
        {
            if (!InventoryManager.Instance.HasResources(requirement.item, requirement.quantity))
                return false;
        }
        return true;
    }

    /// Consume required resources when placing building
    bool ConsumeResources()
    {
        if (currentItem == null || currentItem.requiredResources == null || currentItem.requiredResources.Length == 0)
            return true;

        foreach (var requirement in currentItem.requiredResources)
        {
            if (!InventoryManager.Instance.RemoveItem(requirement.item, requirement.quantity))
                return false;
        }
        return true;
    }


    // ---------------- DESTROY MODE (FIXED) ----------------
    private void UpdateDestroyMode()
    {
        if (TryGetBuildingUnderAim(out PlacedBuilding building, out RaycastHit hit, out string reason))
        {
            if (building != highlightedBuilding)
            {
                ClearHighlight();
                HighlightBuilding(building);
            }

            if (!inputCooldown && InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
            {
                ClearHighlight();

                /// Drop resources before destroying
                building.DropResources();

                Destroy(building.gameObject);
            }
        }
        else
        {
            if (destroyDebug && !string.IsNullOrEmpty(reason))
                Debug.Log($"[DestroyMode] No building: {reason}");

            ClearHighlight();
        }
    }

    private bool TryGetBuildingUnderAim(out PlacedBuilding building, out RaycastHit chosenHit, out string reason)
    {
        building = null;
        chosenHit = default;
        reason = "";

        Ray ray = GetAimRay();

        // Raycast EVERYTHING except Ignore Raycast layer. This bypasses bad buildingMask setup.
        int ignoreLayer = LayerMask.NameToLayer("Ignore Raycast");
        int mask = (ignoreLayer >= 0) ? ~(1 << ignoreLayer) : ~0;

        int hitCount = Physics.RaycastNonAlloc(ray, rayHits, maxDistance, mask, QueryTriggerInteraction.Ignore);
        if (hitCount <= 0)
        {
            reason = "Raycast hit nothing (check camera + maxDistance + colliders exist).";
            return false;
        }

        // Find nearest hit that has a PlacedBuilding in parents
        float bestDist = float.MaxValue;
        int bestIndex = -1;
        PlacedBuilding bestBuilding = null;

        for (int i = 0; i < hitCount; i++)
        {
            var h = rayHits[i];
            if (h.collider == null) continue;

            var pb = h.collider.GetComponentInParent<PlacedBuilding>();
            if (pb == null) continue;

            if (h.distance < bestDist)
            {
                bestDist = h.distance;
                bestIndex = i;
                bestBuilding = pb;
            }
        }

        if (bestIndex < 0 || bestBuilding == null)
        {
            return false;
        }

        chosenHit = rayHits[bestIndex];
        building = bestBuilding;
        return true;
    }



    private void HighlightBuilding(PlacedBuilding building)
    {
        highlightedBuilding = building;
        restoreCache.Clear();

        // Grab every renderer under the pivot parent (including inactive if needed)
        var renderers = building.GetComponentsInChildren<Renderer>(true);

        for (int i = 0; i < renderers.Length; i++)
        {
            var r = renderers[i];
            if (r == null) continue;

            // Cache originals (FULL array, not just .material)
            var original = r.sharedMaterials;
            restoreCache.Add(new RendererRestore { renderer = r, originalSharedMaterials = original });

            // If no preview material assigned, at least do nothing gracefully
            if (destroyMaterialInstance == null) continue;

            // Replace ALL sub-materials so multi-material meshes highlight fully
            var replaced = new Material[original.Length];
            for (int m = 0; m < replaced.Length; m++)
                replaced[m] = destroyMaterialInstance;

            r.sharedMaterials = replaced;
        }
    }

    private void ClearHighlight()
    {
        if (highlightedBuilding == null) return;

        for (int i = 0; i < restoreCache.Count; i++)
        {
            var entry = restoreCache[i];
            if (entry.renderer != null)
                entry.renderer.sharedMaterials = entry.originalSharedMaterials;
        }

        restoreCache.Clear();
        highlightedBuilding = null;
    }

    private static void ApplyDestroyColor(Material mat, Color color)
    {
        if (mat == null) return;

        if (mat.HasProperty("_Color"))
            mat.color = color;

        if (mat.HasProperty("_BaseColor"))
            mat.SetColor("_BaseColor", color);
    }

    // ---------------- rest of your existing methods (unchanged) ----------------
    private Vector3 ApplySnapping(Vector3 position, Vector3 normal)
    {
        if (snapToWorldGrid)
        {
            // Always snap horizontally
            position.x = Mathf.Round(position.x / snapGridSize) * snapGridSize;
            position.z = Mathf.Round(position.z / snapGridSize) * snapGridSize;

            // Only snap Y when the current item is NOT GroundOnly
            // (GroundOnly keeps the raycast height so it sits on terrain properly)
            if (currentItem == null || currentItem.allowedSurfaces != PlacementSurface.GroundOnly)
            {
                position.y = Mathf.Round(position.y / snapGridSize) * snapGridSize;
            }
        }
        else
        {
            Vector3 right = Vector3.Cross(Vector3.up, normal);
            if (right.magnitude < 0.001f)
                right = Vector3.Cross(Vector3.forward, normal);
            right.Normalize();

            Vector3 forward = Vector3.Cross(normal, right).normalized;

            Vector3 surfaceOrigin = Vector3.zero;
            Vector3 localPos = position - surfaceOrigin;

            float localX = Vector3.Dot(localPos, right);
            float localZ = Vector3.Dot(localPos, forward);
            float localY = Vector3.Dot(localPos, normal);

            localX = Mathf.Round(localX / snapGridSize) * snapGridSize;
            localZ = Mathf.Round(localZ / snapGridSize) * snapGridSize;

            // localY stays unsnapped (keeps height along the surface normal)
            position = surfaceOrigin + right * localX + forward * localZ + normal * localY;
        }

        return position;
    }


    private bool IsSurfaceValid(Vector3 normal)
    {
        if (currentItem == null) return false;

        float angle = Vector3.Angle(Vector3.up, normal);
        bool isGround = angle <= currentItem.maxGroundAngle;
        bool isWall = angle >= 90f - currentItem.maxWallAngle && angle <= 90f + currentItem.maxWallAngle;

        return currentItem.allowedSurfaces switch
        {
            PlacementSurface.GroundOnly => isGround,
            PlacementSurface.WallOnly => isWall,
            PlacementSurface.Both => isGround || isWall,
            _ => false
        };
    }

    private bool IsSnapOptionAvailable()
    {

        return enableSnapping && currentItem != null && !currentItem.cantSnapToGrid;
    }

    private bool IsSnappingActiveForCurrentItem()
    {
        return IsSnapOptionAvailable() && snapToggledOn;
    }


    private void Place()
    {
        if (!ConsumeResources())
        {
            Debug.LogWarning("Failed to consume resources for building!");
            return;
        }

        var obj = Instantiate(currentItem.prefab, preview.transform.position, preview.transform.rotation);

        var placed = obj.GetComponent<PlacedBuilding>();
        if (placed == null) placed = obj.AddComponent<PlacedBuilding>();
        placed.buildItem = currentItem;
    }

    private void CreatePreview()
    {
        if (preview != null || currentItem == null || currentItem.prefab == null) return;

        var obj = Instantiate(currentItem.prefab);
        obj.name = $"[Preview] {currentItem.displayName}";

        preview = obj.AddComponent<BuildingPreview>();
        preview.Initialize(previewMaterial, overlapMask, groundMask);

        // NEW: grab support checker from child footprint
        supportCheck = obj.GetComponentInChildren<PreviewGroundSupport>(true);
        if (supportCheck != null)
            supportCheck.Initialize(groundMask, supportRayDistance);
    }


    private void DestroyPreview()
    {
        if (preview != null) Destroy(preview.gameObject);
        preview = null;
        supportCheck = null;
    }


    private bool TryGetSurfacePoint(out Vector3 point, out Vector3 normal)
    {
        Ray ray = GetAimRay();

        if (Physics.Raycast(ray, out RaycastHit hit, maxDistance, groundMask, QueryTriggerInteraction.Ignore))
        {
            point = hit.point;
            normal = hit.normal;

            // NEW: only accept the hit if it matches the current item's allowed surface.
            if (currentItem != null && !IsHitSurfacePreviewableForItem(normal))
                return false;

            return true;
        }

        point = default;
        normal = Vector3.up;
        return false;
    }

    private bool IsHitSurfacePreviewableForItem(Vector3 normal)
    {
        if (currentItem == null) return false;

        float angleFromUp = Vector3.Angle(Vector3.up, normal);

        // Ground-like means "close enough to up"
        bool isGroundLike = angleFromUp <= currentItem.maxGroundAngle;

        // Wall-like means "close enough to 90 degrees from up"
        bool isWallLike = Mathf.Abs(angleFromUp - 90f) <= currentItem.maxWallAngle;

        return currentItem.allowedSurfaces switch
        {
            PlacementSurface.GroundOnly => isGroundLike,
            PlacementSurface.WallOnly => isWallLike,
            PlacementSurface.Both => isGroundLike || isWallLike,
            _ => false
        };
    }


    private Ray GetAimRay()
    {
        if (cam == null) cam = Camera.main;
        if (cam == null) return new Ray(Vector3.zero, Vector3.forward);
        return cam.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0f));
    }
}
