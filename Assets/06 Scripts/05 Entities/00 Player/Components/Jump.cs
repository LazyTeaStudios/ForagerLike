using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class Jump : MonoBehaviour
{
    [SerializeField] float jumpStrength = 2f;
    [SerializeField] GroundCheck groundCheck;

    Rigidbody rb;

    void Reset() => groundCheck = GetComponentInChildren<GroundCheck>();

    void Awake()
    {
        rb = GetComponent<Rigidbody>();
    }

    void Update()
    {
        if (InputHandler.IsMapActive(ActionMap.UI)) return;

        bool grounded = !groundCheck || groundCheck.isGrounded;

        if (InputHandler.Pressed(GameAction.Jump) && grounded)
        {
            Vector3 v = rb.linearVelocity;
            v.y = 0f;
            rb.linearVelocity = v;
            rb.AddForce(Vector3.up * 100f * jumpStrength, ForceMode.Force);
        }
    }
}