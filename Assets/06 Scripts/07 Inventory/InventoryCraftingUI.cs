using System.Collections.Generic;
using UnityEngine;

public class InventoryCraftingUI : MonoBehaviour
{
    [Header("UI")]
    [SerializeField] private GameObject craftingPanel;

    [Header("Buttons")]
    [SerializeField] private List<InventoryRecipeButton> recipeButtons = new List<InventoryRecipeButton>();

    [Header("Recipes")]
    [SerializeField] private List<Recipe> availableRecipes = new List<Recipe>();

    [Header("Tooltip")]
    [SerializeField] private InventoryCraftingTooltipUI tooltipUI;

    private static bool s_Suppressed;
    private static InventoryCraftingUI s_Instance;

    private bool lastIsOpen;
    private bool lastOpenedForBuilding;

    private void Awake()
    {
        s_Instance = this;
        if (craftingPanel != null) craftingPanel.SetActive(false);
        tooltipUI?.Hide();
    }

    private void OnEnable()
    {
        InventoryUI.OnInventoryToggled += HandleInventoryToggled;
    }

    private void OnDisable()
    {
        InventoryUI.OnInventoryToggled -= HandleInventoryToggled;
        if (s_Instance == this) s_Instance = null;
        tooltipUI?.Hide();
    }

    private void Start()
    {
        BindRecipesToButtons();
        ApplyVisibility();
    }

    private void HandleInventoryToggled(bool isOpen, bool openedForBuilding)
    {
        lastIsOpen = isOpen;
        lastOpenedForBuilding = openedForBuilding;
        ApplyVisibility();
    }

    private void ApplyVisibility()
    {
        if (craftingPanel == null) return;
        bool active = lastIsOpen && !lastOpenedForBuilding && !s_Suppressed;

        if (craftingPanel.activeSelf != active)
            craftingPanel.SetActive(active);

        if (!active) tooltipUI?.Hide();
    }

    public static void SetSuppressed(bool value)
    {
        s_Suppressed = value;
        if (s_Instance != null) s_Instance.ApplyVisibility();
    }

    public void BindRecipesToButtons()
    {
        if (recipeButtons == null || recipeButtons.Count == 0) return;

        int buttonCount = recipeButtons.Count;
        int recipeCount = availableRecipes?.Count ?? 0;

        for (int i = 0; i < buttonCount; i++)
        {
            var btn = recipeButtons[i];
            if (btn == null) continue;

            bool hasRecipe = i < recipeCount && availableRecipes[i] != null;
            if (hasRecipe)
            {
                btn.gameObject.SetActive(true);
                btn.Setup(availableRecipes[i], this);
            }
            else
            {
                btn.gameObject.SetActive(false);
            }
        }
    }

    // ===== Tooltip API for buttons (fixed location) =====
    public void ShowTooltip(Recipe recipe)
    {
        tooltipUI?.ShowForRecipe(recipe);
    }

    public void HideTooltip()
    {
        tooltipUI?.Hide();
    }

    public void TryCraft(Recipe recipe)
    {
        var inv = InventorySystem.Instance;
        if (inv == null || recipe == null) return;
        if (!inv.CanCraftFromInventory(recipe)) return;
        inv.CraftIntoInventory(recipe);
    }
}
