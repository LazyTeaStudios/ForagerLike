using System;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;

namespace Nicrom
{
    [CustomEditor(typeof(EnvironmentManager))]
    public class EnvironmentManager_Editor : Editor
    {
        SerializedProperty gizmosVisibility;
        SerializedProperty envManagerUpdateMode;
        SerializedProperty drawFooterButtons;
        SerializedProperty sunOrbitColor;
        SerializedProperty sunCirceColor;
        SerializedProperty moonOrbitColor;
        SerializedProperty moonCirceColor;
        SerializedProperty showSunOrbit;
        SerializedProperty showSunCircle;
        SerializedProperty showMoonOrbit;
        SerializedProperty showMoonCircle;
        SerializedProperty showGradientTime;
        SerializedProperty showLightIntensity;
        SerializedProperty showPPVWeight;

        SerializedProperty globalEnvProfile;
        SerializedProperty mainLight;
        SerializedProperty moonLight;
        SerializedProperty ppvManager;

        SerializedProperty override_globalEnvProfile;
        SerializedProperty override_mainLight;
        SerializedProperty override_moonLight;
        SerializedProperty override_ppvManager;

        SerializedProperty timeOfDay;
        SerializedProperty timePassage;
        SerializedProperty timePassageStep;
        SerializedProperty dayLength;
        SerializedProperty overrideTimeOfDay;
        SerializedProperty overrideTimePassage;
        SerializedProperty overrideTimePassageStep;
        SerializedProperty overrideDayLength;

        private Texture2D discordIcon;
        private Texture2D publiserIcon;
        private Texture2D documentationIcon;
        private Texture2D headerBackground;
        private Texture2D headerText;
        private Texture2D gearIcon;

        private EnvironmentManager envManager;
        private GUIStyle foldoutStyle;
        private Editor globalEnvProfileEditor;

        private bool showGearSettings = false;
        private PrefabStage prefabStage;

        private int shToolbarIndex;
        private GUIContent[] showHideGUIContentArray;

        private void OnEnable()
        {
            envManager = (EnvironmentManager)target;

            if (envManager.mainLight != null)
            {
                if (envManager.mainLight.GetComponent<CloudShadows>() != null && envManager.mainLightCloudShadows == null)
                    envManager.mainLightCloudShadows = envManager.mainLight.GetComponent<CloudShadows>();
            }

            if (envManager.moonLight != null)
            {
                if (envManager.moonLight.GetComponent<CloudShadows>() != null && envManager.moonLightCloudShadows == null)
                    envManager.moonLightCloudShadows = envManager.moonLight.GetComponent<CloudShadows>();
            }

            showHideGUIContentArray = new GUIContent[2];
            showHideGUIContentArray[0] = new GUIContent("Show", "Shows all the settings.");
            showHideGUIContentArray[1] = new GUIContent("Hide", "Hides the settings that are disabled.");

            FindProperties();
        }

        private void FindProperties()
        {
            envManagerUpdateMode            = serializedObject.FindProperty("envManagerUpdateMode");
            gizmosVisibility                = serializedObject.FindProperty("gizmosVisibility");

            drawFooterButtons               = serializedObject.FindProperty("drawFooterButtons");
            sunOrbitColor                   = serializedObject.FindProperty("sunOrbitColor");
            sunCirceColor                   = serializedObject.FindProperty("sunCirceColor");
            moonOrbitColor                  = serializedObject.FindProperty("moonOrbitColor");
            moonCirceColor                  = serializedObject.FindProperty("moonCirceColor");

            showSunOrbit                    = serializedObject.FindProperty("showSunOrbit");
            showSunCircle                   = serializedObject.FindProperty("showSunCircle");
            showMoonOrbit                   = serializedObject.FindProperty("showMoonOrbit");
            showMoonCircle                  = serializedObject.FindProperty("showMoonCircle");

            showGradientTime                = serializedObject.FindProperty("showGradientTime");
            showLightIntensity              = serializedObject.FindProperty("showLightIntensity");
            showPPVWeight                   = serializedObject.FindProperty("showPPVWeight");

            globalEnvProfile                = serializedObject.FindProperty("globalEnvProfile");
            mainLight                       = serializedObject.FindProperty("mainLight");
            moonLight                       = serializedObject.FindProperty("moonLight");
            ppvManager                      = serializedObject.FindProperty("ppvManager");

            override_globalEnvProfile       = serializedObject.FindProperty("override_globalEnvProfile");
            override_mainLight              = serializedObject.FindProperty("override_mainLight");
            override_moonLight              = serializedObject.FindProperty("override_moonLight");
            override_ppvManager             = serializedObject.FindProperty("override_ppvManager");

            timeOfDay                       = serializedObject.FindProperty("timeOfDay");
            timePassage                     = serializedObject.FindProperty("timePassage");
            timePassageStep                 = serializedObject.FindProperty("timePassageStep");
            dayLength                       = serializedObject.FindProperty("dayLength");
            overrideTimeOfDay               = serializedObject.FindProperty("overrideTimeOfDay");
            overrideTimePassage             = serializedObject.FindProperty("overrideTimePassage");
            overrideTimePassageStep         = serializedObject.FindProperty("overrideTimePassageStep");
            overrideDayLength               = serializedObject.FindProperty("overrideDayLength");

            headerBackground                = Resources.Load<Texture2D>("Nicrom_Header_Background_01");
            headerText                      = Resources.Load<Texture2D>("Nicrom_Header_EnvironmentManager_Text");
            publiserIcon                    = Resources.Load<Texture2D>("Nicrom_Footer_Review");
            discordIcon                     = Resources.Load<Texture2D>("Nicrom_Footer_Discord");
            documentationIcon               = Resources.Load<Texture2D>("Nicrom_Footer_Documentation");
            gearIcon                        = Resources.Load<Texture2D>("Nicrom_Icon_Settings_Gear");
        }

