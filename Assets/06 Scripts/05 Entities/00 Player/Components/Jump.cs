using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class Jump : MonoBehaviour
{
    [SerializeField] float jumpStrength = 2f;
    [SerializeField] GroundCheck groundCheck;
    [SerializeField] float ledgeBlockAngle = 45f; // Angle threshold for blocking

    Rigidbody rb;
    CapsuleCollider capsule;

    void Reset() => groundCheck = GetComponentInChildren<GroundCheck>();

    void Awake()
    {
        rb = GetComponent<Rigidbody>();
        capsule = GetComponent<CapsuleCollider>();
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

    void OnCollisionStay(Collision collision)
    {
        // Prevent climbing on steep surfaces while moving upward
        if (rb.linearVelocity.y > 0.1f)
        {
            foreach (ContactPoint contact in collision.contacts)
            {
                float angle = Vector3.Angle(contact.normal, Vector3.up);
                if (angle > ledgeBlockAngle && angle < 90f)
                {
                    // Block upward movement on steep surfaces
                    Vector3 vel = rb.linearVelocity;
                    vel.y = Mathf.Min(vel.y, 0f);
                    rb.linearVelocity = vel;
                    break;
                }
            }
        }
    }
}