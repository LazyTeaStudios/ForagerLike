using UnityEngine;

public class StorageChest : Interactable
{
    [Header("Storage")]
    [SerializeField] private int storageSlots = 20;
    [SerializeField] private GameObject storagePanel;
    [SerializeField] private SlotUI[] slotUIElements;

    [Header("Drop Settings")]
    [SerializeField] private float dropSpawnRadius = 1f;
    [SerializeField] private float dropThrowForce = 3f;

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

    public InventorySlot[] GetSlots() => slots;

    public void DropStoredItems()
    {
        if (slots == null) return;

        foreach (var slot in slots)
        {
            if (slot == null || slot.IsEmpty()) continue;
            if (slot.item?.itemPrefab == null) continue;

            for (int q = 0; q < slot.quantity; q++)
                SpawnDroppedItem(slot.item.itemPrefab);

            slot.Set(null, 0);
        }

        RefreshDisplay();
    }

    void SpawnDroppedItem(GameObject itemPrefab)
    {
        Vector3 offset = Random.insideUnitSphere * dropSpawnRadius;
        offset.y = Mathf.Abs(offset.y + 0.5f);

        var item = Instantiate(itemPrefab, transform.position + offset, Random.rotation);

        var rb = item.GetComponent<Rigidbody>();
        if (rb != null)
        {
            Vector3 dir = Random.onUnitSphere;
            dir.y = Mathf.Abs(dir.y);
            rb.AddForce(dir * dropThrowForce, ForceMode.Impulse);
        }
    }

    public override void Interact()
    {
        if (storagePanel == null || storagePanel.activeSelf) return;
        OpenStorage();
    }

    void OpenStorage()
    {
        storagePanel.SetActive(true);
        RefreshDisplay();
        AcquireUILock();
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
            CloseStorage();
    }

    public void CloseStorage()
    {
        if (storagePanel != null)
            storagePanel.SetActive(false);

        ReleaseUILock();
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

    void OnDestroy()
    {
        if (storagePanel != null && storagePanel.activeSelf)
            CloseStorage();
    }
}
