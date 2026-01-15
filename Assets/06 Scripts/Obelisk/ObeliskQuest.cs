using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(fileName = "ObeliskQuest", menuName = "Obelisk/Quest")]
public class ObeliskQuest : ScriptableObject
{
    [Header("Quest Info")]
    public string questName;
    [TextArea(3, 5)]
    public string questDescription;
    public Sprite questIcon;

    [Header("Requirements")]
    public List<ItemRequirement> requiredItems = new List<ItemRequirement>();

    [System.NonSerialized]
    private bool isCompleted = false;

    public bool IsCompleted
    {
        get => isCompleted;
        set => isCompleted = value;
    }

    public bool CanComplete()
    {
        if (IsCompleted) return false;

        // Check if player has required items
        if (InventoryManager.Instance == null) return false;

        foreach (var requirement in requiredItems)
        {
            if (!InventoryManager.Instance.HasResources(requirement.item, requirement.quantity))
                return false;
        }

        return true;
    }
}