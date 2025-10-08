using System;
using System.Collections.Generic;
using UnityEngine;

public class InventorySystem : Singleton<InventorySystem>
{ 
    [Header("Inventory Settings")]
    public int hotbarSize = 9;
    public int inventoryWidth = 9;
    public int inventoryHeight = 4;
    public ItemData itemToTest;

    private InventorySlot[] hotbarSlots;
    private InventorySlot[] inventorySlots;
    private int selectedHotbarSlot;

    public static event Action<int> OnHotbarSelectionChanged;
    public static event Action OnInventoryChanged;

    /// sumary
    /// Initializes the singleton and inventory arrays
    /// summary
    public override void Awake()
    {
        base.Awake();

        InitializeInventory();
    }

    /// sumary
    /// Adds a test item if assigned
    /// summary
    void Start()
    {
        AddItem(itemToTest);
    }

    /// sumary
    /// Processes input for hotbar selection
    /// summary
    void Update()
    {
        HandleHotbarInput();
    }

    /// sumary
    /// Allocates hotbar and inventory slot arrays
    /// summary
    void InitializeInventory()
    {
        hotbarSlots = CreateSlots(hotbarSize);
        inventorySlots = CreateSlots(inventoryWidth * inventoryHeight);
        selectedHotbarSlot = 0;
    }


    public int GetSelectedHotbarIndex() => selectedHotbarSlot;
    public InventorySlot GetHotbarSlot(int index) => index >= 0 && index < hotbarSize ? hotbarSlots[index] : null;
    public InventorySlot GetInventorySlot(int index) => index >= 0 && index < inventorySlots.Length ? inventorySlots[index] : null;
    public InventorySlot GetSelectedHotbarSlot() => hotbarSlots[selectedHotbarSlot];
    public InventorySlot[] GetAllHotbarSlots() => hotbarSlots;
    public InventorySlot[] GetAllInventorySlots() => inventorySlots;


    /// sumary
    /// Returns a new array of empty slots
    /// summary
    InventorySlot[] CreateSlots(int count)
    {
        var slots = new InventorySlot[count];
        for (int i = 0; i < slots.Length; i++) slots[i] = new InventorySlot();
        return slots;
    }

    /// sumary
    /// Handles number keys and scroll for hotbar
    /// summary
    void HandleHotbarInput()
    {
        for (int i = 0; i < hotbarSize; i++)
        {
            var action = (GameAction)Enum.Parse(typeof(GameAction), $"Hotbar{i + 1}");
            if (InputHandler.Pressed(action))
            {
                SelectHotbarSlot(i);
                return;
            }
        }

        float scroll = InputHandler.GetValue<Vector2>(GameAction.ScrollHotbar).y;
        if (Mathf.Abs(scroll) > 0f)
        {
            int direction = scroll > 0 ? -1 : 1;
            int next = (selectedHotbarSlot + direction + hotbarSize) % hotbarSize;
            SelectHotbarSlot(next);
        }
    }

    /// sumary
    /// Changes selected hotbar slot and notifies listeners
    /// summary
    public void SelectHotbarSlot(int slotIndex)
    {
        if (slotIndex < 0 || slotIndex >= hotbarSize) return;
        if (slotIndex == selectedHotbarSlot) return;

        selectedHotbarSlot = slotIndex;
        OnHotbarSelectionChanged?.Invoke(selectedHotbarSlot);
    }

    /// sumary
    /// Adds an item stack across hotbar and inventory
    /// summary
    public bool AddItem(ItemData item, int quantity = 1)
    {
        if (item == null || quantity <= 0) return false;

        int remaining = quantity;

        remaining = TryAddToExistingStacks(hotbarSlots, item, remaining);
        remaining = remaining > 0 ? TryAddToExistingStacks(inventorySlots, item, remaining) : remaining;

        remaining = remaining > 0 ? TryAddToEmptySlots(hotbarSlots, item, remaining) : remaining;
        remaining = remaining > 0 ? TryAddToEmptySlots(inventorySlots, item, remaining) : remaining;

        if (remaining < quantity)
        {
            OnInventoryChanged?.Invoke();
            return remaining == 0;
        }

        return false;
    }

    /// sumary
    /// Adds as many as possible and returns the amount added
    /// summary
    public int AddAsMuchAsPossible(ItemData item, int quantity)
    {
        if (item == null || quantity <= 0) return 0;

        int start = quantity;

        quantity = TryAddToExistingStacks(hotbarSlots, item, quantity);
        quantity = quantity > 0 ? TryAddToExistingStacks(inventorySlots, item, quantity) : quantity;

        quantity = quantity > 0 ? TryAddToEmptySlots(hotbarSlots, item, quantity) : quantity;
        quantity = quantity > 0 ? TryAddToEmptySlots(inventorySlots, item, quantity) : quantity;

        int added = start - quantity;
        if (added > 0) OnInventoryChanged?.Invoke();
        return added;
    }


    /// sumary
    /// Fills partial stacks in given slots
    /// summary
    int TryAddToExistingStacks(InventorySlot[] slots, ItemData item, int quantity)
    {
        for (int i = 0; i < slots.Length && quantity > 0; i++)
        {
            var s = slots[i];
            if (!s.IsEmpty && s.item == item && !s.IsFull)
            {
                quantity = s.AddItem(item, quantity);
            }
        }
        return quantity;
    }

