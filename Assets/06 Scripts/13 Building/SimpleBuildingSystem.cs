using UnityEngine;
using System.Collections.Generic;

public class SimpleBuildingSystem : MonoBehaviour
{
    public enum Mode { None, Build }

    [Header("Build Item")]
    [SerializeField] private BuildItemSO buildItem;

    [Header("Raycast Settings")]
    [SerializeField] private Camera cam;
    [SerializeField] private LayerMask groundMask = ~0;
    [SerializeField] private LayerMask overlapMask = ~0;
    [SerializeField] private float maxDistance = 50f;

    [Header("Input")]
    [SerializeField] private GameAction toggleBuildModeAction = GameAction.ToggleBuildModeAction;
    [SerializeField] private GameAction placeAction = GameAction.Click;
    [SerializeField] private GameAction cancelAction = GameAction.Cancel;

    [Header("Preview")]
    [SerializeField] private Material previewMaterial;
    [SerializeField] private Color validColor = new Color(0f, 1f, 0f, 0.35f);
    [SerializeField] private Color invalidColor = new Color(1f, 0f, 0f, 0.35f);

    private Mode mode = Mode.None;
    private GameObject previewInstance;
    private Renderer[] previewRenderers;
    private Collider[] previewColliders;

    public Mode CurrentMode => mode;

    void Awake()
    {
        if (cam == null) cam = Camera.main;
        ExitBuildMode();
    }

    void Update()
    {
        if (InputHandler.Pressed(toggleBuildModeAction))
        {
            if (mode == Mode.Build) ExitBuildMode();
            else EnterBuildMode();
        }

        if (InputHandler.Pressed(cancelAction) && mode == Mode.Build)
        {
            ExitBuildMode();
            return;
        }

        if (mode == Mode.Build) UpdateBuildMode();
    }

    public void EnterBuildMode()
    {
        if (buildItem == null || buildItem.prefab == null) return;

        mode = Mode.Build;
        InputHandler.SetMap(ActionMap.Gameplay);
        CreatePreview();
    }

    public void ExitBuildMode()
    {
        mode = Mode.None;
        DestroyPreview();
        InputHandler.SetMap(ActionMap.Gameplay);
    }

    public void SetBuildItem(BuildItemSO item)
    {
        buildItem = item;
        if (mode == Mode.Build)
        {
            DestroyPreview();
            CreatePreview();
        }
    }

    private void UpdateBuildMode()
    {
        if (previewInstance == null) return;

        bool hitSurface = TryGetSurfacePoint(out Vector3 point, out Vector3 normal);

        if (!hitSurface)
        {
            previewInstance.SetActive(false);
            return;
        }

        previewInstance.SetActive(true);
        UpdatePreviewTransform(point, normal);

        bool validSurface = IsSurfaceValid(normal);
        bool noOverlap = !HasOverlap();
        bool canPlace = validSurface && noOverlap;

        SetPreviewColor(canPlace ? validColor : invalidColor);

        if (canPlace && InputHandler.Pressed(placeAction))
            PlaceBuilding();
    }

    private void UpdatePreviewTransform(Vector3 position, Vector3 normal)
    {
        previewInstance.transform.position = position;
        previewInstance.transform.rotation = Quaternion.FromToRotation(Vector3.up, normal);
    }

    private bool IsSurfaceValid(Vector3 normal)
    {
        if (buildItem == null) return false;

        float angleFromUp = Vector3.Angle(Vector3.up, normal);
        bool isGround = angleFromUp <= buildItem.maxGroundAngle;
        bool isWall = angleFromUp >= (90f - buildItem.maxWallAngle) && angleFromUp <= (90f + buildItem.maxWallAngle);

        return buildItem.allowedSurfaces switch
        {
            PlacementSurface.GroundOnly => isGround,
            PlacementSurface.WallOnly => isWall,
            PlacementSurface.Both => isGround || isWall,
            _ => false
        };
    }

