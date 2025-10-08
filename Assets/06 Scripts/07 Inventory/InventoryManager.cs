using UnityEngine;

public class InventoryManager : Singleton<InventoryManager>
{
    [Header("Settings")]
    [SerializeField] int hotbarSize = 9;
    [SerializeField] int inventoryRows = 4;
    [SerializeField] int inventoryColumns = 9;

    InventorySlot[] hotbarSlots;
    InventorySlot[] inventorySlots;

    int selectedHotbarIndex;

    public System.Action<int> OnHotbarSelectionChanged;
    public System.Action OnInventoryChanged;

    [SerializeField] private ItemData itemToAdd;

    public override void Awake()
    {
        base.Awake();

        InitializeSlots();
        AddItem(itemToAdd, 64);
    }

    void InitializeSlots()
    {
        hotbarSlots = new InventorySlot[hotbarSize];
        inventorySlots = new InventorySlot[inventoryRows * inventoryColumns];

        for (int i = 0; i < hotbarSlots.Length; i++)
            hotbarSlots[i] = new InventorySlot();

        for (int i = 0; i < inventorySlots.Length; i++)
            inventorySlots[i] = new InventorySlot();

        selectedHotbarIndex = 0;
    }

    void Update()
    {
        if (InputHandler.IsMapActive(ActionMap.UI)) return;
        HandleHotbarSelection();
    }

    void HandleHotbarSelection()
    {
        for (int i = 1; i <= 9; i++)
        {
            if (i > hotbarSize) break;

            GameAction action = (GameAction)System.Enum.Parse(typeof(GameAction), "Hotbar" + i);
            if (InputHandler.Pressed(action))
            {
                SelectHotbarSlot(i - 1);
                return;
            }
        }

        Vector2 scrollInput = InputHandler.GetValue<Vector2>(GameAction.ScrollHotbar);
        if (Mathf.Abs(scrollInput.y) > 0.01f)
        {
            int direction = scrollInput.y > 0 ? -1 : 1;
            int newIndex = selectedHotbarIndex + direction;

            if (newIndex < 0) newIndex = hotbarSize - 1;
            else if (newIndex >= hotbarSize) newIndex = 0;

            SelectHotbarSlot(newIndex);
        }
    }

    public void SelectHotbarSlot(int index)
    {
        if (index < 0 || index >= hotbarSize) return;
        if (index == selectedHotbarIndex) return;

        selectedHotbarIndex = index;
        OnHotbarSelectionChanged?.Invoke(selectedHotbarIndex);
    }

    public bool AddItem(ItemData item, int amount = 1)
    {
        if (item == null || amount <= 0) return false;

        int remaining = amount;
        remaining = AddToSlots(hotbarSlots, item, remaining);
        remaining = AddToSlots(inventorySlots, item, remaining);

        if (remaining < amount)
        {
            OnInventoryChanged?.Invoke();
            return remaining == 0;
        }

        return false;
    }

    int AddToSlots(InventorySlot[] slots, ItemData item, int amount)
    {
        foreach (var slot in slots)
        {
            if (amount <= 0) break;

            if (!slot.IsEmpty() && slot.item == item)
            {
                int space = item.maxStackSize - slot.quantity;
                if (space > 0)
                {
                    int toAdd = Mathf.Min(amount, space);
                    slot.Set(slot.item, slot.quantity + toAdd);
                    amount -= toAdd;
                }
            }
        }

        foreach (var slot in slots)
        {
            if (amount <= 0) break;

            if (slot.IsEmpty())
            {
                int toAdd = Mathf.Min(amount, item.maxStackSize);
                slot.Set(item, toAdd);
                amount -= toAdd;
            }
        }

        return amount;
    }

    public bool RemoveItem(ItemData item, int amount)
    {
        if (item == null || amount <= 0) return false;

        int remaining = amount;
        remaining = RemoveFromSlots(hotbarSlots, item, remaining);
        remaining = RemoveFromSlots(inventorySlots, item, remaining);

        if (remaining == 0)
        {
            OnInventoryChanged?.Invoke();
            return true;
        }

        return false;
    }

    int RemoveFromSlots(InventorySlot[] slots, ItemData item, int amount)
    {
        foreach (var slot in slots)
        {
            if (amount <= 0) break;

            if (!slot.IsEmpty() && slot.item == item)
            {
                int toRemove = Mathf.Min(amount, slot.quantity);
                int newQuantity = slot.quantity - toRemove;

                if (newQuantity <= 0)
                    slot.Clear();
                else
                    slot.Set(slot.item, newQuantity);

                amount -= toRemove;
            }
        }
        return amount;
    }

    public void MergeOrSwapSlots(int fromIndex, bool fromHotbar, int toIndex, bool toHotbar)
    {
        var fromArray = fromHotbar ? hotbarSlots : inventorySlots;
        var toArray = toHotbar ? hotbarSlots : inventorySlots;

        if (fromIndex < 0 || fromIndex >= fromArray.Length) return;
        if (toIndex < 0 || toIndex >= toArray.Length) return;
        if (fromArray == toArray && fromIndex == toIndex) return;

        var from = fromArray[fromIndex];
        var to = toArray[toIndex];

        if (from.IsEmpty()) return;

        if (to.IsEmpty())
        {
            to.Set(from.item, from.quantity);
            from.Clear();
            OnInventoryChanged?.Invoke();
            return;
        }

        if (to.item == from.item && to.quantity < to.item.maxStackSize)
        {
            int space = to.item.maxStackSize - to.quantity;
            int move = Mathf.Min(space, from.quantity);

            to.Set(to.item, to.quantity + move);

            int remaining = from.quantity - move;
            if (remaining <= 0)
                from.Clear();
            else
                from.Set(from.item, remaining);

            OnInventoryChanged?.Invoke();
            return;
        }

        ItemData tmpItem = from.item;
        int tmpQty = from.quantity;

        from.Set(to.item, to.quantity);
        to.Set(tmpItem, tmpQty);

        OnInventoryChanged?.Invoke();
    }

    public int GetItemCount(ItemData item)
    {
        if (item == null) return 0;

        int count = 0;
        foreach (var slot in hotbarSlots)
            if (slot.item == item) count += slot.quantity;

        foreach (var slot in inventorySlots)
            if (slot.item == item) count += slot.quantity;

        return count;
    }

    public InventorySlot GetSelectedHotbarSlot() => hotbarSlots[selectedHotbarIndex];
    public InventorySlot GetHotbarSlot(int index) => index >= 0 && index < hotbarSize ? hotbarSlots[index] : null;
    public InventorySlot GetInventorySlot(int index) => index >= 0 && index < inventorySlots.Length ? inventorySlots[index] : null;
    public int GetSelectedHotbarIndex() => selectedHotbarIndex;
}