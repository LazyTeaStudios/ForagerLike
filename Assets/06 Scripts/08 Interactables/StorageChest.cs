using UnityEngine;

public class StorageChest : Interactable
{
    [Header("Storage")]
    [SerializeField] int storageSlots = 20;
    [SerializeField] GameObject storagePanel;
    [SerializeField] SlotUI[] slotUIElements;

    InventorySlot[] slots;

    protected override void Awake()
    {
        base.Awake();
        InitializeStorage();

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

    public override void Interact()
    {
        if (storagePanel == null) return;
        if (storagePanel.activeSelf) return;

        OpenStorage();
    }

    void OpenStorage()
    {
        storagePanel.SetActive(true);
        RefreshDisplay();

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
        if (storagePanel != null && storagePanel.activeSelf && 
            InputHandler.Pressed(GameAction.CloseChest))
        {
            CloseStorage();
        }
    }

    public void CloseStorage()
    {
        if (storagePanel != null)
            storagePanel.SetActive(false);

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
        {
            if (slotUI != null)
                slotUI.UpdateDisplay();
        }
    }

    void OnDestroy()
    {
        if (storagePanel != null && storagePanel.activeSelf)
            CloseStorage();
    }
}