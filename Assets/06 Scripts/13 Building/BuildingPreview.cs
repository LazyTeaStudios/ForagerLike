using UnityEngine;

public class BuildingPreview : MonoBehaviour
{
    [Header("Overlap")]
    [SerializeField] private float overlapEpsilon = 0.01f;
    [SerializeField] private float groundIgnoreThreshold = 0.1f; // How far below ground to ignore

    private LayerMask overlapMask;
    private LayerMask groundMask; // Store ground mask to exclude it

    private Renderer[] renderers;
    private MaterialPropertyBlock mpb;

    private Collider[] cachedColliders;
    private readonly Collider[] overlapResults = new Collider[64];

    private static readonly int ColorId = Shader.PropertyToID("_Color");
    private static readonly int BaseColorId = Shader.PropertyToID("_BaseColor");
    private static readonly int TintColorId = Shader.PropertyToID("_TintColor");

    private Material previewMaterialInstance;

    public void Initialize(Material previewMaterial, LayerMask overlapMask, LayerMask groundMask)
    {
        // Store ground mask and exclude it from overlap checks
        this.groundMask = groundMask;
        this.overlapMask = overlapMask & ~groundMask; // Remove ground from overlap mask

        renderers = GetComponentsInChildren<Renderer>(true);
        cachedColliders = GetComponentsInChildren<Collider>(true);

        mpb = new MaterialPropertyBlock();

        int ignore = LayerMask.NameToLayer("Ignore Raycast");
        if (ignore >= 0)
            SetLayerRecursively(gameObject, ignore);

        if (previewMaterial != null)
        {
            previewMaterialInstance = new Material(previewMaterial);

            for (int i = 0; i < renderers.Length; i++)
            {
                var r = renderers[i];
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

        for (int i = 0; i < cachedColliders.Length; i++)
        {
            if (cachedColliders[i] != null)
                cachedColliders[i].enabled = false;
        }
    }

    private void OnDestroy()
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

        for (int i = 0; i < renderers.Length; i++)
        {
            var r = renderers[i];
            if (r == null) continue;
            r.SetPropertyBlock(mpb);
        }
    }

    public bool HasOverlap()
    {
        if (cachedColliders == null || cachedColliders.Length == 0)
            return false;

        for (int i = 0; i < cachedColliders.Length; i++)
        {
            var col = cachedColliders[i];
            if (col == null) continue;

            if (ColliderOverlapsAnything(col))
                return true;
        }

        return false;
    }

    private bool ColliderOverlapsAnything(Collider col)
    {
        int hitCount = 0;

        if (col is BoxCollider box)
        {
            Vector3 center = box.transform.TransformPoint(box.center);
            Quaternion rot = box.transform.rotation;

            Vector3 lossy = Abs(box.transform.lossyScale);
            Vector3 halfExtents = Vector3.Scale(box.size * 0.5f, lossy);
            halfExtents -= Vector3.one * overlapEpsilon;
            halfExtents = Max(halfExtents, Vector3.zero);

            hitCount = Physics.OverlapBoxNonAlloc(
                center, halfExtents, overlapResults, rot, overlapMask, QueryTriggerInteraction.Ignore
            );
        }
        else if (col is SphereCollider sphere)
        {
            Vector3 center = sphere.transform.TransformPoint(sphere.center);
            float radius = sphere.radius * MaxAbsComponent(sphere.transform.lossyScale) - overlapEpsilon;
            if (radius < 0f) radius = 0f;

            hitCount = Physics.OverlapSphereNonAlloc(
                center, radius, overlapResults, overlapMask, QueryTriggerInteraction.Ignore
            );
        }
        else if (col is CapsuleCollider capsule)
        {
            GetCapsuleWorldPoints(capsule, out Vector3 p0, out Vector3 p1, out float radius);
            radius -= overlapEpsilon;
            if (radius < 0f) radius = 0f;

            hitCount = Physics.OverlapCapsuleNonAlloc(
                p0, p1, radius, overlapResults, overlapMask, QueryTriggerInteraction.Ignore
            );
        }
        else
        {
            Bounds b = col.bounds;
            Vector3 halfExtents = b.extents - Vector3.one * overlapEpsilon;
            halfExtents = Max(halfExtents, Vector3.zero);

            hitCount = Physics.OverlapBoxNonAlloc(
                b.center, halfExtents, overlapResults, Quaternion.identity, overlapMask, QueryTriggerInteraction.Ignore
            );
        }

        // Filter out self and ground collisions
        for (int i = 0; i < hitCount; i++)
        {
            var hit = overlapResults[i];
            overlapResults[i] = null;

            if (hit == null) continue;
            if (hit.transform.IsChildOf(transform)) continue;

            // Skip if this collider is on ground layer
            if (IsOnGroundLayer(hit.gameObject)) continue;

            return true;
        }

        return false;
    }

    private bool IsOnGroundLayer(GameObject obj)
    {
        return ((1 << obj.layer) & groundMask) != 0;
    }

    private static void GetCapsuleWorldPoints(CapsuleCollider cap, out Vector3 p0, out Vector3 p1, out float radius)
    {
        Transform t = cap.transform;
        Vector3 scale = Abs(t.lossyScale);

        int dir = cap.direction;
        float height = cap.height * scale[dir];

        float rScale = (dir == 0) ? Mathf.Max(scale.y, scale.z)
                     : (dir == 1) ? Mathf.Max(scale.x, scale.z)
                     : Mathf.Max(scale.x, scale.y);

        radius = cap.radius * rScale;

        Vector3 center = t.TransformPoint(cap.center);
        Vector3 axis = (dir == 0) ? t.right : (dir == 1) ? t.up : t.forward;

        float half = Mathf.Max(0f, (height * 0.5f) - radius);

        p0 = center + axis * half;
        p1 = center - axis * half;
    }

    private static Vector3 Abs(Vector3 v) => new Vector3(Mathf.Abs(v.x), Mathf.Abs(v.y), Mathf.Abs(v.z));
    private static float MaxAbsComponent(Vector3 v) => Mathf.Max(Mathf.Abs(v.x), Mathf.Abs(v.y), Mathf.Abs(v.z));
    private static Vector3 Max(Vector3 a, Vector3 b) => new Vector3(Mathf.Max(a.x, b.x), Mathf.Max(a.y, b.y), Mathf.Max(a.z, b.z));

    private static void SetLayerRecursively(GameObject obj, int layer)
    {
        obj.layer = layer;
        foreach (Transform child in obj.transform)
            SetLayerRecursively(child.gameObject, layer);
    }
}