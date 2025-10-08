using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class RecipeButton : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    [SerializeField] Image icon;
    [SerializeField] InventoryCraftingTooltipUI tooltip;

    Button button;
    Recipe recipe;
    CraftingUI craftingUI;

    void Awake()
    {
        button = GetComponent<Button>();

        // Auto-find tooltip if not assigned
        if (tooltip == null)
        {
            tooltip = GetComponentInChildren<InventoryCraftingTooltipUI>(true);
        }
    }

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
        if (tooltip != null && recipe != null)
        {
            tooltip.ShowForRecipe(recipe);
        }
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        if (tooltip != null)
        {
            tooltip.Hide();
        }
    }

    public void ForceHideTooltip()
    {
        if (tooltip != null)
        {
            tooltip.Hide();
        }
    }

    void OnDisable()
    {
        ForceHideTooltip();
    }
}