        public override void OnInspectorGUI()
        {
            envManager = (EnvironmentManager)target;
            foldoutStyle = new GUIStyle(EditorStyles.foldoutHeader);

            DrawCustomInspector();

            prefabStage = PrefabStageUtility.GetCurrentPrefabStage();

            if (envManager.envManagerUpdateMode == EnvironmentManagerUpdateMode.Automatic && !AssetDatabase.Contains(envManager) && prefabStage == null)
                envManager.UpdateEnvironmentSettings();
        }

        private void OnSceneGUI()
        {
            if (envManager.gizmosVisibility == GizmosVisibility.WhenSelected && prefabStage == null)
                envManager.DrawGizmos();
        }

        private void DrawCustomInspector()
        {
            EditorUtils.DrawHeaderBackgroundAndLogo(headerBackground, headerText);
            EditorUtils.DrawGearSettingsButton(gearIcon, ref showGearSettings);

            if (!showGearSettings)
            {
                DrawMainSetingsGroup();
                DrawDayNightCycleGroup();

                if (envManager.globalEnvProfile != null)
                    DrawProfileEditor();
            }
            else
            {
                DrawGearSettings();
            }

            serializedObject.ApplyModifiedProperties();

            if(drawFooterButtons.boolValue)
                EditorUtils.DrawFooterButtons(discordIcon, publiserIcon, documentationIcon);
        }

        private void DrawGearSettings()
        {
            GUILayout.Space(5);
            EditorGUILayout.PropertyField(envManagerUpdateMode, new GUIContent("Update Mode"));
            GUILayout.Space(5);
            EditorGUILayout.LabelField(new GUIContent("Gizmos"), EditorStyles.boldLabel);
            EditorGUILayout.PropertyField(gizmosVisibility, new GUIContent("Gizmos Visibility"));

            if (envManager.gizmosVisibility != GizmosVisibility.None)
            {
                GUILayout.Space(5);
                EditorGUILayout.PropertyField(showSunOrbit, new GUIContent("Sun Orbit"));
                if (envManager.showSunOrbit)
                    EditorGUILayout.PropertyField(sunOrbitColor, new GUIContent("Sun Orbit Color"));
                EditorGUILayout.PropertyField(showSunCircle, new GUIContent("Sun Circe"));
                if (envManager.showSunCircle)
                    EditorGUILayout.PropertyField(sunCirceColor, new GUIContent("Sun Circle Color"));
                GUILayout.Space(5);
                EditorGUILayout.PropertyField(showMoonOrbit, new GUIContent("Moon Orbit"));
                if (envManager.showMoonOrbit)
                    EditorGUILayout.PropertyField(moonOrbitColor, new GUIContent("Moon Orbit Color"));
                EditorGUILayout.PropertyField(showMoonCircle, new GUIContent("Moon Circe"));
                if (envManager.showMoonCircle)
                    EditorGUILayout.PropertyField(moonCirceColor, new GUIContent("Moon Circle Color"));
            }

            GUILayout.Space(5);
            EditorGUILayout.LabelField(new GUIContent("Help Boxes"), EditorStyles.boldLabel);
            EditorGUILayout.PropertyField(showGradientTime, new GUIContent("Gradient Time"));
            EditorGUILayout.PropertyField(showLightIntensity, new GUIContent("Sun/Moon Intensity"));
            EditorGUILayout.PropertyField(showPPVWeight, new GUIContent("PPVs Weight"));
            
            GUILayout.Space(5);
            EditorGUILayout.LabelField(new GUIContent("Footer"), EditorStyles.boldLabel);
            EditorGUILayout.PropertyField(drawFooterButtons, new GUIContent("Draw Footer Buttons"));
            GUILayout.Space(5);
        }

        private void DrawMainSetingsGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref envManager.showManagerSettingsGroup, "Main Settings", foldoutStyle, -2);

