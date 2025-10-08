using UnityEngine;
using UnityEngine.UI;

public class RecipeButton : MonoBehaviour
{
    [Header("UI")]
    [SerializeField] private Image recipeIcon;

    public Recipe Recipe { get; private set; }

    private Button button;
    private CraftingUI craftingUI;
    private UIButtonOutline outline;

    public void BindUI(CraftingUI ui, Recipe recipe)
    {
        craftingUI = ui;
        Recipe = recipe;

        if (button == null) button = GetComponent<Button>();
        if (button != null)
        {
            button.onClick.RemoveAllListeners();
            button.onClick.AddListener(() =>
            {
                if (craftingUI != null && Recipe != null)
                    craftingUI.SelectRecipe(Recipe);
            });
            button.interactable = (Recipe != null);
        }

        if (recipeIcon != null)
            recipeIcon.sprite = Recipe != null ? Recipe.recipeIcon : null;

        if (outline == null) outline = GetComponent<UIButtonOutline>();
        if (outline != null)
        {
            // Recipe buttons keep the outline when selected (even if later disabled)
            outline.SetPersistWhenSelected(true);
            outline.SetSelected(false);
        }
    }

    /// <summary>Called by CraftingUI when this button becomes (de)selected.</summary>
    public void SetSelected(bool selected) => outline?.SetSelected(selected);

    /// <summary>
    /// Enable/disable interaction from CraftingUI (e.g., during crafting).
    /// Outline on the selected button remains due to UIButtonOutline logic.
    /// Hover outline is suppressed automatically while disabled.
    /// </summary>
    public void SetInteractable(bool interactable)
    {
        if (button == null) button = GetComponent<Button>();
        if (button != null) button.interactable = interactable && (Recipe != null);
        // NOTE: Do NOT clear outline here—selected button should remain "locked" visually.
    }
}
