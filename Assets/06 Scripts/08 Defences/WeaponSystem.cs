using UnityEngine;

public class WeaponSystem : MonoBehaviour
{
    [SerializeField] private Transform firePoint;
    [SerializeField] private GameObject projectilePrefab;
    [SerializeField] private float fireRate = 0.5f;
    [SerializeField] private float windUpTime = 0f;
    [SerializeField] private float aimTolerance = 5f;

    private float _fireTimer;
    private float _windUpTimer;
    private bool _windingUp;
    private Vector3 _currentTarget;

    public bool CanFire => _fireTimer <= 0f && !_windingUp;
    public bool IsWindingUp => _windingUp;

    void Update()
    {
        if (_fireTimer > 0f)
            _fireTimer -= Time.deltaTime;

        if (_windingUp)
        {
            _windUpTimer -= Time.deltaTime;
            if (_windUpTimer <= 0f)
            {
                _windingUp = false;
                ExecuteFire();
            }
        }
    }

    public void TryFire(Vector3 target)
    {
        if (!CanFire || !IsFacingTarget(target)) return;

        if (windUpTime > 0f)
        {
            _windingUp = true;
            _windUpTimer = windUpTime;
            _currentTarget = target;
        }
        else
        {
            ExecuteFire(target);
        }
    }

    private bool IsFacingTarget(Vector3 target)
    {
        Vector3 directionToTarget = target - firePoint.position;
        directionToTarget.y = 0f;

        if (directionToTarget == Vector3.zero) return true;

        float angle = Vector3.Angle(firePoint.forward, directionToTarget);
        return angle <= aimTolerance;
    }

    private void ExecuteFire(Vector3? target = null)
    {
        Vector3 fireTarget = target ?? _currentTarget;

        if (!projectilePrefab || !firePoint) return;

        GameObject proj = Instantiate(projectilePrefab, firePoint.position, Quaternion.identity);
        var projectile = proj.GetComponent<IProjectile>();
        projectile?.SetTarget(fireTarget);

        _fireTimer = 1f / fireRate;
    }
}