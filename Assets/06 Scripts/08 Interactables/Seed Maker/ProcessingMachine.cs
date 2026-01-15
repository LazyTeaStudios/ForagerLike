using UnityEngine;

public class ProcessingMachine : Interactable
{
    [Header("UI")]
    [SerializeField] protected GameObject machinePanel;
    [SerializeField] protected SlotUI inputSlotUI1;
    [SerializeField] protected SlotUI inputSlotUI2; // Optional second slot

    [Header("Recipes")]
    [SerializeField] protected ProcessingRecipe[] recipes;

    [Header("Drops")]
    [SerializeField] protected ItemDropper itemDropper;
    [SerializeField] protected Transform outputPoint;

    [Header("Processing Visual")]
    [SerializeField] protected GameObject processingVisualObject;

    protected InventorySlot inputSlot1;
    protected InventorySlot inputSlot2;
    protected InventorySlot processingSlot1;
    protected InventorySlot processingSlot2;
    protected ProcessingRecipe currentRecipe;
    protected float processTimer;
    protected bool isProcessing;

    public bool IsProcessing => isProcessing;

    protected override void Awake()
    {
        base.Awake();
        InitializeSlots();
        EnsureDropper();

        if (machinePanel != null)
            machinePanel.SetActive(false);

        if (processingVisualObject != null)
            processingVisualObject.SetActive(false);
    }

    void InitializeSlots()
    {
        inputSlot1 = new InventorySlot();
        inputSlot2 = new InventorySlot();
        processingSlot1 = new InventorySlot();
        processingSlot2 = new InventorySlot();

        if (inputSlotUI1 != null)
        {
            inputSlotUI1.Setup(200, false);
            inputSlotUI1.SetCustomSlotProvider(() => inputSlot1);
        }

        if (inputSlotUI2 != null)
        {
            inputSlotUI2.Setup(201, false);
            inputSlotUI2.SetCustomSlotProvider(() => inputSlot2);
        }
    }

    void EnsureDropper()
    {
        if (itemDropper == null)
            itemDropper = GetComponent<ItemDropper>();
        if (itemDropper == null)
            itemDropper = gameObject.AddComponent<ItemDropper>();

        if (outputPoint != null)
            itemDropper.SetSpawnPoint(outputPoint);
    }

    protected virtual void Update()
    {
        if (machinePanel != null && machinePanel.activeSelf && InputHandler.Pressed(GameAction.CloseChest))
            Close();

        UpdateProcessing();
    }

    void UpdateProcessing()
    {
        if (isProcessing)
        {
            processTimer += Time.deltaTime;
            if (processTimer >= currentRecipe.processingTime)
                CompleteProcessing();
        }
        else
        {
            TryStartProcessing();
        }
    }

    void TryStartProcessing()
    {
        // Check if any slots have items
        if (inputSlot1.IsEmpty() && inputSlot2.IsEmpty()) return;

        var recipe = FindMatchingRecipe();
        if (recipe == null) return;

        // Get required amounts for this specific combination
        recipe.GetRequiredAmounts(inputSlot1.item, inputSlot2.item,
                                 out int required1, out int required2);

        // Move items to processing slots
        if (required1 > 0)
        {
            processingSlot1.Set(inputSlot1.item, required1);
            int remaining = inputSlot1.quantity - required1;
            if (remaining <= 0)
                inputSlot1.Set(null, 0);
            else
                inputSlot1.Set(inputSlot1.item, remaining);
        }

        if (required2 > 0)
        {
            processingSlot2.Set(inputSlot2.item, required2);
            int remaining = inputSlot2.quantity - required2;
            if (remaining <= 0)
                inputSlot2.Set(null, 0);
            else
                inputSlot2.Set(inputSlot2.item, remaining);
        }

        RefreshDisplay();

        currentRecipe = recipe;
        isProcessing = true;
        processTimer = 0f;

        if (processingVisualObject != null)
            processingVisualObject.SetActive(true);
    }

    void CompleteProcessing()
    {
        if (currentRecipe == null) return;

        // Spawn output
        if (currentRecipe.outputItem?.itemPrefab != null)
            itemDropper.Drop(currentRecipe.outputItem, currentRecipe.outputQuantity);

        // Clear processing slots
        processingSlot1.Set(null, 0);
        processingSlot2.Set(null, 0);

        RefreshDisplay();

        isProcessing = false;
        currentRecipe = null;
        processTimer = 0f;

        if (processingVisualObject != null)
            processingVisualObject.SetActive(false);
    }

    ProcessingRecipe FindMatchingRecipe()
    {
        if (recipes == null) return null;

        ItemData item1 = inputSlot1.item;
        int qty1 = inputSlot1.quantity;
        ItemData item2 = inputSlot2.item;
        int qty2 = inputSlot2.quantity;

        foreach (var recipe in recipes)
        {
            if (recipe != null && recipe.CanProcess(item1, qty1, item2, qty2))
                return recipe;
        }

        return null;
    }

    public override void Interact()
    {
        if (machinePanel == null || machinePanel.activeSelf) return;
        Open();
    }

    void Open()
    {
        machinePanel.SetActive(true);
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

    public void Close()
    {
        if (machinePanel != null)
            machinePanel.SetActive(false);

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
        if (inputSlotUI1 != null)
            inputSlotUI1.UpdateDisplay();
        if (inputSlotUI2 != null)
            inputSlotUI2.UpdateDisplay();
    }

    public void DropAllItems()
    {
        // Drop all input and processing items
        DropSlotItems(inputSlot1);
        DropSlotItems(inputSlot2);
        DropSlotItems(processingSlot1);
        DropSlotItems(processingSlot2);

        RefreshDisplay();
    }

    void DropSlotItems(InventorySlot slot)
    {
        if (!slot.IsEmpty() && slot.item?.itemPrefab != null)
        {
            itemDropper.Drop(slot.item, slot.quantity);
            slot.Set(null, 0);
        }
    }

    protected override void OnDestroy()
    {
        base.OnDestroy();
        if (machinePanel != null && machinePanel.activeSelf)
            Close();
    }
}