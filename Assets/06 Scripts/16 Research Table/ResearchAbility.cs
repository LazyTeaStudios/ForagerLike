using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(fileName = "ResearchAbility", menuName = "Research/Ability")]
public class ResearchAbility : ScriptableObject
{
    [Header("Basic Info")]
    public string abilityName;
    public string description;
    public Sprite icon;

    [Header("Unlock Requirements")]
    public List<ItemRequirement> itemCosts = new List<ItemRequirement>();
    public List<ResearchAbility> prerequisites = new List<ResearchAbility>();

    [Header("Unlocks")]
    public List<ResearchAbility> unlocksAbilities = new List<ResearchAbility>();

    [Header("Building Unlock")]
    public BuildItemSO unlockedBuilding; // If this ability unlocks a building

    [System.NonSerialized]
    private bool isUnlocked = false;

    public bool IsUnlocked
    {
        get => isUnlocked;
        set => isUnlocked = value;
    }

    public bool CanUnlock()
    {
        // Check prerequisites
        foreach (var prereq in prerequisites)
        {
            if (prereq != null && !prereq.IsUnlocked)
                return false;
        }

        // Check item costs
        if (InventoryManager.Instance == null) return false;

        foreach (var cost in itemCosts)
        {
            if (!InventoryManager.Instance.HasResources(cost.item, cost.quantity))
                return false;
        }

        return true;
    }

    public void Unlock()
    {
        if (!CanUnlock() || IsUnlocked) return;

        // Consume items
        foreach (var cost in itemCosts)
        {
            InventoryManager.Instance.RemoveItem(cost.item, cost.quantity);
        }

        IsUnlocked = true;

        // If this unlocks a building, notify the system
        if (unlockedBuilding != null)
        {
            ResearchManager.Instance.OnBuildingUnlockedSO(unlockedBuilding);
        }
    }
}

[System.Serializable]
public class ItemRequirement
{
    public ItemData item;
    public int quantity = 1;
}