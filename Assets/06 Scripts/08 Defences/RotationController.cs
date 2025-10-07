using UnityEngine;

public class RotationController : MonoBehaviour
{
    [SerializeField] private Transform pivotTransform;
    [SerializeField] private float rotationSpeed = 360f;
    [SerializeField] private bool smoothRotation = true;
    [SerializeField] private bool lockY = true;

    private Transform _pivot;

    void Awake()
    {
        _pivot = pivotTransform ? pivotTransform : transform;
    }

    public void LookAt(Vector3 target)
    {
        Vector3 direction = target - _pivot.position;
        if (lockY) direction.y = 0f;

        if (direction == Vector3.zero) return;

        Quaternion targetRotation = Quaternion.LookRotation(direction);

        if (smoothRotation)
        {
            _pivot.rotation = Quaternion.RotateTowards(
                _pivot.rotation,
                targetRotation,
                rotationSpeed * Time.deltaTime
            );
        }
        else
        {
            _pivot.rotation = targetRotation;
        }
    }
}