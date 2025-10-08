using UnityEngine;

[System.Serializable]
public class ItemDrop
{
    public GameObject itemPrefab;
    [Range(1, 100)] public int quantity = 1;
}

/// <summary>
/// Spawns items when triggered, typically on death.
/// </summary>
public class ItemDropper : MonoBehaviour
{
    [Header("Drops")]
    [SerializeField] private ItemDrop[] drops;

    [Header("Spawn")]
    [SerializeField] private Transform spawnPoint;
    [SerializeField] private float spawnRadius = 0.5f;
    [SerializeField] private float throwForce = 5f;

    private void Awake()
    {
        if (spawnPoint == null)
            spawnPoint = transform;
    }

    public void Drop()
    {
        foreach (var drop in drops)
        {
            for (int i = 0; i < drop.quantity; i++)
            {
                SpawnItem(drop.itemPrefab);
            }
        }
    }

    private void SpawnItem(GameObject itemPrefab)
    {
        Vector3 randomOffset = Random.insideUnitSphere * spawnRadius;
        randomOffset.y = Mathf.Abs(randomOffset.y);
        Vector3 spawnPosition = spawnPoint.position + randomOffset;

        GameObject item = Instantiate(itemPrefab, spawnPosition, Random.rotation);

        Rigidbody rb = item.GetComponent<Rigidbody>();
        if (rb != null)
        {
            Vector3 throwDirection = Random.onUnitSphere;
            throwDirection.y = Mathf.Abs(throwDirection.y);
            rb.AddForce(throwDirection * throwForce, ForceMode.Impulse);
        }
    }
}