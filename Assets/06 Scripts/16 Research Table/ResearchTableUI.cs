using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System.Collections.Generic;

public class ResearchTableUI : MonoBehaviour
{
    [Header("Ability Buttons")]
    [SerializeField] private List<ResearchAbilityButton> abilityButtons = new List<ResearchAbilityButton>();

    [Header("Tooltip")]
    [SerializeField] private GameObject tooltipPanel;
    [SerializeField] private TextMeshProUGUI tooltipTitle;
    [SerializeField] private TextMeshProUGUI tooltipDescription;
    [SerializeField] private Transform costContainer;
    [SerializeField] private GameObject costItemPrefab;
    [SerializeField] private Button unlockButton;
    [SerializeField] private TextMeshProUGUI unlockButtonText;

    private ResearchAbility selectedAbility;
    private List<GameObject> costItems = new List<GameObject>();

    void Start()
    {
        if (tooltipPanel != null)
            tooltipPanel.SetActive(false);

        if (unlockButton != null)
            unlockButton.onClick.AddListener(UnlockSelectedAbility);

        RefreshDisplay();
    }

    public void RefreshDisplay()
    {
        foreach (var button in abilityButtons)
        {
            if (button != null)
                button.RefreshDisplay();
        }

        if (selectedAbility != null)
            ShowTooltip(selectedAbility);
    }

    public void OnAbilityButtonClicked(ResearchAbilityButton button)
    {
        if (button == null || button.Ability == null) return;

        selectedAbility = button.Ability;
        ShowTooltip(selectedAbility);
    }

    void ShowTooltip(ResearchAbility ability)
    {
        if (ability == null || tooltipPanel == null) return;

        tooltipPanel.SetActive(true);

        if (tooltipTitle != null)
            tooltipTitle.text = ability.abilityName;

        if (tooltipDescription != null)
            tooltipDescription.text = ability.description;

        // Clear old cost items
        foreach (var item in costItems)
            if (item != null) Destroy(item);
        costItems.Clear();

        // Create cost items with icons
        if (costContainer != null && costItemPrefab != null)
        {
            foreach (var cost in ability.itemCosts)
            {
                var costItem = Instantiate(costItemPrefab, costContainer);

                // Set item icon
                var img = costItem.GetComponentInChildren<Image>();
                if (img != null && cost.item.icon != null)
                {
                    img.sprite = cost.item.icon;
                    img.enabled = true;
                }

                // Set quantity text with color coding
                var text = costItem.GetComponentInChildren<TextMeshProUGUI>();
                if (text != null)
                {
                    int currentCount = InventoryManager.Instance.GetItemCount(cost.item);
                    text.text = $"{currentCount}/{cost.quantity}";

                    // Color based on availability
                    bool hasEnough = currentCount >= cost.quantity;
                    text.color = hasEnough ? Color.green : Color.red;
                }

                costItems.Add(costItem);
            }
        }

        // Update unlock button
        if (unlockButton != null)
        {
            if (ability.IsUnlocked)
            {
                unlockButton.interactable = false;
                if (unlockButtonText != null)
                    unlockButtonText.text = "Unlocked";
            }
            else
            {
                unlockButton.interactable = ability.CanUnlock();
                if (unlockButtonText != null)
                    unlockButtonText.text = "Unlock";
            }
        }
    }

    void UnlockSelectedAbility()
    {
        if (selectedAbility == null || selectedAbility.IsUnlocked) return;

        selectedAbility.Unlock();
        RefreshDisplay();
    }

    public void HideTooltip()
    {
        if (tooltipPanel != null)
            tooltipPanel.SetActive(false);

        selectedAbility = null;
    }
}