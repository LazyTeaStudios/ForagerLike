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
    public BuildItemSO unlockedBuilding;
    
    [Header("Passive Abilities")]
    public PassiveAbilityModifier passiveModifier;
    
    [System.NonSerialized]
    private bool isUnlocked = false;
    
    public bool IsUnlocked
    {
        get => isUnlocked;
        set => isUnlocked = value;
    }
    
    public bool CanUnlock()
    {
        foreach (var prereq in prerequisites)
        {
            if (prereq != null && !prereq.IsUnlocked)
                return false;
        }
        
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
        
        foreach (var cost in itemCosts)
        {
            InventoryManager.Instance.RemoveItem(cost.item, cost.quantity);
        }
        
        IsUnlocked = true;
        
        // Apply building unlock
        if (unlockedBuilding != null)
        {
            ResearchManager.Instance.OnBuildingUnlockedSO(unlockedBuilding);
        }
        
        // Apply passive ability
        if (passiveModifier != null && passiveModifier.type != PassiveAbilityType.None)
        {
            ResearchManager.Instance.ApplyPassiveAbility(passiveModifier);
        }
    }
    
    public bool ArePrerequisitesMet()
    {
        foreach (var prereq in prerequisites)
        {
            if (prereq != null && !prereq.IsUnlocked)
                return false;
        }
        return true;
    }
    
    public bool HasRequiredItems()
    {
        foreach (var cost in itemCosts)
        {
            int currentCount = InventoryManager.Instance.GetItemCount(cost.item);
            if (currentCount < cost.quantity)
                return false;
        }
        return true;
    }
}

[System.Serializable]
public class ItemRequirement
{
    public ItemData item;
    public int quantity = 1;
}