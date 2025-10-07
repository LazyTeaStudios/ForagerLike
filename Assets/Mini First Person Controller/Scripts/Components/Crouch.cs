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

    [Tooltip("Collider to lower when crouched.")]
    public CapsuleCollider colliderToLower;
    [HideInInspector] public float? defaultColliderHeight;

    public bool IsCrouched { get; private set; }
    public event System.Action CrouchStart, CrouchEnd;

    void Reset()
    {
        movement = GetComponentInParent<FirstPersonMovement>();
        var cam = movement ? movement.GetComponentInChildren<Camera>() : null;
        headToLower = cam ? cam.transform : null;
        colliderToLower = movement ? movement.GetComponentInChildren<CapsuleCollider>() : null;
    }

    void LateUpdate()
    {
        if (InputHandler.IsMapActive(ActionMap.UI)) return;

        bool wantCrouch = false;
        try { wantCrouch = InputHandler.Held(GameAction.Crouch); } catch { }

        if (wantCrouch)
        {
            // head
            if (headToLower)
            {
                if (!defaultHeadYLocalPosition.HasValue)
                    defaultHeadYLocalPosition = headToLower.localPosition.y;

                headToLower.localPosition = new Vector3(
                    headToLower.localPosition.x,
                    crouchYHeadPosition,
                    headToLower.localPosition.z
                );
            }

            // collider
            if (colliderToLower)
            {
                if (!defaultColliderHeight.HasValue)
                    defaultColliderHeight = colliderToLower.height;

                float loweringAmount = defaultHeadYLocalPosition.HasValue
                    ? (defaultHeadYLocalPosition.Value - crouchYHeadPosition)
                    : defaultColliderHeight.Value * 0.5f;

                colliderToLower.height = Mathf.Max(defaultColliderHeight.Value - loweringAmount, 0f);
                colliderToLower.center = Vector3.up * (colliderToLower.height * 0.5f);
            }

            if (!IsCrouched)
            {
                IsCrouched = true;
                SetSpeedOverrideActive(true);
                CrouchStart?.Invoke();
            }
        }
        else if (IsCrouched)
        {
            if (headToLower && defaultHeadYLocalPosition.HasValue)
                headToLower.localPosition = new Vector3(
                    headToLower.localPosition.x,
                    defaultHeadYLocalPosition.Value,
                    headToLower.localPosition.z
                );

            if (colliderToLower && defaultColliderHeight.HasValue)
            {
                colliderToLower.height = defaultColliderHeight.Value;
                colliderToLower.center = Vector3.up * (colliderToLower.height * 0.5f);
            }

            IsCrouched = false;
            SetSpeedOverrideActive(false);
            CrouchEnd?.Invoke();
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
