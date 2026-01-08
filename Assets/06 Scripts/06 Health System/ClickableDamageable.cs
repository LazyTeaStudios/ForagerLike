using UnityEngine;

[RequireComponent(typeof(HealthSystem))]
public class ClickableDamageable : MonoBehaviour
{
    [Header("Damage")]
    [SerializeField] private float damagePerClick = 10f;

    [Header("Range")]
    [SerializeField] private float clickRange = 10f;
    [SerializeField] private LayerMask clickLayers;

    [Header("Collider")]
    [SerializeField] private Collider coll;

    [Header("Feedback")]
    [SerializeField] private float scaleMultiplier = 1.05f;
    [SerializeField] private float scaleDuration = 0.15f;

    private HealthSystem healthSystem;
    private Camera mainCamera;
    private Vector3 originalScale;
    private bool isScaling;
    private float scaleTimer;
    private Vector3 targetScale;

    private void Awake()
    {
        healthSystem = GetComponent<HealthSystem>();
        mainCamera = Camera.main;
        originalScale = transform.localScale;
    }

    private void Update()
    {
        if (InputHandler.Pressed(GameAction.GameplayMouseLeftClick))
        {
            CheckForClick();
        }

        if (isScaling)
        {
            UpdateScale();
        }
    }

    private void CheckForClick()
    {
        Ray ray = mainCamera.ScreenPointToRay(
            InputHandler.GetValue<Vector2>(GameAction.GameplayMousePosition)
        );

        if (Physics.Raycast(ray, out RaycastHit hit, clickRange, clickLayers))
        {
            if (hit.collider == coll)
            {
                healthSystem.TakeDamage(damagePerClick);
                TriggerScaleFeedback();
            }
        }
    }

    private void TriggerScaleFeedback()
    {
        targetScale = originalScale * scaleMultiplier;
        transform.localScale = targetScale;
        isScaling = true;
        scaleTimer = 0f;
    }

    private void UpdateScale()
    {
        scaleTimer += Time.deltaTime;
        float progress = scaleTimer / scaleDuration;

        if (progress >= 1f)
        {
            transform.localScale = originalScale;
            isScaling = false;
        }
        else
        {
            transform.localScale = Vector3.Lerp(targetScale, originalScale, progress);
        }
    }

    private void OnDestroy()
    {
        if (transform != null)
            transform.localScale = originalScale;
    }
}