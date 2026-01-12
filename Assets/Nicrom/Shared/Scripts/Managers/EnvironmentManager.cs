using UnityEditor;
#if UNITY_EDITOR
using UnityEditor.SceneManagement;
#endif
using UnityEngine;
using UnityEngine.Rendering;

namespace Nicrom
{
    public enum GizmosVisibility
    {
        None,
        WhenSelected,
        AlwaysVisible
    }

    public enum TimePassage
    {
        None,
        Smooth,
        Step
    }

    public enum EnvironmentManagerUpdateMode
    {
        Automatic,
        Manual
    }

    [ExecuteInEditMode]
    public class EnvironmentManager : MonoBehaviour
    {
        #region Manager Settings
        public EnvironmentManagerUpdateMode envManagerUpdateMode = EnvironmentManagerUpdateMode.Automatic;
        public GizmosVisibility gizmosVisibility = GizmosVisibility.WhenSelected;
        public Color sunOrbitColor = Color.blue;
        public Color sunCirceColor = Color.white;
        public Color moonOrbitColor = Color.green;
        public Color moonCirceColor = Color.cyan;
        public bool showSunOrbit = true;
        public bool showSunCircle = true;
        public bool showMoonOrbit = true;
        public bool showMoonCircle = true;
        public bool showGradientTime = true;
        public bool showLightIntensity = true;
        public bool showPPVWeight = true;
        public bool drawFooterButtons = true;
        public int mainSettingsGroupSHToolbarIndex = 0;
        #endregion

        #region Main Settings
        public bool showManagerSettingsGroup = true;
        public EnvironmentProfile globalEnvProfile;
        public Light mainLight;
        public Light moonLight;
        public PPVManager ppvManager;

        public bool override_globalEnvProfile = true;
        public bool override_mainLight = true;
        public bool override_moonLight = true;
        public bool override_ppvManager = true;
        #endregion

        #region Day Night Cycle
        public bool showTimeGroup = true;
        public TimePassage timePassage = TimePassage.None;
        [Range(0, 24f)]  public float timeOfDay = 12;
        [Range(0, 120f)] public float dayLength = 10f;
        [Range(0, 300f)] public float timePassageStep = 0.25f;
        public bool overrideTimePassage = true;
        public bool overrideTimeOfDay = true;
        public bool overrideDayLength = true;
        public bool overrideTimePassageStep = true;
        #endregion

        #region Public
        public CloudShadows mainLightCloudShadows;
        public CloudShadows moonLightCloudShadows;
        public Vector3 sunX, sunY, sunZ;
        public Vector3 sunLookAtPos;
        public Vector3 sunRotatedDir;

        public Vector3 moonX, moonY, moonZ;
        public Vector3 moonLookAtPos;
        public Vector3 moonRotatedDir;

        public Vector3 starsX, starsY, starsZ;
        public Vector3 starsLookAtPos;
        public Vector3 starsRotatedDir;
        #endregion

        #region Private
        private EnvironmentProfile envProfile;
        private string skyboxShaderName = "Nicrom/ASE/Skybox";
        private float gradientTime = 0;
        private float timeCounter = 0;
        #endregion

        private void Start()
        {
#if UNITY_EDITOR
            PrefabStage prefabStage = PrefabStageUtility.GetCurrentPrefabStage();
            
            if (prefabStage == null)
                UpdateEnvironmentSettings(true);
#else
            UpdateEnvironmentSettings(true);
#endif
        }

        private void Update()
        {
            if (Application.isPlaying)
            {
                if (timePassage != TimePassage.None)
                    UpdateTimePassage();
            }
        }

        public void SetTimeOfDay(float timeOfDay)
        {
            this.timeOfDay = timeOfDay;
            UpdateEnvironmentSettings();
        }

