using Nicrom;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace Nicrom
{
    [CustomEditor(typeof(TextArea))]
    public class TextArea_Editor : Editor
    {
        SerializedProperty text;

        private TextArea textArea;

        private void OnEnable()
        {
            text = serializedObject.FindProperty("text");
        }

        public override void OnInspectorGUI()
        {
            textArea = (TextArea)target;

            textArea.text =  EditorGUILayout.TextArea(textArea.text);

            serializedObject.ApplyModifiedProperties();
        }
    }
}
