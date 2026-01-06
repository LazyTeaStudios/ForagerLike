using UnityEngine;

public class PlacedBuilding : MonoBehaviour
{
    public BuildItemSO buildItem;

    [Header("Drop Settings")]
    [SerializeField] private bool returnFullResources = true;
    [SerializeField, Range(0f, 1f)] private float resourceReturnRate = 1f;
    [SerializeField] private float dropSpawnRadius = 1f;
    [SerializeField] private float dropThrowForce = 3f;

    public void DropResources()
    {
        if (buildItem == null || buildItem.requiredResources == null) return;

        foreach (var requirement in buildItem.requiredResources)
        {
            if (requirement.item == null || requirement.item.itemPrefab == null) continue;

            int amountToDrop = returnFullResources
                ? requirement.quantity
                : Mathf.CeilToInt(requirement.quantity * resourceReturnRate);

            for (int i = 0; i < amountToDrop; i++)
            {
                SpawnDroppedItem(requirement.item.itemPrefab);
            }
        }
    }

    private void SpawnDroppedItem(GameObject itemPrefab)
    {
        Vector3 randomOffset = Random.insideUnitSphere * dropSpawnRadius;
        randomOffset.y = Mathf.Abs(randomOffset.y + 0.5f);
        Vector3 spawnPosition = transform.position + randomOffset;

        GameObject item = Instantiate(itemPrefab, spawnPosition, Random.rotation);

        Rigidbody rb = item.GetComponent<Rigidbody>();
        if (rb != null)
        {
            Vector3 throwDirection = Random.onUnitSphere;
            throwDirection.y = Mathf.Abs(throwDirection.y);
            rb.AddForce(throwDirection * dropThrowForce, ForceMode.Impulse);
        }
    }
}