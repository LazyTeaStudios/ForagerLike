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
        if (buildItem?.requiredResources == null) return;

        foreach (var req in buildItem.requiredResources)
        {
            if (req.item?.itemPrefab == null) continue;

            int amount = returnFullResources ? req.quantity : Mathf.CeilToInt(req.quantity * resourceReturnRate);

            for (int i = 0; i < amount; i++)
                SpawnDroppedItem(req.item.itemPrefab);
        }
    }

    void SpawnDroppedItem(GameObject itemPrefab)
    {
        Vector3 offset = Random.insideUnitSphere * dropSpawnRadius;
        offset.y = Mathf.Abs(offset.y + 0.5f);

        var item = Instantiate(itemPrefab, transform.position + offset, Random.rotation);

        var rb = item.GetComponent<Rigidbody>();
        if (rb != null)
        {
            Vector3 dir = Random.onUnitSphere;
            dir.y = Mathf.Abs(dir.y);
            rb.AddForce(dir * dropThrowForce, ForceMode.Impulse);
        }
    }
}