    /// sumary
    /// Uses empty slots in given array
    /// summary
    int TryAddToEmptySlots(InventorySlot[] slots, ItemData item, int quantity)
    {
        for (int i = 0; i < slots.Length && quantity > 0; i++)
        {
            var s = slots[i];
            if (s.IsEmpty)
            {
                quantity = s.AddItem(item, quantity);
            }
        }
        return quantity;
    }

    /// sumary
    /// Removes quantity from a specific slot
    /// summary
    public InventorySlot RemoveItem(int slotIndex, bool fromHotbar, int quantity = 1)
    {
        var target = fromHotbar ? hotbarSlots : inventorySlots;
        if (slotIndex < 0 || slotIndex >= target.Length) return new InventorySlot();

        var removed = target[slotIndex].RemoveItem(quantity);
        if (removed.quantity > 0) OnInventoryChanged?.Invoke();
        return removed;
    }

    /// sumary
    /// Swaps two slots between regions
    /// summary
    public void MoveItem(int fromIndex, bool fromHotbar, int toIndex, bool toHotbar)
    {
        var from = fromHotbar ? hotbarSlots : inventorySlots;
        var to = toHotbar ? hotbarSlots : inventorySlots;

        if (fromIndex < 0 || fromIndex >= from.Length) return;
        if (toIndex < 0 || toIndex >= to.Length) return;

        var tmp = from[fromIndex];
        from[fromIndex] = to[toIndex];
        to[toIndex] = tmp;

        OnInventoryChanged?.Invoke();
    }



    /// sumary
    /// Counts total of a given item across all slots
    /// summary
    public int GetTotalQuantity(ItemData item)
    {
        if (item == null) return 0;
        int total = 0;
        for (int i = 0; i < hotbarSlots.Length; i++)
            if (!hotbarSlots[i].IsEmpty && hotbarSlots[i].item == item) total += hotbarSlots[i].quantity;
        for (int i = 0; i < inventorySlots.Length; i++)
            if (!inventorySlots[i].IsEmpty && inventorySlots[i].item == item) total += inventorySlots[i].quantity;
        return total;
    }

    /// sumary
    /// Checks capacity for multiple output stacks
    /// summary
    public bool HasSpaceForOutputs(List<ItemResult> outputs)
    {
        var needed = new Dictionary<ItemData, int>();
        for (int i = 0; i < outputs.Count; i++)
        {
            var o = outputs[i];
            if (o.item == null || o.quantity <= 0) continue;
            if (!needed.ContainsKey(o.item)) needed[o.item] = 0;
            needed[o.item] += o.quantity;
        }

        foreach (var kv in needed)
        {
            if (CountAvailableCapacityForItem(kv.Key) < kv.Value) return false;
        }

        return true;
    }

    /// sumary
    /// Sums free stack capacity and empty slot capacity for an item
    /// summary
    int CountAvailableCapacityForItem(ItemData item)
    {
        int cap = 0;

        for (int i = 0; i < hotbarSlots.Length; i++)
        {
            var s = hotbarSlots[i];
            if (!s.IsEmpty && s.item == item) cap += item.maxStackSize - s.quantity;
            else if (s.IsEmpty) cap += item.maxStackSize;
        }

        for (int i = 0; i < inventorySlots.Length; i++)
        {
            var s = inventorySlots[i];
            if (!s.IsEmpty && s.item == item) cap += item.maxStackSize - s.quantity;
            else if (s.IsEmpty) cap += item.maxStackSize;
        }

        return cap;
    }

    /// sumary
    /// Removes a quantity of an item across all slots
    /// summary
    public bool RemoveItems(ItemData item, int quantity)
    {
        if (item == null) return false;
        if (quantity <= 0) return true;

        int remaining = quantity;

        for (int i = 0; i < hotbarSlots.Length && remaining > 0; i++)
        {
            var s = hotbarSlots[i];
            if (!s.IsEmpty && s.item == item)
            {
                int take = Mathf.Min(remaining, s.quantity);
                s.RemoveItem(take);
                remaining -= take;
            }
        }

        for (int i = 0; i < inventorySlots.Length && remaining > 0; i++)
        {
            var s = inventorySlots[i];
            if (!s.IsEmpty && s.item == item)
            {
                int take = Mathf.Min(remaining, s.quantity);
                s.RemoveItem(take);
                remaining -= take;
            }
        }

        if (remaining == 0)
        {
            OnInventoryChanged?.Invoke();
            return true;
        }

        return false;
    }

    /// sumary
    /// Validates materials and capacity for a recipe
    /// summary
    public bool CanCraftFromInventory(Recipe recipe)
    {
        if (recipe == null) return false;

        for (int i = 0; i < recipe.inputs.Count; i++)
        {
            var req = recipe.inputs[i];
            if (req.item == null || req.quantity <= 0) continue;
            if (GetTotalQuantity(req.item) < req.quantity) return false;
        }

        return HasSpaceForOutputs(recipe.outputs);
    }

    /// sumary
    /// Consumes inputs and adds outputs for a recipe
    /// summary
    public bool CraftIntoInventory(Recipe recipe)
    {
        if (!CanCraftFromInventory(recipe)) return false;

        for (int i = 0; i < recipe.inputs.Count; i++)
        {
            var req = recipe.inputs[i];
            if (req.item == null || req.quantity <= 0) continue;
            RemoveItems(req.item, req.quantity);
        }

        for (int i = 0; i < recipe.outputs.Count; i++)
        {
            var o = recipe.outputs[i];
            if (o.item == null || o.quantity <= 0) continue;
            if (!AddItem(o.item, o.quantity)) return false;
        }

        OnInventoryChanged?.Invoke();
        return true;
    }
}
