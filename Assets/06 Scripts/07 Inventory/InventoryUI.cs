// In InventoryUI
using UnityEngine;
using System;

public class InventoryUI : MonoBehaviour
{
    public static InventoryUI Instance { get; private set; }
    public bool IsInventoryOpen => inventoryOpen;

    public static event Action<bool, bool> OnInventoryToggled;

    [Header("Panels")]
    public GameObject inventoryPanel;

    [Header("Slots (assign manually in inspector)")]
    public InventorySlotUI[] hotbarSlots;
    public InventorySlotUI[] inventorySlots;

    private bool inventoryOpen;

    // --- NEW: debounce to avoid double toggles in one key cycle ---
    [SerializeField] private float toggleCooldown = 0.15f; // seconds, unscaled
    private float _lastToggleTime = -999f;

    void Awake()
    {
        if (Instance == null) Instance = this;
        else { Destroy(gameObject); return; }
    }

    void Start()
    {
        for (int i = 0; i < hotbarSlots.Length; i++)
            if (hotbarSlots[i] != null) hotbarSlots[i].SetupInventory(i, true);

        for (int i = 0; i < inventorySlots.Length; i++)
            if (inventorySlots[i] != null) inventorySlots[i].SetupInventory(i, false);

        InventorySystem.OnHotbarSelectionChanged += OnHotbarSelectionChanged;
        InventorySystem.OnInventoryChanged += RefreshAll;
        InventorySlotUI.OnAnySlotChanged += RefreshAll;

        if (inventoryPanel != null) inventoryPanel.SetActive(false);

        RefreshAll();
    }

    void Update()
    {
        // ignore toggles if inside cooldown
        if (Time.unscaledTime - _lastToggleTime < toggleCooldown)
            return;

        if (InputHandler.Pressed(GameAction.ToggleInventory))
        {
            ToggleInventory(); // player toggled, not "for building"
            _lastToggleTime = Time.unscaledTime; // start cooldown
        }
    }

    public void ForceOpenInventory()
    {
        if (!inventoryOpen) SetInventoryOpen(true, false);
    }

    public void OpenInventoryForBuilding()
    {
        if (!inventoryOpen) SetInventoryOpen(true, true);
        else OnInventoryToggled?.Invoke(true, true);
    }

    public void ToggleInventory()
    {
        SetInventoryOpen(!inventoryOpen, false);
    }

    void SetInventoryOpen(bool open, bool openedForBuilding)
    {
        inventoryOpen = open;

        if (inventoryPanel != null)
            inventoryPanel.SetActive(inventoryOpen);

        // Only one non-Global map is active at a time; Global stays enabled.
        InputHandler.SetMap(inventoryOpen ? ActionMap.UI : ActionMap.Gameplay);

        OnInventoryToggled?.Invoke(inventoryOpen, openedForBuilding);
    }

    void OnHotbarSelectionChanged(int idx)
    {
        for (int i = 0; i < hotbarSlots.Length; i++)
            if (hotbarSlots[i] != null)
                hotbarSlots[i].SetSelected(i == idx);
    }

    void RefreshAll()
    {
        if (hotbarSlots != null)
            foreach (var s in hotbarSlots) if (s != null) s.UpdateDisplay();

        if (inventorySlots != null)
            foreach (var s in inventorySlots) if (s != null) s.UpdateDisplay();
    }

    void OnDestroy()
    {
        InventorySystem.OnHotbarSelectionChanged -= OnHotbarSelectionChanged;
        InventorySystem.OnInventoryChanged -= RefreshAll;
        InventorySlotUI.OnAnySlotChanged -= RefreshAll;
    }
}
