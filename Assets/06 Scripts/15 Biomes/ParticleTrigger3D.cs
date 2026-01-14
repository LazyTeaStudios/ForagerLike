using UnityEngine;

[RequireComponent(typeof(Collider))]
public class ParticleTrigger3D : MonoBehaviour
{
    [Header("Trigger settings")]
    public string requiredTag = "Player";

    [Header("Particle")]
    public ParticleSystem particleSystemToControl;

    [Tooltip("If true, clears existing particles when stopping.")]
    public bool clearOnStop = false;

    private int _insideCount = 0;

    private void Reset()
    {
        var col = GetComponent<Collider>();
        col.isTrigger = true;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (!IsAllowed(other)) return;

        _insideCount++;
        if (_insideCount != 1) return;

        if (particleSystemToControl == null) return;

        if (!particleSystemToControl.isPlaying)
            particleSystemToControl.Play(true);
    }

    private void OnTriggerExit(Collider other)
    {
        if (!IsAllowed(other)) return;

        _insideCount = Mathf.Max(0, _insideCount - 1);
        if (_insideCount != 0) return;

        if (particleSystemToControl == null) return;

        if (particleSystemToControl.isPlaying)
        {
            var stopBehavior = clearOnStop
                ? ParticleSystemStopBehavior.StopEmittingAndClear
                : ParticleSystemStopBehavior.StopEmitting;

            particleSystemToControl.Stop(true, stopBehavior);
        }
    }

    private bool IsAllowed(Collider other)
    {
        if (string.IsNullOrEmpty(requiredTag)) return true;
        return other.CompareTag(requiredTag);
    }
}
