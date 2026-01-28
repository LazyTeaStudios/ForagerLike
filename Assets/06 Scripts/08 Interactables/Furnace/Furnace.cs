using UnityEngine;

public class Furnace : ProcessingMachine
{
    [Header("Furnace Growing")]
    [SerializeField] private Transform growPoint;
    [SerializeField] private float growthSmoothSpeed = 6f;
    [SerializeField] private float minScale = 0.2f;
    [SerializeField] private float maxScale = 1f;

    private GameObject currentPlant;
    private PlantGrowth currentPlantGrowth;
    private HealthSystem currentPlantHealth;
    private ItemData currentSeed;
    private int currentGrowthStage;
    private float targetGrowthPercent;
    private float visualGrowthPercent;
    private bool isGrowing;
    private bool plantDeathHandled;

    protected override void Awake()
    {
        base.Awake();
        if (growPoint == null)
            growPoint = transform;
    }

    private void OnEnable()
    {
        TickManager.OnTick += GrowTick;
    }

    private void OnDisable()
    {
        TickManager.OnTick -= GrowTick;
        UnbindPlantEvents();
    }

    protected override void Update()
    {
        base.Update();
        UpdatePlantVisuals();
    }

    void UpdatePlantVisuals()
    {
        if (currentPlant == null || currentSeed == null)
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

    protected override void UpdateProcessing()
    {
        if (currentPlant != null)
            return;

        base.UpdateProcessing();
    }

    public override void TryStartProcessing()
    {
        if (currentPlant != null)
            return;

        base.TryStartProcessing();
    }

    protected override void CompleteProcessing()
    {
        if (currentRecipe == null)
            return;

        var seed = currentRecipe.outputItem;

        processingSlot1.Set(null, 0);
        processingSlot2.Set(null, 0);

        RefreshDisplay();

        isProcessing = false;
        currentRecipe = null;
        processTimer = 0f;

        if (processingVisualObject != null)
            processingVisualObject.SetActive(false);

        if (seed == null || seed.itemType != ItemType.Seed || seed.plantPrefab == null)
            return;

        StartGrowingSeed(seed);
    }

    void StartGrowingSeed(ItemData seed)
    {
        if (currentPlant != null)
            return;

        currentSeed = seed;
        currentGrowthStage = 0;
        isGrowing = true;
        targetGrowthPercent = 0f;
        visualGrowthPercent = 0f;
        plantDeathHandled = false;

        currentPlant = Instantiate(seed.plantPrefab, growPoint.position, growPoint.rotation, growPoint);
        currentPlant.transform.localScale = Vector3.one * minScale;

        currentPlantGrowth = currentPlant.GetComponent<PlantGrowth>();
        if (currentPlantGrowth != null)
            currentPlantGrowth.Initialize(seed);

        currentPlantHealth = currentPlant.GetComponent<HealthSystem>();
        if (currentPlantHealth != null)
            currentPlantHealth.OnDeath += OnPlantDied;
    }

    void GrowTick()
    {
        if (!isGrowing || currentSeed == null || currentPlant == null)
            return;

        currentGrowthStage++;
        targetGrowthPercent = Mathf.Clamp01(currentGrowthStage / (float)currentSeed.growthStages);

        if (currentGrowthStage >= currentSeed.growthStages)
        {
            isGrowing = false;
            targetGrowthPercent = 1f;
        }
    }

    void OnPlantDied()
    {
        if (plantDeathHandled)
            return;

        plantDeathHandled = true;
        UnbindPlantEvents();

        currentPlant = null;
        currentPlantGrowth = null;
        currentPlantHealth = null;
        currentSeed = null;
        currentGrowthStage = 0;
        targetGrowthPercent = 0f;
        visualGrowthPercent = 0f;
        isGrowing = false;

        TryStartProcessing();
    }

    void UnbindPlantEvents()
    {
        if (currentPlantHealth != null)
            currentPlantHealth.OnDeath -= OnPlantDied;
    }

    protected override void OnDestroy()
    {
        UnbindPlantEvents();

        if (currentPlant != null)
            Destroy(currentPlant);

        currentPlant = null;
        currentPlantGrowth = null;
        currentPlantHealth = null;
        currentSeed = null;
        isGrowing = false;

        base.OnDestroy();
    }
}
