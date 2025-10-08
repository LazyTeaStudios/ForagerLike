using UnityEngine;

public class CraftingUI : MonoBehaviour
{
    [SerializeField] GameObject craftingPanel;
    [SerializeField] RecipeButton[] recipeButtons;
    [SerializeField] Recipe[] recipes;

    void Start()
    {
        InitializeButtons();
        craftingPanel.SetActive(false);

        InventoryManager.Instance.OnInventoryChanged += UpdateAllButtons;
        InventoryUI.OnInventoryToggled += OnInventoryToggled;
    }

    void InitializeButtons()
    {
        for (int i = 0; i < recipeButtons.Length; i++)
        {
            if (recipeButtons[i] == null) continue;

            bool hasRecipe = i < recipes.Length && recipes[i] != null;
            recipeButtons[i].gameObject.SetActive(hasRecipe);

            if (hasRecipe)
                recipeButtons[i].Setup(recipes[i], this);
        }
    }

    void OnInventoryToggled(bool isOpen)
    {
        craftingPanel.SetActive(isOpen);
    }

    void UpdateAllButtons()
    {
        foreach (var button in recipeButtons)
            button?.UpdateInteractable();
    }

    public void TryCraft(Recipe recipe)
    {
        if (!CanCraft(recipe)) return;

        foreach (var input in recipe.inputs)
            InventoryManager.Instance.RemoveItem(input.item, input.quantity);

        foreach (var output in recipe.outputs)
            InventoryManager.Instance.AddItem(output.item, output.quantity);
    }

    bool CanCraft(Recipe recipe)
    {
        foreach (var input in recipe.inputs)
        {
            if (InventoryManager.Instance.GetItemCount(input.item) < input.quantity)
                return false;
        }
        return true;
    }

    void OnDestroy()
    {
        if (InventoryManager.Instance)
            InventoryManager.Instance.OnInventoryChanged -= UpdateAllButtons;

        InventoryUI.OnInventoryToggled -= OnInventoryToggled;
    }
}