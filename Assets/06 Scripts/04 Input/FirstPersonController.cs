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

    // NEW: track horizontal velocity ourselves so we can apply air drag smoothly
    private Vector3 _horizontalVelocity;

    private const float _threshold = 0.000001f;

    private void Awake()
    {
        if (_mainCamera == null)
        {
            _mainCamera = GameObject.FindGameObjectWithTag("MainCamera");
        }
    }

    private void Start()
    {
        _controller = GetComponent<CharacterController>();
        _input = GetComponent<StarterAssetsInputs>();
        _jumpTimeoutDelta = JumpTimeout;
        _fallTimeoutDelta = FallTimeout;
    }

    private void Update()
    {
        GroundedCheck();
        JumpAndGravity();
        Move();
    }

    private void LateUpdate()
    {
        CameraRotation();
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

    private void Move()
    {
        float dt = Time.deltaTime;

        // Desired speed
        float targetSpeed = _input.sprint ? SprintSpeed : MoveSpeed;
        if (_input.move == Vector2.zero) targetSpeed = 0.0f;

        float inputMagnitude = _input.analogMovement ? _input.move.magnitude : 1f;

        // Convert input to world direction
        Vector3 desiredDir = Vector3.zero;
        if (_input.move != Vector2.zero)
        {
            desiredDir = (transform.right * _input.move.x + transform.forward * _input.move.y).normalized;
        }

        // Build desired horizontal velocity (ignores y)
        Vector3 desiredHorizontalVel = desiredDir * (targetSpeed * inputMagnitude);

        if (Grounded)
        {
            // On ground: use your classic smoothing to reach desired speed quickly
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

            // Recompute with newSpeed so it matches your old feel
            _horizontalVelocity = desiredDir * newSpeed;
        }
        else
        {
            // In air: apply acceleration toward desired velocity + drag when no input
            bool hasInput = _input.move != Vector2.zero;

            if (hasInput)
            {
                // Accelerate toward the desired horizontal velocity
                _horizontalVelocity = Vector3.MoveTowards(
                    _horizontalVelocity,
                    desiredHorizontalVel,
                    AirAcceleration * dt
                );

                // If player is trying to reverse / strongly oppose current motion, add a bit more drag
                if (_horizontalVelocity.sqrMagnitude > 0.001f && desiredHorizontalVel.sqrMagnitude > 0.001f)
                {
                    float dot = Vector3.Dot(_horizontalVelocity.normalized, desiredHorizontalVel.normalized);
                    // dot < 0 means opposing
                    if (dot < 0f)
                    {
                        _horizontalVelocity = Vector3.Lerp(_horizontalVelocity, desiredHorizontalVel, 1f - Mathf.Exp(-AirDragOpposing * dt));
                    }
                }
            }
            else
            {
                // No input: fade out horizontal velocity quickly (air resistance)
                _horizontalVelocity = Vector3.Lerp(_horizontalVelocity, Vector3.zero, 1f - Mathf.Exp(-AirDragNoInput * dt));
            }
        }

        Vector3 motion = _horizontalVelocity + Vector3.up * _verticalVelocity;
        _controller.Move(motion * dt);
    }

    private void JumpAndGravity()
    {
        float dt = Time.deltaTime;

        if (Grounded)
        {
            // refresh coyote + jump timeout timers
            _coyoteTimeCounter = CoyoteTime;

            if (_jumpTimeoutDelta > 0f)
                _jumpTimeoutDelta -= dt;

            // Keep the controller grounded (small negative value)
            if (_verticalVelocity < 0f)
                _verticalVelocity = -2f;

            _isJumping = false;

            // Jump
            if (_input.jump && _jumpTimeoutDelta <= 0f)
            {
                _verticalVelocity = Mathf.Sqrt(JumpHeight * -2f * Gravity);
                _isJumping = true;
                _jumpStartedTime = Time.time;

                _jumpTimeoutDelta = JumpTimeout;
                _coyoteTimeCounter = 0f;
            }
        }
        else
        {
            // airborne timers
            _coyoteTimeCounter -= dt;
            _jumpTimeoutDelta = JumpTimeout;

            // Coyote jump (only if we haven't already jumped)
            if (_input.jump && _coyoteTimeCounter > 0f && !_isJumping)
            {
                _verticalVelocity = Mathf.Sqrt(JumpHeight * -2f * Gravity);
                _isJumping = true;
                _jumpStartedTime = Time.time;
                _coyoteTimeCounter = 0f;
            }

            // VARIABLE JUMP CUT:
            // If player released jump AND we are still going up, cut upward velocity.
            // Your input system sets jump=false on release, so this works.
            bool jumpReleased = !_input.jump;
            bool movingUp = _verticalVelocity > 0f;
            bool pastGrace = (Time.time - _jumpStartedTime) > JumpCutGraceTime;

            if (_isJumping && jumpReleased && movingUp && pastGrace)
            {
                _verticalVelocity *= JumpCutMultiplier;
                // Prevent repeated cuts
                _isJumping = false;
            }

            // Apply gravity
            _verticalVelocity += Gravity * dt;

            // Clamp terminal velocity (Gravity is negative)
            if (_verticalVelocity < -_terminalVelocity)
                _verticalVelocity = -_terminalVelocity;
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
