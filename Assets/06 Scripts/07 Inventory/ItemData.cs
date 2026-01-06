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

    [Header("Prefab Reference")]
    public GameObject itemPrefab;

    [Header("Seed Properties")]
    [ShowIf(nameof(itemType), ItemType.Seed)]
    public int growthStages = 5;
    [ShowIf(nameof(itemType), ItemType.Seed)]
    public GameObject plantPrefab;
}

public enum ItemType
{
    Material,
    Seed
}