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
    [SerializeField] private KeyCode toggleSnapKey = KeyCode.V;
    [SerializeField] private bool startWithSnappingOn = true;

    [Header("Ground Support")]
    [SerializeField] private bool requireGroundSupport = true;
    [SerializeField] private float supportRayDistance = 0.5f;

    BuildingPreview preview;
    PreviewGroundSupport supportCheck;
    Mode currentMode = Mode.None;
    bool inputCooldown;
    float currentRotation;
    bool snapToggledOn;

    // Destroy mode
    PlacedBuilding highlightedBuilding;
    readonly List<RendererRestore> restoreCache = new List<RendererRestore>(32);
    Material destroyMaterialInstance;
    readonly RaycastHit[] rayHits = new RaycastHit[32];

    struct RendererRestore
    {
        public Renderer renderer;
        public Material[] originalMaterials;
    }

    public Mode CurrentMode => currentMode;
    public BuildItemSO CurrentItem => currentItem;

    void Awake()
    {
        if (cam == null) cam = Camera.main;
        snapToggledOn = startWithSnappingOn;

        if (previewMaterial != null)
        {
            destroyMaterialInstance = new Material(previewMaterial);
            ApplyColor(destroyMaterialInstance, destroyColor);
        }
    }

    void OnDestroy()
    {
        if (destroyMaterialInstance != null)
            Destroy(destroyMaterialInstance);
    }

    void Update()
    {
        switch (currentMode)
        {
            case Mode.Build: UpdateBuildMode(); break;
            case Mode.Destroy: UpdateDestroyMode(); break;
        }

        if (InputHandler.Pressed(GameAction.GameplayMouseRightClick))
            ExitAllModes();

        inputCooldown = false;
    }

    #region Public API
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
        EnsureDestroyMaterial();
    }

    public void ExitDestroyMode()
    {
        if (currentMode != Mode.Destroy) return;
        ClearHighlight();
        currentMode = Mode.None;
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
    #endregion

    #region Build Mode
    void UpdateBuildMode()
    {
        if (preview == null) return;

        HandleBuildInput();

        if (!TryGetSurfacePoint(out Vector3 point, out Vector3 normal))
        {
            preview.gameObject.SetActive(false);
            return;
        }

        if (IsSnappingActive())
            point = ApplySnapping(point, normal);

        preview.gameObject.SetActive(true);
        ApplyPreviewTransform(point, normal);
        UpdatePreviewColor();
    }

    void HandleBuildInput()
    {
        if (Input.GetKeyDown(toggleSnapKey) && IsSnapAvailable())
            snapToggledOn = !snapToggledOn;

        if (Input.GetKeyDown(rotateKey))
        {
            currentRotation += rotationIncrement;
            if (currentRotation >= 360f) currentRotation -= 360f;
        }
    }

    void ApplyPreviewTransform(Vector3 point, Vector3 normal)
    {
        Quaternion baseRot = Quaternion.FromToRotation(Vector3.up, normal);
        Quaternion userRot = Quaternion.AngleAxis(currentRotation, normal);
        preview.transform.position = point;
        preview.transform.rotation = baseRot * userRot;
    }

    void UpdatePreviewColor()
    {
        bool canPlace = IsSurfaceValid(preview.transform.up) &&
                        !preview.HasOverlap() &&
                        CheckGroundSupport() &&
                        HasRequiredResources();

        preview.SetColor(canPlace ? validColor : invalidColor);

        if (!inputCooldown && canPlace && InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
            Place();
    }

    bool CheckGroundSupport()
    {
        if (!requireGroundSupport || supportCheck == null) return true;
        return supportCheck.HasSupport();
    }

    bool HasRequiredResources()
    {
        if (currentItem?.requiredResources == null) return true;
        foreach (var req in currentItem.requiredResources)
            if (!InventoryManager.Instance.HasResources(req.item, req.quantity))
                return false;
        return true;
    }

    void Place()
    {
        if (!ConsumeResources()) return;

        var obj = Instantiate(currentItem.prefab, preview.transform.position, preview.transform.rotation);
        var placed = obj.GetComponent<PlacedBuilding>() ?? obj.AddComponent<PlacedBuilding>();
        placed.buildItem = currentItem;
    }

    bool ConsumeResources()
    {
        if (currentItem?.requiredResources == null) return true;
        foreach (var req in currentItem.requiredResources)
            if (!InventoryManager.Instance.RemoveItem(req.item, req.quantity))
                return false;
        return true;
    }
    #endregion

    #region Destroy Mode
    void UpdateDestroyMode()
    {
        if (TryGetBuildingUnderAim(out PlacedBuilding building))
        {
            if (building != highlightedBuilding)
            {
                ClearHighlight();
                HighlightBuilding(building);
            }

            if (!inputCooldown && InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
                DestroyBuilding(building);
        }
        else
        {
            ClearHighlight();
        }
    }

    void DestroyBuilding(PlacedBuilding building)
    {
        ClearHighlight();

        var chest = building.GetComponentInChildren<StorageChest>();
        if (chest != null) chest.DropStoredItems();

        building.DropResources();
        Destroy(building.gameObject);
    }

    bool TryGetBuildingUnderAim(out PlacedBuilding building)
    {
        building = null;
        Ray ray = GetAimRay();

        int ignoreLayer = LayerMask.NameToLayer("Ignore Raycast");
        int mask = ignoreLayer >= 0 ? ~(1 << ignoreLayer) : ~0;

        int hitCount = Physics.RaycastNonAlloc(ray, rayHits, maxDistance, mask, QueryTriggerInteraction.Ignore);

        float bestDist = float.MaxValue;
        for (int i = 0; i < hitCount; i++)
        {
            var h = rayHits[i];
            if (h.collider == null) continue;

            var pb = h.collider.GetComponentInParent<PlacedBuilding>();
            if (pb != null && h.distance < bestDist)
            {
                bestDist = h.distance;
                building = pb;
            }
        }

        return building != null;
    }

    void HighlightBuilding(PlacedBuilding building)
    {
        highlightedBuilding = building;
        restoreCache.Clear();

        foreach (var r in building.GetComponentsInChildren<Renderer>(true))
        {
            if (r == null) continue;
            restoreCache.Add(new RendererRestore { renderer = r, originalMaterials = r.sharedMaterials });

            if (destroyMaterialInstance == null) continue;

            var replaced = new Material[r.sharedMaterials.Length];
            for (int m = 0; m < replaced.Length; m++)
                replaced[m] = destroyMaterialInstance;
            r.sharedMaterials = replaced;
        }
    }

    void ClearHighlight()
    {
        if (highlightedBuilding == null) return;

        foreach (var entry in restoreCache)
            if (entry.renderer != null)
                entry.renderer.sharedMaterials = entry.originalMaterials;

        restoreCache.Clear();
        highlightedBuilding = null;
    }

    void EnsureDestroyMaterial()
    {
        if (destroyMaterialInstance != null || previewMaterial == null) return;
        destroyMaterialInstance = new Material(previewMaterial);
        ApplyColor(destroyMaterialInstance, destroyColor);
    }
    #endregion

    #region Snapping
    bool IsSnapAvailable() => enableSnapping && currentItem != null && !currentItem.cantSnapToGrid;
    bool IsSnappingActive() => IsSnapAvailable() && snapToggledOn;

    Vector3 ApplySnapping(Vector3 position, Vector3 normal)
    {
        if (!snapToWorldGrid)
            return ApplyLocalSnapping(position, normal);

        Quaternion finalRot = Quaternion.FromToRotation(Vector3.up, normal) *
                              Quaternion.AngleAxis(currentRotation, normal);

        Vector3 gridRight = Vector3.ProjectOnPlane(finalRot * Vector3.right, normal).normalized;
        Vector3 gridForward = Vector3.ProjectOnPlane(finalRot * Vector3.forward, normal).normalized;

        Vector3 toPoint = position;
        float x = Mathf.Round(Vector3.Dot(toPoint, gridRight) / snapGridSize) * snapGridSize;
        float z = Mathf.Round(Vector3.Dot(toPoint, gridForward) / snapGridSize) * snapGridSize;

        Vector3 snapped = gridRight * x + gridForward * z;

        if (currentItem?.allowedSurfaces == PlacementSurface.GroundOnly)
            snapped += normal * Vector3.Dot(position - snapped, normal);

        return snapped;
    }

    Vector3 ApplyLocalSnapping(Vector3 position, Vector3 normal)
    {
        Vector3 right = Vector3.Cross(Vector3.up, normal);
        if (right.magnitude < 0.001f)
            right = Vector3.Cross(Vector3.forward, normal);
        right.Normalize();

        Vector3 forward = Vector3.Cross(normal, right).normalized;

        float localX = Mathf.Round(Vector3.Dot(position, right) / snapGridSize) * snapGridSize;
        float localZ = Mathf.Round(Vector3.Dot(position, forward) / snapGridSize) * snapGridSize;
        float localY = Vector3.Dot(position, normal);

        return right * localX + forward * localZ + normal * localY;
    }
    #endregion

    #region Surface Validation
    bool IsSurfaceValid(Vector3 normal)
    {
        if (currentItem == null) return false;

        float angle = Vector3.Angle(Vector3.up, normal);
        bool isGround = angle <= currentItem.maxGroundAngle;
        bool isWall = Mathf.Abs(angle - 90f) <= currentItem.maxWallAngle;

        return currentItem.allowedSurfaces switch
        {
            PlacementSurface.GroundOnly => isGround,
            PlacementSurface.WallOnly => isWall,
            PlacementSurface.Both => isGround || isWall,
            _ => false
        };
    }

    bool TryGetSurfacePoint(out Vector3 point, out Vector3 normal)
    {
        point = default;
        normal = Vector3.up;

        Ray ray = GetAimRay();
        if (!Physics.Raycast(ray, out RaycastHit hit, maxDistance, groundMask, QueryTriggerInteraction.Ignore))
            return false;

        point = hit.point;
        normal = hit.normal;

        return IsSurfacePreviewable(normal);
    }

    bool IsSurfacePreviewable(Vector3 normal)
    {
        if (currentItem == null) return false;

        float angle = Vector3.Angle(Vector3.up, normal);
        bool isGround = angle <= currentItem.maxGroundAngle;
        bool isWall = Mathf.Abs(angle - 90f) <= currentItem.maxWallAngle;

        return currentItem.allowedSurfaces switch
        {
            PlacementSurface.GroundOnly => isGround,
            PlacementSurface.WallOnly => isWall,
            PlacementSurface.Both => isGround || isWall,
            _ => false
        };
    }
    #endregion

    #region Preview Management
    void CreatePreview()
    {
        if (preview != null || currentItem?.prefab == null) return;

        var obj = Instantiate(currentItem.prefab);
        obj.name = $"[Preview] {currentItem.displayName}";

        preview = obj.AddComponent<BuildingPreview>();
        preview.Initialize(previewMaterial, overlapMask, groundMask);

        supportCheck = obj.GetComponentInChildren<PreviewGroundSupport>(true);
        if (supportCheck != null)
            supportCheck.Initialize(groundMask, supportRayDistance);
    }

    void DestroyPreview()
    {
        if (preview != null) Destroy(preview.gameObject);
        preview = null;
        supportCheck = null;
    }
    #endregion

    #region Helpers
    Ray GetAimRay()
    {
        if (cam == null) cam = Camera.main;
        return cam != null ? cam.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0f))
                           : new Ray(Vector3.zero, Vector3.forward);
    }

    static void ApplyColor(Material mat, Color color)
    {
        if (mat == null) return;
        if (mat.HasProperty("_Color")) mat.color = color;
        if (mat.HasProperty("_BaseColor")) mat.SetColor("_BaseColor", color);
    }
    #endregion
}