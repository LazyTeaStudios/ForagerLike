using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

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

        foreach (ActionMap mapEnum in System.Enum.GetValues(typeof(ActionMap)))
        {
            var map = actionAsset.FindActionMap(mapEnum.ToString(), true);
            if (map == null)
            {
                Debug.LogWarning($"[InputManager] No ActionMap named “{mapEnum}” in the InputActionAsset.");
                continue;
            }
            _maps[mapEnum] = map;
        }

        foreach (var map in _maps.Values)
            foreach (var act in map.actions)
            {
                _actions[(GameAction)System.Enum.Parse(typeof(GameAction), act.name)] = act;
                act.started += ctx => _pressedAt[(GameAction)System.Enum.Parse(typeof(GameAction), act.name)] = Time.time;
                act.canceled += ctx => _pressedAt.Remove((GameAction)System.Enum.Parse(typeof(GameAction), act.name));
            }

        SwitchMap(ActionMap.Gameplay);
    }

    public void SwitchMap(ActionMap target)
    {
        foreach (var m in _maps.Values) m.Disable();
        if (_maps.TryGetValue(target, out var map)) map.Enable();
        _pressedAt.Clear();
        _currentMap = target;
    }

    public bool Get(GameAction action, ActionButtonState state, float? holdTimeOverride = null)
    {
        if (!_actions.TryGetValue(action, out var act) || !act.enabled) return false;
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
}



public enum ActionButtonState
{
    Pressed,
    Held,
    Released
}


public static class Input
{
    public static bool Pressed(GameAction a) => InputManager.Instance.Get(a, ActionButtonState.Pressed);
    public static bool Released(GameAction a) => InputManager.Instance.Get(a, ActionButtonState.Released);
    public static bool Held(GameAction a, float? holdTimeOverride = null) => InputManager.Instance.Get(a, ActionButtonState.Held, holdTimeOverride);

    public static InputAction Raw(GameAction a) => InputManager.Instance[a];
    public static T GetValue<T>(GameAction a) where T : struct => InputManager.Instance[a].ReadValue<T>();
    public static object GetValue(GameAction a) => InputManager.Instance[a].ReadValueAsObject();

    public static void SetMap(ActionMap m) => InputManager.Instance.SwitchMap(m);
}