using UnityEngine;

[System.Serializable]
public class InventorySlot
{
    private ItemData _item;
    private int _quantity;

    public ItemData item
    {
        get => _item;
        private set => _item = value;
    }

    public int quantity
    {
        get => _quantity;
        private set => _quantity = Mathf.Max(0, value);
    }

    public void Set(ItemData item, int quantity)
    {
        _item = item;
        _quantity = item == null ? 0 : Mathf.Clamp(quantity, 0, item.maxStackSize);
    }

    public bool IsEmpty() => _item == null || _quantity <= 0;

    public void Clear()
    {
        _item = null;
        _quantity = 0;
    }
}