        private void UpdateTimePassage()
        {
            timeOfDay += Time.deltaTime * (24 / (dayLength * 60));
            
            if (timeOfDay > 24)
                timeOfDay -= 24f;

            if (timePassage == TimePassage.Smooth)
            {
                UpdateEnvironmentSettings();
            }
            else
            {
                timeCounter += Time.deltaTime;
                
                if(timeCounter > timePassageStep)
                {
                    timeCounter -= timePassageStep;
                    UpdateEnvironmentSettings();
                }
            }
        }

        public void UpdateEnvironmentSettings(bool recreateCRT = false)
        {
            gradientTime = timeOfDay / 24f;

            if (globalEnvProfile != null)
            {
                envProfile = globalEnvProfile;
                
                if (mainLight != null)
                    UpdateMainLight(recreateCRT);

                if (moonLight != null)
                    UpdateMoonLight(recreateCRT);

                UpdateAmbientLight();
                UpdateEnvironmentFog();

                if (envProfile.skyboxMaterial != null && envProfile.skyboxMaterial.shader.name == skyboxShaderName)
                    UpdateSkyboxMaterial();
            }

            if (ppvManager != null)
                ppvManager.UpdateVolumes();
        }

        private void UpdateMainLight(bool recreateCRT = false)
        {
            if (mainLightCloudShadows != null)
            {
                if (envProfile.override_CloudShadowsState)
                    mainLightCloudShadows.cloudShadowsState = envProfile.cloudShadowsState;
                if (envProfile.override_MainLightCookieSize)
                    mainLightCloudShadows.lightCookieSize = envProfile.mainLightCookieSize;

                mainLightCloudShadows.cloudShadowsStrength = UpdateProperty(mainLightCloudShadows.cloudShadowsStrength,
                    envProfile.override_CloudShadowsStrength, envProfile.cloudShadowsStrength,
                    envProfile.override_CloudShadowsStrength_AC, envProfile.cloudShadowsStrength_AC);

                mainLightCloudShadows.UpdateCloudShadowsSettings(recreateCRT);
            }

            mainLight.intensity = UpdateProperty(mainLight.intensity,
                envProfile.override_MainLightIntensity, envProfile.mainLightIntensity,
                envProfile.override_MainLightIntensity_AC, envProfile.mainLightIntensity_AC);

            mainLight.shadowStrength = UpdateProperty(mainLight.shadowStrength,
                envProfile.override_MainLightShadowStrength, envProfile.mainLightShadowStrength,
                envProfile.override_MainLightShadowStrength_AC, envProfile.mainLightShadowStrength_AC);

            if (envProfile.override_MainLightColor)
                mainLight.color = envProfile.mainLightColorGrad.Evaluate(gradientTime);

            if (mainLight.intensity == 0 && mainLight.enabled)
                mainLight.enabled = false;
            if (mainLight.intensity > 0 && !mainLight.enabled)
                mainLight.enabled = true;

            if (override_mainLight && RenderSettings.sun != mainLight)
                RenderSettings.sun = mainLight;

            UpdateMainLightRotation();
        }

        private void UpdateMoonLight(bool recreateCRT = false)
        {
            if (moonLightCloudShadows != null)
            {
                if (envProfile.override_EnableMoonCloudShadows)
                    moonLightCloudShadows.cloudShadowsState = envProfile.enableMoonCloudShadows;
                if (envProfile.override_MoonLightCookieSize)
                    moonLightCloudShadows.lightCookieSize = envProfile.moonLightCookieSize;

                moonLightCloudShadows.cloudShadowsStrength = UpdateProperty(moonLightCloudShadows.cloudShadowsStrength,
                    envProfile.override_MoonCloudShadowsStrength, envProfile.moonCloudShadowsStrength,
                    envProfile.override_MoonCloudShadowsStrength_AC, envProfile.moonCloudShadowsStrength_AC);

                moonLightCloudShadows.UpdateCloudShadowsSettings(recreateCRT);
            }

            if (envProfile.enableMoonLight)
                moonLight.gameObject.SetActive(true);
            else
                moonLight.gameObject.SetActive(false);

            if(mainLight.enabled == true && moonLight.enabled == true)
                moonLight.enabled = false;

            if(mainLight.enabled == false && moonLight.enabled == false)
                moonLight.enabled = true;

            moonLight.intensity = UpdateProperty(moonLight.intensity,
                envProfile.override_MoonLightIntensity, envProfile.moonLightIntensity,
                envProfile.override_MoonLightIntensity_AC, envProfile.moonLightIntensity_AC);

            if (envProfile.override_MoonLightIntensityScale_AC)
                moonLight.intensity *= envProfile.moonLightIntensityScale_AC.Evaluate(envProfile.skyboxMaterial.GetFloat("_MoonPhase"));

            moonLight.shadowStrength = UpdateProperty(moonLight.shadowStrength,
                envProfile.override_MoonLightShadowStrength, envProfile.moonLightShadowStrength,
                envProfile.override_MoonLightShadowStrength_AC, envProfile.moonLightShadowStrength_AC);

            if (envProfile.override_MoonLightColor)
                moonLight.color = envProfile.moonLightColorGrad.Evaluate(gradientTime);

            UpdateMoonLightRotation();
        }

