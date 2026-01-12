using UnityEngine;

public class StorageChest : Interactable
{
    [Header("Storage")]
    [SerializeField] int storageSlots = 20;
    [SerializeField] GameObject storagePanel;
    [SerializeField] SlotUI[] slotUIElements;

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

    public InventorySlot[] GetSlots()
    {
        return slots;
    }

    public void DropStoredItems()
    {
        if (slots == null) return;

        for (int i = 0; i < slots.Length; i++)
        {
            var slot = slots[i];
            if (slot == null || slot.IsEmpty()) continue;
            if (slot.item == null || slot.item.itemPrefab == null) continue;

            int amount = slot.quantity;
            for (int q = 0; q < amount; q++)
                SpawnDroppedItem(slot.item.itemPrefab);

            slot.Set(null, 0);
        }

        RefreshDisplay();
    }

    void SpawnDroppedItem(GameObject itemPrefab)
    {
        Vector3 randomOffset = Random.insideUnitSphere * dropSpawnRadius;
        randomOffset.y = Mathf.Abs(randomOffset.y + 0.5f);
        Vector3 spawnPosition = transform.position + randomOffset;

        GameObject item = Instantiate(itemPrefab, spawnPosition, Random.rotation);

        Rigidbody rb = item.GetComponent<Rigidbody>();
        if (rb != null)
        {
            Vector3 throwDirection = Random.onUnitSphere;
            throwDirection.y = Mathf.Abs(throwDirection.y);
            rb.AddForce(throwDirection * dropThrowForce, ForceMode.Impulse);
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
