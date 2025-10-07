using UnityEngine;

public class TilePlacer : MonoBehaviour
{
    [Header("Materials")]
    public Material previewMaterial;
    public Material invalidMaterial;

    [Header("Settings")]
    [SerializeField] private LayerMask replaceableMask;
    [SerializeField] private LayerMask placedMask;
    [SerializeField] private float gridStep = 1f;

    private Transform _hoverTile;
    private GameObject _ghost;
    private int _placedLayer;
    private int _rotation;
    private bool _isValid;

    private static readonly Vector3[] Directions = {
        Vector3.forward, Vector3.right, Vector3.back, Vector3.left
    };

    void Awake()
    {
        _placedLayer = Mathf.RoundToInt(Mathf.Log(placedMask.value, 2));
    }

    void Update()
    {
        GameObject prefab = GetCurrentPrefab();
        if (!prefab) return;

        if (GetMouseHit(out RaycastHit hit))
        {
            HandleHover(hit, prefab);
            HandleRotation();
            HandlePlacement(prefab);
        }
        else
        {
            ClearPreview();
        }
    }

    private GameObject GetCurrentPrefab()
    {
        return TileManager.Instance?.CurrentPrefab;
    }

    private bool GetMouseHit(out RaycastHit hit)
    {
        Ray ray = Camera.main.ScreenPointToRay(
            Input.GetValue<Vector2>(GameAction.GameplayMousePoint));
        return Physics.Raycast(ray, out hit, Mathf.Infinity, replaceableMask);
    }

    private void HandleHover(RaycastHit hit, GameObject prefab)
    {
        if (hit.collider.transform != _hoverTile)
        {
            ClearPreview();
            _hoverTile = hit.collider.transform;
            CreateGhost(prefab);
        }
    }

    private void HandleRotation()
    {
        if (Input.Held(GameAction.GameplayCtrlModifier, 0)) return;

        float scroll = Input.GetValue<Vector2>(GameAction.GameplayMouseScroll).y;
        if (scroll != 0)
        {
            _rotation = (_rotation + (scroll > 0 ? 1 : 3)) & 3;
            _ghost.transform.rotation = Quaternion.Euler(0, _rotation * 90, 0);
            ValidateGhost();
        }
    }

    private void HandlePlacement(GameObject prefab)
    {
        if (Input.Pressed(GameAction.GameplayLeftClick) && _isValid)
        {
            PlaceTile(prefab);
        }
    }

    private void CreateGhost(GameObject prefab)
    {
        SetRenderersEnabled(_hoverTile, false);
        _ghost = Instantiate(prefab, _hoverTile.position,
            Quaternion.Euler(0, _rotation * 90, 0), _hoverTile.parent);

        DisableColliders(_ghost);
        ValidateGhost();
    }

    private void DisableColliders(GameObject ghost)
    {
        foreach (var collider in ghost.GetComponentsInChildren<Collider>())
            collider.enabled = false;
    }

    private void ValidateGhost()
    {
        _isValid = true;
        var connections = _ghost.GetComponent<TileConnections>();
        if (!connections) return;

        bool[] ghostOpenings = connections.GetRotated(_rotation);
        int allMask = replaceableMask.value | placedMask.value;

        for (int i = 0; i < 4 && _isValid; i++)
        {
            Vector3 checkPos = _ghost.transform.position + Directions[i] * gridStep;

            if (!Physics.Raycast(checkPos + Vector3.up, Vector3.down, out var hit, 2f, allMask))
            {
                if (ghostOpenings[i]) _isValid = false;
                continue;
            }

            ValidateConnection(hit, i, ghostOpenings[i]);
        }

        ApplyGhostMaterial();
    }

    private void ValidateConnection(RaycastHit hit, int direction, bool ghostOpen)
    {
        var neighborConnections = hit.collider.GetComponent<TileConnections>();
        if (!neighborConnections) return;

        int neighborRotation = GetRotationSteps(hit.collider.transform);
        bool neighborOpen = neighborConnections.GetRotated(neighborRotation)[(direction + 2) & 3];

        if (ghostOpen != neighborOpen) _isValid = false;
    }

    private void ApplyGhostMaterial()
    {
        Material material = _isValid ? previewMaterial : invalidMaterial;
        foreach (var renderer in _ghost.GetComponentsInChildren<Renderer>())
        {
            renderer.sharedMaterials = System.Array.ConvertAll(
                renderer.sharedMaterials, _ => material);
        }
    }

    private int GetRotationSteps(Transform transform)
    {
        return Mathf.RoundToInt(Mathf.Repeat(transform.eulerAngles.y, 360f) / 90f) & 3;
    }

    private void PlaceTile(GameObject prefab)
    {
        Vector3 position = _hoverTile.position;
        Quaternion rotation = _ghost.transform.rotation;
        Transform parent = _hoverTile.parent;

        Destroy(_hoverTile.gameObject);
        Destroy(_ghost);

        GameObject placed = Instantiate(prefab, position, rotation, parent);
        SetLayerRecursively(placed.transform, _placedLayer);

        NotifyTileManager(placed);
        ClearState();
    }

    private void NotifyTileManager(GameObject placed)
    {
        TileManager.Instance?.AdvanceQueue();
        if (placed.CompareTag("Road"))
            TileManager.Instance?.OnRoadPlaced(placed.transform);
    }

    private void ClearState()
    {
        _hoverTile = null;
        _ghost = null;
    }

    private void SetRenderersEnabled(Transform target, bool enabled)
    {
        foreach (var renderer in target.GetComponentsInChildren<Renderer>())
            renderer.enabled = enabled;
    }

    private void ClearPreview()
    {
        if (_hoverTile) SetRenderersEnabled(_hoverTile, true);
        if (_ghost) Destroy(_ghost);
        ClearState();
    }

    private void SetLayerRecursively(Transform target, int layer)
    {
        target.gameObject.layer = layer;
        foreach (Transform child in target)
            SetLayerRecursively(child, layer);
    }
}