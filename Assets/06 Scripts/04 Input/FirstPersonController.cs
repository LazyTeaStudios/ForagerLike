using UnityEngine;

public class FirstPersonController : MonoBehaviour
{
    [Header("Player")]
    public float MoveSpeed = 4.0f;
    public float SprintSpeed = 6.0f;
    public float RotationSpeed = 1.0f;
    public float SpeedChangeRate = 10.0f;

    [Header("Jump & Gravity")]
    public float JumpHeight = 1.2f;
    public float Gravity = -20.0f;

    [Header("Jump Buffer")]
    [Tooltip("Press jump slightly before landing and it will trigger on landing.")]
    public float JumpBufferTime = 0.12f;

    [Header("Variable Jump")]
    [Tooltip("If you release jump while moving upward, upward velocity is multiplied by this (lower = shorter hops).")]
    [Range(0.1f, 1f)]
    public float JumpCutMultiplier = 0.5f;
    [Tooltip("Small grace time after jump start where we ignore jump-cut to prevent micro taps.")]
    public float JumpCutGraceTime = 0.05f;

    [Header("Air Control & Air Resistance")]
    [Tooltip("How quickly you accelerate toward desired air speed while holding input (higher = more control).")]
    public float AirAcceleration = 18f;
    [Tooltip("How quickly horizontal velocity decays when you release movement in air (higher = quicker fade).")]
    public float AirDragNoInput = 14f;
    [Tooltip("Extra drag when trying to stop / reverse direction in air (higher = snappier).")]
    public float AirDragOpposing = 8f;

    [Header("Timing")]
    public float JumpTimeout = 0.1f;
    public float FallTimeout = 0.15f;
    [Tooltip("Time after leaving ground where jump is still allowed")]
    public float CoyoteTime = 0.15f;

    [Header("Crouch")]
    [Tooltip("Hold crouch to crouch. Release to stand.")]
    public float CrouchHeightMultiplier = 0.5f;
    public float CrouchSpeed = 2.5f;
    [Tooltip("How fast we interpolate controller height/center and camera.")]
    public float CrouchTransitionSpeed = 14f;
    [Tooltip("How far to lower the camera target when crouched (local Y offset).")]
    public float CameraCrouchYOffset = -0.6f;
    [Tooltip("Layers that block standing up (ceilings, props, etc). Usually 'Default' + environment layers.")]
    public LayerMask CrouchObstructionLayers = ~0; // currently unused, kept for future

    [Header("Player Grounded")]
    public bool Grounded = true;
    public float GroundedOffset = -0.14f;
    public float GroundedRadius = 0.5f;
    public LayerMask GroundLayers;

    [Header("Cinemachine")]
    public GameObject CinemachineCameraTarget;
    public float TopClamp = 90.0f;
    public float BottomClamp = -90.0f;

    [Header("Look Smoothing")]
    public float LookSmooth = 20f;

    private float _cinemachineTargetPitch;
    private float _rotationVelocity;
    private float _verticalVelocity;
    private float _terminalVelocity = 53.0f;
    private float _jumpTimeoutDelta;
    private float _fallTimeoutDelta;
    private float _coyoteTimeCounter;
    private bool _isJumping;
    private float _jumpStartedTime;

    private CharacterController _controller;
    private StarterAssetsInputs _input;
    private GameObject _mainCamera;
    private Vector2 _lookSmoothed;

    // Track horizontal velocity ourselves so we can apply air drag smoothly
    private Vector3 _horizontalVelocity;

    // Jump buffer state
    private float _jumpBufferCounter;
    private bool _jumpHeldLast;

    // Crouch state
    private bool _isCrouched;
    private float _standHeight;
    private Vector3 _standCenter;
    private float _standBottomLocalY;
    private Vector3 _cameraTargetStandLocalPos;

    private const float _threshold = 0.000001f;

    private void Awake()
    {
        if (_mainCamera == null)
            _mainCamera = GameObject.FindGameObjectWithTag("MainCamera");
    }

    private void Start()
    {
        _controller = GetComponent<CharacterController>();
        _input = GetComponent<StarterAssetsInputs>();

        _jumpTimeoutDelta = JumpTimeout;
        _fallTimeoutDelta = FallTimeout;

        // Cache standing dimensions for crouch system
        _standHeight = _controller.height;
        _standCenter = _controller.center;
        _standBottomLocalY = _standCenter.y - (_standHeight * 0.5f);

        if (CinemachineCameraTarget != null)
            _cameraTargetStandLocalPos = CinemachineCameraTarget.transform.localPosition;
    }

