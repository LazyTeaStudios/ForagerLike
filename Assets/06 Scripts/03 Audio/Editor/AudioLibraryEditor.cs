// AudioLibraryEditor.cs
#if UNITY_EDITOR
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;

/// <summary>
/// Inspector UI for <see cref="AudioLibrary"/> with colour-coded categories.
/// </summary>
[CustomEditor(typeof(AudioLibrary))]
public class AudioLibraryEditor : Editor
{
    #region Fields
    SerializedProperty entriesProp;
    ReorderableList list;

    readonly Color[] catColour =
    {
        new(0.55f, 0.78f, 1.0f), // Music
        new(1.00f, 0.66f, 0.66f), // SFX
        new(0.80f, 0.80f, 0.99f), // UI
        new(0.70f, 0.90f, 0.70f)  // Ambience
    };
    #endregion

    #region Unity
    void OnEnable()
    {
        entriesProp = serializedObject.FindProperty("entries");
        list = new ReorderableList(serializedObject, entriesProp, true, true, true, true)
        {
            drawHeaderCallback = rect => EditorGUI.LabelField(rect, "Audio Entries (id - clip - category)"),
            elementHeight = EditorGUIUtility.singleLineHeight + 4
        };

        list.drawElementCallback = (rect, index, _, _) =>
        {
            var element = entriesProp.GetArrayElementAtIndex(index);
            var idProp = element.FindPropertyRelative("id");
            var clipProp = element.FindPropertyRelative("clip");
            var catProp = element.FindPropertyRelative("category");

            const float idW = 120, catW = 80, pad = 4;
            var idRect = new Rect(rect.x, rect.y + 2, idW, EditorGUIUtility.singleLineHeight);
            var clipRect = new Rect(rect.x + idW + pad, rect.y + 2,
                                    rect.width - idW - catW - pad * 2,
                                    EditorGUIUtility.singleLineHeight);
            var catRect = new Rect(rect.x + rect.width - catW, rect.y + 2,
                                    catW, EditorGUIUtility.singleLineHeight);

            idProp.stringValue = EditorGUI.TextField(idRect, idProp.stringValue);
            clipProp.objectReferenceValue = EditorGUI.ObjectField(clipRect, clipProp.objectReferenceValue, typeof(AudioClip), false);
            EditorGUI.DrawRect(new Rect(catRect.x, catRect.y, 6, catRect.height), catColour[catProp.enumValueIndex]);

            catRect.x += 8; catRect.width -= 8;
            catProp.enumValueIndex = EditorGUI.Popup(catRect, catProp.enumValueIndex, catProp.enumDisplayNames);
        };
    }

    public override void OnInspectorGUI()
    {
        serializedObject.Update();
        list.DoLayoutList();
        serializedObject.ApplyModifiedProperties();
    }
    #endregion
}
#endif