            if (envManager.showManagerSettingsGroup)
            {
                EditorUtils.DrawShowHideToolbar(ref envManager.mainSettingsGroupSHToolbarIndex, showHideGUIContentArray);
                shToolbarIndex = envManager.mainSettingsGroupSHToolbarIndex;

                GUILayout.Space(3);
                EditorUtils.DrawPropertyWithToggle(override_globalEnvProfile, "Profile", globalEnvProfile, "", shToolbarIndex);

                EditorGUI.BeginChangeCheck();
                EditorUtils.DrawPropertyWithToggle(override_mainLight, "Main Light", mainLight, "", shToolbarIndex);
                if (EditorGUI.EndChangeCheck())
                {
                    mainLight.serializedObject.ApplyModifiedProperties();

                    if (envManager.mainLight != null )
                    { 
                        if(envManager.mainLight.GetComponent<CloudShadows>() != null && envManager.mainLightCloudShadows == null)
                            envManager.mainLightCloudShadows = envManager.mainLight.GetComponent<CloudShadows>(); 
                    }
                }

                EditorUtils.DrawPropertyWithToggle(override_moonLight, "Moon Light", moonLight, "", shToolbarIndex);
                EditorUtils.DrawPropertyWithToggle(override_ppvManager, "PPV Manager", ppvManager, "", shToolbarIndex);

                if (envManager.envManagerUpdateMode == EnvironmentManagerUpdateMode.Manual)
                {
                    GUILayout.Space(5);
                    if (GUILayout.Button(new GUIContent("Update Environment")))
                        envManager.UpdateEnvironmentSettings();
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawDayNightCycleGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref envManager.showTimeGroup, "Day-Night Cycle", foldoutStyle, -2);

            if (envManager.showTimeGroup)
            {
                GUILayout.Space(5);
                EditorUtils.DrawPropertyWithToggle(overrideTimeOfDay, "Time", timeOfDay);
                EditorUtils.DrawPropertyWithToggle(overrideTimePassage, "Time Passage", timePassage);
                if(envManager.timePassage == TimePassage.Step)
                    EditorUtils.DrawPropertyWithToggle(overrideTimePassageStep, "Time Passage Step", timePassageStep, "Specifies how often the Day-Nigth Cycle is updated. Real world seconds are used.");
                
                if(envManager.timePassage != TimePassage.None)
                    EditorUtils.DrawPropertyWithToggle(overrideDayLength, "Day Length", dayLength, "Specifies the length of an ingame day in real world minutes.");

                GUILayout.Space(5);
                if (envManager.showGradientTime)
                {
                    EditorGUILayout.BeginHorizontal();
                    GUILayout.Space(17);
                    EditorGUILayout.HelpBox("Gradient Location: " + Math.Round(envManager.timeOfDay / 24f, 2), MessageType.None);
                    EditorGUILayout.EndHorizontal();
                }

                if (envManager.mainLight != null && envManager.mainLight.enabled && envManager.showLightIntensity)
                {
                    EditorGUILayout.BeginHorizontal();
                    GUILayout.Space(17);
                    EditorGUILayout.HelpBox("Sun Intensity: " + Math.Round(envManager.mainLight.intensity, 2), MessageType.None);
                    EditorGUILayout.EndHorizontal();
                }

                if (envManager.moonLight != null && envManager.moonLight.enabled && envManager.showLightIntensity)
                {
                    EditorGUILayout.BeginHorizontal();
                    GUILayout.Space(17);
                    EditorGUILayout.HelpBox("Moon Intensity: " + Math.Round(envManager.moonLight.intensity, 2), MessageType.None);
                    EditorGUILayout.EndHorizontal();
                }

                if (envManager.ppvManager != null && envManager.showPPVWeight)
                {
                    GUILayout.BeginHorizontal();
                    GUILayout.Space(17);
                    if (envManager.ppvManager.dayPPV != null && envManager.ppvManager.dayPPV.isActiveAndEnabled)
                        EditorGUILayout.HelpBox("Day PPV Weight: " + Math.Round(envManager.ppvManager.dayPPV.weight, 2), MessageType.None);

                    if (envManager.ppvManager.nightPPV != null && envManager.ppvManager.nightPPV.isActiveAndEnabled)
                        EditorGUILayout.HelpBox("Night PPV Weight: " + Math.Round(envManager.ppvManager.nightPPV.weight, 2), MessageType.None);

                    if (envManager.ppvManager.sunsetPPV != null && envManager.ppvManager.sunsetPPV.isActiveAndEnabled)
                        EditorGUILayout.HelpBox("Sunset PPV Weight: " + Math.Round(envManager.ppvManager.sunsetPPV.weight, 2), MessageType.None);
                    
                    if (envManager.ppvManager.sunrisePPV != null && envManager.ppvManager.sunrisePPV.isActiveAndEnabled)
                        EditorGUILayout.HelpBox("Sunrise PPV Weight: " + Math.Round(envManager.ppvManager.sunrisePPV.weight, 2), MessageType.None);
                    EditorGUILayout.EndHorizontal();
                }

                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawProfileEditor()
        {
            if (globalEnvProfileEditor == null || globalEnvProfileEditor.target != envManager.globalEnvProfile)
                globalEnvProfileEditor = CreateEditor(envManager.globalEnvProfile);

            globalEnvProfileEditor.OnInspectorGUI();
        }    
    }
}
