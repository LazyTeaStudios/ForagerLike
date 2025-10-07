using UnityEngine;
using UnityEngine.InputSystem;

/// <summary>
/// RTS-style camera rig that pans and yaws around a fixed-offset camera,
/// and now lets you zoom the whole rig in/out with the mouse wheel.
/// </summary>
public class CameraController : MonoBehaviour
{
    [HideInInspector] public bool hasMoved = false;
    [HideInInspector] public bool isHoveringTile = false;
    public bool IsCameraInputActive { get; private set; }

    [Header("Horizontal Translation")]
    [SerializeField] private float speed, maxSpeed = 5f, acceleration = 10f, damping = 15f;

    [Header("Rotation")]
    [SerializeField] private float maxRotationSpeed = 1f;

    [Header("Camera Framing")]
    [Tooltip("Starting distance (m) from pivot to camera along its view direction.")]
    [SerializeField] private float distance = 12f;
    [Tooltip("How far in/out the wheel can push the camera (m).")]
    [SerializeField] private float minDistance = 5f, maxDistance = 30f;
    [Tooltip("Tilt — how far the camera looks down toward the ground (°).")]
    [Range(5f, 80f)]
    [SerializeField] private float pitchAngle = 45f;
    [Tooltip("Meters added/removed per wheel-notch.")]
    [SerializeField] private float zoomStep = 1.2f;

    private Transform cameraTransform;
    private Vector3 initialPosition;
    private float initialDistance;

    private Vector3 targetPosition;
    private Vector3 horizontalVelocity;
    private Vector3 lastPosition;
    private Vector3 startDrag;

    private Vector2 lastMousePos;

    private const float ScrollNotch = 120f;

    private void Awake()
    {
        cameraTransform = GetComponentInChildren<Camera>().transform;

        initialPosition = transform.position;
        initialDistance = distance;

        lastMousePos = Mouse.current.position.ReadValue();
    }

    private void OnEnable()
    {
        lastPosition = transform.position;
        UpdateCameraLocalPosition();
        cameraTransform.LookAt(transform);
    }

    private void Update()
    {
        if (GameManager.IsState(GameState.Paused)) return;

        IsCameraInputActive = false;        

        Vector2 mousePos = Mouse.current.position.ReadValue();
        Vector2 mouseDelta = mousePos - lastMousePos;
        lastMousePos = mousePos;

        HandleMovement();                        
        HandleDrag(mousePos);                    
        HandleRotation(mouseDelta);
        HandleZoom();
        HandleReset();

        UpdateVelocity();
        UpdateBasePosition();
        MaintainCameraPosition();
    }

    #region Input helpers
    private void HandleMovement()
    {
        Vector2 move2D = Input.GetValue<Vector2>(GameAction.Move);
        if (move2D.sqrMagnitude > 0.01f)
        {
            Vector3 input = move2D.x * GetCameraRight() + move2D.y * GetCameraForward();
            targetPosition += input.normalized;
            IsCameraInputActive = true;
        }
    }

    private void HandleDrag(Vector2 mousePos)
    {
        bool middleHeld = Mouse.current.middleButton.isPressed;
        bool middlePressedThisFr = Mouse.current.middleButton.wasPressedThisFrame;

        if (!middleHeld) { hasMoved = false; return; }

        Plane plane = new Plane(Vector3.up, Vector3.zero);
        if (!plane.Raycast(Camera.main.ScreenPointToRay(mousePos), out float dst)) return;

        if (middlePressedThisFr)
            startDrag = Camera.main.ScreenPointToRay(mousePos).GetPoint(dst);
        else
        {
            Vector3 newTarget = targetPosition +
                                (startDrag - Camera.main.ScreenPointToRay(mousePos).GetPoint(dst));
            if (newTarget != targetPosition) targetPosition = newTarget;
        }

        IsCameraInputActive = true;
    }

    private void HandleRotation(Vector2 mouseDelta)
    {
        if (!Mouse.current.rightButton.isPressed) return;

        transform.rotation = Quaternion.Euler(
            0f,
            mouseDelta.x * maxRotationSpeed + transform.rotation.eulerAngles.y,
            0f);

        IsCameraInputActive = true;
    }

    private void HandleZoom()
    {
        if (isHoveringTile) return;
        
        if (!Input.Held(GameAction.GameplayCtrlModifier)) return;

        float scroll = Mouse.current.scroll.ReadValue().y;   // **no /120f**

        // with raw scroll lines we can keep a tiny threshold
        if (Mathf.Abs(scroll) < 0.01f) return;

        distance = Mathf.Clamp(distance - scroll * zoomStep, minDistance, maxDistance);
        IsCameraInputActive = true;
    }

    private void HandleReset()
    {
        if (Input.Pressed(GameAction.ResetCameraPosition)) ResetCameraPosition();
    }
    #endregion

    #region Movement maths
    private void UpdateVelocity()
    {
        horizontalVelocity = (transform.position - lastPosition) / Time.deltaTime;
        horizontalVelocity.y = 0f;
        lastPosition = transform.position;
    }

    private void UpdateBasePosition()
    {
        if (targetPosition.sqrMagnitude > 0.01f)
        {
            speed = Mathf.Lerp(speed, maxSpeed, Time.deltaTime * acceleration);
            transform.position += targetPosition * speed * Time.deltaTime;
            hasMoved = true;
        }
        else
        {
            horizontalVelocity = Vector3.Lerp(horizontalVelocity, Vector3.zero, Time.deltaTime * damping);
            transform.position += horizontalVelocity * Time.deltaTime;
        }
        targetPosition = Vector3.zero;
    }
    #endregion

    private void MaintainCameraPosition()
    {
        UpdateCameraLocalPosition();
        cameraTransform.LookAt(transform);
    }

    private void UpdateCameraLocalPosition()
    {
        Vector3 offsetDir = Quaternion.Euler(pitchAngle, 0f, 0f) * Vector3.back;
        cameraTransform.localPosition = offsetDir * distance;
    }

    #region Reset helpers
    public void ResetCameraPosition()
    {
        horizontalVelocity = Vector3.zero;
        lastPosition = initialPosition;
        targetPosition = Vector3.zero;

        transform.position = initialPosition;
        transform.rotation = Quaternion.identity;

        distance = initialDistance;
        UpdateCameraLocalPosition();
        cameraTransform.LookAt(transform);
    }
    #endregion

    #region Utility
    private Vector3 GetCameraForward()
    {
        Vector3 f = cameraTransform.forward; f.y = 0; return f;
    }
    private Vector3 GetCameraRight()
    {
        Vector3 r = cameraTransform.right; r.y = 0; return r;
    }
    #endregion
}