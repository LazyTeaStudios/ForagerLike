using UnityEngine;

public class StorageChest : Interactable
{
    [Header("Storage")]
    [SerializeField] private int storageSlots = 20;
    [SerializeField] private GameObject storagePanel;
    [SerializeField] private SlotUI[] slotUIElements;

    [Header("Drops")]
    [SerializeField] private ItemDropper itemDropper;

    InventorySlot[] slots;

    protected override void Awake()
    {
        base.Awake();
        InitializeStorage();
        EnsureDropper();

        if (storagePanel != null)
            storagePanel.SetActive(false);
    }

    void InitializeStorage()
    {
        slots = new InventorySlot[storageSlots];
        for (int i = 0; i < slots.Length; i++)
            slots[i] = new InventorySlot();

        for (int i = 0; i < slotUIElements.Length && i < slots.Length; i++)
        {
            if (slotUIElements[i] == null) continue;
            int index = i;
            slotUIElements[i].Setup(100 + i, false);
            slotUIElements[i].SetCustomSlotProvider(() => slots[index]);
        }
    }

    void EnsureDropper()
    {
        if (itemDropper == null)
            itemDropper = GetComponent<ItemDropper>();
        if (itemDropper == null)
            itemDropper = gameObject.AddComponent<ItemDropper>();
    }

    public InventorySlot[] GetSlots() => slots;

    public void DropStoredItems()
    {
        if (slots == null) return;

        foreach (var slot in slots)
        {
            if (slot == null || slot.IsEmpty()) continue;
            if (slot.item?.itemPrefab == null) continue;

            itemDropper.Drop(slot.item, slot.quantity);
            slot.Set(null, 0);
        }

        RefreshDisplay();
    }

    public override void Interact()
    {
        if (storagePanel == null || storagePanel.activeSelf) return;
        Open();
    }

    void Open()
    {
        storagePanel.SetActive(true);
        RefreshDisplay();
        LockUI();
        InputHandler.SetMap(ActionMap.UI);

        if (GameManager.Instance != null)
            GameManager.Instance.SetCursorLocked(false);
        else
        {
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
        }
    }

    void Update()
    {
        if (storagePanel != null && storagePanel.activeSelf && InputHandler.Pressed(GameAction.CloseChest))
            Close();
    }

    public void Close()
    {
        if (storagePanel != null)
            storagePanel.SetActive(false);

        UnlockUI();
        InputHandler.SetMap(ActionMap.Gameplay);

        if (GameManager.Instance != null)
            GameManager.Instance.SetCursorLocked(true);
        else
        {
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;
        }
    }

    void RefreshDisplay()
    {
        foreach (var slotUI in slotUIElements)
            if (slotUI != null) slotUI.UpdateDisplay();
    }

    protected override void OnDestroy()
    {
        base.OnDestroy();
        if (storagePanel != null && storagePanel.activeSelf)
            Close();
    }
}