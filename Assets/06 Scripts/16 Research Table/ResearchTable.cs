using UnityEngine;

public class ResearchTable : Interactable
{
    [Header("UI")]
    [SerializeField] private GameObject researchPanel;
    [SerializeField] private ResearchTableUI tableUI;

    protected override void Awake()
    {
        base.Awake();

        if (researchPanel != null)
            researchPanel.SetActive(false);

        if (tableUI == null)
            tableUI = researchPanel?.GetComponent<ResearchTableUI>();
    }

    public override void Interact()
    {
        if (researchPanel == null || researchPanel.activeSelf) return;
        Open();
    }

    void Open()
    {
        researchPanel.SetActive(true);

        if (tableUI != null)
            tableUI.RefreshDisplay();

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
        if (researchPanel != null)
            researchPanel.SetActive(false);

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

    void Update()
    {
        if (researchPanel != null && researchPanel.activeSelf &&
            InputHandler.Pressed(GameAction.CloseChest))
        {
            Close();
        }
    }

    protected override void OnDestroy()
    {
        base.OnDestroy();
        if (researchPanel != null && researchPanel.activeSelf)
            Close();
    }
}