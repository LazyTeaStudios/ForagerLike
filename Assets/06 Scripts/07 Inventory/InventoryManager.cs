using System.Collections.Generic;
using UnityEngine;

public class InventoryManager : Singleton<InventoryManager>
{
    [System.Serializable]
    public class StartingItem
    {
        public ItemData item;
        [Min(1)] public int amount = 1;
    }

    [Header("Settings")]
    [SerializeField] int hotbarSize = 9;

    InventorySlot[] hotbarSlots;
    int selectedHotbarIndex;

    public System.Action<int> OnHotbarSelectionChanged;
    public System.Action OnInventoryChanged;

    [Header("Starting Items")]
    [SerializeField] private List<StartingItem> itemsToAdd = new List<StartingItem>();

    public override void Awake()
    {
        base.Awake();
        InitializeSlots();

        // Add all configured starting items
        if (itemsToAdd != null)
        {
            foreach (var entry in itemsToAdd)
            {
                if (entry == null || entry.item == null) continue;
                if (entry.amount <= 0) continue;

                AddItem(entry.item, entry.amount);
            }
        }
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
        HandleItemDrop(); // Add this line
    }

    void HandleItemDrop()
    {
        if (InputHandler.Pressed(GameAction.DropItem))
        {
            bool dropAll = InputHandler.Held(GameAction.ShiftModifier);
            DropSelectedItem(dropAll);
        }
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

        // Fill existing stacks first
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

        // Then fill empty slots
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

    public void SwapHotbarSlots(int a, int b)
    {
        if (a < 0 || a >= hotbarSize) return;
        if (b < 0 || b >= hotbarSize) return;
        if (a == b) return;

        InventorySlot slotA = hotbarSlots[a];
        InventorySlot slotB = hotbarSlots[b];

        ItemData aItem = slotA.item;
        int aQty = slotA.quantity;

        // Move B into A
        slotA.Set(slotB.item, slotB.quantity);

        // Move temp A into B
        slotB.Set(aItem, aQty);

        OnInventoryChanged?.Invoke();
    }

    // Add this method to InventoryManager class
    public void DropSelectedItem(bool dropAll = false)
    {
        InventorySlot selectedSlot = GetSelectedHotbarSlot();

        if (selectedSlot == null || selectedSlot.IsEmpty())
            return;

        // Calculate drop amount
        int dropAmount = dropAll ? selectedSlot.quantity : 1;

        // Spawn the dropped item in the world
        SpawnDroppedItem(selectedSlot.item, dropAmount);

        // Remove from inventory
        int newQuantity = selectedSlot.quantity - dropAmount;

        if (newQuantity <= 0)
        {
            selectedSlot.Clear();
        }
        else
        {
            selectedSlot.Set(selectedSlot.item, newQuantity);
        }

        // Notify UI to update
        OnInventoryChanged?.Invoke();
    }

    private void SpawnDroppedItem(ItemData item, int amount)
    {
        if (item == null || item.itemPrefab == null)
            return;

        // Get player position for spawning
        Transform player = GameObject.FindGameObjectWithTag("Player")?.transform;
        if (player == null)
            return;

        // Calculate spawn position (in front of player)
        Vector3 spawnPosition = player.position + player.forward * 2f + Vector3.up * 0.5f;

        // Spawn the item
        GameObject droppedItem = Instantiate(item.itemPrefab, spawnPosition, Quaternion.identity);

        // Add some physics to make it "drop"
        Rigidbody rb = droppedItem.GetComponent<Rigidbody>();
        if (rb == null)
            rb = droppedItem.AddComponent<Rigidbody>();

        // Add a small forward and upward force
        rb.AddForce(player.forward * 3f + Vector3.up * 2f, ForceMode.Impulse);

        // If the dropped item has a component to track quantity, set it
        // (You might have a PickupItem component or similar)
        var pickup = droppedItem.GetComponent<ItemPickup>();
        if (pickup != null)
        {
            pickup.SetItem(item, amount);
        }
    }


    public InventorySlot GetSelectedHotbarSlot() => hotbarSlots[selectedHotbarIndex];
    public InventorySlot GetHotbarSlot(int index) => index >= 0 && index < hotbarSize ? hotbarSlots[index] : null;
    public int GetSelectedHotbarIndex() => selectedHotbarIndex;
}
