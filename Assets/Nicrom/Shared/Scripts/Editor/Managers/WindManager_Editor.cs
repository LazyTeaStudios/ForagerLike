using UnityEngine;
using UnityEditor;

namespace Nicrom
{
    [CustomEditor(typeof(WindManager))]
    public class WindManager_Editor : Editor
    {
        SerializedProperty mainLight;
        SerializedProperty windDirection;
        SerializedProperty windStrength;
        SerializedProperty gizmosVisibility;
        SerializedProperty drawFooterButtons;
        SerializedProperty gWindProfile;

        private Editor windProfileEditor;
        private Texture2D discordIcon;
        private Texture2D publiserIcon;
        private Texture2D documentationIcon;
        private Texture2D headerBackground;
        private Texture2D headerText;
        private Texture2D gearSettingsIcon;
        private WindManager windManager;
        private GUIStyle foldoutStyle;
        private bool showGearSettings = false;

        private void OnEnable()
        {
            FindProperties();

            windManager = (WindManager)target;
            windManager.UpdateWind();
        }

        private void FindProperties()
        {
            headerBackground            = Resources.Load<Texture2D>("Nicrom_Header_Background_01");
            headerText                  = Resources.Load<Texture2D>("Nicrom_Header_WindManager_Text");
            discordIcon                 = Resources.Load<Texture2D>("Nicrom_Footer_Discord");
            publiserIcon                = Resources.Load<Texture2D>("Nicrom_Footer_Review");
            documentationIcon           = Resources.Load<Texture2D>("Nicrom_Footer_Documentation");
            gearSettingsIcon            = Resources.Load<Texture2D>("Nicrom_Icon_Settings_Gear");

            mainLight                   = serializedObject.FindProperty("mainLight");
            windDirection               = serializedObject.FindProperty("windDirection");
            windStrength                = serializedObject.FindProperty("windStrength");
            gWindProfile                = serializedObject.FindProperty("gWindProfile");
            gizmosVisibility            = serializedObject.FindProperty("gizmosVisibility");
            drawFooterButtons           = serializedObject.FindProperty("drawFooterButtons");
        }

        public override void OnInspectorGUI()
        {
            windManager = (WindManager)target;
            DrawCustomInspector(windManager);  
        }

        private void OnSceneGUI()
        {
            if (windManager != null && windManager.gizmosVisibility == GizmosVisibility.WhenSelected)
                windManager.DrawWindDirectionGizmo(windManager.transform.position, 1);
        }

        private void DrawCustomInspector(WindManager windManager)
        {
            foldoutStyle = new GUIStyle(EditorStyles.foldoutHeader);

            EditorUtils.DrawHeaderBackgroundAndLogo(headerBackground, headerText);
            EditorUtils.DrawGearSettingsButton(gearSettingsIcon, ref showGearSettings);

            if (showGearSettings)
            {
                DrawGearSettingsGroup();
            }
            else
            {
                DrawMainSettingsGroup();
                DrawWindSettingsGroup();

                if (windManager.gWindProfile != null)
                    DrawWindProfileEditor();
            }

            serializedObject.ApplyModifiedProperties();

            //windManager.UpdateWind();

            if (windManager.drawFooterButtons)
                EditorUtils.DrawFooterButtons(discordIcon, publiserIcon, documentationIcon);
        }

        private void DrawGearSettingsGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref windManager.showGearGroup, "Manager Settings", foldoutStyle, -2);

            if (windManager.showGearGroup)
            {
                GUILayout.Space(5);
                EditorGUILayout.PropertyField(gizmosVisibility, new GUIContent("Scene Gizmos Visibility"));
                EditorGUILayout.PropertyField(drawFooterButtons, new GUIContent("Draw Footer Buttons"));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawMainSettingsGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref windManager.showMainGroup, "Main Settings", foldoutStyle, -2);

            if (windManager.showMainGroup)
            {
                GUILayout.Space(5);
                EditorGUILayout.PropertyField(gWindProfile, new GUIContent("Profile"));
                EditorGUILayout.PropertyField(mainLight, new GUIContent("Main Light"));         
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawWindSettingsGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref windManager.showWindGroup, "Wind Settings", foldoutStyle, -2);

            if (windManager.showWindGroup)
            {
                GUILayout.Space(5);
                EditorGUI.BeginChangeCheck();
                EditorGUILayout.Slider(windStrength, 0, 2, new GUIContent("Strength", Tooltips.windStrength));
                //EditorGUILayout.HelpBox("When Wind Scale value is 1 or bigger, Min/Max values ", MessageType.Info);
                EditorGUILayout.Slider(windDirection, 0, 360f, new GUIContent("Direction", Tooltips.windDirection));
                if (EditorGUI.EndChangeCheck())
                {
                    //windManager.UpdateShaderGlobalProperties();
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawWindProfileEditor()
        {
            if (windProfileEditor == null || windProfileEditor.target != windManager.gWindProfile)
                windProfileEditor = CreateEditor(windManager.gWindProfile);

            windProfileEditor.OnInspectorGUI();
        }
    }
}
