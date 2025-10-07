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
public static class GameManagerHandler
{
    private static GameManager Mgr => GameManager.Instance;

    public static void Pause() => Mgr.Pause();
    public static void Resume() => Mgr.Resume();

    public static bool IsCurrentGameState(GameState state)
    {
        if (state != Mgr.CurrentState) return false;
        else return true;
    }
}




/// <summary>
/// Centralised game-state hub and pause control.
/// </summary>
public class GameManager : Singleton<GameManager>
{
    public GameState CurrentState { get; private set; }

    [SerializeField] private GameState startState;




    public override void Awake()
    {
        base.Awake();

        Time.timeScale = 1f;
        SetState(startState);
    }
    private void Start()
    {
        InputHandler.SetMap(ActionMap.Gameplay);
    }

    public void SetState(GameState newState)
    {
        if (CurrentState == newState)
            return;

        CurrentState = newState;
    }




    public void Pause()
    {
        if (CurrentState == GameState.Paused)
            return;

        SetState(GameState.Paused);
        Time.timeScale = 0f;
    }


    public void Resume()
    {
        if (CurrentState != GameState.Paused)
            return;

        SetState(GameState.Playing);
        Time.timeScale = 1f;
    }

}
