
/// <summary>
/// List any action maps you would like. Only one can be active at a time.
/// </summary>
public enum ActionMap
{
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
    Resume,
    Navigate,
    Submit,
    Cancel,
    UIMousePoint,
    UILeftClick,
    UIRightClick,

    //Gameplay Action Map
    Pause,

    GameplayCtrlModifier,
    GameplayMousePoint,
    GameplayMouseScroll,

    GameplayLeftClick,
    GameplayMiddleClick,
    GameplayRightClick,
    
    ResetCameraPosition,
    Move,
    
    Dash
}