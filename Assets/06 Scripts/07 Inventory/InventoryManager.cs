using UnityEngine;

public class InventoryManager : Singleton<InventoryManager>
{
    [Header("Settings")]
    [SerializeField] int hotbarSize = 9;

    InventorySlot[] hotbarSlots;
    int selectedHotbarIndex;

    public System.Action<int> OnHotbarSelectionChanged;
    public System.Action OnInventoryChanged;

    [SerializeField] private ItemData itemToAdd;

    public override void Awake()
    {
        base.Awake();
        InitializeSlots();
        if (itemToAdd != null)
            AddItem(itemToAdd, 64);
    }

    void InitializeSlots()
    {
        hotbarSlots = new InventorySlot[hotbarSize];
        for (int i = 0; i < hotbarSlots.Length; i++)
            hotbarSlots[i] = new InventorySlot();
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

        foreach (var slot in hotbarSlots)
        {
            if (remaining <= 0) break;

            if (!slot.IsEmpty() && slot.item == item)
            {
                int space = item.maxStackSize - slot.quantity;
                if (space > 0)
                {
                    int toAdd = Mathf.Min(remaining, space);
                    slot.Set(slot.item, slot.quantity + toAdd);
                    remaining -= toAdd;
                }
            }
        }

        foreach (var slot in hotbarSlots)
        {
            if (remaining <= 0) break;

            if (slot.IsEmpty())
            {
                int toAdd = Mathf.Min(remaining, item.maxStackSize);
                slot.Set(item, toAdd);
                remaining -= toAdd;
            }
        }

        if (remaining < amount)
        {
            OnInventoryChanged?.Invoke();
            return remaining == 0;
        }

        return false;
    }

    public bool RemoveItem(ItemData item, int amount)
    {
        if (item == null || amount <= 0) return false;

        int remaining = amount;

        foreach (var slot in hotbarSlots)
        {
            if (remaining <= 0) break;

            if (!slot.IsEmpty() && slot.item == item)
            {
                int toRemove = Mathf.Min(remaining, slot.quantity);
                int newQuantity = slot.quantity - toRemove;

                if (newQuantity <= 0)
                    slot.Clear();
                else
                    slot.Set(slot.item, newQuantity);

                remaining -= toRemove;
            }
        }

        if (remaining == 0)
        {
            OnInventoryChanged?.Invoke();
            return true;
        }

        return false;
    }

    public bool HasResources(ItemData item, int amount)
    {
        return GetItemCount(item) >= amount;
    }

    public int GetItemCount(ItemData item)
    {
        if (item == null) return 0;

        int count = 0;
        foreach (var slot in hotbarSlots)
            if (slot.item == item) count += slot.quantity;

        return count;
    }

    public InventorySlot GetSelectedHotbarSlot() => hotbarSlots[selectedHotbarIndex];
    public InventorySlot GetHotbarSlot(int index) => index >= 0 && index < hotbarSize ? hotbarSlots[index] : null;
    public int GetSelectedHotbarIndex() => selectedHotbarIndex;
}