    private bool HasOverlap()
    {
        if (previewColliders == null || previewColliders.Length == 0)
            return false;

        Collider[] results = new Collider[10]; // Create array once, reuse it

        foreach (var col in previewColliders)
        {
            if (col == null) continue;

            int hitCount = 0;

            if (col is BoxCollider box)
            {
                Vector3 center = box.transform.TransformPoint(box.center);
                Vector3 halfExtents = Vector3.Scale(box.size * 0.5f, box.transform.lossyScale) * 0.95f;
                hitCount = Physics.OverlapBoxNonAlloc(center, halfExtents, results, box.transform.rotation, overlapMask);
            }
            else if (col is SphereCollider sphere)
            {
                Vector3 center = sphere.transform.TransformPoint(sphere.center);
                float radius = sphere.radius * Mathf.Max(sphere.transform.lossyScale.x, sphere.transform.lossyScale.y, sphere.transform.lossyScale.z) * 0.95f;
                hitCount = Physics.OverlapSphereNonAlloc(center, radius, results, overlapMask);
            }
            else if (col is CapsuleCollider capsule)
            {
                GetCapsulePoints(capsule, out Vector3 p0, out Vector3 p1, out float radius);
                hitCount = Physics.OverlapCapsuleNonAlloc(p0, p1, radius * 0.95f, results, overlapMask);
            }
            else if (col is MeshCollider mesh && mesh.convex)
            {
                Bounds bounds = col.bounds;
                hitCount = Physics.OverlapBoxNonAlloc(bounds.center, bounds.extents * 0.95f, results, Quaternion.identity, overlapMask);
            }

            // Check the results
            for (int i = 0; i < hitCount; i++)
            {
                if (results[i] == null) continue;
                if (IsPreviewCollider(results[i])) continue;
                if (IsGroundCollider(results[i])) continue;

                return true; // Found a valid overlap
            }
        }

        return false;
    }

    private bool IsPreviewCollider(Collider col)
    {
        if (previewColliders == null) return false;

        foreach (var pc in previewColliders)
        {
            if (pc == col) return true;
        }
        return false;
    }

    private bool IsGroundCollider(Collider col)
    {
        return ((1 << col.gameObject.layer) & groundMask) != 0;
    }

    private void GetCapsulePoints(CapsuleCollider capsule, out Vector3 point0, out Vector3 point1, out float radius)
    {
        Vector3 center = capsule.transform.TransformPoint(capsule.center);
        float height = capsule.height * capsule.transform.lossyScale.y;
        radius = capsule.radius * Mathf.Max(capsule.transform.lossyScale.x, capsule.transform.lossyScale.z);

        Vector3 direction = capsule.direction switch
        {
            0 => capsule.transform.right,
            1 => capsule.transform.up,
            2 => capsule.transform.forward,
            _ => capsule.transform.up
        };

        float offset = Mathf.Max(0f, (height * 0.5f) - radius);
        point0 = center + direction * offset;
        point1 = center - direction * offset;
    }

    private void PlaceBuilding()
    {
        GameObject placed = Instantiate(buildItem.prefab, previewInstance.transform.position, previewInstance.transform.rotation);
    }

    private void CreatePreview()
    {
        if (previewInstance != null || buildItem == null || buildItem.prefab == null) return;

        previewInstance = Instantiate(buildItem.prefab);
        previewInstance.name = $"[Preview] {buildItem.displayName}";

        int previewLayer = LayerMask.NameToLayer("Ignore Raycast");
        SetLayerRecursively(previewInstance, previewLayer);

        previewRenderers = previewInstance.GetComponentsInChildren<Renderer>();
        previewColliders = previewInstance.GetComponentsInChildren<Collider>(); // ADD THIS LINE

        // Disable the colliders so they don't interfere with physics
        foreach (var col in previewColliders)
            col.isTrigger = true;

        if (previewMaterial != null)
        {
            foreach (var rend in previewRenderers)
                rend.material = previewMaterial;
        }
    }

    private void SetLayerRecursively(GameObject obj, int layer)
    {
        if (obj == null) return;

        obj.layer = layer;

        foreach (Transform child in obj.transform)
        {
            SetLayerRecursively(child.gameObject, layer);
        }
    }

    private void DestroyPreview()
    {
        if (previewInstance != null) Destroy(previewInstance);
        previewInstance = null;
        previewRenderers = null;
        previewColliders = null;
    }

    private void SetPreviewColor(Color color)
    {
        if (previewRenderers == null) return;

        foreach (var rend in previewRenderers)
        {
            if (rend == null) continue;
            var mat = rend.material;
            if (mat != null && mat.HasProperty("_Color"))
                mat.color = color;
        }
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