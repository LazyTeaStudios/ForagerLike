using UnityEngine;

public class SeedBed : MonoBehaviour
{
    [Header("Growing Settings")]
    [SerializeField] private Transform plantPosition;
    [SerializeField] private GameObject readyToHarvestIndicator;

    [Header("Visual Smoothing")]
    [SerializeField] private float growthSmoothSpeed = 6f;
    [SerializeField] private float minScale = 0.2f;
    [SerializeField] private float maxScale = 1f;

    private ItemData currentSeed;
    private GameObject currentPlant;
    private PlantGrowth currentPlantGrowth;
    private int currentGrowthStage;
    private float targetGrowthPercent;
    private float visualGrowthPercent;
    private bool isGrowing;

    private void Awake()
    {
        if (plantPosition == null)
            plantPosition = transform;

        if (readyToHarvestIndicator)
            readyToHarvestIndicator.SetActive(false);
    }

    private void OnEnable()
    {
        TickManager.OnTick += GrowTick;
    }

    private void OnDisable()
    {
        TickManager.OnTick -= GrowTick;
    }

    private void Update()
    {
        if (currentSeed == null || currentPlant == null)
            return;

        visualGrowthPercent = Mathf.Lerp(
            visualGrowthPercent,
            targetGrowthPercent,
            1f - Mathf.Exp(-growthSmoothSpeed * Time.deltaTime)
        );

        if (targetGrowthPercent >= 1f && visualGrowthPercent > 0.999f)
            visualGrowthPercent = 1f;

        float scale = Mathf.Lerp(minScale, maxScale, visualGrowthPercent);
        currentPlant.transform.localScale = Vector3.one * scale;

        if (currentPlantGrowth != null)
        {
            if (visualGrowthPercent >= 1f)
                currentPlantGrowth.SetFullyGrown();
            else
                currentPlantGrowth.SetGrowthPercent(visualGrowthPercent);
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

        currentPlantGrowth = currentPlant.GetComponent<PlantGrowth>();
        if (currentPlantGrowth != null)
            currentPlantGrowth.Initialize(seed);

        if (readyToHarvestIndicator)
            readyToHarvestIndicator.SetActive(false);

        return true;
    }

    private void GrowTick()
    {
        if (!isGrowing || currentSeed == null || currentPlant == null)
            return;

        currentGrowthStage++;
        targetGrowthPercent = Mathf.Clamp01(currentGrowthStage / (float)currentSeed.growthStages);

        if (currentGrowthStage >= currentSeed.growthStages)
        {
            isGrowing = false;
            targetGrowthPercent = 1f;

            if (readyToHarvestIndicator)
                readyToHarvestIndicator.SetActive(true);
        }
    }

    public bool IsOccupied() => isGrowing || currentPlant != null;

    public bool IsFullyGrown()
    {
        if (currentPlantGrowth != null)
            return currentPlantGrowth.IsFullyGrown;
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
        currentPlantGrowth = null;
        currentGrowthStage = 0;
        targetGrowthPercent = 0f;
        visualGrowthPercent = 0f;
        isGrowing = false;
    }
}