        private float UpdateProperty(float current, bool overrideA, float a, bool overrideB, AnimationCurve b)
        {
            float newVal = current;

            if (overrideA && overrideB)
            {
                newVal = a * b.Evaluate(gradientTime);
            }
            else
            {
                if (overrideA) newVal = a;
                if (overrideB) newVal = b.Evaluate(gradientTime);
            }

            return newVal;
        }

        public void UpdateMainLightRotation()
        {
            sunX = CalculatePositionOnSphere(-envProfile.mainLightAzimuth + 90, envProfile.mainLightAltitude);
            sunZ = new Vector3(Mathf.Cos((-envProfile.mainLightAzimuth + 180) * Mathf.Deg2Rad), 0, Mathf.Sin((-envProfile.mainLightAzimuth + 180) * Mathf.Deg2Rad)).normalized;
            sunY = Vector3.Cross(sunZ, sunX).normalized;

            sunRotatedDir = Quaternion.AngleAxis(timeOfDay * 15f, sunY) * sunX;
            sunLookAtPos = sunRotatedDir + mainLight.transform.position;

            mainLight.transform.LookAt(sunLookAtPos);
        }

        public void UpdateMoonLightRotation()
        {
            moonX = CalculatePositionOnSphere(-envProfile.moonLightAzimuth + 90, envProfile.moonLightAltitude);
            moonZ = new Vector3(Mathf.Cos((-envProfile.moonLightAzimuth + 180) * Mathf.Deg2Rad), 0, Mathf.Sin((-envProfile.moonLightAzimuth + 180) * Mathf.Deg2Rad)).normalized;
            moonY = Vector3.Cross(moonZ, moonX).normalized;

            float time = timeOfDay + envProfile.moonTimeOffset;
            
            if(time > 24)
                time -= 24;

            moonRotatedDir = Quaternion.AngleAxis(time * 15f, moonY) * moonX;
            moonLookAtPos = moonRotatedDir + moonLight.transform.position;

            moonLight.transform.LookAt(moonLookAtPos);
        }

        public void UpdateStarsRotation()
        {
            starsX = CalculatePositionOnSphere(-envProfile.moonLightAzimuth + 90, envProfile.moonLightAltitude);
            starsZ = new Vector3(Mathf.Cos((-envProfile.moonLightAzimuth + 180) * Mathf.Deg2Rad), 0, Mathf.Sin((-envProfile.moonLightAzimuth + 180) * Mathf.Deg2Rad)).normalized;
            starsY = Vector3.Cross(moonZ, moonX).normalized;

            starsRotatedDir = Quaternion.AngleAxis(timeOfDay * 15f, moonY) * moonX;
            starsLookAtPos = starsRotatedDir + moonLight.transform.position;
        }

