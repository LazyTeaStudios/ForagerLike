using UnityEngine;
using UnityEditor;

namespace Nicrom
{
    [CustomEditor(typeof(EnvironmentProfile))]
    public class EnvironmentProfile_Editor : Editor
    {
        SerializedProperty override_MainLightAltitude,          mainLightAltitude;
        SerializedProperty override_MainLightAzimuth,           mainLightAzimuth;
        SerializedProperty override_MainLightColor,             mainLightColorGrad;
        SerializedProperty override_MainLightIntensity,         mainLightIntensity;
        SerializedProperty override_MainLightShadowStrength_AC, mainLightShadowStrength_AC;
        SerializedProperty override_MainLightShadowStrength,    mainLightShadowStrength;
        SerializedProperty override_MainLightCookieSize,        mainLightCookieSize;
        SerializedProperty override_MainLightIntensity_AC,      mainLightIntensity_AC;

        SerializedProperty override_MoonTimeOffset,             moonTimeOffset;
        SerializedProperty override_MoonLightAltitude,          moonLightAltitude;
        SerializedProperty override_MoonLightAzimuth,           moonLightAzimuth;
        SerializedProperty override_MoonLightColor,             moonLightColorGrad;
        SerializedProperty override_MoonLightIntensity,         moonLightIntensity;
        SerializedProperty override_MoonLightIntensityScale_AC, moonLightIntensityScale_AC;
        SerializedProperty override_MoonLightShadowStrength_AC, moonLightShadowStrength_AC;
        SerializedProperty override_MoonLightShadowStrength,    moonLightShadowStrength;
        SerializedProperty override_MoonLightCookieSize,        moonLightCookieSize;
        SerializedProperty override_MoonLightIntensity_AC,      moonLightIntensity_AC;
        SerializedProperty override_enableMoonLight,            enableMoonLight;

        SerializedProperty override_AmbientLightSource,         ambientLightSource;
        SerializedProperty override_AmbientSkyColor,            ambientSkyColorGrad;
        SerializedProperty override_AmbientEquatorColor,        ambientEquatorColorGrad;
        SerializedProperty override_AmbientGroundColor,         ambientGroundColorGrad;
        SerializedProperty override_AmbientColorGrad,           ambientColorGrad;
        SerializedProperty override_AmbientLightSkyboxInt,      ambientLightSkyboxInt;
        SerializedProperty override_AmbientLightSkyboxInt_AC,   ambientLightSkyboxInt_AC;

        SerializedProperty override_EnvFogState,                envFogState;
        SerializedProperty override_EnvFogMode,                 envFogMode;
        SerializedProperty override_EnvFogColor,                envFogColorGrad;
        SerializedProperty override_EnvLinearFogStart,          envLinearFogStart;
        SerializedProperty override_EnvLinearFogStart_AC,       envLinearFogStart_AC;
        SerializedProperty override_EnvLinearFogEnd,            envLinearFogEnd;
        SerializedProperty override_EnvLinearFogEnd_AC,         envLinearFogEnd_AC;
        SerializedProperty override_EnvExpFogDensity,           envExpFogDensity;
        SerializedProperty override_EnvExpFogDensity_AC,        envExpFogDensity_AC;
        SerializedProperty override_EnvExpSquaredFogDensity,    envExpSquaredFogDensity;
        SerializedProperty override_EnvExpSquaredFogDensity_AC, envExpSquaredFogDensity_AC;

        SerializedProperty override_SkyboxMaterial,             skyboxMaterial;
        SerializedProperty override_SkyboxEquatorOpacity_AC,    skyboxEquatorOpacity_AC;
        SerializedProperty override_SkyboxEquatorMinRadius_AC,  skyboxEquatorMinRadius_AC;
        SerializedProperty override_SkyboxEquatorMaxRadius_AC,  skyboxEquatorMaxRadius_AC;
        SerializedProperty override_SkyboxEquatorPower_AC,      skyboxEquatorPower_AC;
        SerializedProperty override_SkyboxGroundColor,          skyboxGroundColorGrad;
        SerializedProperty override_SkyboxGroundPower_AC,       skyboxGroundPower_AC;

