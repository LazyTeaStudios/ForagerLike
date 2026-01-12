using UnityEngine;

namespace Nicrom
{
    public enum EnvironmentFogMode
    {
        Linear,
        Exponential,
        ExponentialSquared
    }

    public enum AmbienttLightSource
    {
        Skybox,
        Gradient,
        Color
    }

    public class EnvironmentProfile : ScriptableObject
    {
        public int selectedToolBar = 0;

        #region Sun Light
        public Gradient mainLightColorGrad;
        public AnimationCurve mainLightIntensity_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public AnimationCurve mainLightShadowStrength_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        [Range(0, 5f)]  public float mainLightIntensity = 1f;
        [Range(0, 1f)]  public float mainLightShadowStrength = 1f;
        [Range(0, 90)]  public float mainLightAltitude = 90f;
        [Range(0, 360)] public float mainLightAzimuth = 0;
        [Range(0, 500)] public int mainLightCookieSize = 80;

        public bool mainLightHasCloudShadows = false;
        public bool showDirectionalLightGroup = true;
        public bool override_MainLightColor = true;
        public bool override_MainLightAltitude = true;
        public bool override_MainLightAzimuth = true;
        public bool override_MainLightIntensity = true;
        public bool override_MainLightShadowStrength = true;
        public bool override_MainLightCookieSize = true;
        public bool override_MainLightIntensity_AC = true;
        public bool override_MainLightShadowStrength_AC = true;
        public int mainLightGroupSHToolbarIndex = 0;
        #endregion

        #region Moon Light
        public Gradient moonLightColorGrad;
        public AnimationCurve moonLightIntensity_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public AnimationCurve moonLightIntensityScale_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public AnimationCurve moonLightShadowStrength_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        [Range(0, 24f)] public float moonTimeOffset = 12f;
        [Range(0, 5f)]  public float moonLightIntensity = 1f;
        [Range(0, 1f)]  public float moonLightShadowStrength = 1f;
        [Range(0, 90)]  public float moonLightAltitude = 90f;
        [Range(0, 360)] public float moonLightAzimuth = 0;
        [Range(0, 500)] public int moonLightCookieSize = 80;

        public bool moonLightHasCloudShadows = false;
        public bool showMoonLightGroup = true;
        public bool enableMoonLight = true;

        public bool override_MoonTimeOffset = true;
        public bool override_MoonLightColor = true;
        public bool override_MoonLightAltitude = true;
        public bool override_MoonLightAzimuth = true;
        public bool override_MoonLightIntensity = true;
        public bool override_MoonLightShadowStrength = true;
        public bool override_MoonLightCookieSize = true;
        public bool override_MoonLightIntensity_AC = true;
        public bool override_MoonLightIntensityScale_AC = true;
        public bool override_MoonLightShadowStrength_AC = true;
        public bool override_enableMoonLight = true;
        public int moonLightGroupSHToolbarIndex = 0;
        #endregion

        #region Ambient Light
        public AnimationCurve ambientLightSkyboxInt_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public AmbienttLightSource ambientLightSource = AmbienttLightSource.Skybox;
        public Gradient ambientSkyColorGrad;
        public Gradient ambientEquatorColorGrad;
        public Gradient ambientGroundColorGrad;
        public Gradient ambientColorGrad;

        [Range(0, 8f)]
        public float ambientLightSkyboxInt = 1;
        public bool showAmbientLightGroup = true;
        public bool override_AmbientLightSource = true;
        public bool override_AmbientSkyColor = true;
        public bool override_AmbientEquatorColor = true;
        public bool override_AmbientGroundColor = true;
        public bool override_AmbientColor = true;
        public bool override_AmbientLightSkyboxInt = true;
        public bool override_AmbientLightSkyboxInt_AC = true;

        public int ambientLightGroupSHToolbarIndex = 0;
        #endregion

        #region Cloud Shadows from Sun Light
        [Range(0, 1f)] public float cloudShadowsStrength= 0.6f;
        public AnimationCurve cloudShadowsStrength_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public bool cloudShadowsState = true;
        public bool override_CloudShadowsState = true;
        public bool override_CloudShadowsStrength = true;
        public bool override_CloudShadowsStrength_AC = true;
        #endregion

        #region Cloud Shadows from Moon Light
        [Range(0, 1f)] public float moonCloudShadowsStrength = 0.6f;
        public AnimationCurve moonCloudShadowsStrength_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public bool enableMoonCloudShadows = true;
        public bool override_EnableMoonCloudShadows = true;
        public bool override_MoonCloudShadowsStrength = true;
        public bool override_MoonCloudShadowsStrength_AC = true;
        #endregion

