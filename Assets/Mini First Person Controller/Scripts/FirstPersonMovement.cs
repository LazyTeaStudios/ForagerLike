using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class FirstPersonMovement : MonoBehaviour
{
    public float speed = 5;

    [Header("Running")]
    public bool canRun = true;
    public bool IsRunning { get; private set; }
    public float runSpeed = 9;

    // Movement speed override stack; last wins.
    public List<System.Func<float>> speedOverrides = new List<System.Func<float>>();

    private Rigidbody rb;

    void Awake()
    {
        rb = GetComponent<Rigidbody>();
        rb.freezeRotation = true;
    }

    void FixedUpdate()
    {
        // don’t move if UI map is active
        if (InputHandler.IsMapActive(ActionMap.UI)) return;

        // running via ShiftModifier (wrapper)
        IsRunning = canRun && InputHandler.Held(GameAction.ShiftModifier);

        // pick speed (last override wins)
        float moveSpeed = IsRunning ? runSpeed : speed;
        if (speedOverrides.Count > 0)
            moveSpeed = speedOverrides[speedOverrides.Count - 1]();

        // read 2D move (Vector2) via wrapper
        Vector2 moveInput = Vector2.zero;
        try { moveInput = InputHandler.GetValue<Vector2>(GameAction.Move); } catch { }

        // transform to world, preserve current Y velocity (gravity/jump elsewhere)
        Vector3 forward = transform.forward; forward.y = 0f; forward.Normalize();
        Vector3 right = transform.right; right.y = 0f; right.Normalize();

        Vector3 planar = (forward * moveInput.y + right * moveInput.x) * moveSpeed;
        rb.linearVelocity = new Vector3(planar.x, rb.linearVelocity.y, planar.z);
    }
}
