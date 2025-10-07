using System;
using Unity.VisualScripting.Antlr3.Runtime.Misc;
using UnityEngine;

public enum GameState
{
    LoadingScene,
    Playing,
    Paused
}



/// <summary>
/// Static class for easier calls from singlton
/// </summary>
public static class GameManager
{
    private static GameManagerClass Mgr => GameManagerClass.Instance;

    public static void Pause() => Mgr.Pause();
    public static void Resume() => Mgr.Resume();
    public static bool IsState(GameState state) => Mgr.IsState(state);
}




/// <summary>
/// Centralised game-state hub and pause control.
/// </summary>
public class GameManagerClass : Singleton<GameManagerClass>
{
    public GameState CurrentState { get; private set; }

    public event Action<GameState> StateChanged;
    public event Action<bool> PauseStateChanged;

    public override void Awake()
    {
        base.Awake();

        CurrentState = GameState.LoadingScene;
        Time.timeScale = 1f;
    }

    public void BeginPlay()
    {
        SetState(GameState.Playing);
        Resume();
    }

    public void Pause()
    {
        if (CurrentState == GameState.Paused)
        {
            return;
        }

        Time.timeScale = 0f;
        SetState(GameState.Paused);
        PauseStateChanged?.Invoke(true);
    }

    public void Resume()
    {
        if (CurrentState != GameState.Paused)
        {
            return;
        }

        Time.timeScale = 1f;
        SetState(GameState.Playing);
        PauseStateChanged?.Invoke(false);
    }

    private void SetState(GameState newState)
    {
        if (CurrentState == newState)
        {
            return;
        }

        CurrentState = newState;
        StateChanged?.Invoke(CurrentState);
    }

    public bool IsState(GameState state)
    {
        return CurrentState == state;
    }
}
