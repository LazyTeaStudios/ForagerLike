using System.Collections.Generic;
using UnityEngine;

public class TileManager : MonoBehaviour
{
    public static TileManager Instance { get; private set; }

    [Header("Placement Queue")]
    public List<GameObject> tileQueue = new List<GameObject>();

    [Header("Markers")]
    public Transform towerMarker;
    public Transform spawnMarker;

    [Header("Pathfinding")]
    [SerializeField] private LayerMask placedMask;
    [SerializeField] private float gridStep = 1f;
    [SerializeField] private float spawnerYOffset = 0.095f;

    private int queueIndex;
    private readonly List<Vector3> _currentPath = new();

    public IReadOnlyList<Vector3> CurrentPath => _currentPath;
    public GameObject CurrentPrefab => queueIndex < tileQueue.Count ? tileQueue[queueIndex] : null;

    private static readonly Vector3[] Directions = {
        Vector3.forward, Vector3.right, Vector3.back, Vector3.left
    };

    void Awake()
    {
        if (Instance && Instance != this)
        {
            Destroy(gameObject);
            return;
        }
        Instance = this;
    }

    void Start()
    {
        InitializeMarkers();
    }

    public void AdvanceQueue()
    {
        queueIndex++;
    }

    public void OnRoadPlaced(Transform _)
    {
        RecalculatePath();
    }

    private void InitializeMarkers()
    {
        var towerTile = GameObject.FindWithTag("TowerTile");
        if (towerTile) towerMarker = towerTile.transform;

        var spawner = FindFirstObjectByType<EnemySpawner>();
        if (spawner) spawnMarker = spawner.transform;
    }

    private void RecalculatePath()
    {
        _currentPath.Clear();
        if (!towerMarker || !spawnMarker) return;

        var pathData = FindPath();
        if (pathData.Count > 0)
        {
            _currentPath.AddRange(pathData);
            UpdateSpawnerPosition();
        }
    }

    private List<Vector3> FindPath()
    {
        if (!ValidateStartTile()) return new List<Vector3>();

        var visited = new HashSet<Transform>();
        var parent = new Dictionary<Transform, Transform>();
        var queue = new Queue<Transform>();

        visited.Add(towerMarker);
        queue.Enqueue(towerMarker);

        Transform furthest = towerMarker;

        while (queue.Count > 0)
        {
            Transform current = queue.Dequeue();
            furthest = ProcessTile(current, visited, parent, queue, furthest);
        }

        return BuildPath(furthest, parent);
    }

    private bool ValidateStartTile()
    {
        if (!towerMarker.GetComponent<TileConnections>())
        {
            Debug.LogWarning("TileManager: Tower marker needs TileConnections component.");
            return false;
        }
        return true;
    }

    private Transform ProcessTile(Transform tile, HashSet<Transform> visited,
        Dictionary<Transform, Transform> parent, Queue<Transform> queue, Transform furthest)
    {
        var connections = tile.GetComponent<TileConnections>();
        bool[] openings = connections.GetRotated(GetRotationSteps(tile));

        for (int i = 0; i < 4; i++)
        {
            if (!openings[i]) continue;

            Transform neighbor = GetNeighbor(tile, i);
            if (!neighbor || visited.Contains(neighbor)) continue;

            if (ValidateNeighborConnection(neighbor, i))
            {
                visited.Add(neighbor);
                parent[neighbor] = tile;
                queue.Enqueue(neighbor);
                furthest = neighbor;
            }
        }

        return furthest;
    }

    private Transform GetNeighbor(Transform tile, int direction)
    {
        Vector3 checkPos = tile.position + Directions[direction] * gridStep;
        if (Physics.Raycast(checkPos + Vector3.up, Vector3.down, out var hit, 2f, placedMask))
            return hit.collider.transform;
        return null;
    }

    private bool ValidateNeighborConnection(Transform neighbor, int direction)
    {
        var neighborConnections = neighbor.GetComponent<TileConnections>();
        if (!neighborConnections) return false;

        bool neighborOpen = neighborConnections.GetRotated(GetRotationSteps(neighbor))[(direction + 2) & 3];
        return neighborOpen;
    }

    private List<Vector3> BuildPath(Transform end, Dictionary<Transform, Transform> parent)
    {
        var path = new List<Vector3>();
        Transform current = end;

        while (current)
        {
            path.Add(current.position);
            parent.TryGetValue(current, out current);
        }

        return path;
    }

    private void UpdateSpawnerPosition()
    {
        if (_currentPath.Count > 0)
            spawnMarker.position = _currentPath[0] + Vector3.up * spawnerYOffset;
    }

    private int GetRotationSteps(Transform transform)
    {
        return Mathf.RoundToInt(Mathf.Repeat(transform.eulerAngles.y, 360f) / 90f) & 3;
    }
}