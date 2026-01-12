using UnityEngine;

public class ItemDropper : MonoBehaviour
{
    [Header("Spawn Settings")]
    [SerializeField] private Transform spawnPoint;
    [SerializeField] private float spawnRadius = 0.5f;
    [SerializeField] private float throwForce = 3f;

    private HealthSystem healthSystem;

    void Awake()
    {
        if (spawnPoint == null)
            spawnPoint = transform;
    }

    public void SetSpawnPoint(Transform point) => spawnPoint = point;

    public void Drop(GameObject prefab)
    {
        if (prefab == null) return;

        Vector3 offset = Random.insideUnitSphere * spawnRadius;
        offset.y = Mathf.Abs(offset.y + 0.5f);

        var item = Instantiate(prefab, spawnPoint.position + offset, Random.rotation);

        var rb = item.GetComponent<Rigidbody>();
        if (rb != null)
        {
            Vector3 dir = Random.onUnitSphere;
            dir.y = Mathf.Abs(dir.y);
            rb.AddForce(dir * throwForce, ForceMode.Impulse);
        }
    }

    public void Drop(GameObject prefab, int quantity)
    {
        for (int i = 0; i < quantity; i++)
            Drop(prefab);
    }

    public void Drop(ItemData item, int quantity)
    {
        if (item?.itemPrefab == null) return;
        Drop(item.itemPrefab, quantity);
    }
}