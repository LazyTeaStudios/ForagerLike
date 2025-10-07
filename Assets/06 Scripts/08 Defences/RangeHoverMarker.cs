using System.Collections.Generic;
using UnityEngine;

[DisallowMultipleComponent]
[ExecuteAlways]
public class RangeHoverMarker : MonoBehaviour
{
    [Header("Marker")]
    [Tooltip("Prefab spawned for every highlighted tile.")]
    public GameObject markerPrefab;

    [Tooltip("Vertical offset above a tile’s centre.")]
    public float heightOffset = 0.1f;

    [Header("Range / Grid")]
    [Min(0)] public int range = 1;         
    public float gridStep = 1f;            

    [Header("Raycast")]
    [Tooltip("Layers that count as tiles for mouse-over & ground checks.")]
    public LayerMask tileLayerMask = ~0;


    readonly List<GameObject> _markers = new();
    Vector3 _lastCentre = Vector3.positiveInfinity;
    bool _preview;                        


    void Update()
    {
        if (!markerPrefab) return;


        _preview = !HasAnyEnabledCollider();

        if (_preview)
        {
            UpdateMarkers(transform.position);
            return;
        }


        Ray ray = Camera.main.ScreenPointToRay(
            Input.GetValue<Vector2>(GameAction.GameplayMousePoint));

        if (Physics.Raycast(ray, out var hit, Mathf.Infinity, tileLayerMask) &&
            IsSelfOrChild(hit.collider.transform))
        {
            UpdateMarkers(hit.collider.transform.position);
        }
        else
        {
            ClearMarkers();
        }
    }


    bool HasAnyEnabledCollider()
    {
        foreach (var c in GetComponentsInChildren<Collider>())
            if (c.enabled) return true;
        return false;
    }

    bool IsSelfOrChild(Transform t) => t == transform || t.IsChildOf(transform);

    void UpdateMarkers(Vector3 centre)
    {
        if (centre == _lastCentre) return;
        _lastCentre = centre;
        ClearMarkers();

        for (int dx = -range; dx <= range; dx++)
            for (int dz = -range; dz <= range; dz++)
            {
                Vector3 probe = centre + new Vector3(dx * gridStep, 1f, dz * gridStep);
                if (Physics.Raycast(probe, Vector3.down, out var hit, 2f, tileLayerMask))
                {
                    Vector3 tilePos = hit.collider.transform.position;
                    GameObject m = Instantiate(
                        markerPrefab,
                        tilePos + Vector3.up * heightOffset,
                        Quaternion.identity,
                        transform);      

                    _markers.Add(m);
                }
            }
    }

    void ClearMarkers()
    {
        foreach (var m in _markers)
            if (m) Destroy(m);
        _markers.Clear();
        _lastCentre = Vector3.positiveInfinity;
    }

    void OnDisable() => ClearMarkers();
    public bool TryGetGridPosition(out Vector2Int gridPos)
    {
        gridPos = default;
        Ray ray = Camera.main.ScreenPointToRay(
            Input.GetValue<Vector2>(GameAction.GameplayMousePoint));

        if (Physics.Raycast(ray, out var hit, Mathf.Infinity, tileLayerMask))
        {
            Vector3 p = hit.collider.transform.position;
            gridPos = new Vector2Int(
                Mathf.RoundToInt(p.x / gridStep),
                Mathf.RoundToInt(p.z / gridStep));
            return true;
        }
        return false;
    }
}
