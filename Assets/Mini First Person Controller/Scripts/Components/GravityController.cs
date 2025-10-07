using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class GravityController : MonoBehaviour
{
    [Header("Gravity Settings")]
    public float normalGravity = -9.81f;
    public float fallMultiplier = 2.5f;
    public float lowJumpMultiplier = 2f;
    [Header("Transition Settings")]
    public float fallGravityTransitionSpeed = 8f;

    private Rigidbody rb;
    private GroundCheck groundCheck;
    private float currentGravityMultiplier = 1f;

    void Awake()
    {
        rb = GetComponent<Rigidbody>();
        groundCheck = GetComponentInChildren<GroundCheck>();
        rb.useGravity = false;
    }

    void FixedUpdate()
    {
        float targetMultiplier = 1f;

        if (rb.linearVelocity.y < 0)
        {
            targetMultiplier = fallMultiplier;
            currentGravityMultiplier = Mathf.Lerp(currentGravityMultiplier, targetMultiplier, fallGravityTransitionSpeed * Time.fixedDeltaTime);
        }
        else if (rb.linearVelocity.y > 0 && !InputHandler.Held(GameAction.Jump))
        {
            targetMultiplier = lowJumpMultiplier;
            currentGravityMultiplier = targetMultiplier;
        }
        else
        {
            currentGravityMultiplier = 1f;
        }

        Vector3 gravity = Vector3.up * normalGravity * currentGravityMultiplier;
        rb.AddForce(gravity, ForceMode.Acceleration);
    }
}