using System;
using UnityEngine;

public enum GameState
{
    LoadingScene,
    Playing,
    Paused
}

/// <summary>
/// Static class for easier calls from singleton
/// </summary>
public static class GameManagerHandler
{
    private static GameManager Mgr => GameManager.Instance;

    public static void Pause() => Mgr.Pause();
    public static void Resume() => Mgr.Resume();

    public static bool IsCurrentGameState(GameState state) => state == Mgr.CurrentState;

    // New: expose cursor helpers to anywhere
    public static void SetCursorLocked(bool locked) => Mgr.SetCursorLocked(locked);
    public static void ToggleCursorLock() => Mgr.ToggleCursorLock();
    public static bool IsCursorLocked => GameManager.Instance != null && GameManager.Instance.IsCursorLocked;
}

/// <summary>
/// Centralised game-state hub, pause control, and cursor lock state.
/// </summary>
public class GameManager : Singleton<GameManager>
{
    public GameState CurrentState { get; private set; }

    [SerializeField] private GameState startState = GameState.Playing;

    public bool IsCursorLocked;

    public override void Awake()
    {
        base.Awake();

        Time.timeScale = 1f;
        SetState(startState);

        SetCursorLocked(true);
    }

    private void Start()
    {
        // Default gameplay map on boot
        InputHandler.SetMap(ActionMap.Gameplay);
    }

    public void SetState(GameState newState)
    {
        if (CurrentState == newState) return;
        CurrentState = newState;
    }

    public void Pause()
    {
        if (CurrentState == GameState.Paused) return;

        SetState(GameState.Paused);
        Time.timeScale = 0f;

        SetCursorLocked(false);
    }

    public void Resume()
    {
        if (CurrentState != GameState.Paused) return;

        SetState(GameState.Playing);
        Time.timeScale = 1f;

        SetCursorLocked(true);
    }

    /// <summary>
    /// Globally set cursor lock/visibility.
    /// </summary>
    public void SetCursorLocked(bool locked)
    {
        IsCursorLocked = locked;
        Cursor.lockState = locked ? CursorLockMode.Locked : CursorLockMode.None;
        Cursor.visible = !locked;
    }

    public void ToggleCursorLock() => SetCursorLocked(!IsCursorLocked);
}
