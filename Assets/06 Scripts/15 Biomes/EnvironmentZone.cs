using System.Collections;
using UnityEngine;

#if UNITY_EDITOR
using UnityEditor;
#endif

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

    [Header("Skybox Cloudiness Blend")]
    [Tooltip("Name/Reference of the Vector1 property in Shader Graph (e.g. _Cloudiness).")]
    public string cloudinessProperty = "_Cloudiness";

    [Tooltip("Value to apply while inside this zone (0=clear, 1=cloudy).")]
    [Range(0f, 1f)]
    public float cloudinessInside = 1f;

    [Tooltip("Create a runtime instance so you don't modify the project asset skybox material.")]
    public bool createSkyboxInstance = true;

    [Header("Material Saturation Blend")]
    [Tooltip("Material to drive saturation on (assign in Inspector).")]
    public Material saturationMaterial;

    [Tooltip("Create a runtime instance so you don't modify the project asset material.")]
    public bool createSaturationMaterialInstance = true;

    [Tooltip("Name of the float property on the material (e.g. _Saturation).")]
    public string saturationProperty = "_Saturation";

    [Tooltip("Target saturation while inside this zone.")]
    [Range(0f, 1f)]
    public float saturationInside = 1f;

    [Header("Water Saturation Multiplier Blend")]
    [Tooltip("Material that has a float property for water saturation multiplier.")]
    public Material waterMaterial;

    [Tooltip("Create a runtime instance so you don't modify the project asset material.")]
    public bool createWaterMaterialInstance = true;

    [Tooltip("Float property name (e.g. _WaterSaturationMultiplier).")]
    public string waterSaturationMultiplierProperty = "_WaterSaturationMultiplier";

    [Tooltip("Target value while inside this zone. Default outside is cached on enter.")]
    [Range(0f, 2f)]
    public float waterSaturationMultiplierInside = 0.3f;

    [Header("Revert behavior")]
    public bool revertOnExit = true;

    private bool _prevFogEnabled;
    private float _prevFogDensity;
    private Color _prevFogColor;

    private float _prevCloudiness;
    private Material _skyboxMat;

    private float _prevSaturation;
    private Material _satMat;

    private float _prevWaterSatMult;
    private Material _waterMat;

    private int _insideCount = 0;
    private Coroutine _transitionRoutine;

    private void Awake()
    {
        // Skybox instance (optional)
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

        // Saturation material instance (optional)
        if (saturationMaterial != null && createSaturationMaterialInstance)
            _satMat = new Material(saturationMaterial);
        else
            _satMat = saturationMaterial;

        // Water material instance (optional)
        if (waterMaterial != null && createWaterMaterialInstance)
            _waterMat = new Material(waterMaterial);
        else
            _waterMat = waterMaterial;

#if UNITY_EDITOR
        // Capture defaults at start of Play Mode and restore when returning to Edit Mode
        if (Application.isPlaying)
        {
            EnsureEditorDefaultsCaptured(this);
            EnsurePlayModeHooked();
        }
#endif
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

        if (setFogEnabled) RenderSettings.fog = fogEnabledInside;

        StartTransition(
            targetFogDensity: fogDensityInside,
            targetFogColor: fogColorInside,
            applyFogColor: setFogColor,
            targetCloudiness: cloudinessInside,
            applyCloudiness: true,
            targetSaturation: saturationInside,
            applySaturation: true,
            targetWaterSatMult: waterSaturationMultiplierInside,
            applyWaterSatMult: true
        );
    }

    private void OnTriggerExit(Collider other)
    {
        if (!IsAllowed(other)) return;

        _insideCount = Mathf.Max(0, _insideCount - 1);
        if (_insideCount != 0) return;

        if (!revertOnExit) return;

        if (setFogEnabled) RenderSettings.fog = _prevFogEnabled;

        StartTransition(
            targetFogDensity: _prevFogDensity,
            targetFogColor: _prevFogColor,
            applyFogColor: setFogColor,
            targetCloudiness: _prevCloudiness,
            applyCloudiness: true,
            targetSaturation: _prevSaturation,
            applySaturation: true,
            targetWaterSatMult: _prevWaterSatMult,
            applyWaterSatMult: true
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

        _prevCloudiness = GetCloudiness();
        _prevSaturation = GetSaturation();
        _prevWaterSatMult = GetWaterSaturationMultiplier();
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

    private float GetSaturation()
    {
        if (_satMat == null) return 0f;
        if (!_satMat.HasProperty(saturationProperty)) return 0f;
        return _satMat.GetFloat(saturationProperty);
    }

    private void SetSaturation(float value)
    {
        if (_satMat == null) return;
        if (!_satMat.HasProperty(saturationProperty)) return;
        _satMat.SetFloat(saturationProperty, value);
    }

    private float GetWaterSaturationMultiplier()
    {
        if (_waterMat == null) return 1f;
        if (!_waterMat.HasProperty(waterSaturationMultiplierProperty)) return 1f;
        return _waterMat.GetFloat(waterSaturationMultiplierProperty);
    }

    private void SetWaterSaturationMultiplier(float value)
    {
        if (_waterMat == null) return;
        if (!_waterMat.HasProperty(waterSaturationMultiplierProperty)) return;
        _waterMat.SetFloat(waterSaturationMultiplierProperty, value);
    }

    private void StartTransition(
        float targetFogDensity,
        Color targetFogColor,
        bool applyFogColor,
        float targetCloudiness,
        bool applyCloudiness,
        float targetSaturation,
        bool applySaturation,
        float targetWaterSatMult,
        bool applyWaterSatMult
    )
    {
        if (_transitionRoutine != null)
            StopCoroutine(_transitionRoutine);

        float startFogDensity = RenderSettings.fogDensity;
        Color startFogColor = RenderSettings.fogColor;

        float startCloudiness = GetCloudiness();
        float startSaturation = GetSaturation();
        float startWaterSatMult = GetWaterSaturationMultiplier();

        if (transitionDuration <= 0f)
        {
            RenderSettings.fogDensity = targetFogDensity;
            if (applyFogColor) RenderSettings.fogColor = targetFogColor;
            if (applyCloudiness) SetCloudiness(targetCloudiness);
            if (applySaturation) SetSaturation(targetSaturation);
            if (applyWaterSatMult) SetWaterSaturationMultiplier(targetWaterSatMult);

            DynamicGI.UpdateEnvironment();
            return;
        }

        _transitionRoutine = StartCoroutine(TransitionRoutine(
            startFogDensity, targetFogDensity,
            startFogColor, targetFogColor,
            applyFogColor,
            startCloudiness, targetCloudiness,
            applyCloudiness,
            startSaturation, targetSaturation,
            applySaturation,
            startWaterSatMult, targetWaterSatMult,
            applyWaterSatMult,
            transitionDuration
        ));
    }

    private IEnumerator TransitionRoutine(
        float fromFogDensity, float toFogDensity,
        Color fromFogColor, Color toFogColor,
        bool applyFogColor,
        float fromCloudiness, float toCloudiness,
        bool applyCloudiness,
        float fromSaturation, float toSaturation,
        bool applySaturation,
        float fromWaterSatMult, float toWaterSatMult,
        bool applyWaterSatMult,
        float duration
    )
    {
        float t = 0f;

        while (t < duration)
        {
            float dt = useUnscaledTime ? Time.unscaledDeltaTime : Time.deltaTime;
            t += dt;

            float u = Mathf.Clamp01(t / duration);
            u = u * u * (3f - 2f * u); // smoothstep

            RenderSettings.fogDensity = Mathf.Lerp(fromFogDensity, toFogDensity, u);

            if (applyFogColor)
                RenderSettings.fogColor = Color.Lerp(fromFogColor, toFogColor, u);

            if (applyCloudiness)
                SetCloudiness(Mathf.Lerp(fromCloudiness, toCloudiness, u));

            if (applySaturation)
                SetSaturation(Mathf.Lerp(fromSaturation, toSaturation, u));

            if (applyWaterSatMult)
                SetWaterSaturationMultiplier(Mathf.Lerp(fromWaterSatMult, toWaterSatMult, u));

            yield return null;
        }

        RenderSettings.fogDensity = toFogDensity;
        if (applyFogColor) RenderSettings.fogColor = toFogColor;
        if (applyCloudiness) SetCloudiness(toCloudiness);
        if (applySaturation) SetSaturation(toSaturation);
        if (applyWaterSatMult) SetWaterSaturationMultiplier(toWaterSatMult);

        DynamicGI.UpdateEnvironment();
        _transitionRoutine = null;
    }

#if UNITY_EDITOR
    // =========================
    // Editor-only: restore defaults after stopping play
    // =========================

    private struct EditorDefaults
    {
        public bool fogEnabled;
        public float fogDensity;
        public Color fogColor;

        public Material skybox;
        public string cloudinessProp;
        public float skyboxCloudiness;
        public bool skyboxHasCloudiness;

        public Material saturationMatAsset;
        public string saturationProp;
        public float saturationValue;
        public bool saturationHasProp;

        public Material waterMatAsset;
        public string waterProp;
        public float waterValue;
        public bool waterHasProp;

        public bool valid;
    }

    private static bool s_hooked;
    private static bool s_captured;
    private static EditorDefaults s_defaults;

    private static void EnsurePlayModeHooked()
    {
        if (s_hooked) return;
        s_hooked = true;
        EditorApplication.playModeStateChanged += OnPlayModeStateChanged;
    }

    private static void EnsureEditorDefaultsCaptured(EnvironmentZone zone)
    {
        if (s_captured) return;

        var d = new EditorDefaults();

        d.fogEnabled = RenderSettings.fog;
        d.fogDensity = RenderSettings.fogDensity;
        d.fogColor = RenderSettings.fogColor;

        d.skybox = RenderSettings.skybox;
        d.cloudinessProp = zone != null ? zone.cloudinessProperty : "_Cloudiness";
        d.skyboxHasCloudiness = (d.skybox != null && d.skybox.HasProperty(d.cloudinessProp));
        d.skyboxCloudiness = d.skyboxHasCloudiness ? d.skybox.GetFloat(d.cloudinessProp) : 0f;

        d.saturationMatAsset = zone != null ? zone.saturationMaterial : null;
        d.saturationProp = zone != null ? zone.saturationProperty : "_Saturation";
        d.saturationHasProp = (d.saturationMatAsset != null && d.saturationMatAsset.HasProperty(d.saturationProp));
        d.saturationValue = d.saturationHasProp ? d.saturationMatAsset.GetFloat(d.saturationProp) : 0f;

        d.waterMatAsset = zone != null ? zone.waterMaterial : null;
        d.waterProp = zone != null ? zone.waterSaturationMultiplierProperty : "_WaterSaturationMultiplier";
        d.waterHasProp = (d.waterMatAsset != null && d.waterMatAsset.HasProperty(d.waterProp));
        d.waterValue = d.waterHasProp ? d.waterMatAsset.GetFloat(d.waterProp) : 1f;

        d.valid = true;

        s_defaults = d;
        s_captured = true;
    }

    private static void OnPlayModeStateChanged(PlayModeStateChange state)
    {
        // When Play Mode ends and we return to Edit Mode, restore what was present at Play start.
        if (state != PlayModeStateChange.EnteredEditMode) return;
        RestoreEditorDefaults();
    }

    private static void RestoreEditorDefaults()
    {
        if (!s_captured || !s_defaults.valid) return;

        RenderSettings.fog = s_defaults.fogEnabled;
        RenderSettings.fogDensity = s_defaults.fogDensity;
        RenderSettings.fogColor = s_defaults.fogColor;

        RenderSettings.skybox = s_defaults.skybox;
        if (s_defaults.skybox != null && s_defaults.skyboxHasCloudiness)
            s_defaults.skybox.SetFloat(s_defaults.cloudinessProp, s_defaults.skyboxCloudiness);

        if (s_defaults.saturationMatAsset != null && s_defaults.saturationHasProp)
            s_defaults.saturationMatAsset.SetFloat(s_defaults.saturationProp, s_defaults.saturationValue);

        if (s_defaults.waterMatAsset != null && s_defaults.waterHasProp)
            s_defaults.waterMatAsset.SetFloat(s_defaults.waterProp, s_defaults.waterValue);

        DynamicGI.UpdateEnvironment();

        // Allow fresh capture next Play session
        s_captured = false;
        s_defaults = default;
    }
#endif
}
