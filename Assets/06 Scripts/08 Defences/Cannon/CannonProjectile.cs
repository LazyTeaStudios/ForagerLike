
using UnityEngine;

[RequireComponent(typeof(Rigidbody))]
public class CannonProjectile : MonoBehaviour, IProjectile
{
    [SerializeField] private float speed = 10f;
    [SerializeField] private float hitRadius = 0.2f;
    [SerializeField] private LayerMask hitMask = -1;

    private Vector3 _target;
    private Rigidbody _rb;
    private bool _hasTarget;

    void Awake() => _rb = GetComponent<Rigidbody>();

    public void SetTarget(Vector3 pos)
    {
        _target = pos;
        _hasTarget = true;
    }

    void FixedUpdate()
    {
        if (!_hasTarget) return;

        Vector3 dir = _target - transform.position;
        if (dir.magnitude <= hitRadius)
        {
            Hit();
            return;
        }

        _rb.MovePosition(transform.position + dir.normalized * speed * Time.fixedDeltaTime);
    }

    void Hit()
    {
        Collider[] hits = Physics.OverlapSphere(transform.position, hitRadius, hitMask);
        foreach (var hit in hits)
        {
            var enemy = hit.GetComponent<Enemy>();
            enemy?.OnDestroyed();
        }
        Destroy(gameObject);
    }
}