    private void Update()
    {
        float dt = Time.deltaTime;

        // Update jump buffer BEFORE we evaluate jump logic
        UpdateJumpBuffer(dt);

        GroundedCheck();

        HandleCrouch(dt);

        JumpAndGravity(dt);
        Move(dt);
    }

    private void LateUpdate()
    {
        CameraRotation();
    }

    private void UpdateJumpBuffer(float dt)
    {
        // Detect jump press edge (since _input.jump is held-state)
        if (_input.jump && !_jumpHeldLast)
        {
            _jumpBufferCounter = JumpBufferTime;
        }

        if (_jumpBufferCounter > 0f)
            _jumpBufferCounter -= dt;

        _jumpHeldLast = _input.jump;
    }

    private void ConsumeJumpBuffer()
    {
        _jumpBufferCounter = 0f;
    }

    private void GroundedCheck()
    {
        Vector3 spherePosition = new Vector3(transform.position.x, transform.position.y - GroundedOffset, transform.position.z);
        Grounded = Physics.CheckSphere(spherePosition, GroundedRadius, GroundLayers, QueryTriggerInteraction.Ignore);
    }

    private void CameraRotation()
    {
        _lookSmoothed = Vector2.Lerp(_lookSmoothed, _input.look, 1f - Mathf.Exp(-LookSmooth * Time.deltaTime));

        if (_lookSmoothed.sqrMagnitude >= _threshold)
        {
            _cinemachineTargetPitch += _lookSmoothed.y * RotationSpeed;
            _rotationVelocity = _lookSmoothed.x * RotationSpeed;

            _cinemachineTargetPitch = ClampAngle(_cinemachineTargetPitch, BottomClamp, TopClamp);
            CinemachineCameraTarget.transform.localRotation = Quaternion.Euler(_cinemachineTargetPitch, 0f, 0f);
            transform.Rotate(Vector3.up * _rotationVelocity);
        }
    }

    private void HandleCrouch(float dt)
    {
        // PURE HOLD-TO-CROUCH
        _isCrouched = _input.crouch;

        float desiredHeight = _isCrouched ? (_standHeight * CrouchHeightMultiplier) : _standHeight;
        desiredHeight = Mathf.Max(desiredHeight, _controller.radius * 2.0f + 0.01f);

        // Keep feet at same place by preserving bottom Y
        float desiredCenterY = _standBottomLocalY + (desiredHeight * 0.5f);
        Vector3 desiredCenter = new Vector3(_standCenter.x, desiredCenterY, _standCenter.z);

        float t = 1f - Mathf.Exp(-CrouchTransitionSpeed * dt);
        _controller.height = Mathf.Lerp(_controller.height, desiredHeight, t);
        _controller.center = Vector3.Lerp(_controller.center, desiredCenter, t);

        // Camera target smooth offset
        if (CinemachineCameraTarget != null)
        {
            Vector3 camPos = CinemachineCameraTarget.transform.localPosition;
            float desiredCamY = _cameraTargetStandLocalPos.y + (_isCrouched ? CameraCrouchYOffset : 0f);
            camPos.y = Mathf.Lerp(camPos.y, desiredCamY, t);
            CinemachineCameraTarget.transform.localPosition = camPos;
        }
    }

    private void Move(float dt)
    {
        // Desired speed
        float baseSpeed = _input.sprint ? SprintSpeed : MoveSpeed;

        // If crouched, override speed
        float targetSpeed = _isCrouched ? CrouchSpeed : baseSpeed;

        if (_input.move == Vector2.zero)
            targetSpeed = 0.0f;

        float inputMagnitude = _input.analogMovement ? _input.move.magnitude : 1f;

        // Convert input to world direction
        Vector3 desiredDir = Vector3.zero;
        if (_input.move != Vector2.zero)
            desiredDir = (transform.right * _input.move.x + transform.forward * _input.move.y).normalized;

        // Desired horizontal velocity (ignores y)
        Vector3 desiredHorizontalVel = desiredDir * (targetSpeed * inputMagnitude);

        if (Grounded)
        {
            // On ground: smoothing toward desired speed
            Vector3 currentHorizontal = new Vector3(_controller.velocity.x, 0f, _controller.velocity.z);
            float currentSpeed = currentHorizontal.magnitude;

            float speedOffset = 0.1f;
            float newSpeed;

            if (currentSpeed < targetSpeed - speedOffset || currentSpeed > targetSpeed + speedOffset)
            {
                newSpeed = Mathf.Lerp(currentSpeed, targetSpeed * inputMagnitude, dt * SpeedChangeRate);
                newSpeed = Mathf.Round(newSpeed * 1000f) / 1000f;
            }
            else
            {
                newSpeed = targetSpeed;
            }

            _horizontalVelocity = desiredDir * newSpeed;
        }
        else
        {
            // In air: acceleration toward desired velocity + drag when no input
            bool hasInput = _input.move != Vector2.zero;

            if (hasInput)
            {
                _horizontalVelocity = Vector3.MoveTowards(
                    _horizontalVelocity,
                    desiredHorizontalVel,
                    AirAcceleration * dt
                );

                // Extra drag when reversing direction in air
                if (_horizontalVelocity.sqrMagnitude > 0.001f && desiredHorizontalVel.sqrMagnitude > 0.001f)
                {
                    float dot = Vector3.Dot(_horizontalVelocity.normalized, desiredHorizontalVel.normalized);
                    if (dot < 0f)
                    {
                        _horizontalVelocity = Vector3.Lerp(
                            _horizontalVelocity,
                            desiredHorizontalVel,
                            1f - Mathf.Exp(-AirDragOpposing * dt)
                        );
                    }
                }
            }
            else
            {
                _horizontalVelocity = Vector3.Lerp(
                    _horizontalVelocity,
                    Vector3.zero,
                    1f - Mathf.Exp(-AirDragNoInput * dt)
                );
            }
        }

        Vector3 motion = _horizontalVelocity + Vector3.up * _verticalVelocity;
        _controller.Move(motion * dt);
    }

