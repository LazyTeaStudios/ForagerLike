using UnityEngine;

public class FirstPersonLook : MonoBehaviour
{
    [SerializeField] Transform character;
    [SerializeField] float sensitivity = 2f;
    [SerializeField] float smoothing = 1.5f;
    [SerializeField] float verticalClamp = 90f;

    Vector2 velocity;
    Vector2 frameVelocity;

    void Reset() => character = GetComponentInParent<FirstPersonMovement>()?.transform;

    void Update()
    {
        if (InputHandler.IsMapActive(ActionMap.UI)) return;

        Vector2 lookDelta = InputHandler.GetValue<Vector2>(GameAction.Look);
        Vector2 rawFrameVelocity = lookDelta * sensitivity;

        frameVelocity = Vector2.Lerp(frameVelocity, rawFrameVelocity, 1f / Mathf.Max(0.0001f, smoothing));
        velocity += frameVelocity;
        velocity.y = Mathf.Clamp(velocity.y, -verticalClamp, verticalClamp);

        transform.localRotation = Quaternion.AngleAxis(-velocity.y, Vector3.right);

        if (character)
        {
            character.localRotation = Quaternion.AngleAxis(velocity.x, Vector3.up);
        }
    }
}