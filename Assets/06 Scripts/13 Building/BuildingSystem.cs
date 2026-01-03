using UnityEngine;

public class BuildingSystem : MonoBehaviour
{
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

    private BuildingPreview preview;
    private bool isBuilding;

    public bool IsBuilding => isBuilding;
    public BuildItemSO CurrentItem => currentItem;

    private void Awake()
    {
        if (cam == null) cam = Camera.main;
    }

    private void Update()
    {
        HandleInput();
        if (isBuilding) UpdatePreview();
    }

    private void HandleInput()
    {
        if (InputHandler.Pressed(GameAction.ToggleBuildModeAction))
        {
            if (isBuilding) ExitBuildMode();
            else EnterBuildMode();
            return;
        }

        if (isBuilding && InputHandler.Pressed(GameAction.GameplayMouseRightClick))
            ExitBuildMode();
    }

    public void EnterBuildMode()
    {
        if (currentItem == null || currentItem.prefab == null) return;

        isBuilding = true;
        CreatePreview();
    }

    public void ExitBuildMode()
    {
        isBuilding = false;
        DestroyPreview();
    }

    public void SetBuildItem(BuildItemSO item)
    {
        currentItem = item;
        if (isBuilding)
        {
            DestroyPreview();
            CreatePreview();
        }
    }

    private void UpdatePreview()
    {
        if (preview == null) return;

        if (!TryGetSurfacePoint(out Vector3 point, out Vector3 normal))
        {
            preview.gameObject.SetActive(false);
            return;
        }

        preview.gameObject.SetActive(true);
        preview.SetTransform(point, normal);

        bool validSurface = IsSurfaceValid(normal);
        bool noOverlap = !preview.HasOverlap();
        bool canPlace = validSurface && noOverlap;

        preview.SetColor(canPlace ? validColor : invalidColor);

        if (canPlace && InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
            Place();
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