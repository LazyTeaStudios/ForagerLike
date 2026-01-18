using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

[AttributeUsage(AttributeTargets.Field)]
public sealed class AudioIdAttribute : PropertyAttribute
{
    public int categoryIndex;
    public AudioIdAttribute() { categoryIndex = -1; }
    public AudioIdAttribute(AudioCategory category) { categoryIndex = (int)category; }
}

#if UNITY_EDITOR

[CustomPropertyDrawer(typeof(AudioIdAttribute))]
public class AudioIdDrawer : PropertyDrawer
{
    public override void OnGUI(Rect position, SerializedProperty property, GUIContent label)
    {
        if (property.propertyType != SerializedPropertyType.String)
        {
            EditorGUI.PropertyField(position, property, label);
            return;
        }

        var lib = UnityEngine.Object.FindFirstObjectByType<AudioLibrary>();
        if (!lib)
        {
            EditorGUI.PropertyField(position, property, label);
            return;
        }

        var attr = (AudioIdAttribute)attribute;
        var ids = new List<string>();

        if (attr.categoryIndex < 0)
        {
            ids.AddRange(lib.EditorGetIds(AudioCategory.Music));
            ids.AddRange(lib.EditorGetIds(AudioCategory.SFX));
            ids.AddRange(lib.EditorGetIds(AudioCategory.UI));
            ids.AddRange(lib.EditorGetIds(AudioCategory.Ambience));
        }
        else
        {
            ids.AddRange(lib.EditorGetIds((AudioCategory)attr.categoryIndex));
        }

        ids.Sort(StringComparer.OrdinalIgnoreCase);

        var options = new string[ids.Count + 1];
        options[0] = "(None)";
        for (int i = 0; i < ids.Count; i++) options[i + 1] = ids[i];

        bool mixed = property.hasMultipleDifferentValues;
        int current = 0;

        if (!mixed && !string.IsNullOrEmpty(property.stringValue))
        {
            int idx = ids.IndexOf(property.stringValue);
            if (idx >= 0) current = idx + 1;
        }

        var prevMixed = EditorGUI.showMixedValue;
        EditorGUI.showMixedValue = mixed;

        EditorGUI.BeginChangeCheck();
        int next = EditorGUI.Popup(position, label.text, current, options);
        bool changed = EditorGUI.EndChangeCheck();

        EditorGUI.showMixedValue = prevMixed;

        if (!changed) return;

        property.stringValue = next <= 0 ? "" : ids[next - 1];
    }
}
#endif
