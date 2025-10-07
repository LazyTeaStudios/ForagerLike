using UnityEngine;

public class FirstPersonLook : MonoBehaviour
{
    [SerializeField] Transform character;
    public float sensitivity = 2f;
    public float smoothing = 1.5f;
    public float verticalClamp = 90f;

    private Vector2 velocity;
    private Vector2 frameVelocity;

    void Reset()
    {
        character = GetComponentInParent<FirstPersonMovement>()?.transform;
    }

    void Update()
    {
        if (InputHandler.IsMapActive(ActionMap.UI)) return;

        // Get look delta from wrapper (Vector2)
        Vector2 lookDelta = Vector2.zero;
        try { lookDelta = InputHandler.GetValue<Vector2>(GameAction.Look); } catch { }

        // scale to feel like your former sensitivity
        Vector2 rawFrameVelocity = lookDelta * sensitivity;
        frameVelocity = Vector2.Lerp(frameVelocity, rawFrameVelocity, 1f / Mathf.Max(0.0001f, smoothing));
        velocity += frameVelocity;
        velocity.y = Mathf.Clamp(velocity.y, -verticalClamp, verticalClamp);

        // camera pitch + character yaw
        transform.localRotation = Quaternion.AngleAxis(-velocity.y, Vector3.right);
        if (character) character.localRotation = Quaternion.AngleAxis(velocity.x, Vector3.up);
    }
}
