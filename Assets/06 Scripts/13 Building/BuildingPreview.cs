using UnityEngine;

public class BuildingPreview : MonoBehaviour
{
    [Header("Overlap")]
    [SerializeField] private float overlapEpsilon = 0.01f;

    LayerMask overlapMask;
    LayerMask groundMask;
    Renderer[] renderers;
    Collider[] cachedColliders;
    MaterialPropertyBlock mpb;
    Material previewMaterialInstance;

    readonly Collider[] overlapResults = new Collider[64];

    static readonly int ColorId = Shader.PropertyToID("_Color");
    static readonly int BaseColorId = Shader.PropertyToID("_BaseColor");
    static readonly int TintColorId = Shader.PropertyToID("_TintColor");

    public void Initialize(Material previewMaterial, LayerMask overlapMask, LayerMask groundMask)
    {
        this.groundMask = groundMask;
        this.overlapMask = overlapMask & ~groundMask;

        renderers = GetComponentsInChildren<Renderer>(true);
        cachedColliders = GetComponentsInChildren<Collider>(true);
        mpb = new MaterialPropertyBlock();

        int ignoreLayer = LayerMask.NameToLayer("Ignore Raycast");
        if (ignoreLayer >= 0)
            SetLayerRecursively(gameObject, ignoreLayer);

        SetupPreviewMaterial(previewMaterial);
        DisableColliders();
    }

    void SetupPreviewMaterial(Material previewMaterial)
    {
        if (previewMaterial == null) return;

        previewMaterialInstance = new Material(previewMaterial);

        foreach (var r in renderers)
        {
            if (r == null) continue;

            var shared = r.sharedMaterials;
            if (shared == null || shared.Length == 0)
            {
                r.sharedMaterial = previewMaterialInstance;
                continue;
            }

            var replaced = new Material[shared.Length];
            for (int m = 0; m < replaced.Length; m++)
                replaced[m] = previewMaterialInstance;
            r.sharedMaterials = replaced;
        }
    }

    void DisableColliders()
    {
        foreach (var col in cachedColliders)
            if (col != null) col.enabled = false;
    }

    void OnDestroy()
    {
        if (previewMaterialInstance != null)
            Destroy(previewMaterialInstance);
    }

    public void SetColor(Color c)
    {
        if (renderers == null) return;

        mpb.Clear();
        mpb.SetColor(ColorId, c);
        mpb.SetColor(BaseColorId, c);
        mpb.SetColor(TintColorId, c);

        foreach (var r in renderers)
            if (r != null) r.SetPropertyBlock(mpb);
    }

    public bool HasOverlap()
    {
        if (cachedColliders == null) return false;

        foreach (var col in cachedColliders)
            if (col != null && ColliderOverlapsAnything(col))
                return true;
        return false;
    }

    bool ColliderOverlapsAnything(Collider col)
    {
        int hitCount = PerformOverlapCheck(col);

        for (int i = 0; i < hitCount; i++)
        {
            var hit = overlapResults[i];
            overlapResults[i] = null;

            if (hit == null) continue;
            if (hit.transform.IsChildOf(transform)) continue;
            if (IsOnGroundLayer(hit.gameObject)) continue;

            return true;
        }
        return false;
    }

    int PerformOverlapCheck(Collider col)
    {
        if (col is BoxCollider box)
        {
            Vector3 center = box.transform.TransformPoint(box.center);
            Vector3 halfExtents = Vector3.Scale(box.size * 0.5f, Abs(box.transform.lossyScale));
            halfExtents -= Vector3.one * overlapEpsilon;
            halfExtents = Max(halfExtents, Vector3.zero);

            return Physics.OverlapBoxNonAlloc(center, halfExtents, overlapResults,
                box.transform.rotation, overlapMask, QueryTriggerInteraction.Ignore);
        }

        if (col is SphereCollider sphere)
        {
            Vector3 center = sphere.transform.TransformPoint(sphere.center);
            float radius = sphere.radius * MaxAbsComponent(sphere.transform.lossyScale) - overlapEpsilon;
            if (radius < 0f) radius = 0f;

            return Physics.OverlapSphereNonAlloc(center, radius, overlapResults,
                overlapMask, QueryTriggerInteraction.Ignore);
        }

        if (col is CapsuleCollider capsule)
        {
            GetCapsuleWorldPoints(capsule, out Vector3 p0, out Vector3 p1, out float radius);
            radius = Mathf.Max(0f, radius - overlapEpsilon);

            return Physics.OverlapCapsuleNonAlloc(p0, p1, radius, overlapResults,
                overlapMask, QueryTriggerInteraction.Ignore);
        }

        // Fallback for other collider types
        Bounds b = col.bounds;
        Vector3 extents = Max(b.extents - Vector3.one * overlapEpsilon, Vector3.zero);
        return Physics.OverlapBoxNonAlloc(b.center, extents, overlapResults,
            Quaternion.identity, overlapMask, QueryTriggerInteraction.Ignore);
    }

    bool IsOnGroundLayer(GameObject obj) => ((1 << obj.layer) & groundMask) != 0;

    static void GetCapsuleWorldPoints(CapsuleCollider cap, out Vector3 p0, out Vector3 p1, out float radius)
    {
        Transform t = cap.transform;
        Vector3 scale = Abs(t.lossyScale);
        int dir = cap.direction;

        float height = cap.height * scale[dir];
        float rScale = dir == 0 ? Mathf.Max(scale.y, scale.z) :
                       dir == 1 ? Mathf.Max(scale.x, scale.z) :
                                  Mathf.Max(scale.x, scale.y);

        radius = cap.radius * rScale;
        Vector3 center = t.TransformPoint(cap.center);
        Vector3 axis = dir == 0 ? t.right : dir == 1 ? t.up : t.forward;
        float half = Mathf.Max(0f, height * 0.5f - radius);

        p0 = center + axis * half;
        p1 = center - axis * half;
    }

    static Vector3 Abs(Vector3 v) => new Vector3(Mathf.Abs(v.x), Mathf.Abs(v.y), Mathf.Abs(v.z));
    static float MaxAbsComponent(Vector3 v) => Mathf.Max(Mathf.Abs(v.x), Mathf.Max(Mathf.Abs(v.y), Mathf.Abs(v.z)));
    static Vector3 Max(Vector3 a, Vector3 b) => new Vector3(Mathf.Max(a.x, b.x), Mathf.Max(a.y, b.y), Mathf.Max(a.z, b.z));

    static void SetLayerRecursively(GameObject obj, int layer)
    {
        obj.layer = layer;
        foreach (Transform child in obj.transform)
            SetLayerRecursively(child.gameObject, layer);
    }
}