using UnityEngine;

/// <summary>
/// Spawns items on death. Gets drop config from PlantGrowth.SeedData.
/// </summary>
[RequireComponent(typeof(HealthSystem))]
public class ItemDropper : MonoBehaviour
{
    [Header("Spawn")]
    [SerializeField] private Transform spawnPoint;
    [SerializeField] private float spawnRadius = 0.5f;
    [SerializeField] private float throwForce = 5f;

    private HealthSystem healthSystem;
    private PlantGrowth plantGrowth;

    private void Awake()
    {
        if (spawnPoint == null)
            spawnPoint = transform;

        healthSystem = GetComponent<HealthSystem>();
        plantGrowth = GetComponent<PlantGrowth>();
    }

    private void OnEnable()
    {
        if (healthSystem != null)
            healthSystem.OnDeath += Drop;
    }

    private void OnDisable()
    {
        if (healthSystem != null)
            healthSystem.OnDeath -= Drop;
    }

    private void Drop()
    {
        if (plantGrowth == null || plantGrowth.SeedData == null) return;

        var drops = plantGrowth.SeedData.drops;
        if (drops == null) return;

        foreach (var drop in drops)
        {
            var prefab = drop.GetPrefab();
            if (prefab == null) continue;

            for (int i = 0; i < drop.quantity; i++)
            {
                SpawnItem(prefab);
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