    private void JumpAndGravity(float dt)
    {
        // Treat buffered press as "wants jump"
        bool wantsJump = _jumpBufferCounter > 0f;

        // REAL grounding (collision-based)
        bool controllerGrounded = _controller.isGrounded;

        // -----------------------
        // JUMP (ground + coyote)
        // -----------------------
        if (Grounded)
        {
            _coyoteTimeCounter = CoyoteTime;

            if (_jumpTimeoutDelta > 0f)
                _jumpTimeoutDelta -= dt;

            // Jump from ground using buffer
            if (wantsJump && _jumpTimeoutDelta <= 0f)
            {
                _verticalVelocity = Mathf.Sqrt(JumpHeight * -2f * Gravity);
                _isJumping = true;
                _jumpStartedTime = Time.time;

                ConsumeJumpBuffer();
                _jumpTimeoutDelta = JumpTimeout;
                _coyoteTimeCounter = 0f;
            }
        }
        else
        {
            // airborne timers
            _coyoteTimeCounter -= dt;
            _jumpTimeoutDelta = JumpTimeout;

            // Coyote jump using buffer (only if we haven't already jumped)
            if (wantsJump && _coyoteTimeCounter > 0f && !_isJumping)
            {
                _verticalVelocity = Mathf.Sqrt(JumpHeight * -2f * Gravity);
                _isJumping = true;
                _jumpStartedTime = Time.time;

                ConsumeJumpBuffer();
                _coyoteTimeCounter = 0f;
            }
        }

        // -----------------------
        // VARIABLE JUMP HEIGHT
        // -----------------------
        bool movingUp = _verticalVelocity > 0f;
        bool jumpReleased = !_input.jump;
        bool pastGrace = (Time.time - _jumpStartedTime) > JumpCutGraceTime;

        // If player releases jump while going up (after a tiny grace time),
        // cut the upward velocity for a shorter hop.
        if (_isJumping && jumpReleased && movingUp && pastGrace)
        {
            _verticalVelocity *= JumpCutMultiplier;
            _isJumping = false; // we spent our variable jump
        }

        // -----------------------
        // GRAVITY (same everywhere)
        // -----------------------
        _verticalVelocity += Gravity * dt;

        // Clamp terminal velocity (Gravity is negative)
        if (_verticalVelocity < -_terminalVelocity)
            _verticalVelocity = -_terminalVelocity;

        // Actually on floor? Stop us from sinking and end the jump.
        if (controllerGrounded && _verticalVelocity < 0f)
        {
            _verticalVelocity = -2f;
            _isJumping = false; // landed
        }
    }


    private static float ClampAngle(float lfAngle, float lfMin, float lfMax)
    {
        if (lfAngle < -360f) lfAngle += 360f;
        if (lfAngle > 360f) lfAngle -= 360f;
        return Mathf.Clamp(lfAngle, lfMin, lfMax);
    }

    private void OnDrawGizmosSelected()
    {
        Color transparentGreen = new Color(0.0f, 1.0f, 0.0f, 0.35f);
        Color transparentRed = new Color(1.0f, 0.0f, 0.0f, 0.35f);

        Gizmos.color = Grounded ? transparentGreen : transparentRed;
        Gizmos.DrawSphere(new Vector3(transform.position.x, transform.position.y - GroundedOffset, transform.position.z), GroundedRadius);
    }
}
