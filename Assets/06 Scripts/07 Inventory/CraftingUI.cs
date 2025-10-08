using UnityEngine;

public class CraftingUI : MonoBehaviour
{
    [Header("UI")]
    [SerializeField] GameObject craftingPanel;

    [Header("Recipe Buttons - Assign in Inspector")]
    [SerializeField] RecipeButton[] recipeButtons;

    [Header("Recipes")]
    [SerializeField] Recipe[] recipes;

    void Start()
    {
        InitializeExistingButtons();
        craftingPanel.SetActive(false);
        InventoryManager.Instance.OnInventoryChanged += UpdateRecipeButtons;
    }

    void InitializeExistingButtons()
    {
        int buttonCount = Mathf.Min(recipeButtons.Length, recipes.Length);
        for (int i = 0; i < recipeButtons.Length; i++)
        {
            if (recipeButtons[i] == null) continue;
            if (i < recipes.Length && recipes[i] != null)
            {
                recipeButtons[i].Setup(recipes[i], this);
                recipeButtons[i].gameObject.SetActive(true);
            }
            else
            {
                recipeButtons[i].gameObject.SetActive(false);
            }
        }
    }

    void Update()
    {
        bool shouldBeActive = InputHandler.IsMapActive(ActionMap.UI);

        if (craftingPanel.activeSelf != shouldBeActive)
        {
            craftingPanel.SetActive(shouldBeActive);

            // Hide all tooltips when closing
            if (!shouldBeActive)
            {
                HideAllTooltips();
            }
        }
    }

    void HideAllTooltips()
    {
        foreach (RecipeButton button in recipeButtons)
        {
            if (button != null)
                button.ForceHideTooltip();
        }
    }

    void UpdateRecipeButtons()
    {
        foreach (RecipeButton button in recipeButtons)
        {
            if (button != null && button.gameObject.activeSelf)
                button.UpdateInteractable();
        }
    }

    public void TryCraft(Recipe recipe)
    {
        if (!CanCraft(recipe)) return;

        foreach (ItemRequirement input in recipe.inputs)
            InventoryManager.Instance.RemoveItem(input.item, input.quantity);

        foreach (ItemResult output in recipe.outputs)
            InventoryManager.Instance.AddItem(output.item, output.quantity);
    }

    bool CanCraft(Recipe recipe)
    {
        foreach (ItemRequirement input in recipe.inputs)
        {
            if (InventoryManager.Instance.GetItemCount(input.item) < input.quantity)
                return false;
        }
        return true;
    }

    void OnDestroy()
    {
        if (InventoryManager.Instance != null)
            InventoryManager.Instance.OnInventoryChanged -= UpdateRecipeButtons;
    }

    void OnDisable()
    {
        HideAllTooltips();
    }
}