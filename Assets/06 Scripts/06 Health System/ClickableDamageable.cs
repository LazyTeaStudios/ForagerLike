using UnityEngine;

[RequireComponent(typeof(HealthSystem))]
public class ClickableDamageable : MonoBehaviour
{
    [Header("Collider")]
    [SerializeField] private Collider coll;

    private HealthSystem healthSystem;
    private PlantGrowth plantGrowth;
    private Camera mainCamera;
    private Vector3 originalScale;
    private bool isScaling;
    private float scaleTimer;
    private Vector3 targetScale;

    private void Awake()
    {
        healthSystem = GetComponent<HealthSystem>();
        plantGrowth = GetComponent<PlantGrowth>();
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
        if (healthSystem.IsDead) return;

        var playerData = PlayerDataHandler.Data;
        if (playerData == null || mainCamera == null) return;

        Ray ray = mainCamera.ScreenPointToRay(
            InputHandler.GetValue<Vector2>(GameAction.GameplayMousePosition)
        );

        if (Physics.Raycast(ray, out RaycastHit hit, playerData.clickRange, playerData.clickLayers))
        {
            if (hit.collider != coll) return;

            if (plantGrowth != null && !plantGrowth.IsFullyGrown) return;

            healthSystem.TakeDamage(playerData.damagePerClick);
            TriggerScaleFeedback();
        }
    }

    private void TriggerScaleFeedback()
    {
        var playerData = PlayerDataHandler.Data;
        if (playerData == null) return;

        targetScale = originalScale * playerData.scaleMultiplier;
        transform.localScale = targetScale;
        isScaling = true;
        scaleTimer = 0f;
    }

    private void UpdateScale()
    {
        var playerData = PlayerDataHandler.Data;
        if (playerData == null)
        {
            transform.localScale = originalScale;
            isScaling = false;
            return;
        }

        scaleTimer += Time.deltaTime;
        float progress = scaleTimer / playerData.scaleDuration;

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
}
