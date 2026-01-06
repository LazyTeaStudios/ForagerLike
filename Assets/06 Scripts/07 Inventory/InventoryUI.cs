using UnityEngine;

public class InventoryUI : MonoBehaviour
{
    [Header("UI References")]
    [SerializeField] GameObject craftingContainer;
    [SerializeField] SlotUI[] hotbarSlotUIs;

    bool inventoryOpen;
    public static System.Action<bool> OnInventoryToggled;

    void Start()
    {
        SetupSlots();

        if (InventoryManager.Instance != null)
        {
            InventoryManager.Instance.OnHotbarSelectionChanged += UpdateHotbarSelection;
            InventoryManager.Instance.OnInventoryChanged += RefreshAllSlots;
            UpdateHotbarSelection(InventoryManager.Instance.GetSelectedHotbarIndex());
        }

        craftingContainer.SetActive(false);
        RefreshAllSlots();
    }

    void OnEnable()
    {
        if (InventoryManager.Instance != null && hotbarSlotUIs != null && hotbarSlotUIs.Length > 0)
        {
            UpdateHotbarSelection(InventoryManager.Instance.GetSelectedHotbarIndex());
        }
    }

    void SetupSlots()
    {
        for (int i = 0; i < hotbarSlotUIs.Length; i++)
        {
            if (hotbarSlotUIs[i] != null)
                hotbarSlotUIs[i].Setup(i, true);
        }
    }

    void Update()
    {
        if (InputHandler.Pressed(GameAction.ToggleInventory))
        {
            ToggleInventory();
        }
    }

    void ToggleInventory()
    {
        inventoryOpen = !inventoryOpen;
        craftingContainer.SetActive(inventoryOpen);
        OnInventoryToggled?.Invoke(inventoryOpen);

        InputHandler.SetMap(inventoryOpen ? ActionMap.UI : ActionMap.Gameplay);

        if (GameManager.Instance != null)
        {
            GameManager.Instance.SetCursorLocked(!inventoryOpen);
        }
        else
        {
            Cursor.lockState = inventoryOpen ? CursorLockMode.None : CursorLockMode.Locked;
            Cursor.visible = inventoryOpen;
        }
    }

    public void CloseInventory()
    {
        if (!inventoryOpen) return;

        inventoryOpen = false;
        craftingContainer.SetActive(false);
        InputHandler.SetMap(ActionMap.Gameplay);

        if (GameManager.Instance != null)
        {
            GameManager.Instance.SetCursorLocked(true);
        }
    }

    void UpdateHotbarSelection(int index)
    {
        for (int i = 0; i < hotbarSlotUIs.Length; i++)
        {
            if (hotbarSlotUIs[i] != null)
                hotbarSlotUIs[i].SetSelected(i == index);
        }
    }

    void RefreshAllSlots()
    {
        for (int i = 0; i < hotbarSlotUIs.Length; i++)
        {
            if (hotbarSlotUIs[i] != null)
                hotbarSlotUIs[i].UpdateDisplay();
        }

        if (InventoryManager.Instance != null)
        {
            UpdateHotbarSelection(InventoryManager.Instance.GetSelectedHotbarIndex());
        }
    }

    void OnDestroy()
    {
        if (InventoryManager.Instance != null)
        {
            InventoryManager.Instance.OnHotbarSelectionChanged -= UpdateHotbarSelection;
            InventoryManager.Instance.OnInventoryChanged -= RefreshAllSlots;
        }
    }

    void OnDisable()
    {
        if (inventoryOpen)
        {
            CloseInventory();
        }
    }
}