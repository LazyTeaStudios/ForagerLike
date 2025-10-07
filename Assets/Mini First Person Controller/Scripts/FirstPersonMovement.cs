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
    public List<System.Func<float>> speedOverrides = new List<System.Func<float>>();
    [Header("Air Control")]
    [Range(0f, 1f)]
    public float airControl = 0.3f;

    private Rigidbody rb;
    private GroundCheck groundCheck;
    private Vector3 moveVelocity;
    private float currentMoveSpeed;

    void Awake()
    {
        rb = GetComponent<Rigidbody>();
        rb.freezeRotation = true;
        groundCheck = GetComponentInChildren<GroundCheck>();
        currentMoveSpeed = speed;
    }

    void FixedUpdate()
    {
        if (InputHandler.IsMapActive(ActionMap.UI)) return;

        bool isGrounded = groundCheck != null ? groundCheck.isGrounded : true;
        bool wantsToRun = canRun && InputHandler.Held(GameAction.ShiftModifier);

        if (isGrounded && wantsToRun)
        {
            IsRunning = true;
            currentMoveSpeed = runSpeed;
        }
        else if (isGrounded && !wantsToRun)
        {
            IsRunning = false;
            currentMoveSpeed = speed;
        }

        float moveSpeed = currentMoveSpeed;
        if (speedOverrides.Count > 0)
            moveSpeed = speedOverrides[speedOverrides.Count - 1]();

        Vector2 moveInput = Vector2.zero;
        try { moveInput = InputHandler.GetValue<Vector2>(GameAction.Move); } catch { }

        Vector3 forward = transform.forward; forward.y = 0f; forward.Normalize();
        Vector3 right = transform.right; right.y = 0f; right.Normalize();
        Vector3 targetVelocity = (forward * moveInput.y + right * moveInput.x) * moveSpeed;

        if (isGrounded)
        {
            moveVelocity = targetVelocity;
            rb.linearVelocity = new Vector3(moveVelocity.x, rb.linearVelocity.y, moveVelocity.z);
        }
        else
        {
            Vector3 velocityChange = targetVelocity - moveVelocity;
            moveVelocity += velocityChange * airControl;

            Vector3 currentVel = rb.linearVelocity;
            Vector3 horizontalVel = new Vector3(currentVel.x, 0, currentVel.z);

            if (horizontalVel.magnitude > 0.1f && moveInput.magnitude > 0.1f)
            {
                float dot = Vector3.Dot(horizontalVel.normalized, targetVelocity.normalized);
                if (dot < -0.5f)
                {
                    moveVelocity = Vector3.Lerp(moveVelocity, targetVelocity, airControl * 2f);
                }
            }

            rb.linearVelocity = new Vector3(moveVelocity.x, rb.linearVelocity.y, moveVelocity.z);
        }
    }
}