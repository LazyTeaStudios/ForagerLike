using UnityEngine;

public class PreviewGroundSupport : MonoBehaviour
{
    [Header("Footprint Collider (on this object)")]
    [SerializeField] private BoxCollider supportBox;

    [Header("Raycast")]
    [SerializeField] private LayerMask groundMask = ~0;
    private float rayDistance = 0.2f;
    private float cornerInset = 0.02f;

    [Header("Debug")]
    [SerializeField] private bool debugDraw = false;

    /// <summary>
    /// Optional initializer so your BuildingSystem can push masks/distance at runtime.
    /// </summary>
    public void Initialize(LayerMask groundMask, float distance)
    {
        this.groundMask = groundMask;
        this.rayDistance = distance;

        if (supportBox == null)
            supportBox = GetComponent<BoxCollider>();
    }

    /// <summary>
    /// Returns true only if ALL bottom corners have ground support within rayDistance.
    /// </summary>
    public bool HasSupport()
    {
        if (supportBox == null)
        {
            // If you prefer "fail closed", change this to: return false;
            Debug.LogWarning($"[{nameof(PreviewGroundSupport)}] No BoxCollider assigned/found on {name}. Support check skipped.");
            return true;
        }

        var t = supportBox.transform;

        // Work in the collider's local space (BoxCollider center/size are in local space)
        Vector3 c = supportBox.center;
        Vector3 e = supportBox.size * 0.5f;

        float ix = Mathf.Max(0f, e.x - cornerInset);
        float iz = Mathf.Max(0f, e.z - cornerInset);
        float y = -e.y;

        // 4 bottom corners in local space (relative to BoxCollider)
        Vector3[] localCorners = new Vector3[4]
        {
            c + new Vector3(-ix, y, -iz),
            c + new Vector3(-ix, y,  iz),
            c + new Vector3( ix, y, -iz),
            c + new Vector3( ix, y,  iz),
        };

        const float startOffsetUp = 0.02f; // avoids starting exactly on a surface
        for (int i = 0; i < localCorners.Length; i++)
        {
            Vector3 cornerWorld = t.TransformPoint(localCorners[i]);
            Vector3 origin = cornerWorld + Vector3.up * startOffsetUp;

            bool hit = Physics.Raycast(
                origin,
                Vector3.down,
                out _,
                rayDistance + startOffsetUp,
                groundMask,
                QueryTriggerInteraction.Ignore
            );

            if (debugDraw)
            {
                Debug.DrawRay(origin, Vector3.down * (rayDistance + startOffsetUp), hit ? Color.green : Color.red);
            }

            if (!hit)
                return false;
        }

        return true;
    }
}
