using UnityEngine;

[RequireComponent(typeof(Rigidbody2D))]
public class TopDownPlayerController : MonoBehaviour
{
    /*

    [Header("Movement")]
    [SerializeField, Min(0f)] private float moveSpeed = 5f;

    [Header("Dash")]
    [SerializeField, Min(0f)] private float dashSpeed = 15f;
    [SerializeField, Min(0f)] private float dashDuration = 0.15f;
    [SerializeField, Min(0f)] private float dashCooldown = 0.3f;

    private Rigidbody2D _rb;
    private Vector2 _moveInput;
    private Vector2 _lastMoveDir;
    private float _dashTimeLeft;
    private float _nextDashReady;

    private bool IsDashing => _dashTimeLeft > 0f;

    private void Awake() => _rb = GetComponent<Rigidbody2D>();

    private void Update()
    {
        _moveInput = Input.GetValue<Vector2>(GameAction.Move);

        if (_moveInput.sqrMagnitude > 0.0001f)
            _lastMoveDir = _moveInput.normalized;

        if (Input.Released(GameAction.Dash) 
            && Time.time >= _nextDashReady && _lastMoveDir.sqrMagnitude > 0.0001f && !IsDashing)
        {
            _dashTimeLeft = dashDuration;
            _nextDashReady = Time.time + dashCooldown;
            _rb.linearVelocity = _lastMoveDir * dashSpeed;
        }

        if (IsDashing)
        {
            _dashTimeLeft -= Time.deltaTime;
            if (_dashTimeLeft <= 0f) _dashTimeLeft = 0f;
        }
    }

    private void FixedUpdate()
    {
        if (IsDashing) return;

        _rb.linearVelocity = _moveInput * moveSpeed;
    }

    */
}