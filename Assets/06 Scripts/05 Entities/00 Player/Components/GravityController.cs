using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class GravityController : MonoBehaviour
{
    [Header("Gravity Settings")]
    [SerializeField] float normalGravity = -9.81f;
    [SerializeField] float fallMultiplier = 2.5f;
    [SerializeField] float lowJumpMultiplier = 2f;
    [SerializeField] float fallGravityTransitionSpeed = 8f;

    Rigidbody rb;
    float currentGravityMultiplier = 1f;

    void Awake()
    {
        rb = GetComponent<Rigidbody>();
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

        rb.AddForce(Vector3.up * normalGravity * currentGravityMultiplier, ForceMode.Acceleration);
    }
}