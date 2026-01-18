#if UNITY_EDITOR
using UnityEditor;
using UnityEditorInternal;
using UnityEngine;

[CustomEditor(typeof(AudioLibrary))]
public class AudioLibraryEditor : Editor
{
    SerializedProperty musicProp;
    SerializedProperty sfxProp;
    SerializedProperty uiProp;
    SerializedProperty ambienceProp;

    ReorderableList musicList;
    ReorderableList sfxList;
    ReorderableList uiList;
    ReorderableList ambienceList;

    void OnEnable()
    {
        musicProp = serializedObject.FindProperty("music");
        sfxProp = serializedObject.FindProperty("sfx");
        uiProp = serializedObject.FindProperty("ui");
        ambienceProp = serializedObject.FindProperty("ambience");

        musicList = MakeList(musicProp, "Music");
        sfxList = MakeList(sfxProp, "SFX");
        uiList = MakeList(uiProp, "UI");
        ambienceList = MakeList(ambienceProp, "Ambience");
    }

    ReorderableList MakeList(SerializedProperty prop, string title)
    {
        var list = new ReorderableList(serializedObject, prop, true, true, true, true);
        list.drawHeaderCallback = r => EditorGUI.LabelField(r, title);
        list.elementHeight = EditorGUIUtility.singleLineHeight + 4;

        list.drawElementCallback = (rect, index, _, _) =>
        {
            var element = prop.GetArrayElementAtIndex(index);
            var idProp = element.FindPropertyRelative("id");
            var clipProp = element.FindPropertyRelative("clip");

            const float idW = 160f;
            const float pad = 6f;

            var idRect = new Rect(rect.x, rect.y + 2, idW, EditorGUIUtility.singleLineHeight);
            var clipRect = new Rect(rect.x + idW + pad, rect.y + 2, rect.width - idW - pad, EditorGUIUtility.singleLineHeight);

            idProp.stringValue = EditorGUI.TextField(idRect, idProp.stringValue);
            clipProp.objectReferenceValue = EditorGUI.ObjectField(clipRect, clipProp.objectReferenceValue, typeof(AudioClip), false);
        };

        return list;
    }

    public override void OnInspectorGUI()
    {
        serializedObject.Update();

        musicList.DoLayoutList();
        sfxList.DoLayoutList();
        uiList.DoLayoutList();
        ambienceList.DoLayoutList();

        serializedObject.ApplyModifiedProperties();
    }
}
#endif
