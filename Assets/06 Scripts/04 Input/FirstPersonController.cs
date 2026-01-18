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
    public LayerMask CrouchObstructionLayers = ~0;

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

    private Vector3 _horizontalVelocity;

    private float _jumpBufferCounter;
    private bool _jumpHeldLast;

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

        _standHeight = _controller.height;
        _standCenter = _controller.center;
        _standBottomLocalY = _standCenter.y - (_standHeight * 0.5f);

        if (CinemachineCameraTarget != null)
            _cameraTargetStandLocalPos = CinemachineCameraTarget.transform.localPosition;

        MoveSpeed = PlayerDataHandler.Data.moveSpeed;
        SprintSpeed = PlayerDataHandler.Data.sprintSpeed;
    }

    private void Update()
    {
        float dt = Time.deltaTime;

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
        _isCrouched = _input.crouch;

        float desiredHeight = _isCrouched ? (_standHeight * CrouchHeightMultiplier) : _standHeight;
        desiredHeight = Mathf.Max(desiredHeight, _controller.radius * 2.0f + 0.01f);

        float desiredCenterY = _standBottomLocalY + (desiredHeight * 0.5f);
        Vector3 desiredCenter = new Vector3(_standCenter.x, desiredCenterY, _standCenter.z);

        float t = 1f - Mathf.Exp(-CrouchTransitionSpeed * dt);
        _controller.height = Mathf.Lerp(_controller.height, desiredHeight, t);
        _controller.center = Vector3.Lerp(_controller.center, desiredCenter, t);

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
        float baseSpeed = _input.sprint ? SprintSpeed : MoveSpeed;
        float targetSpeed = _isCrouched ? CrouchSpeed : baseSpeed;

        if (_input.move == Vector2.zero)
            targetSpeed = 0.0f;

        float inputMagnitude = _input.analogMovement ? _input.move.magnitude : 1f;

        Vector3 desiredDir = Vector3.zero;
        if (_input.move != Vector2.zero)
            desiredDir = (transform.right * _input.move.x + transform.forward * _input.move.y).normalized;

        Vector3 desiredHorizontalVel = desiredDir * (targetSpeed * inputMagnitude);

        if (Grounded)
        {
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
            bool hasInput = _input.move != Vector2.zero;

            if (hasInput)
            {
                _horizontalVelocity = Vector3.MoveTowards(
                    _horizontalVelocity,
                    desiredHorizontalVel,
                    AirAcceleration * dt
                );

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
        bool wantsJump = _jumpBufferCounter > 0f;
        bool controllerGrounded = _controller.isGrounded;

        if (Grounded)
        {
            _coyoteTimeCounter = CoyoteTime;

            if (_jumpTimeoutDelta > 0f)
                _jumpTimeoutDelta -= dt;

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
            _coyoteTimeCounter -= dt;
            _jumpTimeoutDelta = JumpTimeout;

            if (wantsJump && _coyoteTimeCounter > 0f && !_isJumping)
            {
                _verticalVelocity = Mathf.Sqrt(JumpHeight * -2f * Gravity);
                _isJumping = true;
                _jumpStartedTime = Time.time;

                ConsumeJumpBuffer();
                _coyoteTimeCounter = 0f;
            }
        }

        bool movingUp = _verticalVelocity > 0f;
        bool jumpReleased = !_input.jump;
        bool pastGrace = (Time.time - _jumpStartedTime) > JumpCutGraceTime;

        if (_isJumping && jumpReleased && movingUp && pastGrace)
        {
            _verticalVelocity *= JumpCutMultiplier;
            _isJumping = false;
        }

        _verticalVelocity += Gravity * dt;

        if (_verticalVelocity < -_terminalVelocity)
            _verticalVelocity = -_terminalVelocity;

        if (controllerGrounded && _verticalVelocity < 0f)
        {
            _verticalVelocity = -2f;
            _isJumping = false;
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
