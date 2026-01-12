using UnityEngine;
using UnityEditor;

namespace Nicrom
{
    [CustomEditor(typeof(CloudShadows))]
    public class CloudShadows_Editor : Editor
    {
        SerializedProperty lightCookieSize;
        SerializedProperty cloudShadowsState;
        SerializedProperty cloudShadowsRT;
        SerializedProperty cloudShadowsRTSize;
        SerializedProperty cloudShadowsMaterial;
        SerializedProperty cloudShadowsStrength;
        SerializedProperty showCloudShadowsMI;

        private CloudShadows cloudShadows;
        private Editor cloudShadowsMaterialEditor;

        private void OnEnable()
        {
            cloudShadows = (CloudShadows)target;

            cloudShadows.directionalLight = cloudShadows.GetComponent<Light>();

            FindProperties();
        }

        private void FindProperties()
        {
            lightCookieSize                 = serializedObject.FindProperty("lightCookieSize");
            cloudShadowsState               = serializedObject.FindProperty("cloudShadowsState");
            cloudShadowsRT                  = serializedObject.FindProperty("cloudShadowsRT");
            cloudShadowsRTSize              = serializedObject.FindProperty("cloudShadowsRTSize");
            cloudShadowsMaterial            = serializedObject.FindProperty("cloudShadowsMaterial");
            showCloudShadowsMI              = serializedObject.FindProperty("showCloudShadowsMI");
            cloudShadowsStrength            = serializedObject.FindProperty("cloudShadowsStrength");
        }

        public override void OnInspectorGUI()
        {
            cloudShadows = (CloudShadows)target;
            
            DrawCustomInspector();
        }

        private void DrawCustomInspector()
        {
            DrawCloudShadowSettings();

            serializedObject.ApplyModifiedProperties();
            
            cloudShadows.UpdateCloudShadowsSettings();

            if (cloudShadowsState.boolValue == true && cloudShadows.showCloudShadowsMI)
                DrawCloudShadowsMaterialEditor();
        }

        private void DrawCloudShadowSettings()
        {
            GUILayout.Space(5);
            EditorGUILayout.PropertyField(cloudShadowsState, new GUIContent("Enable"));
            GUILayout.Space(5);

            if (cloudShadows.cloudShadowsState)
            {
                EditorGUILayout.PropertyField(lightCookieSize, new GUIContent("Size"));
                if(cloudShadows.cloudShadowsMaterial != null)
                    EditorGUILayout.PropertyField(cloudShadowsStrength, new GUIContent("Strength"));
                GUILayout.Space(5);
                EditorGUILayout.PropertyField(cloudShadowsRT, new GUIContent("Render Texture"));
                
                if (cloudShadows.cloudShadowsRT != null)
                {
                    EditorGUI.BeginChangeCheck();
                    EditorGUILayout.PropertyField(cloudShadowsRTSize, new GUIContent("Render Texture Size"));
                    if (EditorGUI.EndChangeCheck())
                    {
                        cloudShadowsRT.serializedObject.ApplyModifiedProperties();
                        cloudShadows.RecreateCRT();        
                    }
                }
                GUILayout.Space(5);
                EditorGUI.BeginChangeCheck();
                EditorGUILayout.PropertyField(cloudShadowsMaterial, new GUIContent("Material"));
                if (EditorGUI.EndChangeCheck())
                {
                    cloudShadowsMaterial.serializedObject.ApplyModifiedProperties();
                    if(cloudShadows.cloudShadowsRT != null)
                        cloudShadows.UpdateRTM();
                }

                if (cloudShadows.cloudShadowsMaterial != null)
                {
                    EditorGUILayout.PropertyField(showCloudShadowsMI, new GUIContent("Material Inspector"));
                    GUILayout.Space(5);
                }
            }
        }

        private void DrawCloudShadowsMaterialEditor()
        {
            if (cloudShadows.cloudShadowsMaterial != null)
            {
                if (cloudShadowsMaterialEditor == null || cloudShadowsMaterialEditor.target != cloudShadows.cloudShadowsMaterial)
                    cloudShadowsMaterialEditor = CreateEditor(cloudShadows.cloudShadowsMaterial);
                cloudShadowsMaterialEditor.DrawHeader();
                cloudShadowsMaterialEditor.OnInspectorGUI();
            }
        }
    }
}
