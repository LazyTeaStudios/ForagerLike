using UnityEngine;

public enum ToolType
{
    None,
    Axe,
    Pickaxe,
    Sword
}

[CreateAssetMenu(fileName = "New Tool", menuName = "Inventory/Tool")]
public class ToolData : ScriptableObject
{
    public ToolType toolType = ToolType.None;
    public float swingCooldown = 0.2f;
}
