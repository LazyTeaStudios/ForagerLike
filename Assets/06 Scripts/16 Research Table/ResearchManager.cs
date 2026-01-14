using System.Collections.Generic;
using UnityEngine;

public class ResearchManager : Singleton<ResearchManager>
{
    [Header("All Abilities")]
    [SerializeField] private List<ResearchAbility> allAbilities = new List<ResearchAbility>();

    [Header("Unlocked Buildings")]
    private HashSet<BuildItemSO> unlockedBuildings = new HashSet<BuildItemSO>();

    public System.Action<BuildItemSO> OnBuildingUnlocked;

    public override void Awake()
    {
        base.Awake();
        InitializeAbilities();
    }

    void InitializeAbilities()
    {
        // Reset all abilities to locked state on game start
        foreach (var ability in allAbilities)
        {
            if (ability != null)
                ability.IsUnlocked = false;
        }
    }

    public bool IsBuildingUnlocked(BuildItemSO building)
    {
        if (building == null) return false;

        // Check if building should be unlocked by default
        if (building.unlockedByDefault) return true;

        return unlockedBuildings.Contains(building);
    }

    public void OnBuildingUnlockedSO(BuildItemSO building)
    {
        if (building == null) return;
        unlockedBuildings.Add(building);
        OnBuildingUnlocked?.Invoke(building);
    }

    public List<ResearchAbility> GetAllAbilities()
    {
        return allAbilities;
    }
}