        SerializedProperty override_SkyboxZenithColor,          skyboxZenithColorGrad;
        SerializedProperty override_SkyboxZenithPower_AC,       skyboxZenithPower_AC;
        SerializedProperty override_SkyboxHorizonColor,         skyboxHorizonColorGrad;
        SerializedProperty override_SkyboxHorizonScale_AC,      skyboxHorizonScale_AC;
        SerializedProperty override_SkyboxEquatorColor,         skyboxEquatorColorGrad;
        SerializedProperty override_SkyboxCloudsColor,          skyboxCloudsColorGrad;
        SerializedProperty override_SkyboxStarsOpacity,         skyboxStarsOpacity_AC;
        SerializedProperty override_SkyboxSunDiskColor,         skyboxSunDiskColorGrad;
        SerializedProperty override_SkyboxCloudsOpacity_AC,     skyboxCloudsOpacity_AC;
        SerializedProperty override_SkyboxFogState,             skyboxFogState;
        SerializedProperty override_SkyboxFogStartNH_AC,        skyboxFogStartNH_AC;
        SerializedProperty override_SkyboxFogEndNH_AC,          skyboxFogEndNH_AC;
        SerializedProperty override_SkyboxFogStartSH_AC,        skyboxFogStartSH_AC;
        SerializedProperty override_SkyboxFogEndSH_AC,          skyboxFogEndSH_AC;
        SerializedProperty override_SkyboxFogOpacity_AC,        skyboxFogOpacity_AC;
        SerializedProperty override_SkyboxMoonOpacity_AC,       skyboxMoonOpacity_AC;
        SerializedProperty override_showSkyboxMI,               showSkyboxMI;

        SerializedProperty override_CloudShadowsState,          cloudShadowsState;
        SerializedProperty override_CloudShadowsStrength,       cloudShadowsStrength;
        SerializedProperty override_CloudShadowsStrength_AC,    cloudShadowsStrength_AC;

        SerializedProperty override_EnableMoonCloudShadows,         enableMoonCloudShadows;
        SerializedProperty override_MoonCloudShadowsStrength,       moonCloudShadowsStrength;
        SerializedProperty override_MoonCloudShadowsStrength_AC,    moonCloudShadowsStrength_AC;

        private string[] profileToolBarTitles = { "Light", "Fog", "Skybox" };
        private Editor skyboxMaterialEditor;
        private GUIStyle foldoutStyle;
        private EnvironmentProfile envProfile;
        private EnvironmentManager envManager;
        private int shToolbarIndex;
        private GUIContent[] showHideGUIContentArray;

        private string shaderName = "Nicrom/ASE/Skybox";

        private void OnEnable()
        {
            envProfile = (EnvironmentProfile) target;
            envManager = FindFirstObjectByType<EnvironmentManager>();

            showHideGUIContentArray = new GUIContent[2];
            showHideGUIContentArray[0] = new GUIContent("Show", "Shows all the settings.");
            showHideGUIContentArray[1] = new GUIContent("Hide", "Hides the settings that are disabled.");

            FindProperties();
        }

        private void OnDisable()
        {
            envManager = null;
        }

