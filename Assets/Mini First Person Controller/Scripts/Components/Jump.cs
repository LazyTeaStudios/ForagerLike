using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class Jump : MonoBehaviour
{
    private Rigidbody rb;

    public float jumpStrength = 2f;

    [SerializeField, Tooltip("Prevents jumping when the transform is in mid-air.")]
    private GroundCheck groundCheck;

    void Reset()
    {
        groundCheck = GetComponentInChildren<GroundCheck>();
    }

    void Awake()
    {
        rb = GetComponent<Rigidbody>();
    }

    void LateUpdate()
    {
        if (InputHandler.IsMapActive(ActionMap.UI)) return;

        bool grounded = !groundCheck || groundCheck.isGrounded;

        // wrapper-driven jump
        bool pressedJump = false;
        try { pressedJump = InputHandler.Pressed(GameAction.Jump); } catch { }

        if (pressedJump && grounded)
        {
            Vector3 v = rb.linearVelocity;
            v.y = 0f; // clear any downward vel so the jump is consistent
            rb.linearVelocity = v;

            rb.AddForce(Vector3.up * 100f * jumpStrength, ForceMode.Force);
        }
    }
}
