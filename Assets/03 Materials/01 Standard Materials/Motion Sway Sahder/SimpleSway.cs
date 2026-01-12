using UnityEngine;

public class SimpleSway : MonoBehaviour
{
    [Header("Sway")]
    public Vector3 rotationAxis = Vector3.forward; // z-axis tilt by default
    public float amplitudeDegrees = 5f;
    public float frequency = 1f;

    [Header("Variation")]
    public float phaseOffset = 0f;
    public bool randomizePhaseOnStart = true;

    Quaternion _startRot;

    void Start()
    {
        _startRot = transform.localRotation;
        if (randomizePhaseOnStart) phaseOffset = Random.value * 1000f;
    }

    void Update()
    {
        float t = (Time.time + phaseOffset) * frequency * Mathf.PI * 2f;
        float angle = Mathf.Sin(t) * amplitudeDegrees;
        transform.localRotation = _startRot * Quaternion.AngleAxis(angle, rotationAxis.normalized);
    }
}
