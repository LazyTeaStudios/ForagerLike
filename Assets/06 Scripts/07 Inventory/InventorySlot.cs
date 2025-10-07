using UnityEngine;

[System.Serializable]
public class InventorySlot
{
    public ItemData item;
    public int quantity;

    public bool IsEmpty => item == null || quantity <= 0;
    public bool IsFull => item != null && quantity >= item.maxStackSize;

    /// sumary
    /// Clears the slot
    /// summary
    public void Clear()
    {
        item = null;
        quantity = 0;
    }

    /// sumary
    /// Validates if items can be added
    /// summary
    public bool CanAddItem(ItemData itemToAdd, int amount = 1)
    {
        if (itemToAdd == null || amount <= 0) return false;
        if (IsEmpty) return amount <= itemToAdd.maxStackSize;
        if (item != itemToAdd) return false;
        return quantity + amount <= item.maxStackSize;
    }

    /// sumary
    /// Adds up to amount and returns remaining
    /// summary
    public int AddItem(ItemData itemToAdd, int amount)
    {
        if (itemToAdd == null || amount <= 0) return amount;

        if (IsEmpty)
        {
            item = itemToAdd;
            int canTake = Mathf.Min(amount, itemToAdd.maxStackSize);
            quantity = canTake;
            return amount - canTake;
        }

        if (item != itemToAdd) return amount;

        int free = item.maxStackSize - quantity;
        int taken = Mathf.Min(amount, free);
        quantity += taken;
        return amount - taken;
    }

    /// sumary
    /// Removes up to amount and returns a stack copy
    /// summary
    public InventorySlot RemoveItem(int amount)
    {
        if (IsEmpty || amount <= 0) return new InventorySlot();

        int removed = Mathf.Min(amount, quantity);
        quantity -= removed;

        var result = new InventorySlot { item = item, quantity = removed };
        if (quantity <= 0) Clear();

        return result;
    }
}
