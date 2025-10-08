using UnityEngine;

public class InventoryManager : Singleton<InventoryManager>
{
    [Header("Settings")]
    [SerializeField] int hotbarSize = 9;
    [SerializeField] int inventoryRows = 4;
    [SerializeField] int inventoryColumns = 9;

    [Header("Hotbar Slots - Edit in Inspector")]
    [SerializeField] InventorySlot[] hotbarSlots = new InventorySlot[9];

    [Header("Inventory Slots - Edit in Inspector")]
    [SerializeField] InventorySlot[] inventorySlots = new InventorySlot[36];

    int selectedHotbarIndex;

    public System.Action<int> OnHotbarSelectionChanged;
    public System.Action OnInventoryChanged;

    public override void Awake()
    {
        base.Awake();
        InitializeSlots();
    }

    void InitializeSlots()
    {
        // Ensure arrays are properly sized
        if (hotbarSlots == null || hotbarSlots.Length != hotbarSize)
        {
            System.Array.Resize(ref hotbarSlots, hotbarSize);
        }

        int totalInventorySlots = inventoryRows * inventoryColumns;
        if (inventorySlots == null || inventorySlots.Length != totalInventorySlots)
        {
            System.Array.Resize(ref inventorySlots, totalInventorySlots);
        }

        // Initialize any null slots
        for (int i = 0; i < hotbarSlots.Length; i++)
        {
            if (hotbarSlots[i] == null)
                hotbarSlots[i] = new InventorySlot();
        }

        for (int i = 0; i < inventorySlots.Length; i++)
        {
            if (inventorySlots[i] == null)
                inventorySlots[i] = new InventorySlot();
        }

        selectedHotbarIndex = 0;
    }

    void OnValidate()
    {
        // Resize arrays if settings changed in inspector
        if (Application.isPlaying) return;

        int newHotbarSize = Mathf.Clamp(hotbarSize, 1, 10);
        if (hotbarSlots == null || hotbarSlots.Length != newHotbarSize)
        {
            System.Array.Resize(ref hotbarSlots, newHotbarSize);
            for (int i = 0; i < hotbarSlots.Length; i++)
            {
                if (hotbarSlots[i] == null)
                    hotbarSlots[i] = new InventorySlot();
            }
        }

        int totalSlots = inventoryRows * inventoryColumns;
        if (inventorySlots == null || inventorySlots.Length != totalSlots)
        {
            System.Array.Resize(ref inventorySlots, totalSlots);
            for (int i = 0; i < inventorySlots.Length; i++)
            {
                if (inventorySlots[i] == null)
                    inventorySlots[i] = new InventorySlot();
            }
        }
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

    public void SetItemAtSlot(int index, bool isHotbar, ItemData item, int quantity)
    {
        InventorySlot[] targetArray = isHotbar ? hotbarSlots : inventorySlots;

        if (index < 0 || index >= targetArray.Length) return;

        targetArray[index].item = item;
        targetArray[index].quantity = quantity;

        if (quantity <= 0) targetArray[index].Clear();

        OnInventoryChanged?.Invoke();
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
        // First pass: stack with existing items
        for (int i = 0; i < slots.Length; i++)
        {
            if (amount <= 0) break;

            InventorySlot slot = slots[i];
            if (slot.item == item && slot.quantity < item.maxStackSize)
            {
                int space = item.maxStackSize - slot.quantity;
                int toAdd = Mathf.Min(amount, space);
                slot.quantity += toAdd;
                amount -= toAdd;
            }
        }

        // Second pass: fill empty slots
        for (int i = 0; i < slots.Length; i++)
        {
            if (amount <= 0) break;

            InventorySlot slot = slots[i];
            if (slot.IsEmpty())
            {
                int toAdd = Mathf.Min(amount, item.maxStackSize);
                slot.item = item;
                slot.quantity = toAdd;
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
        for (int i = 0; i < slots.Length; i++)
        {
            if (amount <= 0) break;

            InventorySlot slot = slots[i];
            if (slot.item == item)
            {
                int toRemove = Mathf.Min(amount, slot.quantity);
                slot.quantity -= toRemove;
                amount -= toRemove;

                if (slot.quantity <= 0) slot.Clear();
            }
        }
        return amount;
    }

    public void SwapSlots(int fromIndex, bool fromHotbar, int toIndex, bool toHotbar)
    {
        InventorySlot[] fromArray = fromHotbar ? hotbarSlots : inventorySlots;
        InventorySlot[] toArray = toHotbar ? hotbarSlots : inventorySlots;

        if (fromIndex < 0 || fromIndex >= fromArray.Length) return;
        if (toIndex < 0 || toIndex >= toArray.Length) return;

        // Create deep copies for swapping
        InventorySlot temp = new InventorySlot(fromArray[fromIndex].item, fromArray[fromIndex].quantity);
        fromArray[fromIndex].item = toArray[toIndex].item;
        fromArray[fromIndex].quantity = toArray[toIndex].quantity;
        toArray[toIndex].item = temp.item;
        toArray[toIndex].quantity = temp.quantity;

        OnInventoryChanged?.Invoke();
    }

    public int GetItemCount(ItemData item)
    {
        if (item == null) return 0;

        int count = 0;
        count += CountInSlots(hotbarSlots, item);
        count += CountInSlots(inventorySlots, item);
        return count;
    }

    int CountInSlots(InventorySlot[] slots, ItemData item)
    {
        int count = 0;
        for (int i = 0; i < slots.Length; i++)
        {
            if (slots[i].item == item)
                count += slots[i].quantity;
        }
        return count;
    }

    public InventorySlot GetSelectedHotbarSlot() => hotbarSlots[selectedHotbarIndex];
    public InventorySlot GetHotbarSlot(int index) => index >= 0 && index < hotbarSize ? hotbarSlots[index] : null;
    public InventorySlot GetInventorySlot(int index) => index >= 0 && index < inventorySlots.Length ? inventorySlots[index] : null;
    public int GetSelectedHotbarIndex() => selectedHotbarIndex;
}