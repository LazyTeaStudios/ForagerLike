using UnityEngine;
using UnityEditor;
using NaughtyAttributes;

/// <summary>
/// Generates a grid with one tower-spawn pair at the center, randomly oriented.
/// </summary>
[ExecuteInEditMode]
public class GridGenerator : MonoBehaviour
{
    [Header("Grid Settings")]
    [SerializeField, Min(2)] private int gridSize = 10;
    [SerializeField] private float tileSize = 1f;

    [Header("Prefabs")]
    public GameObject[] tilePrefabs;
    public GameObject towerTilePrefab;
    public GameObject spawnTilePrefab;

    private static readonly Vector2Int[] Directions = {
        new(0, -1), new(-1, 0), new(0, 1), new(1, 0)
    };

    [Button("Clear Grid")]
    public void ClearGrid()
    {
        for (int i = transform.childCount - 1; i >= 0; i--)
            Undo.DestroyObjectImmediate(transform.GetChild(i).gameObject);
    }

    [Button("Generate Grid")]
    public void GenerateGrid()
    {
        if (!ValidatePrefabs()) return;

        ClearGrid();

        var towerSpawnPair = GenerateTowerSpawnPair();
        CreateGrid(towerSpawnPair);
    }

    private bool ValidatePrefabs()
    {
        if (!towerTilePrefab || !spawnTilePrefab)
        {
            Debug.LogWarning($"{name}: Assign tower & spawn prefabs.");
            return false;
        }

        if (tilePrefabs == null || tilePrefabs.Length == 0)
        {
            Debug.LogWarning($"{name}: No regular tile prefabs assigned.");
            return false;
        }

        return true;
    }

    private (Vector2Int tower, Vector2Int spawn, int orientation) GenerateTowerSpawnPair()
    {
        int orientation = Random.Range(0, 4);
        Vector2Int direction = Directions[orientation];

        int center = gridSize / 2;
        int rangeMin = center - 1;
        int rangeMax = center + 1;

        Vector2Int towerPos = new(center, center);

        for (int attempts = 0; attempts < 30; attempts++)
        {
            var candidate = new Vector2Int(
                Random.Range(rangeMin, rangeMax + 1),
                Random.Range(rangeMin, rangeMax + 1)
            );

            Vector2Int spawnCandidate = candidate + direction;

            if (IsInBounds(spawnCandidate))
            {
                towerPos = candidate;
                break;
            }
        }

        return (towerPos, towerPos + direction, orientation);
    }

    private void CreateGrid((Vector2Int tower, Vector2Int spawn, int orientation) towerSpawnPair)
    {
        Vector3 origin = transform.position;
        float halfGrid = gridSize / 2f;
        Quaternion pairRotation = Quaternion.Euler(0f, towerSpawnPair.orientation * 90f, 0f);

        for (int x = 0; x < gridSize; x++)
        {
            for (int z = 0; z < gridSize; z++)
            {
                var gridPos = new Vector2Int(x, z);
                GameObject prefab = SelectPrefab(gridPos, towerSpawnPair);

                if (!prefab) continue;

                Vector3 worldPos = CalculateWorldPosition(origin, gridPos, halfGrid, prefab);
                Quaternion rotation = CalculateRotation(prefab, pairRotation);

                CreateTile(prefab, worldPos, rotation);
            }
        }
    }

    private GameObject SelectPrefab(Vector2Int gridPos, (Vector2Int tower, Vector2Int spawn, int orientation) pair)
    {
        if (gridPos == pair.tower) return towerTilePrefab;
        if (gridPos == pair.spawn) return spawnTilePrefab;
        return tilePrefabs[Random.Range(0, tilePrefabs.Length)];
    }

    private Vector3 CalculateWorldPosition(Vector3 origin, Vector2Int gridPos, float halfGrid, GameObject prefab)
    {
        Vector3 pos = origin + new Vector3(
            (gridPos.x - halfGrid + 0.5f) * tileSize,
            0f,
            (gridPos.y - halfGrid + 0.5f) * tileSize
        );

        if (prefab == spawnTilePrefab)
            pos.y += 0.095f;

        return pos;
    }

    private Quaternion CalculateRotation(GameObject prefab, Quaternion pairRotation)
    {
        if (prefab == towerTilePrefab || prefab == spawnTilePrefab)
            return pairRotation;

        return Quaternion.Euler(0f, Random.Range(0, 4) * 90f, 0f);
    }

    private void CreateTile(GameObject prefab, Vector3 position, Quaternion rotation)
    {
        GameObject instance = (GameObject)PrefabUtility.InstantiatePrefab(prefab, transform);
        Undo.RegisterCreatedObjectUndo(instance, "Create grid tile");
        instance.transform.SetPositionAndRotation(position, rotation);
    }

    private bool IsInBounds(Vector2Int pos) =>
        pos.x >= 0 && pos.x < gridSize && pos.y >= 0 && pos.y < gridSize;
}