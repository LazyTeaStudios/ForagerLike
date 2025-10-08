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
            ValidateAfterSingleFieldSet();
        }
    }

    public int quantity
    {
        get => _quantity;
        set
        {
            _quantity = Mathf.Max(0, value);
            // Same note as above.
            ValidateAfterSingleFieldSet();
        }
    }

    public InventorySlot()
    {
        _item = null;
        _quantity = 0;
    }

    public InventorySlot(ItemData item, int quantity)
    {
        Set(item, quantity);
    }

    /// <summary>
    /// Atomically assign both fields and then validate once.
    /// Use this for swaps, moves, and adds into empty slots.
    /// </summary>
    public void Set(ItemData item, int quantity)
    {
        _item = item;
        _quantity = Mathf.Max(0, quantity);
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

    /// <summary>
    /// Lenient validation for single-field sets: never nuke values mid-write.
    /// It only clamps stack sizes and normalizes zero state,
    /// but it does NOT clear item just because quantity is temporarily 0.
    /// </summary>
    private void ValidateAfterSingleFieldSet()
    {
        if (_item == null)
        {
            // If item is null, normalize to empty slot.
            _quantity = 0;
            return;
        }

        // If there is an item, cap quantity but don't auto-clear.
        if (_item.maxStackSize > 0)
            _quantity = Mathf.Min(_quantity, _item.maxStackSize);
    }

    /// <summary>
    /// Full validation when both fields are intended to be set.
    /// </summary>
    private void ValidateSlot()
    {
        if (_item == null || _quantity <= 0)
        {
            _item = null;
            _quantity = 0;
            return;
        }

        if (_item.maxStackSize > 0)
            _quantity = Mathf.Min(_quantity, _item.maxStackSize);
    }

    public override string ToString()
    {
        if (IsEmpty()) return "Empty Slot";
        return $"{_item.itemName} x{_quantity}";
    }
}
