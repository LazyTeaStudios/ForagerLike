using UnityEngine;

public class Obelisk : Interactable
{
    [Header("UI")]
    [SerializeField] private GameObject obeliskPanel;
    [SerializeField] private ObeliskUI obeliskUI;

    [Header("Quest")]
    [SerializeField] private ObeliskQuest currentQuest;

    [Header("Reward")]
    [SerializeField] private GameObject objectToEnable; // Direct reference in inspector

    protected override void Awake()
    {
        base.Awake();

        if (obeliskPanel != null)
            obeliskPanel.SetActive(false);

        if (obeliskUI == null)
            obeliskUI = obeliskPanel?.GetComponent<ObeliskUI>();

        // Make sure reward object is initially disabled
        if (objectToEnable != null)
            objectToEnable.SetActive(false);
    }

    public override void Interact()
    {
        if (obeliskPanel == null || obeliskPanel.activeSelf) return;
        Open();
    }

    void Open()
    {
        obeliskPanel.SetActive(true);

        if (obeliskUI != null)
        {
            obeliskUI.SetQuest(currentQuest);
            obeliskUI.SetObelisk(this);
        }

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
        if (obeliskPanel != null)
            obeliskPanel.SetActive(false);

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

    public void CompleteCurrentQuest()
    {
        if (currentQuest != null && currentQuest.CanComplete())
        {
            // Consume the required items
            foreach (var requirement in currentQuest.requiredItems)
            {
                InventoryManager.Instance.RemoveItem(requirement.item, requirement.quantity);
            }

            // Enable the reward object
            if (objectToEnable != null)
                objectToEnable.SetActive(true);

            // Mark quest as completed
            currentQuest.IsCompleted = true;

            // Refresh the UI
            if (obeliskUI != null)
                obeliskUI.RefreshDisplay();

            Close();
        }
    }

    void Update()
    {
        if (obeliskPanel != null && obeliskPanel.activeSelf &&
            InputHandler.Pressed(GameAction.CloseChest))
        {
            Close();
        }
    }

    protected override void OnDestroy()
    {
        base.OnDestroy();
        if (obeliskPanel != null && obeliskPanel.activeSelf)
            Close();
    }
}