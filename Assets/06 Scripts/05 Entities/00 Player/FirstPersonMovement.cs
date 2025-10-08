using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class FirstPersonMovement : MonoBehaviour
{
    [SerializeField] float speed = 5f;
    [SerializeField] bool canRun = true;
    [SerializeField] float runSpeed = 9f;
    [SerializeField, Range(0f, 1f)] float airControl = 0.3f;

    public bool IsRunning { get; private set; }
    public List<System.Func<float>> speedOverrides = new();

    Rigidbody rb;
    GroundCheck groundCheck;
    Vector3 moveVelocity;
    float currentMoveSpeed;

    void Awake()
    {
        rb = GetComponent<Rigidbody>();
        rb.freezeRotation = true;
        groundCheck = GetComponentInChildren<GroundCheck>();
        currentMoveSpeed = speed;
    }

    void FixedUpdate()
    {
        if (InputHandler.IsMapActive(ActionMap.UI))
        {
            rb.linearVelocity = new Vector3(0, rb.linearVelocity.y, 0);
            return;
        }

        bool isGrounded = !groundCheck || groundCheck.isGrounded;
        bool wantsToRun = canRun && InputHandler.Held(GameAction.ShiftModifier);

        if (isGrounded)
        {
            IsRunning = wantsToRun;
            currentMoveSpeed = IsRunning ? runSpeed : speed;
        }

        float moveSpeed = speedOverrides.Count > 0 ? speedOverrides[^1]() : currentMoveSpeed;

        Vector2 moveInput = InputHandler.GetValue<Vector2>(GameAction.Move);
        Vector3 forward = transform.forward; forward.y = 0f; forward.Normalize();
        Vector3 right = transform.right; right.y = 0f; right.Normalize();
        Vector3 targetVelocity = (forward * moveInput.y + right * moveInput.x) * moveSpeed;

        if (isGrounded)
        {
            moveVelocity = targetVelocity;
        }
        else
        {
            Vector3 velocityChange = targetVelocity - moveVelocity;
            moveVelocity += velocityChange * airControl;
        }

        rb.linearVelocity = new Vector3(moveVelocity.x, rb.linearVelocity.y, moveVelocity.z);
    }
}