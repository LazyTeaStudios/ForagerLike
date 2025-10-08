using UnityEngine;
using UnityEngine.UI;
using System.Collections;

/// <summary>
/// Displays health for whatever object the player is looking at within range.
/// </summary>
public class HealthBar : MonoBehaviour
{
    [Header("UI")]
    [SerializeField] private Slider healthSlider;
    [SerializeField] private CanvasGroup canvasGroup;

    [Header("Detection")]
    [SerializeField] private float lookRange = 10f;
    [SerializeField] private LayerMask detectLayers;

    [Header("Animation")]
    [SerializeField] private float fadeSpeed = 5f;

    private Camera mainCamera;
    private HealthSystem currentTarget;
    private Coroutine fadeCoroutine;

    private void Awake()
    {
        mainCamera = Camera.main;

        if (canvasGroup == null)
            canvasGroup = GetComponent<CanvasGroup>();

        if (canvasGroup != null)
            canvasGroup.alpha = 0f;
    }

    private void Update()
    {
        CheckLookTarget();
    }

    private void CheckLookTarget()
    {
        Ray ray = mainCamera.ScreenPointToRay(new Vector2(Screen.width / 2f, Screen.height / 2f));

        if (Physics.Raycast(ray, out RaycastHit hit, lookRange, detectLayers))
        {
            HealthSystem newTarget = hit.collider.GetComponent<HealthSystem>();

            if (newTarget != null && !newTarget.IsDead)
            {
                if (newTarget != currentTarget)
                {
                    SetTarget(newTarget);
                }
                FadeTo(1f);
                return;
            }
        }

        if (currentTarget != null)
        {
            ClearTarget();
        }

        FadeTo(0f);
    }

    private void SetTarget(HealthSystem newTarget)
    {
        if (currentTarget != null)
        {
            currentTarget.OnHealthChanged -= UpdateHealthBar;
            currentTarget.OnDeath -= OnTargetDeath;
        }

        currentTarget = newTarget;
        currentTarget.OnHealthChanged += UpdateHealthBar;
        currentTarget.OnDeath += OnTargetDeath;

        UpdateHealthBar(currentTarget.CurrentHealth, currentTarget.MaxHealth);
    }

    private void ClearTarget()
    {
        if (currentTarget != null)
        {
            currentTarget.OnHealthChanged -= UpdateHealthBar;
            currentTarget.OnDeath -= OnTargetDeath;
            currentTarget = null;
        }
    }

    private void OnTargetDeath()
    {
        ClearTarget();
        FadeTo(0f);
    }

    private void UpdateHealthBar(float current, float max)
    {
        if (healthSlider != null)
        {
            healthSlider.maxValue = max;
            healthSlider.value = current;
        }
    }

    private void FadeTo(float targetAlpha)
    {
        if (canvasGroup == null) return;

        if (fadeCoroutine != null)
            StopCoroutine(fadeCoroutine);

        fadeCoroutine = StartCoroutine(FadeCoroutine(targetAlpha));
    }

    private IEnumerator FadeCoroutine(float targetAlpha)
    {
        while (!Mathf.Approximately(canvasGroup.alpha, targetAlpha))
        {
            canvasGroup.alpha = Mathf.MoveTowards(canvasGroup.alpha, targetAlpha, fadeSpeed * Time.deltaTime);
            yield return null;
        }

        canvasGroup.alpha = targetAlpha;
        fadeCoroutine = null;
    }

    private void OnDestroy()
    {
        ClearTarget();
    }
}