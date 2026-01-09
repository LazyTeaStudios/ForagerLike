using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using TMPro;

public class HealthBar : MonoBehaviour
{
    [Header("UI")]
    [SerializeField] private Image healthFillImage;
    [SerializeField] private CanvasGroup canvasGroup;
    [SerializeField] private TMP_Text healthText;

    [Header("Animation")]
    [SerializeField] private float fadeSpeed = 5f;

    private Camera mainCamera;
    private HealthSystem currentTarget;
    private Coroutine fadeCoroutine;
    private float currentFadeTarget = -1f;

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
        var playerData = PlayerDataHandler.Data;
        if (playerData == null || mainCamera == null)
        {
            ClearTarget();
            FadeTo(0f);
            return;
        }

        Ray ray = mainCamera.ScreenPointToRay(new Vector2(Screen.width / 2f, Screen.height / 2f));

        if (Physics.Raycast(ray, out RaycastHit hit, playerData.clickRange, playerData.clickLayers))
        {
            HealthSystem newTarget = hit.collider.GetComponentInParent<HealthSystem>();

            if (newTarget != null && !newTarget.IsDead)
            {
                if (newTarget != currentTarget)
                    SetTarget(newTarget);

                PlantGrowth growth = currentTarget.GetComponent<PlantGrowth>();
                bool show = growth == null || growth.IsFullyGrown;

                if (show)
                {
                    UpdateHealthBar(currentTarget.CurrentHealth, currentTarget.MaxHealth);
                    FadeTo(1f);
                }
                else
                {
                    if (healthText != null)
                        healthText.text = string.Empty;

                    FadeTo(0f);
                }

                return;
            }
        }

        ClearTarget();
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
            healthFillImage.fillAmount = max > 0f ? current / max : 0f;

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
        if (Mathf.Approximately(currentFadeTarget, targetAlpha)) return;

        currentFadeTarget = targetAlpha;

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
