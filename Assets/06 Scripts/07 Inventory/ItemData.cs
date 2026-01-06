using UnityEngine;
using NaughtyAttributes;

[CreateAssetMenu(fileName = "New Item", menuName = "Inventory/Item")]
public class ItemData : ScriptableObject
{
    [Header("Basic Info")]
    public string itemName;
    public Sprite icon;
    public int maxStackSize = 64;

    [Header("Prefab Reference")]
    public GameObject itemPrefab;
}

public enum ItemType
{
    Material,
}
