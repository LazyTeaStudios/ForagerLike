
using System;

/// <summary>
/// List any action maps you would like. Only one can be active at a time.
/// </summary>
public enum ActionMap
{
    Global,
    Gameplay,
    UI,
    Disabled
}

/// <summary>
/// List every gameplay action you want to poll here.
/// Make sure the action names in your .inputactions asset match these exactly.
/// </summary>
public enum GameAction
{
    //UI Action Map
    UIPause,
    Navigate,
    Submit,
    Cancel,
    Point,
    Click,
    RightClick,

    CloseBuildModeAction,
    CloseChest,

    //Gameplay Action Map
    GameplayPause,
    GameplayMousePosition,
    GameplayMouseLeftClick,
    GameplayMouseRightClick,
    Move,
    Jump,
    Crouch,
    Look,
    Attack,
    DropItem,

    // Inventory Actions (Global)
    ToggleInventory,
    ToggleBuildModeAction,
    Hotbar1,
    Hotbar2,
    Hotbar3,
    Hotbar4,
    Hotbar5,
    Hotbar6,
    Hotbar7,
    Hotbar8,
    Hotbar9,
    ScrollHotbar,

    //  Global Modifiers
    ShiftModifier,
    AltModifier
}

