using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "RadialMenuDef", menuName = "UI/Radial Menu Definition")]
public class RadialMenuDefinition : ScriptableObject
{
    public string menuName;
    public Texture2D menuIcon;
    public string menuDescription;
    public List<RadialMenuEntry> entries = new List<RadialMenuEntry>();
}

[System.Serializable]
public class RadialMenuEntry
{
    public enum EntryType { Action, SubMenu, BuildItem, Back }

    public EntryType type = EntryType.Action;
    public string displayName;
    public string description;
    public Texture2D icon;

    [Header("SubMenu (if type = SubMenu)")]
    public RadialMenuDefinition subMenu;

    [Header("Build Item (if type = BuildItem)")]
    public BuildItemSO buildItem;

    [Header("Action ID (if type = Action)")]
    public string actionId;
}
