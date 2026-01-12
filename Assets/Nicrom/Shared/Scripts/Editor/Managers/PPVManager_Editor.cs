using System;
using UnityEditor;
using UnityEngine;

namespace Nicrom
{
    [CustomEditor(typeof(PPVManager))]
    public class PPVManager_Editor : Editor
    {
        SerializedProperty envManager;
        SerializedProperty timeOfDaySource;
        SerializedProperty timeOfDay;

        SerializedProperty dayPPV;
        SerializedProperty dayStart;
        SerializedProperty dayEnd;

        SerializedProperty nightPPV;
        SerializedProperty nightWeightAC;

        SerializedProperty sunrisePPV;
        SerializedProperty sunriseStart;
        SerializedProperty sunriseEnd;
        SerializedProperty sunriseWeightAC;
        SerializedProperty useSunrisePPV;

        SerializedProperty sunsetPPV;
        SerializedProperty sunsetStart;
        SerializedProperty sunsetEnd;
        SerializedProperty sunsetWeightAC;
        SerializedProperty useSunsetPPV;

        private Texture2D discordIcon;
        private Texture2D publiserIcon;
        private Texture2D headerBackground;
        private Texture2D headerText;
        private Texture2D documentationIcon;

        private PPVManager ppvManager;
        private GUIStyle foldoutStyle;

        private void OnEnable()
        {
            FindProperties();
        }

        private void FindProperties()
        {
            envManager = serializedObject.FindProperty("envManager");
            timeOfDaySource = serializedObject.FindProperty("timeOfDaySource");
            timeOfDay = serializedObject.FindProperty("timeOfDay");

            dayPPV = serializedObject.FindProperty("dayPPV");
            dayStart = serializedObject.FindProperty("dayStart");
            dayEnd = serializedObject.FindProperty("dayEnd");

            nightPPV = serializedObject.FindProperty("nightPPV");
            nightWeightAC = serializedObject.FindProperty("nightWeightAC");

            sunrisePPV = serializedObject.FindProperty("sunrisePPV");
            sunriseStart = serializedObject.FindProperty("sunriseStart");
            sunriseEnd = serializedObject.FindProperty("sunriseEnd");
            sunriseWeightAC = serializedObject.FindProperty("sunriseWeightAC");
            useSunrisePPV = serializedObject.FindProperty("useSunrisePPV");

            sunsetPPV = serializedObject.FindProperty("sunsetPPV");
            sunsetStart = serializedObject.FindProperty("sunsetStart");
            sunsetEnd = serializedObject.FindProperty("sunsetEnd");
            sunsetWeightAC = serializedObject.FindProperty("sunsetWeightAC");
            useSunsetPPV = serializedObject.FindProperty("useSunsetPPV");

            headerBackground = Resources.Load<Texture2D>("Nicrom_Header_Background_01");
            headerText = Resources.Load<Texture2D>("Nicrom_Header_PPVManager_Text");
            publiserIcon = Resources.Load<Texture2D>("Nicrom_Footer_Publisher");
            documentationIcon = Resources.Load<Texture2D>("Nicrom_Footer_Documentation");
            discordIcon = Resources.Load<Texture2D>("Nicrom_Footer_Discord");
        }

        public override void OnInspectorGUI()
        {
            ppvManager = (PPVManager)target;
            foldoutStyle = new GUIStyle(EditorStyles.foldoutHeader);

            DrawCustomInspector();
        }

        private void DrawCustomInspector()
        {
            EditorUtils.DrawHeaderBackgroundAndLogo(headerBackground, headerText);

            DrawMainProperties();
            DrawPPVSettings();

            serializedObject.ApplyModifiedProperties();
            EditorUtils.DrawFooterButtons(discordIcon, publiserIcon, documentationIcon);

            ppvManager.UpdateVolumes();
        }

        private void DrawMainProperties()
        {
            

            EditorUtils.DrawFoldoutHeader(ref ppvManager.showMainGroup, "Main Settings", foldoutStyle, -2);

            if (ppvManager.showMainGroup)
            {
                GUILayout.Space(5);
                EditorGUILayout.PropertyField(timeOfDaySource, new GUIContent("Time of Day Source"));

                if (ppvManager.timeOfDaySource == TimeOfDaySource.Local)
                {
                    EditorGUILayout.PropertyField(timeOfDay, new GUIContent("Time Of Day"));
                }
                else
                    EditorGUILayout.PropertyField(envManager, new GUIContent("Environment Manager"));

                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawPPVSettings()
        {
            EditorUtils.DrawFoldoutHeader(ref ppvManager.showPrimaryGroup, "Primary Volumes", foldoutStyle, -2);
            if (ppvManager.showPrimaryGroup)
            {
                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Day"), EditorStyles.boldLabel);
                EditorGUILayout.PropertyField(dayPPV, new GUIContent("Volume"));
                //EditorGUILayout.PropertyField(dayStart, new GUIContent("Start Time"));
                //EditorGUILayout.PropertyField(dayEnd, new GUIContent("End Time"));

                EditorUtils.MinMaxSlider("Time", ref dayStart, ref dayEnd, 0.0f, 24);

                GUILayout.Space(5);

                EditorGUILayout.LabelField(new GUIContent("Night"), EditorStyles.boldLabel);
                EditorGUILayout.PropertyField(nightPPV, new GUIContent("Volume"));
                EditorGUILayout.PropertyField(nightWeightAC, new GUIContent("Weight"));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();

            EditorUtils.DrawFoldoutHeader(ref ppvManager.showSecondaryGroup, "Secondary Volumes", foldoutStyle, -2);
            if (ppvManager.showSecondaryGroup)
            {
                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Sunrise"), EditorStyles.boldLabel);
                EditorGUILayout.PropertyField(useSunrisePPV, new GUIContent("Enable"));
                //GUILayout.Space(5);
                if (ppvManager.useSunrisePPV)
                {
                    EditorGUILayout.PropertyField(sunrisePPV, new GUIContent("Volume"));
                    EditorGUILayout.PropertyField(sunriseWeightAC, new GUIContent("Weight"));
                    //EditorGUILayout.PropertyField(sunriseStart, new GUIContent("Start Time"));
                    //EditorGUILayout.PropertyField(sunriseEnd, new GUIContent("End Time"));
                    EditorUtils.MinMaxSlider("Time", ref sunriseStart, ref sunriseEnd, 0.0f, 24);
                    GUILayout.Space(5);
                }

                EditorGUILayout.LabelField(new GUIContent("Sunset"), EditorStyles.boldLabel);
                EditorGUILayout.PropertyField(useSunsetPPV, new GUIContent("Enable"));
                //GUILayout.Space(5);
                if (ppvManager.useSunsetPPV)
                {
                    EditorGUILayout.PropertyField(sunsetPPV, new GUIContent("Volume"));
                    EditorGUILayout.PropertyField(sunsetWeightAC, new GUIContent("Weight"));
                    //EditorGUILayout.PropertyField(sunsetStart, new GUIContent("Start Time"));
                    //EditorGUILayout.PropertyField(sunsetEnd, new GUIContent("End Time"));
                    EditorUtils.MinMaxSlider("Time", ref sunsetStart, ref sunsetEnd, 0.0f, 24);
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();

        }
    }
}
