using UnityEngine;

public class SeedBed : MonoBehaviour
{
    [Header("Growing Settings")]
    [SerializeField] private Transform plantPosition;
    [SerializeField] private GameObject readyToHarvestIndicator;

    private ItemData currentSeed;
    private GameObject currentPlant;
    private int currentGrowthStage = 0;
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
        TickManager.OnTick += Grow;
    }

    void OnDisable()
    {
        TickManager.OnTick -= Grow;
    }

    void OnMouseEnter()
    {
        /// Show growth info when hovering
        if (isGrowing && currentSeed != null)
        {
            float percent = (currentGrowthStage / (float)currentSeed.growthStages) * 100f;
            Debug.Log($"Growth: {percent:F0}%");
        }
    }

    public bool PlantSeed(ItemData seed)
    {
        if (seed == null || seed.itemType != ItemType.Seed || seed.plantPrefab == null)
            return false;

        if (isGrowing)
            return false;

        currentSeed = seed;
        currentGrowthStage = 0;
        isGrowing = true;

        currentPlant = Instantiate(seed.plantPrefab, plantPosition.position, plantPosition.rotation, plantPosition);
        currentPlant.transform.localScale = Vector3.one * 0.2f;

        return true;
    }

    void Grow()
    {
        if (!isGrowing || currentSeed == null || currentPlant == null)
            return;

        currentGrowthStage++;

        float growthPercent = (float)currentGrowthStage / currentSeed.growthStages;
        float scale = Mathf.Lerp(0.2f, 1f, growthPercent);
        currentPlant.transform.localScale = Vector3.one * scale;

        if (currentGrowthStage >= currentSeed.growthStages)
        {
            isGrowing = false;

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
        isGrowing = false;
    }
}