        private void FindProperties()
        {
            mainLightAltitude                   = serializedObject.FindProperty("mainLightAltitude");
            mainLightAzimuth                    = serializedObject.FindProperty("mainLightAzimuth");
            mainLightColorGrad                  = serializedObject.FindProperty("mainLightColorGrad");
            mainLightIntensity                  = serializedObject.FindProperty("mainLightIntensity");
            mainLightIntensity_AC               = serializedObject.FindProperty("mainLightIntensity_AC");
            mainLightShadowStrength             = serializedObject.FindProperty("mainLightShadowStrength");
            mainLightShadowStrength_AC          = serializedObject.FindProperty("mainLightShadowStrength_AC");
            mainLightCookieSize                 = serializedObject.FindProperty("mainLightCookieSize");

            override_MainLightAltitude          = serializedObject.FindProperty("override_MainLightAltitude");
            override_MainLightAzimuth           = serializedObject.FindProperty("override_MainLightAzimuth");
            override_MainLightColor             = serializedObject.FindProperty("override_MainLightColor");
            override_MainLightCookieSize        = serializedObject.FindProperty("override_MainLightCookieSize");
            override_MainLightIntensity         = serializedObject.FindProperty("override_MainLightIntensity");
            override_MainLightShadowStrength    = serializedObject.FindProperty("override_MainLightShadowStrength");
            override_MainLightIntensity_AC      = serializedObject.FindProperty("override_MainLightIntensity_AC");
            override_MainLightShadowStrength_AC = serializedObject.FindProperty("override_MainLightShadowStrength_AC");

            enableMoonLight                     = serializedObject.FindProperty("enableMoonLight");
            moonTimeOffset                      = serializedObject.FindProperty("moonTimeOffset");
            moonLightAltitude                   = serializedObject.FindProperty("moonLightAltitude");
            moonLightAzimuth                    = serializedObject.FindProperty("moonLightAzimuth");
            moonLightColorGrad                  = serializedObject.FindProperty("moonLightColorGrad");
            moonLightIntensity                  = serializedObject.FindProperty("moonLightIntensity");
            moonLightIntensity_AC               = serializedObject.FindProperty("moonLightIntensity_AC");
            moonLightIntensityScale_AC          = serializedObject.FindProperty("moonLightIntensityScale_AC");
            moonLightShadowStrength             = serializedObject.FindProperty("moonLightShadowStrength");
            moonLightShadowStrength_AC          = serializedObject.FindProperty("moonLightShadowStrength_AC");
            moonLightCookieSize                 = serializedObject.FindProperty("moonLightCookieSize");

            override_enableMoonLight            = serializedObject.FindProperty("override_enableMoonLight");
            override_MoonTimeOffset             = serializedObject.FindProperty("override_MoonTimeOffset");
            override_MoonLightAltitude          = serializedObject.FindProperty("override_MoonLightAltitude");
            override_MoonLightAzimuth           = serializedObject.FindProperty("override_MoonLightAzimuth");
            override_MoonLightColor             = serializedObject.FindProperty("override_MoonLightColor");
            override_MoonLightCookieSize        = serializedObject.FindProperty("override_MoonLightCookieSize");
            override_MoonLightIntensity         = serializedObject.FindProperty("override_MoonLightIntensity");
            override_MoonLightShadowStrength    = serializedObject.FindProperty("override_MoonLightShadowStrength");
            override_MoonLightIntensity_AC      = serializedObject.FindProperty("override_MoonLightIntensity_AC");
            override_MoonLightIntensityScale_AC = serializedObject.FindProperty("override_MoonLightIntensityScale_AC");
            override_MoonLightShadowStrength_AC = serializedObject.FindProperty("override_MoonLightShadowStrength_AC");

            ambientLightSource                  = serializedObject.FindProperty("ambientLightSource");
            ambientSkyColorGrad                 = serializedObject.FindProperty("ambientSkyColorGrad");
            ambientEquatorColorGrad             = serializedObject.FindProperty("ambientEquatorColorGrad");
            ambientGroundColorGrad              = serializedObject.FindProperty("ambientGroundColorGrad");
            ambientColorGrad                    = serializedObject.FindProperty("ambientColorGrad");
            ambientLightSkyboxInt               = serializedObject.FindProperty("ambientLightSkyboxInt");
            ambientLightSkyboxInt_AC            = serializedObject.FindProperty("ambientLightSkyboxInt_AC");
            override_AmbientLightSource         = serializedObject.FindProperty("override_AmbientLightSource");
            override_AmbientSkyColor            = serializedObject.FindProperty("override_AmbientSkyColor");
            override_AmbientEquatorColor        = serializedObject.FindProperty("override_AmbientEquatorColor");
            override_AmbientGroundColor         = serializedObject.FindProperty("override_AmbientGroundColor");
            override_AmbientColorGrad           = serializedObject.FindProperty("override_AmbientColor");
            override_AmbientLightSkyboxInt      = serializedObject.FindProperty("override_AmbientLightSkyboxInt");
            override_AmbientLightSkyboxInt_AC   = serializedObject.FindProperty("override_AmbientLightSkyboxInt_AC");

            envFogState                         = serializedObject.FindProperty("envFogState");
            envFogMode                          = serializedObject.FindProperty("envFogMode");
            envFogColorGrad                     = serializedObject.FindProperty("envFogColorGrad");
            envLinearFogStart                   = serializedObject.FindProperty("envLinearFogStart");
            envLinearFogStart_AC                = serializedObject.FindProperty("envLinearFogStart_AC");
            envLinearFogEnd                     = serializedObject.FindProperty("envLinearFogEnd");
            envLinearFogEnd_AC                  = serializedObject.FindProperty("envLinearFogEnd_AC");
            envExpFogDensity                    = serializedObject.FindProperty("envExpFogDensity");
            envExpFogDensity_AC                 = serializedObject.FindProperty("envExpFogDensity_AC");
            envExpSquaredFogDensity             = serializedObject.FindProperty("envExpSquaredFogDensity");
            envExpSquaredFogDensity_AC          = serializedObject.FindProperty("envExpSquaredFogDensity_AC");
            override_EnvFogState                = serializedObject.FindProperty("override_EnvFogState");
            override_EnvFogMode                 = serializedObject.FindProperty("override_EnvFogMode");
            override_EnvFogColor                = serializedObject.FindProperty("override_EnvFogColor");
            override_EnvLinearFogStart          = serializedObject.FindProperty("override_EnvLinearFogStart");
            override_EnvLinearFogEnd            = serializedObject.FindProperty("override_EnvLinearFogEnd");
            override_EnvExpFogDensity           = serializedObject.FindProperty("override_EnvExpFogDensity");
            override_EnvExpSquaredFogDensity    = serializedObject.FindProperty("override_EnvExpSquaredFogDensity");
            override_EnvLinearFogStart_AC       = serializedObject.FindProperty("override_EnvLinearFogStart_AC");
            override_EnvLinearFogEnd_AC         = serializedObject.FindProperty("override_EnvLinearFogEnd_AC");
            override_EnvExpFogDensity_AC        = serializedObject.FindProperty("override_EnvExpFogDensity_AC");
            override_EnvExpSquaredFogDensity_AC = serializedObject.FindProperty("override_EnvExpSquaredFogDensity_AC");

            skyboxMaterial                      = serializedObject.FindProperty("skyboxMaterial");
            skyboxZenithColorGrad               = serializedObject.FindProperty("skyboxZenithColorGrad");
            skyboxZenithPower_AC                = serializedObject.FindProperty("skyboxZenithPower_AC");
            skyboxHorizonColorGrad              = serializedObject.FindProperty("skyboxHorizonColorGrad");
            skyboxHorizonScale_AC               = serializedObject.FindProperty("skyboxHorizonScale_AC");
            skyboxEquatorColorGrad              = serializedObject.FindProperty("skyboxEquatorColorGrad");
            skyboxEquatorOpacity_AC             = serializedObject.FindProperty("skyboxEquatorOpacity_AC");
            skyboxEquatorMinRadius_AC           = serializedObject.FindProperty("skyboxEquatorMinRadius_AC");
            skyboxEquatorMaxRadius_AC           = serializedObject.FindProperty("skyboxEquatorMaxRadius_AC");
            skyboxEquatorPower_AC               = serializedObject.FindProperty("skyboxEquatorPower_AC");
            skyboxGroundColorGrad               = serializedObject.FindProperty("skyboxGroundColorGrad");
            skyboxGroundPower_AC                = serializedObject.FindProperty("skyboxGroundPower_AC");
            skyboxCloudsColorGrad               = serializedObject.FindProperty("skyboxCloudsColorGrad");
            skyboxSunDiskColorGrad              = serializedObject.FindProperty("skyboxSunDiskColorGrad");
            skyboxStarsOpacity_AC               = serializedObject.FindProperty("skyboxStarsOpacity_AC");
            skyboxCloudsOpacity_AC              = serializedObject.FindProperty("skyboxCloudsOpacity_AC");
            skyboxMoonOpacity_AC                = serializedObject.FindProperty("skyboxMoonOpacity_AC");

            override_SkyboxMaterial             = serializedObject.FindProperty("override_skyboxMaterial");
            override_SkyboxZenithColor          = serializedObject.FindProperty("override_SkyboxZenithColor");
            override_SkyboxZenithPower_AC       = serializedObject.FindProperty("override_SkyboxZenithPower_AC");
            override_SkyboxHorizonColor         = serializedObject.FindProperty("override_SkyboxHorizonColor");
            override_SkyboxHorizonScale_AC      = serializedObject.FindProperty("override_SkyboxHorizonScale_AC");
            override_SkyboxEquatorColor         = serializedObject.FindProperty("override_SkyboxEquatorColor");
            override_SkyboxEquatorOpacity_AC    = serializedObject.FindProperty("override_SkyboxEquatorOpacity_AC");
            override_SkyboxEquatorMinRadius_AC  = serializedObject.FindProperty("override_SkyboxEquatorMinRadius_AC");
            override_SkyboxEquatorMaxRadius_AC  = serializedObject.FindProperty("override_SkyboxEquatorMaxRadius_AC");
            override_SkyboxEquatorPower_AC      = serializedObject.FindProperty("override_SkyboxEquatorPower_AC");
            override_SkyboxGroundColor          = serializedObject.FindProperty("override_SkyboxGroundColor");
            override_SkyboxGroundPower_AC       = serializedObject.FindProperty("override_SkyboxGroundPower_AC");
            override_SkyboxCloudsColor          = serializedObject.FindProperty("override_SkyboxCloudsColor");
            override_SkyboxSunDiskColor         = serializedObject.FindProperty("override_SkyboxSunDiskColor");
            override_SkyboxStarsOpacity         = serializedObject.FindProperty("override_SkyboxStarsOpacity");
            override_SkyboxCloudsOpacity_AC     = serializedObject.FindProperty("override_SkyboxCloudsOpacity_AC");
            override_SkyboxMoonOpacity_AC       = serializedObject.FindProperty("override_SkyboxMoonOpacity_AC");

            skyboxFogState                      = serializedObject.FindProperty("skyboxFogState");
            skyboxFogStartNH_AC                 = serializedObject.FindProperty("skyboxFogStartNH_AC");
            skyboxFogEndNH_AC                   = serializedObject.FindProperty("skyboxFogEndNH_AC");
            skyboxFogStartSH_AC                 = serializedObject.FindProperty("skyboxFogStartSH_AC");
            skyboxFogEndSH_AC                   = serializedObject.FindProperty("skyboxFogEndSH_AC");
            skyboxFogOpacity_AC                 = serializedObject.FindProperty("skyboxFogOpacity_AC");
            override_SkyboxFogState             = serializedObject.FindProperty("override_SkyboxFogState");
            override_SkyboxFogStartNH_AC        = serializedObject.FindProperty("override_SkyboxFogStartNH_AC");
            override_SkyboxFogEndNH_AC          = serializedObject.FindProperty("override_SkyboxFogEndNH_AC");
            override_SkyboxFogStartSH_AC        = serializedObject.FindProperty("override_SkyboxFogStartSH_AC");
            override_SkyboxFogEndSH_AC          = serializedObject.FindProperty("override_SkyboxFogEndSH_AC");
            override_SkyboxFogOpacity_AC        = serializedObject.FindProperty("override_SkyboxFogOpacity_AC");
            showSkyboxMI                        = serializedObject.FindProperty("showSkyboxMI");
            override_showSkyboxMI               = serializedObject.FindProperty("override_showSkyboxMI");

            cloudShadowsState                       = serializedObject.FindProperty("cloudShadowsState");
            cloudShadowsStrength                    = serializedObject.FindProperty("cloudShadowsStrength");
            cloudShadowsStrength_AC                 = serializedObject.FindProperty("cloudShadowsStrength_AC");
            override_CloudShadowsState              = serializedObject.FindProperty("override_CloudShadowsState");
            override_CloudShadowsStrength           = serializedObject.FindProperty("override_CloudShadowsStrength");
            override_CloudShadowsStrength_AC        = serializedObject.FindProperty("override_CloudShadowsStrength_AC");

            enableMoonCloudShadows                  = serializedObject.FindProperty("enableMoonCloudShadows");
            moonCloudShadowsStrength                = serializedObject.FindProperty("moonCloudShadowsStrength");
            moonCloudShadowsStrength_AC             = serializedObject.FindProperty("moonCloudShadowsStrength_AC");
            override_EnableMoonCloudShadows         = serializedObject.FindProperty("override_EnableMoonCloudShadows");
            override_MoonCloudShadowsStrength       = serializedObject.FindProperty("override_MoonCloudShadowsStrength");
            override_MoonCloudShadowsStrength_AC    = serializedObject.FindProperty("override_MoonCloudShadowsStrength_AC");
        }

