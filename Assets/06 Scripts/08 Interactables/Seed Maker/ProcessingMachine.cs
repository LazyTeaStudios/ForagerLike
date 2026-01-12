using UnityEngine;

public class ProcessingMachine : Interactable
{
    [Header("UI")]
    [SerializeField] protected GameObject machinePanel;
    [SerializeField] protected SlotUI inputSlotUI;

    [Header("Recipes")]
    [SerializeField] protected ProcessingRecipe[] recipes;

    [Header("Drops")]
    [SerializeField] protected ItemDropper itemDropper;
    [SerializeField] protected Transform outputPoint;

    protected InventorySlot inputSlot;
    protected ProcessingRecipe currentRecipe;
    protected float processTimer;
    protected bool isProcessing;

    public bool IsProcessing => isProcessing;

    protected override void Awake()
    {
        base.Awake();
        InitializeSlot();
        EnsureDropper();

        if (machinePanel != null)
            machinePanel.SetActive(false);
    }

    void InitializeSlot()
    {
        inputSlot = new InventorySlot();

        if (inputSlotUI != null)
        {
            inputSlotUI.Setup(200, false);
            inputSlotUI.SetCustomSlotProvider(() => inputSlot);
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
        if (inputSlot.IsEmpty()) return;

        var recipe = FindMatchingRecipe(inputSlot.item, inputSlot.quantity);
        if (recipe == null) return;

        currentRecipe = recipe;
        isProcessing = true;
        processTimer = 0f;
    }

    void CompleteProcessing()
    {
        if (currentRecipe == null) return;

        // Spawn output
        if (currentRecipe.outputItem?.itemPrefab != null)
            itemDropper.Drop(currentRecipe.outputItem, currentRecipe.outputQuantity);

        // Consume input
        int remaining = inputSlot.quantity - currentRecipe.inputQuantity;
        if (remaining <= 0)
            inputSlot.Set(null, 0);
        else
            inputSlot.Set(inputSlot.item, remaining);

        RefreshDisplay();

        isProcessing = false;
        currentRecipe = null;
        processTimer = 0f;
    }

    ProcessingRecipe FindMatchingRecipe(ItemData item, int quantity)
    {
        if (recipes == null || item == null) return null;

        foreach (var recipe in recipes)
            if (recipe != null && recipe.CanProcess(item, quantity))
                return recipe;

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
        if (inputSlotUI != null)
            inputSlotUI.UpdateDisplay();
    }

    public void DropAllItems()
    {
        if (inputSlot == null || inputSlot.IsEmpty()) return;
        if (inputSlot.item?.itemPrefab == null) return;

        itemDropper.Drop(inputSlot.item, inputSlot.quantity);
        inputSlot.Set(null, 0);
        RefreshDisplay();
    }

    protected override void OnDestroy()
    {
        base.OnDestroy();
        if (machinePanel != null && machinePanel.activeSelf)
            Close();
    }
}