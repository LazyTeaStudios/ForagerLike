using System;
using System.Collections.Generic;
using UnityEngine;

public class BiomeZone : MonoBehaviour
{
    [Header("Biome")]
    [SerializeField] private BiomeData biomeData;

    [Header("Zone Grid (centered on this GameObject)")]
    [Min(1)][SerializeField] private int gridWidth = 64;
    [Min(1)][SerializeField] private int gridHeight = 64;
    [Min(0.1f)][SerializeField] private float cellSize = 1f;

    [Tooltip("Which cells are allowed to spawn in (stored as width*height bools).")]
    [SerializeField] private bool[] allowedCells;

    [Header("Spawning")]
    [SerializeField] private float raycastHeight = 100f;
    [Tooltip("Layers to ignore when checking the FIRST hit (e.g. zone trigger volumes, helper colliders).")]
    [SerializeField] private LayerMask ignoreRaycastLayers;
    [SerializeField] private int maxSpawnAttemptsPerTick = 10;

    [Header("Slope Limit")]
    [Range(0f, 89f)]
    [SerializeField] private float maxGroundSlopeAngle = 10f;

    [Header("Debug")]
    [SerializeField] private bool drawGridGizmos = true;
    [SerializeField] private bool drawAllowedCells = true;
    [Range(0.1f, 1f)][SerializeField] private float allowedCellFill = 0.9f;

    private readonly List<GameObject> spawnedObjects = new List<GameObject>();
    private bool isPaused;

    // cache for faster random selection
    [NonSerialized] private List<int> _allowedIndexCache;
    [NonSerialized] private bool _cacheDirty = true;

    // -------------------- Unity --------------------

    private void OnValidate()
    {
        EnsureGridSize();
        _cacheDirty = true;
    }

    private void Start()
    {
        EnsureGridSize();
        TickManager.OnTick += OnTick;
    }

    private void OnDestroy()
    {
        TickManager.OnTick -= OnTick;
    }

    private void OnTick()
    {
        CleanupDestroyedObjects();

        if (biomeData == null)
            return;

        if (isPaused || spawnedObjects.Count >= biomeData.maxSpawnCount)
        {
            isPaused = true;
            return;
        }

        TrySpawnObject();
    }

    // -------------------- Spawning --------------------

    private void TrySpawnObject()
    {
        if (biomeData.spawnablePrefabs == null || biomeData.spawnablePrefabs.Length == 0)
            return;

        for (int i = 0; i < maxSpawnAttemptsPerTick; i++)
        {
            if (TryGetSpawnPoint(out Vector3 spawnPoint))
            {
                SpawnRandomObject(spawnPoint);
                return;
            }
        }
    }

    private bool TryGetSpawnPoint(out Vector3 groundPoint)
    {
        groundPoint = default;

        if (!TryGetRandomAllowedPoint(out Vector3 basePoint))
            return false;

        Vector3 rayOrigin = new Vector3(basePoint.x, basePoint.y + raycastHeight, basePoint.z);
        float maxDist = raycastHeight * 2f;

        // Cast against everything (minus ignored layers) so ANY collider can block the ray.
        int mask = Physics.DefaultRaycastLayers & ~ignoreRaycastLayers.value;

        RaycastHit[] hits = Physics.RaycastAll(
            rayOrigin,
            Vector3.down,
            maxDist,
            mask,
            QueryTriggerInteraction.Ignore
        );

        if (hits == null || hits.Length == 0)
            return false;

        Array.Sort(hits, (a, b) => a.distance.CompareTo(b.distance));
        RaycastHit firstHit = hits[0];

        // First hit MUST be ground.
        if (!IsInLayerMask(firstHit.collider.gameObject.layer, biomeData.groundLayer))
            return false;

        // NEW: reject steep surfaces (e.g. tables, ramps, cliffs)
        float slopeAngle = Vector3.Angle(firstHit.normal, Vector3.up);
        if (slopeAngle > maxGroundSlopeAngle)
            return false;

        // Ensure still inside grid bounds (in case of steep slopes/edges)
        if (!WorldToCell(firstHit.point, out _, out _))
            return false;

        groundPoint = firstHit.point;
        return true;
    }

    private void SpawnRandomObject(Vector3 position)
    {
        GameObject prefab = biomeData.spawnablePrefabs[UnityEngine.Random.Range(0, biomeData.spawnablePrefabs.Length)];
        GameObject spawned = Instantiate(prefab, position, Quaternion.identity, transform);
        spawnedObjects.Add(spawned);
    }

    private void CleanupDestroyedObjects()
    {
        spawnedObjects.RemoveAll(o => o == null);

        if (biomeData != null && isPaused && spawnedObjects.Count < biomeData.maxSpawnCount)
            isPaused = false;
    }

    public void RemoveSpawnedObject(GameObject obj)
    {
        if (spawnedObjects.Remove(obj))
        {
            Destroy(obj);

            if (biomeData != null && isPaused && spawnedObjects.Count < biomeData.maxSpawnCount)
                isPaused = false;
        }
    }

    // -------------------- Grid API (used by editor painting & runtime sampling) --------------------

    private void EnsureGridSize()
    {
        gridWidth = Mathf.Max(1, gridWidth);
        gridHeight = Mathf.Max(1, gridHeight);
        int count = gridWidth * gridHeight;

        if (allowedCells == null || allowedCells.Length != count)
        {
            bool[] newArr = new bool[count];
            if (allowedCells != null)
            {
                int copy = Mathf.Min(allowedCells.Length, newArr.Length);
                Array.Copy(allowedCells, newArr, copy);
            }
            allowedCells = newArr;
        }
    }

