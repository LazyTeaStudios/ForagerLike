using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using UnityEngine;
using UnityEngine.InputSystem;


/// <summary>
/// Static ref so you can write:
/// if (Input.Pressed(GameAction.Jump))
/// while the heavy lifting happens inside<see cref="InputManager"/>.
/// </summary>
public static class InputHandler
{
    public static bool Pressed(GameAction a) => InputManager.Instance.Get(a, ActionButtonState.Pressed);
    public static bool Released(GameAction a) => InputManager.Instance.Get(a, ActionButtonState.Released);
    public static bool Held(GameAction a, float? holdTimeOverride = null) => InputManager.Instance.Get(a, ActionButtonState.Held, holdTimeOverride);

    public static InputAction Raw(GameAction a) => InputManager.Instance[a];
    public static T GetValue<T>(GameAction a) where T : struct => InputManager.Instance[a].ReadValue<T>();
    public static object GetValue(GameAction a) => InputManager.Instance[a].ReadValueAsObject();

    public static void SetMap(ActionMap m) => InputManager.Instance.SwitchMap(m);
    public static bool IsMapActive(ActionMap map) => InputManager.Instance.IsMapActive(map);
    public static ActionMap GetCurrentActionMap() => InputManager.Instance.GetCurrentMap();

}

/// <summary>
/// Which kind of button event you want.
/// </summary>
public enum ActionButtonState
{
    Pressed,
    Held,
    Released
}

/// <summary>
/// Singleton façade over the Unity Input System that maps enum values
/// to <see cref="InputAction"/> objects at start-up.
/// </summary>
public class InputManager : Singleton<InputManager>
{
    [Header("Plug your generated .inputactions asset here")]
    [SerializeField] private InputActionAsset actionAsset;
    [Min(0f)] public float defaultHoldTime = 0.3f;

    private readonly Dictionary<GameAction, InputAction> _actions = new();
    private readonly Dictionary<GameAction, float> _pressedAt = new();
    private readonly Dictionary<ActionMap, InputActionMap> _maps = new();
    private ActionMap _currentMap;

    public override void Awake()
    {
        base.Awake();
        InitializeActionMaps();
        InitializeActions();
    }

    private void InitializeActionMaps()
    {
        foreach (ActionMap mapEnum in Enum.GetValues(typeof(ActionMap)))
        {
            var map = actionAsset.FindActionMap(mapEnum.ToString(), false);
            if (map != null) _maps[mapEnum] = map;
        }
    }

    private void InitializeActions()
    {
        // Index all actions across all maps so InputHandler can read them anytime
        foreach (var map in actionAsset.actionMaps)
        {
            foreach (var act in map.actions)
            {
                if (!Enum.TryParse(act.name, out GameAction ga)) continue;
                if (_actions.ContainsKey(ga)) continue;

                _actions[ga] = act;
                act.started += _ => _pressedAt[ga] = Time.time;
                act.canceled += _ => _pressedAt.Remove(ga);
            }
        }
    }

    public void SwitchMap(ActionMap target)
    {
        // Disable everything first so nothing leaks
        actionAsset.Disable();

        // Enable Global map (always on)
        if (_maps.TryGetValue(ActionMap.Global, out var globalMap))
            globalMap.Enable();

        // Then enable the target map
        if (_maps.TryGetValue(target, out var targetMap))
            targetMap.Enable();

        _pressedAt.Clear();
        _currentMap = target;

        //Debug.Log(_currentMap);
    }

    public bool Get(GameAction action, ActionButtonState state, float? holdTimeOverride = null)
    {
        if (!_actions.TryGetValue(action, out var act)) return false;

        return state switch
        {
            ActionButtonState.Pressed => act.WasPressedThisFrame(),
            ActionButtonState.Released => act.WasReleasedThisFrame(),
            ActionButtonState.Held => IsHeld(action, act, holdTimeOverride),
            _ => false
        };
    }

    private bool IsHeld(GameAction ga, InputAction act, float? holdOverride)
    {
        if (!_pressedAt.TryGetValue(ga, out var t0)) return false;
        return act.IsPressed() && Time.time - t0 >= (holdOverride ?? defaultHoldTime);
    }

    public InputAction this[GameAction action] => _actions[action];
    public bool IsMapActive(ActionMap map) => _currentMap == map;
    public ActionMap GetCurrentMap() => _currentMap;
}