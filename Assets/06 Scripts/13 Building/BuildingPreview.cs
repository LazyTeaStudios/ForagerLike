using UnityEngine;

public class BuildingPreview : MonoBehaviour
{
    private Renderer[] renderers;
    private Collider[] colliders;
    private Material previewMaterial;
    private LayerMask overlapMask;
    private LayerMask ignoreMask;
    private Collider[] overlapResults = new Collider[20];
    
    public void Initialize(Material material, LayerMask overlapLayer, LayerMask ignoreLayer)
    {
        previewMaterial = material;
        overlapMask = overlapLayer;
        ignoreMask = ignoreLayer;
        
        renderers = GetComponentsInChildren<Renderer>();
        colliders = GetComponentsInChildren<Collider>();
        
        SetupLayer();
        SetupColliders();
        ApplyPreviewMaterial();
    }
    
    private void SetupLayer()
    {
        int layer = LayerMask.NameToLayer("Ignore Raycast");
        SetLayerRecursive(transform, layer);
    }
    
    private void SetLayerRecursive(Transform t, int layer)
    {
        t.gameObject.layer = layer;
        foreach (Transform child in t)
            SetLayerRecursive(child, layer);
    }
    
    private void SetupColliders()
    {
        foreach (var col in colliders)
            col.isTrigger = true;
    }
    
    private void ApplyPreviewMaterial()
    {
        if (previewMaterial == null) return;
        foreach (var rend in renderers)
            rend.material = previewMaterial;
    }
    
    public void SetColor(Color color)
    {
        foreach (var rend in renderers)
        {
            if (rend != null && rend.material.HasProperty("_Color"))
                rend.material.color = color;
        }
    }
    
    public void SetTransform(Vector3 position, Vector3 normal)
    {
        transform.position = position;
        transform.rotation = Quaternion.FromToRotation(Vector3.up, normal);
    }
    
    public bool HasOverlap()
    {
        foreach (var col in colliders)
        {
            if (col == null) continue;
            
            int count = GetOverlapCount(col);
            
            for (int i = 0; i < count; i++)
            {
                var hit = overlapResults[i];
                if (hit == null) continue;
                if (IsOwnCollider(hit)) continue;
                if (IsIgnored(hit)) continue;
                return true;
            }
        }
        return false;
    }
    
    private int GetOverlapCount(Collider col)
    {
        switch (col)
        {
            case BoxCollider box:
                return OverlapBox(box);
            case SphereCollider sphere:
                return OverlapSphere(sphere);
            case CapsuleCollider capsule:
                return OverlapCapsule(capsule);
            case MeshCollider mesh when mesh.convex:
                return OverlapBounds(mesh.bounds);
            default:
                return 0;
        }
    }
    
    private int OverlapBox(BoxCollider box)
    {
        Vector3 center = box.transform.TransformPoint(box.center);
        Vector3 halfExtents = Vector3.Scale(box.size * 0.5f, box.transform.lossyScale) * 0.9f;
        return Physics.OverlapBoxNonAlloc(center, halfExtents, overlapResults, box.transform.rotation, overlapMask);
    }
    
    private int OverlapSphere(SphereCollider sphere)
    {
        Vector3 center = sphere.transform.TransformPoint(sphere.center);
        Vector3 scale = sphere.transform.lossyScale;
        float radius = sphere.radius * Mathf.Max(scale.x, scale.y, scale.z) * 0.9f;
        return Physics.OverlapSphereNonAlloc(center, radius, overlapResults, overlapMask);
    }
    
    private int OverlapCapsule(CapsuleCollider capsule)
    {
        GetCapsulePoints(capsule, out Vector3 p0, out Vector3 p1, out float radius);
        return Physics.OverlapCapsuleNonAlloc(p0, p1, radius * 0.9f, overlapResults, overlapMask);
    }
    
    private int OverlapBounds(Bounds bounds)
    {
        return Physics.OverlapBoxNonAlloc(bounds.center, bounds.extents * 0.9f, overlapResults, Quaternion.identity, overlapMask);
    }
    
    private void GetCapsulePoints(CapsuleCollider capsule, out Vector3 p0, out Vector3 p1, out float radius)
    {
        Vector3 center = capsule.transform.TransformPoint(capsule.center);
        Vector3 scale = capsule.transform.lossyScale;
        float height = capsule.height * scale.y;
        radius = capsule.radius * Mathf.Max(scale.x, scale.z);
        
        Vector3 dir = capsule.direction switch
        {
            0 => capsule.transform.right,
            1 => capsule.transform.up,
            _ => capsule.transform.forward
        };
        
        float offset = Mathf.Max(0f, height * 0.5f - radius);
        p0 = center + dir * offset;
        p1 = center - dir * offset;
    }
    
    private bool IsOwnCollider(Collider col)
    {
        foreach (var c in colliders)
            if (c == col) return true;
        return false;
    }
    
    private bool IsIgnored(Collider col)
    {
        return ((1 << col.gameObject.layer) & ignoreMask) != 0;
    }
}
