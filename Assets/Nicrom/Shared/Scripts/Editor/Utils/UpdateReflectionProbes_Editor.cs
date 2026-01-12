using UnityEditor;
using UnityEngine;

namespace Nicrom
{
    [CustomEditor(typeof(UpdateReflectionProbes))]
    public class UpdateReflectionProbes_Editor : Editor
    {
        SerializedProperty reflectionProbes;

        private UpdateReflectionProbes rp;

        private void OnEnable()
        {
            reflectionProbes = serializedObject.FindProperty("reflectionProbesList");
        }

        public override void OnInspectorGUI()
        {
            rp = (UpdateReflectionProbes)target;

            DrawCustomInspector();

            serializedObject.ApplyModifiedProperties();
        }

        private void DrawCustomInspector()
        {
            //GUILayout.Space(5);
            EditorGUILayout.PropertyField(reflectionProbes, new GUIContent("Reflection Probes"));

            if (rp.reflectionProbesList.Count > 0)
            {
                if (GUILayout.Button(new GUIContent("Update Reflection Probes", "At run time press U key to update the reflection probess.")))
                    rp.UpdateRPs();
            }
        }
    }
}
