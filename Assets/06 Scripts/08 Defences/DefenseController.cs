using UnityEngine;

public class DefenseController : MonoBehaviour
{
    private TargetingSystem _targeting;
    private RotationController _rotation;
    private WeaponSystem _weapon;

    void Awake()
    {
        _targeting = GetComponent<TargetingSystem>();
        _rotation = GetComponent<RotationController>();
        _weapon = GetComponent<WeaponSystem>();
    }

    void Update()
    {
        var target = _targeting.CurrentTarget;
        if (target == null) return;

        _rotation.LookAt(target.Position);

        if (_weapon.CanFire)
            _weapon.TryFire(target.Position);
    }
}