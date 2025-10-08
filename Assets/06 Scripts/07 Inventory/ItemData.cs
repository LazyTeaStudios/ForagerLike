using UnityEngine;
using NaughtyAttributes;

[CreateAssetMenu(fileName = "New Item", menuName = "Inventory/Item")]
public class ItemData : ScriptableObject
{
    [Header("Basic Info")]
    public string itemName;
    public Sprite icon;
    public int maxStackSize = 64;
    public ItemType itemType;

    [Header("Tool Properties")]
    [ShowIf(nameof(itemType), ItemType.Tool)]
    public ToolData toolData;

    [Header("Prefab Reference")]
    public GameObject itemPrefab;

    [Header("Building Properties")]
    [ShowIf(nameof(itemType), ItemType.Building)]
    public GameObject buildingPrefab;

    [ShowIf(nameof(itemType), ItemType.Building)]
    public Vector2Int buildingSize = Vector2Int.one;

    public bool IsPlaceable => itemType == ItemType.Building && buildingPrefab != null;
}

public enum ItemType
{
    Tool,
    Material,
    Building
}
