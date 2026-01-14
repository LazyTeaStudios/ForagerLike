using System.Collections;
using UnityEngine;

[RequireComponent(typeof(Collider))]
public class EnvironmentZone : MonoBehaviour
{
    [Header("Trigger settings")]
    public string requiredTag = "Player";

    [Header("Transition")]
    [Min(0f)] public float transitionDuration = 1.0f;
    public bool useUnscaledTime = false;

    [Header("Fog")]
    public bool setFogEnabled = true;
    public bool fogEnabledInside = true;

    public bool setFogColor = true;
    public Color fogColorInside = Color.gray;

    [Range(0f, 0.2f)]
    public float fogDensityInside = 0.02f;

    [Header("Clouds / Object Toggle")]
    public GameObject cloudsObject;

    [Header("Skybox Cloudiness Blend")]
    [Tooltip("Name/Reference of the Vector1 property in Shader Graph (e.g. _Cloudiness).")]
    public string cloudinessProperty = "_Cloudiness";

    [Tooltip("Value to apply while inside this zone (0=clear, 1=cloudy).")]
    [Range(0f, 1f)]
    public float cloudinessInside = 1f;

    [Tooltip("Create a runtime instance so you don't modify the project asset material.")]
    public bool createSkyboxInstance = true;

    [Header("Revert behavior")]
    public bool revertOnExit = true;

    private bool _prevFogEnabled;
    private float _prevFogDensity;
    private Color _prevFogColor;
    private bool _prevCloudsActive;

    private float _prevCloudiness;
    private Material _skyboxMat;

    private int _insideCount = 0;
    private Coroutine _transitionRoutine;

    private void Awake()
    {
        if (RenderSettings.skybox != null && createSkyboxInstance)
        {
            _skyboxMat = new Material(RenderSettings.skybox);
            RenderSettings.skybox = _skyboxMat;
            DynamicGI.UpdateEnvironment();
        }
        else
        {
            _skyboxMat = RenderSettings.skybox;
        }
    }

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

        CacheCurrentSettings();

        if (cloudsObject != null) cloudsObject.SetActive(false);

        if (setFogEnabled) RenderSettings.fog = fogEnabledInside;

        StartTransition(
            targetFogDensity: fogDensityInside,
            targetFogColor: fogColorInside,
            applyFogColor: setFogColor,
            targetCloudiness: cloudinessInside,
            applyCloudiness: true
        );
    }

    private void OnTriggerExit(Collider other)
    {
        if (!IsAllowed(other)) return;

        _insideCount = Mathf.Max(0, _insideCount - 1);
        if (_insideCount != 0) return;

        if (cloudsObject != null) cloudsObject.SetActive(_prevCloudsActive);

        if (!revertOnExit) return;

        if (setFogEnabled) RenderSettings.fog = _prevFogEnabled;

        StartTransition(
            targetFogDensity: _prevFogDensity,
            targetFogColor: _prevFogColor,
            applyFogColor: setFogColor,
            targetCloudiness: _prevCloudiness,
            applyCloudiness: true
        );
    }

    private bool IsAllowed(Collider other)
    {
        if (string.IsNullOrEmpty(requiredTag)) return true;
        return other.CompareTag(requiredTag);
    }

    private void CacheCurrentSettings()
    {
        _prevFogEnabled = RenderSettings.fog;
        _prevFogDensity = RenderSettings.fogDensity;
        _prevFogColor = RenderSettings.fogColor;

        if (cloudsObject != null)
            _prevCloudsActive = cloudsObject.activeSelf;

        _prevCloudiness = GetCloudiness();
    }

    private float GetCloudiness()
    {
        if (_skyboxMat == null) return 0f;
        if (!_skyboxMat.HasProperty(cloudinessProperty)) return 0f;
        return _skyboxMat.GetFloat(cloudinessProperty);
    }

    private void SetCloudiness(float value)
    {
        if (_skyboxMat == null) return;
        if (!_skyboxMat.HasProperty(cloudinessProperty)) return;
        _skyboxMat.SetFloat(cloudinessProperty, value);
    }

    private void StartTransition(
        float targetFogDensity,
        Color targetFogColor,
        bool applyFogColor,
        float targetCloudiness,
        bool applyCloudiness
    )
    {
        if (_transitionRoutine != null)
            StopCoroutine(_transitionRoutine);

        float startFogDensity = RenderSettings.fogDensity;
        Color startFogColor = RenderSettings.fogColor;

        float startCloudiness = GetCloudiness();

        if (transitionDuration <= 0f)
        {
            RenderSettings.fogDensity = targetFogDensity;
            if (applyFogColor) RenderSettings.fogColor = targetFogColor;
            if (applyCloudiness) SetCloudiness(targetCloudiness);

            DynamicGI.UpdateEnvironment();
            return;
        }

        _transitionRoutine = StartCoroutine(TransitionRoutine(
            startFogDensity, targetFogDensity,
            startFogColor, targetFogColor,
            applyFogColor,
            startCloudiness, targetCloudiness,
            applyCloudiness,
            transitionDuration
        ));
    }

    private IEnumerator TransitionRoutine(
        float fromFogDensity, float toFogDensity,
        Color fromFogColor, Color toFogColor,
        bool applyFogColor,
        float fromCloudiness, float toCloudiness,
        bool applyCloudiness,
        float duration
    )
    {
        float t = 0f;

        while (t < duration)
        {
            float dt = useUnscaledTime ? Time.unscaledDeltaTime : Time.deltaTime;
            t += dt;

            float u = Mathf.Clamp01(t / duration);
            u = u * u * (3f - 2f * u); 

            RenderSettings.fogDensity = Mathf.Lerp(fromFogDensity, toFogDensity, u);

            if (applyFogColor)
                RenderSettings.fogColor = Color.Lerp(fromFogColor, toFogColor, u);

            if (applyCloudiness)
                SetCloudiness(Mathf.Lerp(fromCloudiness, toCloudiness, u));

            yield return null;
        }

        RenderSettings.fogDensity = toFogDensity;
        if (applyFogColor) RenderSettings.fogColor = toFogColor;
        if (applyCloudiness) SetCloudiness(toCloudiness);

        DynamicGI.UpdateEnvironment();

        _transitionRoutine = null;
    }
}