        public override void OnInspectorGUI()
        {
            envProfile = (EnvironmentProfile)target;
            foldoutStyle = new GUIStyle(EditorStyles.foldoutHeader);

            DrawCustomInspector();
        }

        private void DrawCustomInspector()
        {
            serializedObject.Update();

            DrawToolbar();

            if (envProfile.selectedToolBar == 0)
            {
                DrawMainLightGroup();
                DrawMoonLightGroup();
                DrawAmbientLightGroup();
            }

            if (envProfile.selectedToolBar == 1)
                DrawEnvironmentFogGroup();

            if (envProfile.selectedToolBar == 2)
                DrawSkyboxGroup();

            serializedObject.ApplyModifiedProperties();

            if (envProfile.selectedToolBar == 2) {
                if (envProfile.skyboxMaterial != null && envProfile.showSkyboxMI && envProfile.skyboxMaterial.shader.name == shaderName)
                    DrawSkyboxMatProp();
            }
            
            UpdateEnvironmentSettings();
        }

        private void DrawToolbar()
        {
            GUILayout.BeginHorizontal();
            GUILayout.Space(-18);
            envProfile.selectedToolBar = GUILayout.Toolbar(envProfile.selectedToolBar, profileToolBarTitles);
            GUILayout.EndHorizontal();
            GUILayout.Space(5);
        }

