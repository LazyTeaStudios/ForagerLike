using UnityEngine;
using System.Collections.Generic;

public class StarterAssetsInputs : MonoBehaviour
{
    [Header("Character Input Values")]
    public Vector2 move;
    public Vector2 look;
    public bool jump;
    public bool sprint;

    [Header("Movement Settings")]
    public bool analogMovement;

    [Header("Mouse Cursor Settings")]
    public bool cursorLocked = true;
    public bool cursorInputForLook = true;

    [Header("Look Sensitivity")]
    [Range(0.1f, 10f)]
    public float mouseSensitivityX = 1f;
    [Range(0.1f, 10f)]
    public float mouseSensitivityY = 1f;
    public bool invertYAxis = true;

    private void Start()
    {
        InputManager.Instance.SwitchMap(ActionMap.Gameplay);
        SetCursorState(cursorLocked);
    }

    private void Update()
    {
        move = InputHandler.GetValue<Vector2>(GameAction.Move);

        if (cursorInputForLook)
        {
            Vector2 rawLook = InputHandler.GetValue<Vector2>(GameAction.Look);

            look.x = rawLook.x * mouseSensitivityX;
            look.y = rawLook.y * mouseSensitivityY * -1;
        }

        if (InputHandler.Pressed(GameAction.Jump))
        {
            jump = true;
        }
        else if (InputHandler.Released(GameAction.Jump))
        {
            jump = false;
        }

        sprint = InputHandler.Held(GameAction.ShiftModifier, 0f);

        if (InputHandler.Pressed(GameAction.Crouch))
        {
            // Handle crouch if needed
        }

        if (InputHandler.Pressed(GameAction.GameplayPause))
        {
            // Handle pause
        }
    }

    private void LateUpdate()
    {

    }

    public void MoveInput(Vector2 newMoveDirection)
    {
        move = newMoveDirection;
    }

    public void LookInput(Vector2 newLookDirection)
    {
        look = newLookDirection;
    }

    public void JumpInput(bool newJumpState)
    {
        jump = newJumpState;
    }

    public void SprintInput(bool newSprintState)
    {
        sprint = newSprintState;
    }

    private void OnApplicationFocus(bool hasFocus)
    {
        SetCursorState(cursorLocked);
    }

    private void SetCursorState(bool newState)
    {
        Cursor.lockState = newState ? CursorLockMode.Locked : CursorLockMode.None;
    }
}