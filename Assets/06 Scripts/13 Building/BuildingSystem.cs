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
    
    private BuildingPreview preview;
    private PlacedBuilding highlightedBuilding;
    private Material[] originalMaterials;
    private Mode currentMode = Mode.None;
    private bool inputCooldown;
    
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
        if (currentMode == Mode.Build)
        {
            DestroyPreview();
            CreatePreview();
        }
    }
    
    private void UpdateBuildMode()
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
        
        if (!inputCooldown && canPlace && InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
            Place();
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
                renderers[i].material = previewMaterial;
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