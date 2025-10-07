using UnityEngine;

public class TileHoverMarker : MonoBehaviour
{
    [SerializeField] private GameObject markerPrefab;
    [SerializeField] private float heightOffset = 0.1f;
    [SerializeField] private LayerMask tileLayerMask = ~0;

    private GameObject _markerInstance;

    void Update()
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.GetValue<Vector2>(GameAction.GameplayMousePoint));

        if (Physics.Raycast(ray, out var hit, Mathf.Infinity, tileLayerMask))
        {
            ShowMarker(hit.collider.transform.position);
        }
        else
        {
            HideMarker();
        }
    }

    void ShowMarker(Vector3 position)
    {
        if (!_markerInstance)
            _markerInstance = Instantiate(markerPrefab);

        _markerInstance.transform.position = position + Vector3.up * heightOffset;
        _markerInstance.SetActive(true);
    }

    void HideMarker()
    {
        if (_markerInstance)
            _markerInstance.SetActive(false);
    }
}