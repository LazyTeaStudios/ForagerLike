using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System.Collections.Generic;

public class ObeliskUI : MonoBehaviour
{
    [Header("Quest Display")]
    [SerializeField] private TextMeshProUGUI questTitle;
    [SerializeField] private TextMeshProUGUI questDescription;
    [SerializeField] private Image questIcon;

    [Header("Requirements")]
    [SerializeField] private Transform requirementContainer;
    [SerializeField] private GameObject requirementItemPrefab;

    [Header("Complete Button")]
    [SerializeField] private Button completeButton;
    [SerializeField] private TextMeshProUGUI completeButtonText;

    private ObeliskQuest currentQuest;
    private Obelisk currentObelisk;
    private List<GameObject> requirementItems = new List<GameObject>();

    void Start()
    {
        if (completeButton != null)
            completeButton.onClick.AddListener(OnCompleteButtonClicked);
    }

    public void SetQuest(ObeliskQuest quest)
    {
        currentQuest = quest;
        RefreshDisplay();
    }

    public void SetObelisk(Obelisk obelisk)
    {
        currentObelisk = obelisk;
    }

    public void RefreshDisplay()
    {
        if (currentQuest == null) return;

        // Update quest info
        if (questTitle != null)
            questTitle.text = currentQuest.questName;

        if (questDescription != null)
            questDescription.text = currentQuest.questDescription;

        if (questIcon != null && currentQuest.questIcon != null)
        {
            questIcon.sprite = currentQuest.questIcon;
            questIcon.enabled = true;
        }
        else if (questIcon != null)
        {
            questIcon.enabled = false;
        }

        // Clear old requirement items
        foreach (var item in requirementItems)
            if (item != null) Destroy(item);
        requirementItems.Clear();

        // Create requirement items
        if (requirementContainer != null && requirementItemPrefab != null)
        {
            foreach (var requirement in currentQuest.requiredItems)
            {
                var reqItem = Instantiate(requirementItemPrefab, requirementContainer);

                // Set item icon
                var img = reqItem.GetComponentInChildren<Image>();
                if (img != null && requirement.item.icon != null)
                {
                    img.sprite = requirement.item.icon;
                    img.enabled = true;
                }

                // Set quantity text with color coding
                var text = reqItem.GetComponentInChildren<TextMeshProUGUI>();
                if (text != null)
                {
                    int currentCount = InventoryManager.Instance.GetItemCount(requirement.item);
                    text.text = $"{currentCount}/{requirement.quantity}";

                    // Color based on availability
                    bool hasEnough = currentCount >= requirement.quantity;
                    text.color = hasEnough ? Color.green : Color.red;
                }

                requirementItems.Add(reqItem);
            }
        }

        // Update complete button
        UpdateCompleteButton();
    }

    void UpdateCompleteButton()
    {
        if (completeButton == null) return;

        if (currentQuest.IsCompleted)
        {
            completeButton.interactable = false;
            if (completeButtonText != null)
                completeButtonText.text = "Completed";
        }
        else
        {
            bool canComplete = currentQuest.CanComplete();
            completeButton.interactable = canComplete;

            if (completeButtonText != null)
            {
                completeButtonText.text = canComplete ? "Complete Quest" : "Insufficient Items";
            }
        }
    }

    void OnCompleteButtonClicked()
    {
        if (currentObelisk != null && currentQuest != null && currentQuest.CanComplete())
        {
            currentObelisk.CompleteCurrentQuest();
        }
    }

    void Update()
    {
        // Refresh the display periodically to update item counts
        if (gameObject.activeSelf && Time.frameCount % 30 == 0)
        {
            RefreshDisplay();
        }
    }
}