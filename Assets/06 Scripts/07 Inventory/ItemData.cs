using UnityEngine;
using VInspector;

[CreateAssetMenu(fileName = "New Item", menuName = "Inventory/Item")]
public class ItemData : ScriptableObject
{
    [Header("Basic Info")]
    public string itemName;
    public Sprite icon;
    public int maxStackSize = 64;
    public ItemType itemType;

    [Header("Prefab Reference")]
    [ShowIf(nameof(itemType), ItemType.Material)]
    public GameObject itemPrefab;

    [Header("Seed Properties")]
    [ShowIf(nameof(itemType), ItemType.Seed)]
    public int growthStages = 5;

    [ShowIf(nameof(itemType), ItemType.Seed)]
    public float maxHealth = 100f;

    [ShowIf(nameof(itemType), ItemType.Seed)]
    public GameObject plantPrefab;

    [ShowIf(nameof(itemType), ItemType.Seed)]
    public DropEntry[] drops;
}

[System.Serializable]
public class DropEntry
{
    public ItemData item;
    [Range(1, 100)] public int quantity = 1;

    public GameObject GetPrefab() => item != null ? item.itemPrefab : null;
}

public enum ItemType
{
    Material,
    Seed
}