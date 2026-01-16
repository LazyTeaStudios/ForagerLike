using System.Collections.Generic;
using UnityEngine;

public class ResearchManager : Singleton<ResearchManager>
{
    [Header("All Abilities")]
    [SerializeField] private List<ResearchAbility> allAbilities = new List<ResearchAbility>();

    [Header("Unlocked Buildings")]
    private HashSet<BuildItemSO> unlockedBuildings = new HashSet<BuildItemSO>();

    public System.Action<BuildItemSO> OnBuildingUnlocked;

    [Header("Current Modifiers")]
    private float moveSpeedBonus = 0f;
    private float doubleClickChance = 0f;

    public float GetMoveSpeedBonus() => moveSpeedBonus;
    public float GetDoubleClickChance() => doubleClickChance;

    public override void Awake()
    {
        base.Awake();
        InitializeAbilities();
    }

    void InitializeAbilities()
    {
        foreach (var ability in allAbilities)
            if (ability != null)
                ability.IsUnlocked = false;

        moveSpeedBonus = 0f;
        doubleClickChance = 0f;
    }

    public bool IsBuildingUnlocked(BuildItemSO building)
    {
        if (building == null) return false;
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

    public void ApplyPassiveAbility(PassiveAbilityModifier modifier)
    {
        if (modifier == null) return;

        switch (modifier.type)
        {
            case PassiveAbilityType.MoveSpeedBonus:
                moveSpeedBonus += modifier.value;
                ApplyMoveSpeedToPlayer();
                break;

            case PassiveAbilityType.DoubleClickChance:
                doubleClickChance = Mathf.Clamp01(doubleClickChance + (modifier.value / 100f));
                break;
        }
    }

    private void ApplyMoveSpeedToPlayer()
    {
        var player = GameObject.FindGameObjectWithTag("Player");
        if (player == null) return;

        var controller = player.GetComponent<FirstPersonController>();
        if (controller == null) return;

        controller.MoveSpeed = PlayerDataHandler.Data.moveSpeed + moveSpeedBonus;
        controller.SprintSpeed = PlayerDataHandler.Data.sprintSpeed + moveSpeedBonus;
    }
}
