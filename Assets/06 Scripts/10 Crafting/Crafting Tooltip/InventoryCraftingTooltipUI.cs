using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

/// <summary>
/// Shows a crafting tooltip by fading a CanvasGroup in/out instead of enabling/disabling the GameObject.
/// </summary>
[RequireComponent(typeof(CanvasGroup))]
public class InventoryCraftingTooltipUI : MonoBehaviour
{
    [Header("Canvas Group / Visibility")]
    [Tooltip("CanvasGroup to control visibility. If null, will use the one on this GameObject.")]
    [SerializeField] private CanvasGroup canvasGroup;

    [Tooltip("Seconds to fade in/out.")]
    [SerializeField] private float fadeDuration = 0.15f;

    [Tooltip("If true, fade uses unscaled time (ignores Time.timeScale).")]
    [SerializeField] private bool useUnscaledTime = true;

    [Tooltip("Optional ease curve for the fade (time 0..1 on X, alpha 0..1 on Y). If null, uses linear.")]
    [SerializeField] private AnimationCurve fadeCurve = AnimationCurve.Linear(0, 0, 1, 1);

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

    // caches to destroy/rebuild entries
    private readonly List<GameObject> spawnedInputs = new();
    private readonly List<GameObject> spawnedOutputs = new();

    // runtime
    private Coroutine fadeRoutine;
    private bool isVisible;

    private void Awake()
    {
        if (!canvasGroup)
            canvasGroup = GetComponent<CanvasGroup>();

        // Start hidden
        canvasGroup.alpha = 0f;
        canvasGroup.interactable = false;
        canvasGroup.blocksRaycasts = false;
        isVisible = false;

        ClearAll();
    }

    /// <summary>Show the tooltip for a recipe at its anchored (fixed) UI position.</summary>
    public void ShowForRecipe(Recipe recipe)
    {
        if (recipe == null)
        {
            Hide();
            return;
        }

        if (recipeNameText != null)
            recipeNameText.text = string.IsNullOrEmpty(recipe.recipeName) ? "Recipe" : recipe.recipeName;

        RebuildInputs(recipe);
        RebuildOutputs(recipe);

        FadeTo(1f, true);
    }

    /// <summary>Fade out and clear contents after the fade completes.</summary>
    public void Hide()
    {
        FadeTo(0f, false, onComplete: ClearAll);
    }

    private void RebuildInputs(Recipe recipe)
    {
        ClearList(spawnedInputs);
        if (inputsParent == null || inputItemPrefab == null || recipe?.inputs == null) return;

        foreach (var req in recipe.inputs)
        {
            if (req == null || req.item == null || req.quantity <= 0) continue;

            var go = Instantiate(inputItemPrefab.gameObject, inputsParent);
            var ui = go.GetComponent<ItemAmountUI>();
            if (ui) ui.Set(req.item, req.quantity);
            spawnedInputs.Add(go);
        }
    }

    private void RebuildOutputs(Recipe recipe)
    {
        ClearList(spawnedOutputs);
        if (outputsParent == null || outputItemPrefab == null || recipe?.outputs == null) return;

        foreach (var res in recipe.outputs)
        {
            if (res == null || res.item == null || res.quantity <= 0) continue;

            var go = Instantiate(outputItemPrefab.gameObject, outputsParent);
            var ui = go.GetComponent<ItemAmountUI>();
            if (ui) ui.Set(res.item, res.quantity);
            spawnedOutputs.Add(go);
        }
    }

    private void ClearAll()
    {
        ClearList(spawnedInputs);
        ClearList(spawnedOutputs);
        if (recipeNameText) recipeNameText.text = string.Empty;
    }

    private void ClearList(List<GameObject> cache)
    {
        for (int i = 0; i < cache.Count; i++)
            if (cache[i]) Destroy(cache[i]);
        cache.Clear();
    }

    /// <summary>
    /// Starts a fade to the target alpha. Handles raycasts/interactable toggling.
    /// </summary>
    private void FadeTo(float targetAlpha, bool visibleStateAfter, System.Action onComplete = null)
    {
        // Short-circuit if already at target visually
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

        // Make it responsive to input as soon as we begin showing
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

        // If fully hidden, disable interaction; if shown, keep it on
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
