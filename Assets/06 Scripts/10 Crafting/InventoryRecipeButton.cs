using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class InventoryRecipeButton : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    [SerializeField] public Image icon;

    private Button button;
    private Recipe recipe;
    private InventoryCraftingUI craftingUI;
    private UIButtonOutline outline;

    public void Setup(Recipe recipeData, InventoryCraftingUI ui)
    {
        recipe = recipeData;
        craftingUI = ui;

        if (button == null) button = GetComponent<Button>();
        if (button == null) button = gameObject.AddComponent<Button>();

        if (icon == null) icon = GetComponentInChildren<Image>();
        if (icon != null) icon.sprite = recipe != null ? recipe.recipeIcon : null;

        if (outline == null) outline = GetComponent<UIButtonOutline>();
        if (outline != null)
        {
            outline.SetPersistWhenSelected(false);
            outline.SetSelected(false);
        }

        button.onClick.RemoveAllListeners();
        button.onClick.AddListener(() =>
        {
            if (craftingUI != null && recipe != null)
                craftingUI.TryCraft(recipe);

            if (outline != null)
                outline.SetSelected(false);
        });
    }

    // ===== Hover Tooltip (fixed-position panel) =====
    public void OnPointerEnter(PointerEventData eventData)
    {
        if (craftingUI != null && recipe != null)
            craftingUI.ShowTooltip(recipe);
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        craftingUI?.HideTooltip();
    }
}