        private void UpdateEnvironmentSettings()
        {
            if (envManager == null)
                envManager = FindFirstObjectByType<EnvironmentManager>();

            if (envManager != null && envManager.envManagerUpdateMode == EnvironmentManagerUpdateMode.Automatic)
                envManager.UpdateEnvironmentSettings();
        }

        private void DrawMainLightGroup()
        {
            EditorUtils.DrawFoldoutHeader(() => envProfile.showDirectionalLightGroup = EditorGUILayout.BeginFoldoutHeaderGroup(
                envProfile.showDirectionalLightGroup, "Sun Light", foldoutStyle), -2);

            if (envProfile.showDirectionalLightGroup)
            {
                EditorUtils.DrawShowHideToolbar(ref envProfile.mainLightGroupSHToolbarIndex, showHideGUIContentArray);
                shToolbarIndex = envProfile.mainLightGroupSHToolbarIndex;

                EditorUtils.DrawPropertyWithToggle(override_MainLightColor, "Color", mainLightColorGrad, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_MainLightIntensity, "Intensity", mainLightIntensity, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_MainLightIntensity_AC, "Intensity AC", mainLightIntensity_AC, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_MainLightShadowStrength, "Shadow Strength", mainLightShadowStrength, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_MainLightShadowStrength_AC, "Shadow Strength AC", mainLightShadowStrength_AC, "", shToolbarIndex);

                EditorUtils.DrawPropertyWithToggle(override_MainLightAltitude, "Altitude", mainLightAltitude, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_MainLightAzimuth, "Azimuth", mainLightAzimuth, "", shToolbarIndex);

                GUILayout.Space(5);
                EditorUtils.DrawPropertyWithToggle(override_CloudShadowsState, "Cloud Shadows", cloudShadowsState, "", shToolbarIndex);
                if (envProfile.cloudShadowsState)
                {
                    EditorUtils.DrawPropertyWithToggle(override_MainLightCookieSize, "Size", mainLightCookieSize, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_CloudShadowsStrength, "Strength", cloudShadowsStrength, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_CloudShadowsStrength_AC, "Strength AC", cloudShadowsStrength_AC, "", shToolbarIndex);
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawMoonLightGroup()
        {
            EditorUtils.DrawFoldoutHeader(() => envProfile.showMoonLightGroup = EditorGUILayout.BeginFoldoutHeaderGroup(
                envProfile.showMoonLightGroup, "Moon Light", foldoutStyle), -2);

            if (envProfile.showMoonLightGroup)
            {
                EditorUtils.DrawShowHideToolbar(ref envProfile.moonLightGroupSHToolbarIndex, showHideGUIContentArray);
                shToolbarIndex = envProfile.moonLightGroupSHToolbarIndex;

                EditorUtils.DrawPropertyWithToggle(override_enableMoonLight, "Enable", enableMoonLight, "", shToolbarIndex);

                if (envProfile.enableMoonLight)
                {
                    EditorUtils.DrawPropertyWithToggle(override_MoonLightColor, "Color", moonLightColorGrad, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_MoonLightIntensity, "Intensity", moonLightIntensity, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_MoonLightIntensity_AC, "Intensity AC", moonLightIntensity_AC, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_MoonLightIntensityScale_AC, "Intensity Scale AC", moonLightIntensityScale_AC, "Scales the intensity of the moon light, based on the current moon phase.", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_MoonLightShadowStrength, "Shadow Strength", moonLightShadowStrength, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_MoonLightShadowStrength_AC, "Shadow Strength AC", moonLightShadowStrength_AC, "", shToolbarIndex);
                }

                EditorUtils.DrawPropertyWithToggle(override_MoonLightAltitude, "Altitude", moonLightAltitude, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_MoonLightAzimuth, "Azimuth", moonLightAzimuth, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_MoonTimeOffset, "Offset", moonTimeOffset, "", shToolbarIndex);

                if (envProfile.enableMoonLight)
                {
                    GUILayout.Space(5);
                    EditorUtils.DrawPropertyWithToggle(override_EnableMoonCloudShadows, "Cloud Shadows", enableMoonCloudShadows, "", shToolbarIndex);
                    if (envProfile.enableMoonCloudShadows)
                    {
                        EditorUtils.DrawPropertyWithToggle(override_MoonLightCookieSize, "Size", moonLightCookieSize, "", shToolbarIndex);
                        EditorUtils.DrawPropertyWithToggle(override_MoonCloudShadowsStrength, "Strength", moonCloudShadowsStrength, "", shToolbarIndex);
                        EditorUtils.DrawPropertyWithToggle(override_MoonCloudShadowsStrength_AC, "Strength AC", moonCloudShadowsStrength_AC, "", shToolbarIndex);
                    }
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawAmbientLightGroup()
        {
            EditorUtils.DrawFoldoutHeader(() => envProfile.showAmbientLightGroup = EditorGUILayout.BeginFoldoutHeaderGroup(
                envProfile.showAmbientLightGroup, "Ambient Light", foldoutStyle), -2);

            if (envProfile.showAmbientLightGroup)
            {
                EditorUtils.DrawShowHideToolbar(ref envProfile.ambientLightGroupSHToolbarIndex, showHideGUIContentArray);
                shToolbarIndex = envProfile.ambientLightGroupSHToolbarIndex;

                EditorUtils.DrawPropertyWithToggle(override_AmbientLightSource, "Source", ambientLightSource, "", shToolbarIndex);

                if (envProfile.ambientLightSource == AmbienttLightSource.Skybox)
                {
                    EditorUtils.DrawPropertyWithToggle(override_AmbientLightSkyboxInt, "Intensity", ambientLightSkyboxInt, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_AmbientLightSkyboxInt_AC, "Intensity AC", ambientLightSkyboxInt_AC, "", shToolbarIndex);
                }

                if (envProfile.ambientLightSource == AmbienttLightSource.Gradient)
                {
                    EditorUtils.DrawPropertyWithToggle(override_AmbientSkyColor, "Sky", ambientSkyColorGrad, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_AmbientEquatorColor, "Equator", ambientEquatorColorGrad, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_AmbientGroundColor, "Ground", ambientGroundColorGrad, "", shToolbarIndex);
                }

                if (envProfile.ambientLightSource == AmbienttLightSource.Color)
                {
                    EditorUtils.DrawPropertyWithToggle(override_AmbientColorGrad, "Ambient Color", ambientColorGrad, "", shToolbarIndex);
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawEnvironmentFogGroup()
        {
            EditorUtils.DrawFoldoutHeader(() => envProfile.showEnvFogGroup = EditorGUILayout.BeginFoldoutHeaderGroup(
                envProfile.showEnvFogGroup, "Environment Fog", foldoutStyle), -2);

            if (envProfile.showEnvFogGroup)
            {
                EditorUtils.DrawShowHideToolbar(ref envProfile.envFogGroupSHToolbarIndex, showHideGUIContentArray);
                shToolbarIndex = envProfile.envFogGroupSHToolbarIndex;

                GUILayout.Space(5);
                EditorUtils.DrawPropertyWithToggle(override_EnvFogState, "Fog", envFogState);
                GUILayout.Space(5);

                if (envProfile.envFogState)
                {
                    EditorUtils.DrawPropertyWithToggle(override_EnvFogMode, "Mode", envFogMode, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_EnvFogColor, "Color", envFogColorGrad, "", shToolbarIndex);

                    if (envProfile.envFogMode == EnvironmentFogMode.Linear)
                    {
                        EditorUtils.DrawPropertyWithToggle(override_EnvLinearFogStart, "Start", envLinearFogStart, "", shToolbarIndex);
                        EditorUtils.DrawPropertyWithToggle(override_EnvLinearFogEnd, "End", envLinearFogEnd, "", shToolbarIndex);
                        EditorUtils.DrawPropertyWithToggle(override_EnvLinearFogStart_AC, "Start AC", envLinearFogStart_AC, "", shToolbarIndex);
                        EditorUtils.DrawPropertyWithToggle(override_EnvLinearFogEnd_AC, "End AC", envLinearFogEnd_AC, "", shToolbarIndex);
                    }
                    else if (envProfile.envFogMode == EnvironmentFogMode.Exponential)
                    {
                        EditorUtils.DrawPropertyWithToggle(override_EnvExpFogDensity, "Density", envExpFogDensity, "", shToolbarIndex);
                        EditorUtils.DrawPropertyWithToggle(override_EnvExpFogDensity_AC, "Density AC", envExpFogDensity_AC, "", shToolbarIndex);
                    }
                    else
                    {
                        EditorUtils.DrawPropertyWithToggle(override_EnvExpSquaredFogDensity, "Density", envExpSquaredFogDensity, "", shToolbarIndex);
                        EditorUtils.DrawPropertyWithToggle(override_EnvExpSquaredFogDensity_AC, "Density AC", envExpSquaredFogDensity_AC, "", shToolbarIndex);
                    }
                }

                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawSkyboxGroup()
        {
            DrawSkyboxMaterialGroup();

            if (envProfile.skyboxMaterial != null && envProfile.skyboxMaterial.shader.name == shaderName)
            {
                DrawSkyboxColorGroup();
                DrawSkyboxCelestialsGroup();
                DrawSkyboxFogGroup();
            }
        }

        private void DrawSkyboxMaterialGroup()
        {
            EditorUtils.DrawFoldoutHeader(() => envProfile.showSkyboxMaterialGroup = EditorGUILayout.BeginFoldoutHeaderGroup(
                envProfile.showSkyboxMaterialGroup, "Material", foldoutStyle), -2);

            if (envProfile.showSkyboxMaterialGroup)
            {
                GUILayout.Space(5);
                EditorUtils.DrawPropertyWithToggle(override_SkyboxMaterial, "Material", skyboxMaterial);

                if(envProfile.skyboxMaterial != null)
                    EditorUtils.DrawPropertyWithToggle(override_showSkyboxMI, "Material Inspector", showSkyboxMI);
                GUILayout.Space(5);

                if (envProfile.skyboxMaterial != null && envProfile.skyboxMaterial.shader.name != shaderName)
                    EditorGUILayout.HelpBox("This feature works only with Skybox materials that use the shader Nicrom/ASE/Skybox.", MessageType.Info);

                GUILayout.Space(5);
            }

            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawSkyboxColorGroup()
        {
            EditorUtils.DrawFoldoutHeader(() => envProfile.showSkyboxColorGroup = EditorGUILayout.BeginFoldoutHeaderGroup(
                envProfile.showSkyboxColorGroup, "Color", foldoutStyle), -2);

            if (envProfile.showSkyboxColorGroup)
            {
                EditorUtils.DrawShowHideToolbar(ref envProfile.skyboxColorGroupSHToolbarIndex, showHideGUIContentArray);
                shToolbarIndex = envProfile.skyboxColorGroupSHToolbarIndex;

                GUILayout.Space(3);
                EditorUtils.DrawPropertyWithToggle(override_SkyboxZenithColor, "Zenith Color", skyboxZenithColorGrad, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_SkyboxZenithPower_AC, "Zenith Power", skyboxZenithPower_AC, "", shToolbarIndex);
                //GUILayout.Space(5);
                EditorUtils.DrawPropertyWithToggle(override_SkyboxHorizonColor, "Horizon Color", skyboxHorizonColorGrad, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_SkyboxHorizonScale_AC, "Horizon Scale", skyboxHorizonScale_AC, "", shToolbarIndex);
                //GUILayout.Space(5);
                EditorUtils.DrawPropertyWithToggle(override_SkyboxEquatorColor, "Equator Color", skyboxEquatorColorGrad, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_SkyboxEquatorOpacity_AC, "Equator Opacity", skyboxEquatorOpacity_AC, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_SkyboxEquatorMinRadius_AC, "Equator Min Radius", skyboxEquatorMinRadius_AC, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_SkyboxEquatorMaxRadius_AC, "Equator Max Radius", skyboxEquatorMaxRadius_AC, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_SkyboxEquatorPower_AC, "Equator Power", skyboxEquatorPower_AC, "", shToolbarIndex);
                //GUILayout.Space(5);
                EditorUtils.DrawPropertyWithToggle(override_SkyboxGroundColor, "Ground Color", skyboxGroundColorGrad, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_SkyboxGroundPower_AC, "Ground Power", skyboxGroundPower_AC, "", shToolbarIndex);
                GUILayout.Space(5);
            }

            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawSkyboxCelestialsGroup()
        {
            EditorUtils.DrawFoldoutHeader(() => envProfile.showSkyboxSkyObjectsGroup = EditorGUILayout.BeginFoldoutHeaderGroup(
                envProfile.showSkyboxSkyObjectsGroup, "Sky Objects", foldoutStyle), -2);

            if (envProfile.showSkyboxSkyObjectsGroup)
            {
                if (envProfile.skyboxMaterial.shader.name == shaderName)
                {
                    EditorUtils.DrawShowHideToolbar(ref envProfile.skyboxSkyObjectsGroupSHToolbarIndex, showHideGUIContentArray);
                    shToolbarIndex = envProfile.skyboxSkyObjectsGroupSHToolbarIndex;

                    EditorUtils.DrawPropertyWithToggle(override_SkyboxSunDiskColor, "Sun Color", skyboxSunDiskColorGrad, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_SkyboxMoonOpacity_AC, "Moon Opacity", skyboxMoonOpacity_AC, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_SkyboxStarsOpacity, "Stars Opacity", skyboxStarsOpacity_AC, "", shToolbarIndex);


                    GUILayout.Space(5);
                    EditorUtils.DrawPropertyWithToggle(override_SkyboxCloudsColor, "Clouds Color", skyboxCloudsColorGrad, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_SkyboxCloudsOpacity_AC, "Clouds Opacity", skyboxCloudsOpacity_AC, "", shToolbarIndex);
                    GUILayout.Space(5);
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawSkyboxFogGroup()
        {
            EditorUtils.DrawFoldoutHeader(() => envProfile.showSkyboxFogGroup = EditorGUILayout.BeginFoldoutHeaderGroup(
                envProfile.showSkyboxFogGroup, "Fog", foldoutStyle), -2);

            if (envProfile.showSkyboxFogGroup)
            {
                EditorUtils.DrawShowHideToolbar(ref envProfile.skyboxFogGroupSHToolbarIndex, showHideGUIContentArray);
                shToolbarIndex = envProfile.skyboxFogGroupSHToolbarIndex;
                GUILayout.Space(5);
                EditorUtils.DrawPropertyWithToggle(override_SkyboxFogState, "Fog", skyboxFogState);
                
                if (skyboxFogState.boolValue)
                {
                    GUILayout.Space(5);
                    EditorUtils.DrawPropertyWithToggle(override_SkyboxFogStartNH_AC, "Fog Start - NH", skyboxFogStartNH_AC, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_SkyboxFogEndNH_AC, "Fog End - NH", skyboxFogEndNH_AC, "", shToolbarIndex);
                    GUILayout.Space(5);
                    EditorUtils.DrawPropertyWithToggle(override_SkyboxFogStartSH_AC, "Fog Start - SH", skyboxFogStartSH_AC, "", shToolbarIndex);
                    EditorUtils.DrawPropertyWithToggle(override_SkyboxFogEndSH_AC, "Fog End - SH", skyboxFogEndSH_AC, "", shToolbarIndex);
                    GUILayout.Space(5);
                    EditorUtils.DrawPropertyWithToggle(override_SkyboxFogOpacity_AC, "Fog Opacity", skyboxFogOpacity_AC, "", shToolbarIndex);
                }           
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawSkyboxMatProp()
        {
            if (envProfile.skyboxMaterial != null)
            {
                GUILayout.Space(10);
                if (skyboxMaterialEditor == null || skyboxMaterialEditor.target != envProfile.skyboxMaterial)
                    skyboxMaterialEditor = CreateEditor(envProfile.skyboxMaterial);
                skyboxMaterialEditor.DrawHeader();
                skyboxMaterialEditor.OnInspectorGUI();
                GUILayout.Space(-8);
            }
        }
    }
}
