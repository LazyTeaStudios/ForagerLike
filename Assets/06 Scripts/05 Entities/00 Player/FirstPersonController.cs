using UnityEngine;
using UnityEngine.InputSystem;

[RequireComponent(typeof(CharacterController))]
public class FirstPersonController : MonoBehaviour
{
    [Header("References")]
    [Tooltip("Camera pivot (usually the child transform that holds the Camera).")]
    public Transform cameraRoot;

    [Header("Movement")]
    public float walkSpeed = 4.0f;
    public float sprintSpeed = 7.0f;
    public float gravity = -20f;
    public float groundedStick = -2f;
    public float slopeSlideExtra = 0.0f;

    [Header("Look")]
    public float mouseSensitivity = 0.1f;
    public float gamepadLookSensitivity = 120f;
    public float verticalLookLimit = 85f;

    private CharacterController _cc;
    private float _pitch;
    private Vector3 _velocity;

    private void Awake()
    {
        _cc = GetComponent<CharacterController>();
        if (cameraRoot == null && Camera.main != null)
            cameraRoot = Camera.main.transform;
    }

    private void Update()
    {
        if (InputHandler.IsMapActive(ActionMap.UI)) return;

        HandleLook();
        HandleMove();

        var e = transform.eulerAngles;
        transform.eulerAngles = new Vector3(0f, e.y, 0f);
    }

    private void HandleLook()
    {
        Vector2 mDelta = Mouse.current != null ? Mouse.current.delta.ReadValue() : Vector2.zero;
        float yawDelta = mDelta.x * mouseSensitivity;
        float pitchDelta = -mDelta.y * mouseSensitivity;

        if (Gamepad.current != null)
        {
            Vector2 stick = Gamepad.current.rightStick.ReadValue();
            yawDelta += stick.x * gamepadLookSensitivity * Time.deltaTime;
            pitchDelta += -stick.y * gamepadLookSensitivity * Time.deltaTime;
        }

        transform.Rotate(Vector3.up, yawDelta, Space.World);

        _pitch = Mathf.Clamp(_pitch + pitchDelta, -verticalLookLimit, verticalLookLimit);
        if (cameraRoot != null)
        {
            Vector3 e = cameraRoot.localEulerAngles;
            e.x = _pitch;
            e.y = 0f;
            e.z = 0f;
            cameraRoot.localEulerAngles = e;
        }
    }

    private void HandleMove()
    {
        Vector2 move2D = Vector2.zero;
        try { move2D = InputHandler.GetValue<Vector2>(GameAction.Move); } catch { }

        Vector3 fwd = transform.forward; fwd.y = 0f; fwd.Normalize();
        Vector3 right = transform.right; right.y = 0f; right.Normalize();
        Vector3 planar = (fwd * move2D.y + right * move2D.x);

        bool sprinting = InputHandler.Held(GameAction.ShiftModifier);
        float speed = sprinting ? sprintSpeed : walkSpeed;

        if (_cc.isGrounded)
            _velocity.y = groundedStick;
        else
            _velocity.y += gravity * Time.deltaTime;

        if (slopeSlideExtra > 0f && _cc.isGrounded)
        {
            if (Physics.Raycast(transform.position, Vector3.down, out var hit, _cc.height * 1.5f))
            {
                Vector3 alongSlope = Vector3.ProjectOnPlane(Vector3.down, hit.normal).normalized;
                _velocity += alongSlope * slopeSlideExtra * Time.deltaTime;
            }
        }

        Vector3 motion = planar * speed + _velocity;
        _cc.Move(motion * Time.deltaTime);
    }
}
