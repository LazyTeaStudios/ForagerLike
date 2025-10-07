using UnityEngine;

public class ItemDropper : MonoBehaviour
{
    [Header("Drop Physics")]
    [SerializeField] private Transform dropSpawnPoint;

    private void Awake()
    {
        if (dropSpawnPoint == null)
            dropSpawnPoint = this.transform;
    }

    public void ProcessSpecificLootTable(LootTable lootTable)
    {
        ProcessLootTable(lootTable);
    }

    public void ProcessSpecificItem(GameObject itemPrefab)
    {
        SpawnDrop(itemPrefab);
    }

    private void ProcessLootTable(LootTable lootTable)
    {
        if (lootTable == null) return;

        if (UnityEngine.Random.Range(0f, 100f) <= lootTable.dropChance)
        {
            GameObject itemToDrop = lootTable.GetRandomDrop();
            if (itemToDrop != null)
            {
                SpawnDrop(itemToDrop);
            }
        }
    }

    private void SpawnDrop(GameObject itemPrefab)
    {
        Vector3 dropPosition = GetRandomDropPosition();
        GameObject dropObj = Instantiate(itemPrefab, dropPosition, Quaternion.identity);

        ItemPickup pickup = dropObj.GetComponent<ItemPickup>();
        if (pickup != null)
        {
            pickup.StartThrow();
        }
    }

    private Vector3 GetRandomDropPosition()
    {
        return dropSpawnPoint.position;
    }
}