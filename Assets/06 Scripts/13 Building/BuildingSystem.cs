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
    [SerializeField] private LayerMask buildingMask = ~0;
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
    [SerializeField] private bool snapToWorldGrid = true; // true = world space, false = local to surface

    private BuildingPreview preview;
    private PlacedBuilding highlightedBuilding;
    private Material[] originalMaterials;
    private Mode currentMode = Mode.None;
    private bool inputCooldown;
    private float currentRotation = 0f;

    public Mode CurrentMode => currentMode;
    public BuildItemSO CurrentItem => currentItem;

    private void Awake()
    {
        if (cam == null) cam = Camera.main;
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
        currentRotation = 0f; // Reset rotation when entering build mode
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
        currentRotation = 0f; // Reset rotation when switching items
        if (currentMode == Mode.Build)
        {
            DestroyPreview();
            CreatePreview();
        }
    }

    private void UpdateBuildMode()
    {
        if (preview == null) return;

        // Handle rotation input
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

        // Apply snapping if enabled
        if (enableSnapping)
        {
            point = ApplySnapping(point, normal);
        }

        preview.gameObject.SetActive(true);

        // Calculate rotation with user input
        Quaternion baseRotation = Quaternion.FromToRotation(Vector3.up, normal);
        Quaternion userRotation = Quaternion.AngleAxis(currentRotation, normal);
        preview.transform.position = point;
        preview.transform.rotation = baseRotation * userRotation;

        bool validSurface = IsSurfaceValid(normal);
        bool noOverlap = !preview.HasOverlap();
        bool canPlace = validSurface && noOverlap;

        preview.SetColor(canPlace ? validColor : invalidColor);

        if (!inputCooldown && canPlace && InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
            Place();
    }

    private Vector3 ApplySnapping(Vector3 position, Vector3 normal)
    {
        if (snapToWorldGrid)
        {
            // Snap to world grid
            position.x = Mathf.Round(position.x / snapGridSize) * snapGridSize;
            position.y = Mathf.Round(position.y / snapGridSize) * snapGridSize;
            position.z = Mathf.Round(position.z / snapGridSize) * snapGridSize;
        }
        else
        {
            // Snap relative to the surface (local grid)
            // Create a coordinate system based on the surface normal
            Vector3 right = Vector3.Cross(Vector3.up, normal);
            if (right.magnitude < 0.001f) // Handle case when normal is up or down
                right = Vector3.Cross(Vector3.forward, normal);
            right.Normalize();

            Vector3 forward = Vector3.Cross(normal, right).normalized;

            // Project position onto the surface plane
            Vector3 surfaceOrigin = Vector3.zero; // You could use a reference point here
            Vector3 localPos = position - surfaceOrigin;

            // Get local coordinates
            float localX = Vector3.Dot(localPos, right);
            float localZ = Vector3.Dot(localPos, forward);
            float localY = Vector3.Dot(localPos, normal);

            // Snap local coordinates
            localX = Mathf.Round(localX / snapGridSize) * snapGridSize;
            localZ = Mathf.Round(localZ / snapGridSize) * snapGridSize;

            // Reconstruct world position
            position = surfaceOrigin + right * localX + forward * localZ + normal * localY;
        }

        return position;
    }

    private void UpdateDestroyMode()
    {
        Ray ray = GetAimRay();

        if (Physics.Raycast(ray, out RaycastHit hit, maxDistance, buildingMask))
        {
            var building = hit.collider.GetComponentInParent<PlacedBuilding>();

            if (building != highlightedBuilding)
            {
                ClearHighlight();
                if (building != null) HighlightBuilding(building);
            }

            if (!inputCooldown && building != null && InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
            {
                Destroy(building.gameObject);
                highlightedBuilding = null;
            }
        }
        else
        {
            ClearHighlight();
        }
    }

    private void HighlightBuilding(PlacedBuilding building)
    {
        highlightedBuilding = building;
        var renderers = building.GetComponentsInChildren<Renderer>();
        originalMaterials = new Material[renderers.Length];

        for (int i = 0; i < renderers.Length; i++)
        {
            originalMaterials[i] = renderers[i].material;
            if (previewMaterial != null)
            {
                renderers[i].material = new Material(previewMaterial);
                renderers[i].material.color = destroyColor;
            }
        }
    }

    private void ClearHighlight()
    {
        if (highlightedBuilding == null) return;

        var renderers = highlightedBuilding.GetComponentsInChildren<Renderer>();
        for (int i = 0; i < renderers.Length && i < originalMaterials.Length; i++)
        {
            if (originalMaterials[i] != null)
                renderers[i].material = originalMaterials[i];
        }

        highlightedBuilding = null;
        originalMaterials = null;
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

    private void Place()
    {
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
    }

    private void DestroyPreview()
    {
        if (preview != null) Destroy(preview.gameObject);
        preview = null;
    }

    private bool TryGetSurfacePoint(out Vector3 point, out Vector3 normal)
    {
        Ray ray = GetAimRay();

        if (Physics.Raycast(ray, out RaycastHit hit, maxDistance, groundMask))
        {
            point = hit.point;
            normal = hit.normal;
            return true;
        }

        point = default;
        normal = Vector3.up;
        return false;
    }

    private Ray GetAimRay()
    {
        if (cam == null) cam = Camera.main;
        if (cam == null) return new Ray(Vector3.zero, Vector3.forward);
        return cam.ViewportPointToRay(new Vector3(0.5f, 0.5f, 0f));
    }
}