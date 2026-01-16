using UnityEngine;
using System.Collections.Generic;


[System.Serializable]
public enum PassiveAbilityType
{
    None,
    MoveSpeedBonus,
    DoubleClickChance
}

[System.Serializable]
public class PassiveAbilityModifier
{
    public PassiveAbilityType type;
    public float value; // Percentage for double click, flat value for move speed
}