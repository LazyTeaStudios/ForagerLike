using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CraftingUI : MonoBehaviour
{
    [Header("UI")]
    public GameObject craftingPanel;
    public Button craftButton;
    public Slider progressSlider;

    [Header("Slots (assign in inspector)")]
    public InventorySlotUI[] inputSlots;
    public InventorySlotUI[] outputSlots;

    [Header("Recipes (index-aligned with buttons)")]
    public List<Recipe> recipes = new List<Recipe>();
    public RecipeButton[] recipeButtons;
    public bool autoSelectFirstRecipe = true;

    [Header("Optional context")]
    public Building building;

    // Internal machine storage (persistent)
    private InventorySlot[] machineInputSlots;
    private InventorySlot[] machineOutputSlots;

    public InventorySlot[] InputSlots => machineInputSlots;
    public InventorySlot[] OutputSlots => machineOutputSlots;

    [Header("Tooltip UI")]
    public CraftingTooltipUI tooltipUI;

    public Recipe CurrentRecipe { get; private set; }
    public static CraftingUI OpenInstance { get; private set; }

    private bool isCrafting;
    private float elapsed;
    private bool started;

    void OnEnable()
    {
        InventorySystem.OnInventoryChanged += UpdateCraftButton;
        InventorySlotUI.OnAnySlotChanged += UpdateCraftButton;
        InventoryUI.OnInventoryToggled += HandleInventoryToggled;
    }

    void OnDisable()
    {
        InventorySystem.OnInventoryChanged -= UpdateCraftButton;
        InventorySlotUI.OnAnySlotChanged -= UpdateCraftButton;
        InventoryUI.OnInventoryToggled -= HandleInventoryToggled;

        if (craftingPanel != null) craftingPanel.SetActive(false);
        if (OpenInstance == this) OpenInstance = null;
    }
    void Start()
    {
        started = true;

        EnsureMachineSlots();
        BindSlotsToMachine();

        if (craftingPanel != null) craftingPanel.SetActive(false);

        if (craftButton != null)
        {
            craftButton.onClick.RemoveAllListeners();
            craftButton.onClick.AddListener(StartCrafting);
        }

        WireRecipeButtons();

        if (CurrentRecipe == null && autoSelectFirstRecipe && recipes.Count > 0)
            SelectRecipe(recipes[0]);
        else
            tooltipUI?.ShowRecipe(CurrentRecipe);

        UpdateCraftButton();
    }


    public void Initialize(Building host)
    {
        building = host;
        if (started) UpdateCraftButton();
    }

    // Open / Close
    public void Open()
    {
        if (craftingPanel != null) craftingPanel.SetActive(true);

        if (InventoryUI.Instance != null && !InventoryUI.Instance.IsInventoryOpen)
            InventoryUI.Instance.OpenInventoryForBuilding();

        InventoryCraftingUI.SetSuppressed(true);

        BindSlotsToMachine();
        UpdateCraftButton();

        tooltipUI?.ShowRecipe(CurrentRecipe);

        OpenInstance = this;
    }


    public void Close()
    {
        if (craftingPanel != null) craftingPanel.SetActive(false);

        InventoryCraftingUI.SetSuppressed(false);

        if (OpenInstance == this) OpenInstance = null;
    }

    void HandleInventoryToggled(bool isOpen, bool openedForBuilding)
    {
        if (!isOpen || !openedForBuilding) Close();
    }


    public void SelectRecipe(Recipe recipe)
    {
        if (isCrafting) return;

        CurrentRecipe = recipe;
        UpdateCraftButton();
        UpdateRecipeButtonSelection(recipe);

        tooltipUI?.ShowRecipe(CurrentRecipe);
    }


    void WireRecipeButtons()
    {
        if (recipeButtons == null) return;

        int count = Mathf.Min(recipeButtons.Length, recipes != null ? recipes.Count : 0);
        for (int i = 0; i < count; i++)
            if (recipeButtons[i] != null) recipeButtons[i].BindUI(this, recipes[i]);

        // clear any extra buttons
        for (int i = count; i < (recipeButtons?.Length ?? 0); i++)
            if (recipeButtons[i] != null) recipeButtons[i].BindUI(this, null);

        // ensure interactable state reflects crafting state on startup
        SetRecipeButtonsInteractable(!isCrafting);
    }

    void UpdateRecipeButtonSelection(Recipe selected)
    {
        if (recipeButtons == null) return;
        foreach (var rb in recipeButtons)
            if (rb != null) rb.SetSelected(rb.Recipe == selected);
    }

    // Crafting loop
    void Update()
    {
        // quick close on toggle
        if (craftingPanel != null && craftingPanel.activeSelf &&
            InputHandler.Pressed(GameAction.ToggleInventory))
        {
            Close();
            return;
        }

        if (!isCrafting || CurrentRecipe == null) return;

        elapsed += Time.deltaTime;
        float duration = Mathf.Max(0.0001f, CurrentRecipe.craftingTime);
        if (progressSlider != null)
            progressSlider.value = Mathf.Clamp01(elapsed / duration);

        if (elapsed >= duration) CompleteCrafting();
    }

    void StartCrafting()
    {
        if (!CanCraft()) return;

        // consume inputs
        foreach (var req in CurrentRecipe.inputs)
        {
            if (req.item == null || req.quantity <= 0) continue;

            int remaining = req.quantity;
            for (int i = 0; i < machineInputSlots.Length && remaining > 0; i++)
            {
                var s = machineInputSlots[i];
                if (s == null || s.IsEmpty || s.item != req.item) continue;

                int take = Mathf.Min(remaining, s.quantity);
                s.RemoveItem(take);
                remaining -= take;
            }
        }

        // kick off
        isCrafting = true;
        elapsed = 0f;

        if (progressSlider != null) progressSlider.value = 0f;
        if (craftButton != null) craftButton.interactable = false;

        // NEW: lock recipe switching during craft
        SetRecipeButtonsInteractable(false);

        RefreshCraftingSlots();
    }

    void CompleteCrafting()
    {
        isCrafting = false;
        elapsed = 0f;
        if (progressSlider != null) progressSlider.value = 0f;

        // deposit outputs
        foreach (var def in CurrentRecipe.outputs)
        {
            if (def.item == null || def.quantity <= 0) continue;

            int remaining = def.quantity;

            // stack into same item
            for (int i = 0; i < machineOutputSlots.Length && remaining > 0; i++)
            {
                var s = machineOutputSlots[i];
                if (s != null && !s.IsEmpty && s.item == def.item && !s.IsFull)
                    remaining = s.AddItem(def.item, remaining);
            }

            // then empty slots
            for (int i = 0; i < machineOutputSlots.Length && remaining > 0; i++)
            {
                var s = machineOutputSlots[i];
                if (s != null && s.IsEmpty)
                    remaining = s.AddItem(def.item, remaining);
            }
        }

        RefreshCraftingSlots();
        UpdateCraftButton();

        // NEW: unlock recipe buttons after craft
        SetRecipeButtonsInteractable(true);
    }

    bool CanCraft()
    {
        if (CurrentRecipe == null || isCrafting) return false;

        // inputs
        foreach (var req in CurrentRecipe.inputs)
        {
            if (req.item == null || req.quantity <= 0) continue;

            int have = 0;
            for (int i = 0; i < machineInputSlots.Length; i++)
            {
                var s = machineInputSlots[i];
                if (s != null && !s.IsEmpty && s.item == req.item)
                    have += s.quantity;
            }
            if (have < req.quantity) return false;
        }

        // outputs capacity
        if (!SimulateOutputCapacity(CurrentRecipe.outputs)) return false;

        return true;
    }

    void UpdateCraftButton()
    {
        if (craftButton != null)
            craftButton.interactable = CanCraft();
    }

    // Storage allocation & binding
    void EnsureMachineSlots()
    {
        int inCount = Mathf.Max(0, inputSlots != null ? inputSlots.Length : 0);
        int outCount = Mathf.Max(0, outputSlots != null ? outputSlots.Length : 0);

        EnsureArraySize(ref machineInputSlots, inCount, preserveContents: true);
        EnsureArraySize(ref machineOutputSlots, outCount, preserveContents: true);
    }

    static void EnsureArraySize(ref InventorySlot[] arr, int desiredLength, bool preserveContents)
    {
        desiredLength = Mathf.Max(0, desiredLength);

        if (arr == null)
        {
            arr = new InventorySlot[desiredLength];
            for (int i = 0; i < desiredLength; i++) arr[i] = new InventorySlot();
            return;
        }

        if (arr.Length == desiredLength) return;

        var newArr = new InventorySlot[desiredLength];
        int copy = preserveContents ? Mathf.Min(arr.Length, newArr.Length) : 0;

        for (int i = 0; i < copy; i++) newArr[i] = arr[i];
        for (int i = copy; i < desiredLength; i++) newArr[i] = new InventorySlot();

        arr = newArr;
    }

    void BindSlotsToMachine()
    {
        // Inputs
        for (int i = 0; i < (inputSlots?.Length ?? 0); i++)
        {
            var ui = inputSlots[i];
            if (ui == null) continue;
            var slotRef = (machineInputSlots != null && i < machineInputSlots.Length)
                ? machineInputSlots[i] : null;
            ui.SetupCrafting(slotRef, InventorySlotUI.SlotContext.CraftingInput);
        }

        // Outputs
        for (int i = 0; i < (outputSlots?.Length ?? 0); i++)
        {
            var ui = outputSlots[i];
            if (ui == null) continue;
            var slotRef = (machineOutputSlots != null && i < machineOutputSlots.Length)
                ? machineOutputSlots[i] : null;
            ui.SetupCrafting(slotRef, InventorySlotUI.SlotContext.CraftingOutput);
        }
    }

    // Helpers
    bool SimulateOutputCapacity(List<ItemResult> outputs)
    {
        if (machineOutputSlots == null) return false;

        var tmpItems = new ItemData[machineOutputSlots.Length];
        var tmpQty = new int[machineOutputSlots.Length];

        for (int i = 0; i < machineOutputSlots.Length; i++)
        {
            var s = machineOutputSlots[i];
            if (s == null || s.IsEmpty) { tmpItems[i] = null; tmpQty[i] = 0; }
            else { tmpItems[i] = s.item; tmpQty[i] = s.quantity; }
        }

        foreach (var def in outputs)
        {
            if (def.item == null || def.quantity <= 0) continue;

            int remaining = def.quantity;

            // stack into same item
            for (int i = 0; i < tmpItems.Length && remaining > 0; i++)
            {
                if (tmpItems[i] == def.item)
                {
                    int free = def.item.maxStackSize - tmpQty[i];
                    int take = Mathf.Min(free, remaining);
                    tmpQty[i] += take;
                    remaining -= take;
                }
            }

            // then empty slots
            for (int i = 0; i < tmpItems.Length && remaining > 0; i++)
            {
                if (tmpItems[i] == null)
                {
                    int take = Mathf.Min(def.item.maxStackSize, remaining);
                    tmpItems[i] = def.item;
                    tmpQty[i] = take;
                    remaining -= take;
                }
            }

            if (remaining > 0) return false;
        }

        return true;
    }

    public void RefreshCraftingSlots()
    {
        if (inputSlots != null)
            foreach (var ui in inputSlots) if (ui != null) ui.UpdateDisplay();

        if (outputSlots != null)
            foreach (var ui in outputSlots) if (ui != null) ui.UpdateDisplay();
    }

    public int AddToInputs(ItemData item, int quantity)
    {
        if (item == null || quantity <= 0 || machineInputSlots == null) return 0;

        int remaining = quantity;

        // stack first
        for (int i = 0; i < machineInputSlots.Length && remaining > 0; i++)
        {
            var s = machineInputSlots[i];
            if (s != null && !s.IsEmpty && s.item == item && !s.IsFull)
                remaining = s.AddItem(item, remaining);
        }

        // then empty slots
        for (int i = 0; i < machineInputSlots.Length && remaining > 0; i++)
        {
            var s = machineInputSlots[i];
            if (s != null && s.IsEmpty)
                remaining = s.AddItem(item, remaining);
        }

        int added = quantity - remaining;
        if (added > 0) RefreshCraftingSlots();
        return added;
    }

    // NEW: enable/disable all recipe buttons at once
    private void SetRecipeButtonsInteractable(bool interactable)
    {
        if (recipeButtons == null) return;
        foreach (var rb in recipeButtons)
            if (rb != null) rb.SetInteractable(interactable);
    }
}
