using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class CraftingTooltipUI : MonoBehaviour
{
    [Header("Root / Visibility")]
    [Tooltip("Root panel to show/hide. If null, this GameObject is used.")]
    [SerializeField] private GameObject panelRoot;

    [Header("Header")]
    [SerializeField] private TextMeshProUGUI recipeNameText;

    [Header("Content Parents")]
    [Tooltip("Parent transform where input item prefabs will be instantiated.")]
    [SerializeField] private Transform inputsParent;
    [Tooltip("Parent transform where output item prefabs will be instantiated.")]
    [SerializeField] private Transform outputsParent;

    [Header("Prefabs")]
    [Tooltip("Prefab with ItemAmountUI to show an INPUT item icon and quantity.")]
    [SerializeField] private ItemAmountUI inputItemPrefab;
    [Tooltip("Prefab with ItemAmountUI to show an OUTPUT item icon and quantity.")]
    [SerializeField] private ItemAmountUI outputItemPrefab;

    // Keep instances to clean up/reuse if needed
    private readonly List<GameObject> spawnedInputs = new();
    private readonly List<GameObject> spawnedOutputs = new();

    private void Awake()
    {
        if (panelRoot == null) panelRoot = gameObject;
        SetVisible(false);
        ClearAll();
    }

    public void ShowRecipe(Recipe recipe)
    {
        if (recipe == null)
        {
            SetVisible(false);
            ClearAll();
            return;
        }

        SetVisible(true);

        if (recipeNameText != null)
            recipeNameText.text = string.IsNullOrEmpty(recipe.recipeName) ? "Recipe" : recipe.recipeName;

        RebuildList(recipe.inputs, inputsParent, spawnedInputs, /*isInput:*/ true);
        RebuildList(recipe.outputs, outputsParent, spawnedOutputs, /*isInput:*/ false);
    }

    public void ClearAll()
    {
        ClearList(spawnedInputs);
        ClearList(spawnedOutputs);
        if (recipeNameText != null) recipeNameText.text = string.Empty;
    }

    private void RebuildList(
        List<ItemRequirement> list, Transform parent, List<GameObject> cache, bool isInput)
    {
        ClearList(cache);
        if (parent == null || list == null) return;

        var prefab = isInput ? inputItemPrefab : outputItemPrefab;
        if (prefab == null) return;

        foreach (var entry in list)
        {
            if (entry == null || entry.item == null || entry.quantity <= 0) continue;

            var go = Instantiate(prefab.gameObject, parent);
            var ui = go.GetComponent<ItemAmountUI>();
            if (ui != null)
                ui.Set(entry.item, entry.quantity);
            cache.Add(go);
        }
    }

    private void RebuildList(
        List<ItemResult> list, Transform parent, List<GameObject> cache, bool isInput)
    {
        ClearList(cache);
        if (parent == null || list == null) return;

        var prefab = isInput ? inputItemPrefab : outputItemPrefab;
        if (prefab == null) return;

        foreach (var entry in list)
        {
            if (entry == null || entry.item == null || entry.quantity <= 0) continue;

            var go = Instantiate(prefab.gameObject, parent);
            var ui = go.GetComponent<ItemAmountUI>();
            if (ui != null)
                ui.Set(entry.item, entry.quantity);
            cache.Add(go);
        }
    }

    private void ClearList(List<GameObject> cache)
    {
        for (int i = 0; i < cache.Count; i++)
            if (cache[i] != null) Destroy(cache[i]);
        cache.Clear();
    }

    private void SetVisible(bool visible)
    {
        if (panelRoot != null) panelRoot.SetActive(visible);
    }
}