        public Vector3 CalculatePositionOnSphere(float azimuth, float altitude)
        {
            float altitudeRad = altitude * Mathf.Deg2Rad;
            float azimuthRad = azimuth * Mathf.Deg2Rad;

            float x = Mathf.Cos(altitudeRad) * Mathf.Cos(azimuthRad);
            float y = Mathf.Sin(altitudeRad);
            float z = Mathf.Cos(altitudeRad) * Mathf.Sin(azimuthRad);

            return new Vector3(x, y, z);
        }

        private void UpdateAmbientLight()
        {
            if (envProfile.ambientLightSource == AmbienttLightSource.Skybox)
            {
                RenderSettings.ambientMode = AmbientMode.Skybox;

                if (envProfile.override_AmbientLightSkyboxInt && envProfile.override_AmbientLightSkyboxInt_AC) {
                    RenderSettings.ambientIntensity = envProfile.ambientLightSkyboxInt * envProfile.ambientLightSkyboxInt_AC.Evaluate(gradientTime);
                }
                else
                {
                    if (envProfile.override_AmbientLightSkyboxInt && !envProfile.override_AmbientLightSkyboxInt_AC)
                        RenderSettings.ambientIntensity = envProfile.ambientLightSkyboxInt;
                    else
                        RenderSettings.ambientIntensity = envProfile.ambientLightSkyboxInt_AC.Evaluate(gradientTime);
                }
            }
            else if (envProfile.ambientLightSource == AmbienttLightSource.Gradient)
            {
                RenderSettings.ambientMode = AmbientMode.Trilight;
                
                if(envProfile.override_AmbientSkyColor)
                    RenderSettings.ambientSkyColor = envProfile.ambientSkyColorGrad.Evaluate(gradientTime);
                if (envProfile.override_AmbientEquatorColor)
                    RenderSettings.ambientEquatorColor = envProfile.ambientEquatorColorGrad.Evaluate(gradientTime);
                if (envProfile.override_AmbientGroundColor)
                    RenderSettings.ambientGroundColor = envProfile.ambientGroundColorGrad.Evaluate(gradientTime);
            }
            else
            {
                RenderSettings.ambientMode = AmbientMode.Flat;

                if (envProfile.override_AmbientColor)
                    RenderSettings.ambientLight = envProfile.ambientColorGrad.Evaluate(gradientTime);
            }
        }

        private void UpdateEnvironmentFog()
        {
            if (envProfile.override_EnvFogState)
            {
                if (envProfile.envFogState)
                    RenderSettings.fog = true;
                else
                    RenderSettings.fog = false;
            }

            if(envProfile.envFogMode == EnvironmentFogMode.Linear)
            {
                RenderSettings.fogMode = FogMode.Linear;

                if (envProfile.override_EnvLinearFogStart)
                {
                    if (envProfile.override_EnvLinearFogStart_AC)
                        RenderSettings.fogStartDistance = envProfile.envLinearFogStart * envProfile.envLinearFogStart_AC.Evaluate(gradientTime);
                    else
                        RenderSettings.fogStartDistance = envProfile.envLinearFogStart;
                }

                if (envProfile.override_EnvLinearFogEnd)
                {
                    if (envProfile.override_EnvLinearFogEnd_AC)
                        RenderSettings.fogEndDistance = envProfile.envLinearFogEnd * envProfile.envLinearFogEnd_AC.Evaluate(gradientTime);
                    else
                        RenderSettings.fogEndDistance = envProfile.envLinearFogEnd;
                }
            }
            else if (envProfile.envFogMode == EnvironmentFogMode.Exponential)
            {
                RenderSettings.fogMode = FogMode.Exponential;

                if (envProfile.override_EnvExpFogDensity_AC)
                    RenderSettings.fogDensity = envProfile.envExpFogDensity * envProfile.envExpFogDensity_AC.Evaluate(gradientTime);
                else
                    RenderSettings.fogDensity = envProfile.envExpFogDensity ;
            }
            else
            {
                RenderSettings.fogMode = FogMode.ExponentialSquared;

                if(envProfile.override_EnvExpSquaredFogDensity_AC)
                    RenderSettings.fogDensity = envProfile.envExpSquaredFogDensity * envProfile.envExpSquaredFogDensity_AC.Evaluate(gradientTime);
                else
                    RenderSettings.fogDensity = envProfile.envExpSquaredFogDensity;
            }                

            if (envProfile.override_EnvFogColor)
            {
                RenderSettings.fogColor = envProfile.envFogColorGrad.Evaluate(gradientTime);
            }
        }

