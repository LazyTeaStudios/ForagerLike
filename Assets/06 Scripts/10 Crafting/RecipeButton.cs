using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class RecipeButton : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    [SerializeField] Image icon;
    [SerializeField] GameObject tooltipPanel;
    [SerializeField] TMPro.TextMeshProUGUI tooltipText;

    Button button;
    Recipe recipe;
    CraftingUI craftingUI;

    public void Setup(Recipe recipeData, CraftingUI ui)
    {
        recipe = recipeData;
        craftingUI = ui;

        if (button == null)
            button = GetComponent<Button>();

        if (icon != null && recipe != null)
            icon.sprite = recipe.recipeIcon;

        button.onClick.RemoveAllListeners();
        button.onClick.AddListener(OnClick);

        UpdateInteractable();
    }

    void OnClick()
    {
        if (craftingUI != null && recipe != null)
            craftingUI.TryCraft(recipe);

        UpdateInteractable();
    }

    public void UpdateInteractable()
    {
        if (button == null || recipe == null) return;

        bool canCraft = true;
        foreach (ItemRequirement input in recipe.inputs)
        {
            if (InventoryManager.Instance.GetItemCount(input.item) < input.quantity)
            {
                canCraft = false;
                break;
            }
        }

        button.interactable = canCraft;
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        if (tooltipPanel != null && recipe != null)
        {
            tooltipPanel.SetActive(true);

            if (tooltipText != null)
            {
                string text = recipe.recipeName + "\n\nRequires:\n";
                foreach (ItemRequirement input in recipe.inputs)
                {
                    int owned = InventoryManager.Instance.GetItemCount(input.item);
                    text += $"- {input.item.itemName} x{input.quantity} ({owned})\n";
                }
                tooltipText.text = text;
            }
        }
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        if (tooltipPanel != null)
            tooltipPanel.SetActive(false);
    }
}