        #region Fog
        public EnvironmentFogMode envFogMode = EnvironmentFogMode.Linear;
        public AnimationCurve envLinearFogStart_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public AnimationCurve envLinearFogEnd_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public AnimationCurve envExpFogDensity_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public AnimationCurve envExpSquaredFogDensity_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public Gradient envFogColorGrad;
        [Range(0, 2000f)]
        public float envLinearFogStart = 10f;
        [Range(0, 5000f)]
        public float envLinearFogEnd = 800f;
        [Range(0, 1f)]
        public float envExpFogDensity = 0.01f;
        [Range(0, 1f)]
        public float envExpSquaredFogDensity = 0.01f;
        public bool showEnvFogGroup = true;
        public bool envFogState = true;
        public bool override_EnvFogState = true;
        public bool override_EnvFogMode = true;
        public bool override_EnvFogColor = true;
        public bool override_EnvLinearFogStart = true;
        public bool override_EnvLinearFogEnd = true;
        public bool override_EnvExpFogDensity = true;
        public bool override_EnvExpSquaredFogDensity = true;
        public bool override_EnvLinearFogStart_AC = true;
        public bool override_EnvLinearFogEnd_AC = true;
        public bool override_EnvExpFogDensity_AC = true;
        public bool override_EnvExpSquaredFogDensity_AC = true;

        public int envFogGroupSHToolbarIndex = 0;
        #endregion

        #region Skybox
        public AnimationCurve skyboxStarsOpacity_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public AnimationCurve skyboxCloudsOpacity_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public AnimationCurve skyboxFogStartNH_AC = AnimationCurve.EaseInOut(0, 0f, 1f, 0f);
        public AnimationCurve skyboxFogEndNH_AC = AnimationCurve.EaseInOut(0, 0.3f, 1f, 0.3f);
        public AnimationCurve skyboxFogStartSH_AC = AnimationCurve.EaseInOut(0, 0.1f, 1f, 0.1f);
        public AnimationCurve skyboxFogEndSH_AC = AnimationCurve.EaseInOut(0, 0.4f, 1f, 0.4f);
        public AnimationCurve skyboxFogOpacity_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);
        public AnimationCurve skyboxMoonOpacity_AC = AnimationCurve.EaseInOut(0, 1f, 1f, 1f);

        public AnimationCurve skyboxZenithPower_AC = AnimationCurve.EaseInOut(0, 0.03f, 1f, 0.03f);
        public AnimationCurve skyboxHorizonScale_AC = AnimationCurve.EaseInOut(0, 0.1f, 1f, 0.1f);
        public AnimationCurve skyboxEquatorOpacity_AC = AnimationCurve.EaseInOut(0, 0.2f, 1f, 0.2f);
        public AnimationCurve skyboxEquatorMinRadius_AC = AnimationCurve.EaseInOut(0, 0.0f, 1f, 0.0f);
        public AnimationCurve skyboxEquatorMaxRadius_AC = AnimationCurve.EaseInOut(0, 0.3f, 1f, 0.3f);
        public AnimationCurve skyboxEquatorPower_AC = AnimationCurve.EaseInOut(0, 0.1f, 1f, 0.1f);
        public AnimationCurve skyboxGroundPower_AC = AnimationCurve.EaseInOut(0, 0.06f, 1f, 0.06f);

        public Material skyboxMaterial;
        public Gradient skyboxZenithColorGrad;
        public Gradient skyboxHorizonColorGrad;
        public Gradient skyboxEquatorColorGrad;
        public Gradient skyboxGroundColorGrad;
        public Gradient skyboxCloudsColorGrad;
        public Gradient skyboxSunDiskColorGrad;

        public int skyboxColorGroupSHToolbarIndex = 0;
        public int skyboxSkyObjectsGroupSHToolbarIndex = 0;
        public int skyboxFogGroupSHToolbarIndex = 0;
        public bool showSkyboxMaterialGroup = true;
        public bool showSkyboxColorGroup = true;
        public bool showSkyboxSkyObjectsGroup = true;
        public bool showSkyboxFogGroup = true;
        public bool skyboxFogState = true;
        public bool override_SkyboxFogState = true;
        public bool override_SkyboxFogStartNH_AC = true;
        public bool override_SkyboxFogEndNH_AC = true;
        public bool override_SkyboxFogStartSH_AC = true;
        public bool override_SkyboxFogEndSH_AC = true;
        public bool override_SkyboxFogOpacity_AC = true;
        public bool override_SkyboxZenithColor = true;
        public bool override_SkyboxHorizonColor = true;
        public bool override_SkyboxEquatorColor = true;
        public bool override_SkyboxCloudsColor = true;
        public bool override_SkyboxCloudsOpacity_AC = true;
        public bool override_SkyboxSunDiskColor = true;
        public bool override_SkyboxStarsOpacity = true;
        public bool override_SkyboxMoonOpacity_AC = true;

        public bool override_skyboxMaterial = true;
        public bool override_SkyboxZenithPower_AC = true;
        public bool override_SkyboxHorizonScale_AC = true;
        public bool override_SkyboxEquatorOpacity_AC = true;
        public bool override_SkyboxEquatorMinRadius_AC = true;
        public bool override_SkyboxEquatorMaxRadius_AC = true;
        public bool override_SkyboxEquatorPower_AC = true;
        public bool override_SkyboxGroundColor = true;
        public bool override_SkyboxGroundPower_AC = true;
        public bool showSkyboxMI = false;
        public bool override_showSkyboxMI = true;

        #endregion
    }
}
