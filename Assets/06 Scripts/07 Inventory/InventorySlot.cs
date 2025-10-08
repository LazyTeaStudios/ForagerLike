using UnityEngine;

[System.Serializable]
public class InventorySlot
{
    [Header("Slot Contents")]
    [SerializeField] private ItemData _item;
    [SerializeField] private int _quantity;

    public ItemData item
    {
        get => _item;
        set
        {
            _item = value;
            ValidateSlot();
        }
    }

    public int quantity
    {
        get => _quantity;
        set
        {
            _quantity = Mathf.Max(0, value);
            ValidateSlot();
        }
    }

    public InventorySlot()
    {
        _item = null;
        _quantity = 0;
    }

    public InventorySlot(ItemData item, int quantity)
    {
        this._item = item;
        this._quantity = quantity;
        ValidateSlot();
    }

    public bool IsEmpty()
    {
        return _item == null || _quantity <= 0;
    }

    public void Clear()
    {
        _item = null;
        _quantity = 0;
    }

    private void ValidateSlot()
    {
        if (_item == null)
        {
            _quantity = 0;
        }
        else if (_quantity <= 0)
        {
            _item = null;
            _quantity = 0;
        }
        else if (_item.maxStackSize > 0)
        {
            _quantity = Mathf.Min(_quantity, _item.maxStackSize);
        }
    }

    public override string ToString()
    {
        if (IsEmpty()) return "Empty Slot";
        return $"{_item.itemName} x{_quantity}";
    }
}