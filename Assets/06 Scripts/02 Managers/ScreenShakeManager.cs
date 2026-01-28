using UnityEngine;
using Unity.Cinemachine;

public class ScreenShakeManager : MonoBehaviour
{
    public static ScreenShakeManager Instance { get; private set; }

    [SerializeField] private CinemachineImpulseSource impulseSource;

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
    }

    private void Start()
    {
        if (impulseSource == null)
            impulseSource = GetComponent<CinemachineImpulseSource>();

        if (impulseSource == null)
            impulseSource = FindFirstObjectByType<CinemachineImpulseSource>();
    }

    public void Shake()
    {
        if (impulseSource == null) return;
        impulseSource.GenerateImpulse();
    }

    public void Shake(float force)
    {
        if (impulseSource == null) return;
        impulseSource.GenerateImpulse(force);
    }

    public void Shake(Vector3 velocity)
    {
        if (impulseSource == null) return;
        impulseSource.GenerateImpulse(velocity);
    }

    public void Shake(float amplitude, float frequency, float duration)
    {
        if (impulseSource == null) return;

        var def = impulseSource.ImpulseDefinition;

        float oldAmp = def.AmplitudeGain;
        float oldFreq = def.FrequencyGain;
        float oldTime = def.ImpulseDuration;

        def.AmplitudeGain = amplitude;
        def.FrequencyGain = frequency;
        def.ImpulseDuration = duration;

        impulseSource.ImpulseDefinition = def;
        impulseSource.GenerateImpulse();

        def.AmplitudeGain = oldAmp;
        def.FrequencyGain = oldFreq;
        def.ImpulseDuration = oldTime;

        impulseSource.ImpulseDefinition = def;
    }

    public void Shake(Vector3 direction, float amplitude, float frequency, float duration)
    {
        if (impulseSource == null) return;

        var def = impulseSource.ImpulseDefinition;

        float oldAmp = def.AmplitudeGain;
        float oldFreq = def.FrequencyGain;
        float oldTime = def.ImpulseDuration;

        def.AmplitudeGain = amplitude;
        def.FrequencyGain = frequency;
        def.ImpulseDuration = duration;

        impulseSource.ImpulseDefinition = def;
        impulseSource.GenerateImpulse(direction);

        def.AmplitudeGain = oldAmp;
        def.FrequencyGain = oldFreq;
        def.ImpulseDuration = oldTime;

        impulseSource.ImpulseDefinition = def;
    }
}