        private void UpdateSkyboxMaterial()
        {
            if (envProfile.override_skyboxMaterial && RenderSettings.skybox != envProfile.skyboxMaterial)
                RenderSettings.skybox = envProfile.skyboxMaterial;

            if (envProfile.override_SkyboxZenithColor)
                envProfile.skyboxMaterial.SetColor("_ZenithColor", envProfile.skyboxZenithColorGrad.Evaluate(gradientTime));
            if (envProfile.override_SkyboxZenithPower_AC)
                envProfile.skyboxMaterial.SetFloat("_ZenithPower", Mathf.Clamp01(envProfile.skyboxZenithPower_AC.Evaluate(gradientTime)));

            if (envProfile.override_SkyboxHorizonColor)
                envProfile.skyboxMaterial.SetColor("_HorizonColor", envProfile.skyboxHorizonColorGrad.Evaluate(gradientTime));
            if (envProfile.override_SkyboxHorizonScale_AC)
                envProfile.skyboxMaterial.SetFloat("_HorizonScale", Mathf.Clamp01(envProfile.skyboxHorizonScale_AC.Evaluate(gradientTime)));

            if (envProfile.override_SkyboxEquatorColor)
                envProfile.skyboxMaterial.SetColor("_EquatorColor", envProfile.skyboxEquatorColorGrad.Evaluate(gradientTime));
            if (envProfile.override_SkyboxEquatorOpacity_AC)
                envProfile.skyboxMaterial.SetFloat("_EquatorOpacity", Mathf.Clamp01(envProfile.skyboxEquatorOpacity_AC.Evaluate(gradientTime)));
            if (envProfile.override_SkyboxEquatorMinRadius_AC)
                envProfile.skyboxMaterial.SetFloat("_EquatorMinRadius", Mathf.Clamp01(envProfile.skyboxEquatorMinRadius_AC.Evaluate(gradientTime)));
            if (envProfile.override_SkyboxEquatorMaxRadius_AC)
                envProfile.skyboxMaterial.SetFloat("_EquatorMaxRadius", Mathf.Clamp01(envProfile.skyboxEquatorMaxRadius_AC.Evaluate(gradientTime)));
            if (envProfile.override_SkyboxEquatorPower_AC)
                envProfile.skyboxMaterial.SetFloat("_EquatorPower", Mathf.Clamp01(envProfile.skyboxEquatorPower_AC.Evaluate(gradientTime)));

            if (envProfile.override_SkyboxGroundColor)
                envProfile.skyboxMaterial.SetColor("_GroundColor", envProfile.skyboxGroundColorGrad.Evaluate(gradientTime));

            if (envProfile.override_SkyboxCloudsColor)
                envProfile.skyboxMaterial.SetColor("_CloudsColor", envProfile.skyboxCloudsColorGrad.Evaluate(gradientTime));


            if (envProfile.override_SkyboxSunDiskColor)
                envProfile.skyboxMaterial.SetColor("_SunColor", envProfile.skyboxSunDiskColorGrad.Evaluate(gradientTime));

            if (envProfile.override_SkyboxStarsOpacity)
                envProfile.skyboxMaterial.SetFloat("_StarsOpacity", Mathf.Clamp01(envProfile.skyboxStarsOpacity_AC.Evaluate(gradientTime)));

            if (envProfile.override_SkyboxCloudsOpacity_AC)
                envProfile.skyboxMaterial.SetFloat("_CloudsOpacity", Mathf.Clamp01(envProfile.skyboxCloudsOpacity_AC.Evaluate(gradientTime)));

            if (envProfile.override_SkyboxFogState)
            {
                if (envProfile.skyboxFogState)
                {
                    envProfile.skyboxMaterial.EnableKeyword("_FOG_ON");
                    envProfile.skyboxMaterial.SetFloat("_Fog", 1);
                }
                else
                {
                    envProfile.skyboxMaterial.SetFloat("_Fog", 0);
                    envProfile.skyboxMaterial.DisableKeyword("_FOG_ON");
                }
            }

            if (envProfile.override_SkyboxFogStartNH_AC)
                envProfile.skyboxMaterial.SetFloat("_FogStartNH", Mathf.Clamp01(envProfile.skyboxFogStartNH_AC.Evaluate(gradientTime)));

            if (envProfile.override_SkyboxFogEndNH_AC)
                envProfile.skyboxMaterial.SetFloat("_FogEndNH", Mathf.Clamp01(envProfile.skyboxFogEndNH_AC.Evaluate(gradientTime)));

            if (envProfile.override_SkyboxFogStartSH_AC)
                envProfile.skyboxMaterial.SetFloat("_FogStartSH", Mathf.Clamp01(envProfile.skyboxFogStartSH_AC.Evaluate(gradientTime)));

            if (envProfile.override_SkyboxFogEndSH_AC)
                envProfile.skyboxMaterial.SetFloat("_FogEndSH", Mathf.Clamp01(envProfile.skyboxFogEndSH_AC.Evaluate(gradientTime)));

            if (envProfile.override_SkyboxFogOpacity_AC)
                envProfile.skyboxMaterial.SetFloat("_FogOpacity", Mathf.Clamp01(envProfile.skyboxFogOpacity_AC.Evaluate(gradientTime)));

            if (envProfile.override_SkyboxMoonOpacity_AC)
                envProfile.skyboxMaterial.SetFloat("_MoonOpacity", Mathf.Clamp01(envProfile.skyboxMoonOpacity_AC.Evaluate(gradientTime)));

            Shader.SetGlobalFloat("Nicrom_SunRotationAngle", timeOfDay * 15f);
            Shader.SetGlobalVector("Nicrom_SunRotationAxis", -sunY);
            Shader.SetGlobalVector("Nicrom_Skybox_MoonDir", moonRotatedDir);
        }
#if UNITY_EDITOR
        private void OnDrawGizmos()
        {
            if (gizmosVisibility == GizmosVisibility.AlwaysVisible)
                DrawGizmos();
        }

