using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

[RequireComponent(typeof(CanvasGroup))]
public class InventoryCraftingTooltipUI : MonoBehaviour
{
    [Header("Canvas Group / Visibility")]
    [SerializeField] private CanvasGroup canvasGroup;
    [SerializeField] private float fadeDuration = 0.15f;
    [SerializeField] private bool useUnscaledTime = true;
    [SerializeField] private AnimationCurve fadeCurve = AnimationCurve.Linear(0, 0, 1, 1);

    [Header("Header")]
    [SerializeField] private TextMeshProUGUI recipeNameText;

    [Header("Content Parents")]
    [SerializeField] private Transform inputsParent;
    [SerializeField] private Transform outputsParent;

    [Header("Prefabs")]
    [SerializeField] private ItemAmountUI itemAmountPrefab;

    private readonly List<ItemAmountUI> spawnedInputs = new();
    private readonly List<ItemAmountUI> spawnedOutputs = new();

    private Coroutine fadeRoutine;
    private bool isVisible;

    // Track which recipe we're showing so we can refresh counts on inventory change
    private Recipe currentRecipe;

    private void Awake()
    {
        if (!canvasGroup)
            canvasGroup = GetComponent<CanvasGroup>();

        canvasGroup.alpha = 0f;
        canvasGroup.interactable = false;
        canvasGroup.blocksRaycasts = false;
        isVisible = false;

        ClearAll();
    }

    private void OnEnable()
    {
        if (InventoryManager.Instance != null)
            InventoryManager.Instance.OnInventoryChanged += HandleInventoryChanged;
    }

    private void OnDisable()
    {
        if (InventoryManager.Instance != null)
            InventoryManager.Instance.OnInventoryChanged -= HandleInventoryChanged;
        // Do not ClearAll here: we want to preserve state between enable/disable if needed.
    }

    private void OnDestroy()
    {
        if (InventoryManager.Instance != null)
            InventoryManager.Instance.OnInventoryChanged -= HandleInventoryChanged;
    }

    /// <summary>
    /// Called by RecipeButton on hover. Also sets the current recipe reference for auto-refresh.
    /// </summary>
    public void ShowForRecipe(Recipe recipe)
    {
        if (recipe == null)
        {
            Hide();
            return;
        }

        currentRecipe = recipe;

        if (recipeNameText)
            recipeNameText.text = recipe.recipeName;

        RebuildInputs(recipe);
        RebuildOutputs(recipe);

        FadeTo(1f, true);
    }

    public void Refresh()
    {
        if (isVisible && currentRecipe != null)
            RebuildInputs(currentRecipe);
    }

    public void Hide()
    {
        FadeTo(0f, false, onComplete: ClearAll);
    }

    private void HandleInventoryChanged()
    {
        // If we're visible and have a recipe selected, refresh counts live.
        if (isVisible && currentRecipe != null)
        {
            Refresh();
        }
    }

    private void RebuildInputs(Recipe recipe)
    {
        ClearList(spawnedInputs);
        if (inputsParent == null || itemAmountPrefab == null || recipe?.inputs == null) return;

        foreach (var req in recipe.inputs)
        {
            if (req == null || req.item == null || req.quantity <= 0) continue;

            var ui = Instantiate(itemAmountPrefab, inputsParent);

            // Get current inventory count
            int owned = InventoryManager.Instance != null
                ? InventoryManager.Instance.GetItemCount(req.item)
                : 0;

            bool hasEnough = owned >= req.quantity;

            // Set the item and quantity
            ui.Set(req.item, req.quantity);

            // Update text color based on availability
            var text = ui.GetComponentInChildren<TextMeshProUGUI>();
            if (text != null)
            {
                text.color = hasEnough ? Color.green : Color.red;
                text.text = $"{req.quantity} ({owned})";
            }

            spawnedInputs.Add(ui);
        }
    }

    private void RebuildOutputs(Recipe recipe)
    {
        ClearList(spawnedOutputs);
        if (outputsParent == null || itemAmountPrefab == null || recipe?.outputs == null) return;

        foreach (var res in recipe.outputs)
        {
            if (res == null || res.item == null || res.quantity <= 0) continue;

            var ui = Instantiate(itemAmountPrefab, outputsParent);
            ui.Set(res.item, res.quantity);
            spawnedOutputs.Add(ui);
        }
    }

    private void ClearAll()
    {
        ClearList(spawnedInputs);
        ClearList(spawnedOutputs);
        if (recipeNameText) recipeNameText.text = string.Empty;
        currentRecipe = null;
    }

    private void ClearList(List<ItemAmountUI> cache)
    {
        for (int i = 0; i < cache.Count; i++)
            if (cache[i]) Destroy(cache[i].gameObject);
        cache.Clear();
    }

    private void FadeTo(float targetAlpha, bool visibleStateAfter, System.Action onComplete = null)
    {
        if (Mathf.Approximately(canvasGroup.alpha, targetAlpha))
        {
            isVisible = visibleStateAfter;
            ApplyInteractableState(targetAlpha > 0.001f);
            onComplete?.Invoke();
            return;
        }

        if (fadeRoutine != null)
            StopCoroutine(fadeRoutine);

        fadeRoutine = StartCoroutine(FadeRoutine(targetAlpha, visibleStateAfter, onComplete));
    }

    private IEnumerator FadeRoutine(float targetAlpha, bool visibleStateAfter, System.Action onComplete)
    {
        float start = canvasGroup.alpha;
        float duration = Mathf.Max(0.0001f, fadeDuration);
        float t = 0f;

        if (targetAlpha > start)
            ApplyInteractableState(true);

        while (t < duration)
        {
            t += useUnscaledTime ? Time.unscaledDeltaTime : Time.deltaTime;
            float normalized = Mathf.Clamp01(t / duration);

            float eased = fadeCurve != null ? fadeCurve.Evaluate(normalized) : normalized;
            canvasGroup.alpha = Mathf.Lerp(start, targetAlpha, eased);

            yield return null;
        }

        canvasGroup.alpha = targetAlpha;
        isVisible = visibleStateAfter;

        ApplyInteractableState(targetAlpha > 0.001f);

        fadeRoutine = null;
        onComplete?.Invoke();
    }

    private void ApplyInteractableState(bool on)
    {
        canvasGroup.blocksRaycasts = on;
        canvasGroup.interactable = on;
    }
}