    private int Index(int x, int y) => (y * gridWidth) + x;
    private bool InBounds(int x, int y) => x >= 0 && y >= 0 && x < gridWidth && y < gridHeight;

    private float HalfWidthWorld => (gridWidth * cellSize) * 0.5f;
    private float HalfHeightWorld => (gridHeight * cellSize) * 0.5f;

    private Vector3 GridOriginWorld
    {
        get
        {
            Vector3 c = transform.position;
            return new Vector3(c.x - HalfWidthWorld, c.y, c.z - HalfHeightWorld);
        }
    }

    public Bounds GridWorldBounds
    {
        get
        {
            Vector3 c = transform.position;
            Vector3 size = new Vector3(gridWidth * cellSize, 0.1f, gridHeight * cellSize);
            return new Bounds(new Vector3(c.x, c.y, c.z), size);
        }
    }

    public bool WorldToCell(Vector3 world, out int x, out int y)
    {
        Vector3 origin = GridOriginWorld;
        float lx = (world.x - origin.x) / cellSize;
        float lz = (world.z - origin.z) / cellSize;

        x = Mathf.FloorToInt(lx);
        y = Mathf.FloorToInt(lz);

        return InBounds(x, y);
    }

    public Vector3 CellCenterWorld(int x, int y)
    {
        Vector3 origin = GridOriginWorld;
        float wx = origin.x + (x + 0.5f) * cellSize;
        float wz = origin.z + (y + 0.5f) * cellSize;
        return new Vector3(wx, transform.position.y, wz);
    }

    public bool GetAllowed(int x, int y)
    {
        if (!InBounds(x, y)) return false;
        EnsureGridSize();
        return allowedCells[Index(x, y)];
    }

    public void SetAllowed(int x, int y, bool value)
    {
        if (!InBounds(x, y)) return;
        EnsureGridSize();

        int idx = Index(x, y);
        if (allowedCells[idx] == value) return;

        allowedCells[idx] = value;
        _cacheDirty = true;
    }

    public void ClearAll(bool value = false)
    {
        EnsureGridSize();
        for (int i = 0; i < allowedCells.Length; i++)
            allowedCells[i] = value;

        _cacheDirty = true;
    }

    public void PaintCircle(Vector3 world, float radius, bool value)
    {
        EnsureGridSize();

        Vector3 origin = GridOriginWorld;

        int minX = Mathf.FloorToInt(((world.x - radius) - origin.x) / cellSize);
        int maxX = Mathf.FloorToInt(((world.x + radius) - origin.x) / cellSize);
        int minY = Mathf.FloorToInt(((world.z - radius) - origin.z) / cellSize);
        int maxY = Mathf.FloorToInt(((world.z + radius) - origin.z) / cellSize);

        minX = Mathf.Clamp(minX, 0, gridWidth - 1);
        maxX = Mathf.Clamp(maxX, 0, gridWidth - 1);
        minY = Mathf.Clamp(minY, 0, gridHeight - 1);
        maxY = Mathf.Clamp(maxY, 0, gridHeight - 1);

        float r2 = radius * radius;

        for (int y = minY; y <= maxY; y++)
        {
            for (int x = minX; x <= maxX; x++)
            {
                Vector3 c = CellCenterWorld(x, y);
                float dx = c.x - world.x;
                float dz = c.z - world.z;
                if ((dx * dx + dz * dz) <= r2)
                    SetAllowed(x, y, value);
            }
        }
    }

    private void RebuildCacheIfNeeded()
    {
        if (!_cacheDirty && _allowedIndexCache != null) return;

        EnsureGridSize();
        _allowedIndexCache ??= new List<int>(allowedCells.Length);
        _allowedIndexCache.Clear();

        for (int i = 0; i < allowedCells.Length; i++)
            if (allowedCells[i]) _allowedIndexCache.Add(i);

        _cacheDirty = false;
    }

    private bool TryGetRandomAllowedPoint(out Vector3 point)
    {
        point = default;

        RebuildCacheIfNeeded();
        if (_allowedIndexCache.Count == 0)
            return false;

        int idx = _allowedIndexCache[UnityEngine.Random.Range(0, _allowedIndexCache.Count)];
        int x = idx % gridWidth;
        int y = idx / gridWidth;

        // random point inside the cell
        Vector3 origin = GridOriginWorld;
        float wx = origin.x + (x + UnityEngine.Random.value) * cellSize;
        float wz = origin.z + (y + UnityEngine.Random.value) * cellSize;

        point = new Vector3(wx, transform.position.y, wz);
        return true;
    }

    private bool IsInLayerMask(int layer, LayerMask mask) => (mask.value & (1 << layer)) != 0;

    // -------------------- Gizmos --------------------

    private void OnDrawGizmosSelected()
    {
        if (!drawGridGizmos) return;

        Bounds b = GridWorldBounds;
        Gizmos.DrawWireCube(new Vector3(b.center.x, transform.position.y, b.center.z), new Vector3(b.size.x, 0.05f, b.size.z));

        if (!drawAllowedCells) return;

        EnsureGridSize();

        float fill = Mathf.Clamp01(allowedCellFill);
        Vector3 boxSize = new Vector3(cellSize * fill, 0.05f, cellSize * fill);

        for (int y = 0; y < gridHeight; y++)
        {
            for (int x = 0; x < gridWidth; x++)
            {
                if (!GetAllowed(x, y)) continue;
                Vector3 c = CellCenterWorld(x, y);
                c.y = transform.position.y;
                Gizmos.DrawCube(c, boxSize);
            }
        }
    }

    // -------------------- Public info --------------------

    public int CurrentSpawnCount => spawnedObjects.Count;
    public bool IsPaused => isPaused;
    public BiomeType BiomeType => biomeData != null ? biomeData.biomeType : default;
}
