using UnityEngine;

public class PlacedBuilding : MonoBehaviour
{
    public BuildItemSO buildItem;

    [Header("Resource Return")]
    [SerializeField] private bool returnFullResources = true;
    [SerializeField, Range(0f, 1f)] private float resourceReturnRate = 1f;

    [Header("Drops")]
    [SerializeField] private ItemDropper itemDropper;

    void Awake()
    {
        if (itemDropper == null)
            itemDropper = GetComponent<ItemDropper>();
        if (itemDropper == null)
            itemDropper = gameObject.AddComponent<ItemDropper>();
    }

    public void DropResources()
    {
        if (buildItem?.requiredResources == null) return;

        foreach (var req in buildItem.requiredResources)
        {
            if (req.item?.itemPrefab == null) continue;

            int amount = returnFullResources ? req.quantity : Mathf.CeilToInt(req.quantity * resourceReturnRate);
            itemDropper.Drop(req.item, amount);
        }
    }
}