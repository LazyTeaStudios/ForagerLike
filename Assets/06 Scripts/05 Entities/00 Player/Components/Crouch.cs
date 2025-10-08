using UnityEngine;

public class Crouch : MonoBehaviour
{
    [Header("Settings")]
    [SerializeField] FirstPersonMovement movement;
    [SerializeField] float movementSpeed = 2f;
    [SerializeField] Transform headToLower;
    [SerializeField] float crouchYHeadPosition = 1f;
    [SerializeField] float crouchSpeed = 10f;
    [SerializeField] CapsuleCollider colliderToLower;

    public bool IsCrouched { get; private set; }
    public event System.Action CrouchStart, CrouchEnd;

    float defaultHeadY;
    float defaultColliderHeight;
    float currentHeadHeight;
    float targetHeadHeight;

    void Reset()
    {
        movement = GetComponentInParent<FirstPersonMovement>();
        headToLower = movement?.GetComponentInChildren<Camera>()?.transform;
        colliderToLower = movement?.GetComponent<CapsuleCollider>();
    }

    void Start()
    {
        if (headToLower)
        {
            defaultHeadY = headToLower.localPosition.y;
            currentHeadHeight = defaultHeadY;
            targetHeadHeight = defaultHeadY;
        }
        if (colliderToLower) defaultColliderHeight = colliderToLower.height;
    }

    void Update()
    {
        if (InputHandler.IsMapActive(ActionMap.UI)) return;

        bool wantCrouch = InputHandler.Held(GameAction.Crouch);

        if (wantCrouch && !IsCrouched)
        {
            IsCrouched = true;
            SetSpeedOverride(true);
            targetHeadHeight = crouchYHeadPosition;
            CrouchStart?.Invoke();
        }
        else if (!wantCrouch && IsCrouched)
        {
            IsCrouched = false;
            SetSpeedOverride(false);
            targetHeadHeight = defaultHeadY;
            CrouchEnd?.Invoke();
        }

        currentHeadHeight = Mathf.Lerp(currentHeadHeight, targetHeadHeight, Time.deltaTime * crouchSpeed);

        if (headToLower)
            headToLower.localPosition = new Vector3(headToLower.localPosition.x, currentHeadHeight, headToLower.localPosition.z);

        if (colliderToLower)
        {
            float loweringAmount = defaultHeadY - currentHeadHeight;
            colliderToLower.height = Mathf.Max(defaultColliderHeight - loweringAmount, 0.1f);
            colliderToLower.center = Vector3.up * (colliderToLower.height * 0.5f);
        }
    }

    void SetSpeedOverride(bool enable)
    {
        if (!movement) return;

        if (enable && !movement.speedOverrides.Contains(SpeedOverride))
            movement.speedOverrides.Add(SpeedOverride);
        else if (!enable)
            movement.speedOverrides.Remove(SpeedOverride);
    }

    float SpeedOverride() => movementSpeed;
}