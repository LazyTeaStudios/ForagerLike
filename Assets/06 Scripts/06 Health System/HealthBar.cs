using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using TMPro;

/// <summary>
/// Displays health for whatever object the player is looking at within range.
/// </summary>
public class HealthBar : MonoBehaviour
{
    [Header("UI")]
    [SerializeField] private Image healthFillImage;
    [SerializeField] private CanvasGroup canvasGroup;
    [SerializeField] private TMP_Text healthText;

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

        if (healthFillImage != null)
            healthFillImage.fillAmount = 1f;

        if (healthText != null)
            healthText.text = string.Empty;
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
            HealthSystem newTarget = hit.collider.GetComponentInParent<HealthSystem>();

            if (newTarget != null && !newTarget.IsDead)
            {
                // ?? If this health system belongs to a SeedBed plant,
                // only show the bar once the SeedBed says it's fully grown.
                SeedBed seedBed = newTarget.GetComponentInParent<SeedBed>();

                if (seedBed != null && !seedBed.IsFullyGrown())
                {
                    // It's a growing plant in a seed bed and not harvestable yet,
                    // so treat it as "no valid target".
                }
                else
                {
                    // Either:
                    // - not part of a SeedBed (natural prefab / enemy / etc), OR
                    // - part of a SeedBed but fully grown => show health bar
                    if (newTarget != currentTarget)
                    {
                        SetTarget(newTarget);
                    }
                    FadeTo(1f);
                    return;
                }
            }
        }

        // No valid target or blocked by SeedBed gating
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

        if (healthText != null)
            healthText.text = string.Empty;
    }

    private void OnTargetDeath()
    {
        ClearTarget();
        FadeTo(0f);
    }

    private void UpdateHealthBar(float current, float max)
    {
        if (healthFillImage != null)
        {
            healthFillImage.fillAmount = current / max;
        }

        if (healthText != null)
        {
            int curInt = Mathf.CeilToInt(current);
            int maxInt = Mathf.CeilToInt(max);
            healthText.text = $"{curInt}/{maxInt}";
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