        public void DrawGizmos()
        {
            transform.position = SceneView.currentDrawingSceneView.camera.transform.position;

            if (showSunOrbit)
            {
                Handles.color = sunOrbitColor;
                Handles.DrawWireArc(transform.position, sunY, Quaternion.AngleAxis(3f, sunY) * -sunRotatedDir, 354, 3000, 1);
            }

            if (showSunCircle)
            {
                Handles.color = sunCirceColor;
                Handles.DrawWireArc(transform.position - sunRotatedDir * 3000, sunRotatedDir, sunY, 360, 150f, 1);
            }

            if (moonLight != null && envProfile.enableMoonLight)
            {
                float moonDiskScale = 0.1f;

                if (envProfile.skyboxMaterial != null && envProfile.skyboxMaterial.HasFloat("_MoonSize"))
                    moonDiskScale = envProfile.skyboxMaterial.GetFloat("_MoonSize");

                if (showMoonOrbit)
                {
                    Handles.color = Color.green;
                    //Handles.DrawWireArc(transform.position, moonY, Quaternion.AngleAxis(8f, moonY) * -moonRotatedDir, 344, 3000, 1);
                    Handles.DrawWireArc(transform.position, moonY, Quaternion.AngleAxis(180f * moonDiskScale * 0.5f, moonY) * -moonRotatedDir, 360 - (180f * moonDiskScale), 3000, 1);
                }

                if (showMoonCircle)
                {
                    Handles.color = Color.cyan;
                    Handles.DrawWireArc(transform.position - moonRotatedDir * 3000, moonRotatedDir, moonY, 360, 400f * moonDiskScale * 10f, 1);
                }
            }
        }
#endif
    }
}
