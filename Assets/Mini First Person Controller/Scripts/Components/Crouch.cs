using UnityEngine;

public class Crouch : MonoBehaviour
{
    [Header("Slow Movement")]
    [Tooltip("Movement to slow down when crouched.")]
    public FirstPersonMovement movement;
    [Tooltip("Movement speed when crouched.")]
    public float movementSpeed = 2;

    [Header("Low Head")]
    [Tooltip("Head to lower when crouched.")]
    public Transform headToLower;
    [HideInInspector] public float? defaultHeadYLocalPosition;
    public float crouchYHeadPosition = 1;

    [Header("Crouch Transition")]
    [Tooltip("Speed of the crouch transition.")]
    public float crouchSpeed = 10f;

    [Tooltip("Collider to lower when crouched.")]
    public CapsuleCollider colliderToLower;
    [HideInInspector] public float? defaultColliderHeight;

    public bool IsCrouched { get; private set; }
    public event System.Action CrouchStart, CrouchEnd;

    private float targetHeadHeight;
    private float currentHeadHeight;

    void Reset()
    {
        movement = GetComponentInParent<FirstPersonMovement>();
        var cam = movement ? movement.GetComponentInChildren<Camera>() : null;
        headToLower = cam ? cam.transform : null;
        colliderToLower = movement ? movement.GetComponentInChildren<CapsuleCollider>() : null;
    }

    void Start()
    {
        if (headToLower)
        {
            defaultHeadYLocalPosition = headToLower.localPosition.y;
            currentHeadHeight = defaultHeadYLocalPosition.Value;
            targetHeadHeight = defaultHeadYLocalPosition.Value;
        }

        if (colliderToLower)
        {
            defaultColliderHeight = colliderToLower.height;
        }
    }

    void LateUpdate()
    {
        if (InputHandler.IsMapActive(ActionMap.UI)) return;

        bool wantCrouch = false;
        try { wantCrouch = InputHandler.Held(GameAction.Crouch); } catch { }

        // Set target height based on crouch state
        if (wantCrouch)
        {
            if (!IsCrouched)
            {
                IsCrouched = true;
                SetSpeedOverrideActive(true);
                CrouchStart?.Invoke();
            }
            targetHeadHeight = crouchYHeadPosition;
        }
        else
        {
            if (IsCrouched)
            {
                IsCrouched = false;
                SetSpeedOverrideActive(false);
                CrouchEnd?.Invoke();
            }
            targetHeadHeight = defaultHeadYLocalPosition ?? headToLower.localPosition.y;
        }

        // Smoothly lerp to target height
        currentHeadHeight = Mathf.Lerp(currentHeadHeight, targetHeadHeight, Time.deltaTime * crouchSpeed);

        // Apply head position
        if (headToLower)
        {
            headToLower.localPosition = new Vector3(
                headToLower.localPosition.x,
                currentHeadHeight,
                headToLower.localPosition.z
            );
        }

        // Update collider
        if (colliderToLower && defaultColliderHeight.HasValue && defaultHeadYLocalPosition.HasValue)
        {
            float loweringAmount = defaultHeadYLocalPosition.Value - currentHeadHeight;
            colliderToLower.height = Mathf.Max(defaultColliderHeight.Value - loweringAmount, 0f);
            colliderToLower.center = Vector3.up * (colliderToLower.height * 0.5f);
        }
    }

    void SetSpeedOverrideActive(bool state)
    {
        if (!movement) return;

        if (state)
        {
            if (!movement.speedOverrides.Contains(SpeedOverride))
                movement.speedOverrides.Add(SpeedOverride);
        }
        else
        {
            if (movement.speedOverrides.Contains(SpeedOverride))
                movement.speedOverrides.Remove(SpeedOverride);
        }
    }

    float SpeedOverride() => movementSpeed;
}