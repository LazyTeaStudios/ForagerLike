using System;
using UnityEngine;

/// <summary>
/// Central data container for plant state and configuration.
/// All plant-related scripts reference this for growth state and seed data.
/// </summary>
public class PlantGrowth : MonoBehaviour
{
    public event Action OnFullyGrown;

    public ItemData SeedData;
    public bool IsFullyGrown { get; private set; }
    public float GrowthPercent { get; private set; }

    public void Initialize(ItemData seedData)
    {
        SeedData = seedData;
        IsFullyGrown = false;
        GrowthPercent = 0f;
    }

    public void SetGrowthPercent(float percent)
    {
        GrowthPercent = Mathf.Clamp01(percent);

        if (!IsFullyGrown && GrowthPercent >= 1f)
        {
            IsFullyGrown = true;
            OnFullyGrown?.Invoke();
        }
    }

    public void SetFullyGrown()
    {
        GrowthPercent = 1f;
        if (!IsFullyGrown)
        {
            IsFullyGrown = true;
            OnFullyGrown?.Invoke();
        }
    }

    public void Reset()
    {
        IsFullyGrown = false;
        GrowthPercent = 0f;
        SeedData = null;
    }
}