using UnityEngine;

public class SeedBed : MonoBehaviour
{
    [Header("Growing Settings")]
    [SerializeField] private Transform plantPosition;
    [SerializeField] private GameObject readyToHarvestIndicator;

    [Header("Visual Smoothing")]
    [Tooltip("How quickly the plant scale moves toward the target each second. Higher = snappier.")]
    [SerializeField] private float growthSmoothSpeed = 6f;

    [Tooltip("Starting scale of the plant when planted.")]
    [SerializeField] private float minScale = 0.2f;

    [Tooltip("Final scale of the plant when fully grown.")]
    [SerializeField] private float maxScale = 1f;

    private ItemData currentSeed;
    private GameObject currentPlant;

    // NEW: clickable reference on the planted instance
    private ClickableDamageable currentClickable;

    private int currentGrowthStage = 0;

    // Tick-driven "target" (where the plant should be after the latest tick)
    private float targetGrowthPercent = 0f;

    // What we're currently displaying (smoothed)
    private float visualGrowthPercent = 0f;

    private bool isGrowing = false;

    void Awake()
    {
        if (plantPosition == null)
            plantPosition = transform;

        if (readyToHarvestIndicator)
            readyToHarvestIndicator.SetActive(false);
    }

    void OnEnable()
    {
        TickManager.OnTick += GrowTick;
    }

    void OnDisable()
    {
        TickManager.OnTick -= GrowTick;
    }

    void Update()
    {
        if (currentSeed == null || currentPlant == null)
            return;

        // Smoothly move the visual growth toward the tick-based target.
        visualGrowthPercent = Mathf.Lerp(
            visualGrowthPercent,
            targetGrowthPercent,
            1f - Mathf.Exp(-growthSmoothSpeed * Time.deltaTime)
        );

        float scale = Mathf.Lerp(minScale, maxScale, visualGrowthPercent);
        currentPlant.transform.localScale = Vector3.one * scale;
    }

    void OnMouseEnter()
    {
        // Show growth info when hovering (use visual so it matches what you see)
        if ((isGrowing || IsFullyGrown()) && currentSeed != null)
        {
            float percent = visualGrowthPercent * 100f;
            Debug.Log($"Growth: {percent:F0}%");
        }
    }

    public bool PlantSeed(ItemData seed)
    {
        if (seed == null || seed.itemType != ItemType.Seed || seed.plantPrefab == null)
            return false;

        if (IsOccupied())
            return false;

        currentSeed = seed;
        currentGrowthStage = 0;
        isGrowing = true;

        targetGrowthPercent = 0f;
        visualGrowthPercent = 0f;

        currentPlant = Instantiate(seed.plantPrefab, plantPosition.position, plantPosition.rotation, plantPosition);
        currentPlant.transform.localScale = Vector3.one * minScale;

        // ?? Find clickable component on the planted instance and disable it while growing
        currentClickable = currentPlant.GetComponentInChildren<ClickableDamageable>();
        if (currentClickable != null)
        {
            currentClickable.enabled = false;
        }

        if (readyToHarvestIndicator)
            readyToHarvestIndicator.SetActive(false);

        return true;
    }

    // Called by TickManager
    void GrowTick()
    {
        if (!isGrowing || currentSeed == null || currentPlant == null)
            return;

        currentGrowthStage++;

        // Update the target growth based on the new stage.
        targetGrowthPercent = Mathf.Clamp01(currentGrowthStage / (float)currentSeed.growthStages);

        if (currentGrowthStage >= currentSeed.growthStages)
        {
            isGrowing = false;
            targetGrowthPercent = 1f; // ensure final

            // ?? Fully grown: now allow clicking on this planted instance
            if (currentClickable != null)
            {
                currentClickable.enabled = true;
            }

            if (readyToHarvestIndicator)
                readyToHarvestIndicator.SetActive(true);
        }
    }

    public bool IsOccupied()
    {
        return isGrowing || currentPlant != null;
    }

    public bool IsFullyGrown()
    {
        return currentSeed != null && currentGrowthStage >= currentSeed.growthStages;
    }

    public void Harvest()
    {
        if (currentPlant != null)
            Destroy(currentPlant);

        if (readyToHarvestIndicator)
            readyToHarvestIndicator.SetActive(false);

        currentSeed = null;
        currentPlant = null;
        currentGrowthStage = 0;

        targetGrowthPercent = 0f;
        visualGrowthPercent = 0f;
        isGrowing = false;

        // Clear clickable reference
        currentClickable = null;
    }
}
