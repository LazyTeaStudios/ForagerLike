#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(LootTable))]
public class LootTableEditor : Editor
{
    private float[] previousWeights;

    public override void OnInspectorGUI()
    {
        LootTable lootTable = (LootTable)target;

        serializedObject.Update();

        EditorGUILayout.PropertyField(serializedObject.FindProperty("dropChance"));

        EditorGUILayout.Space();
        EditorGUILayout.LabelField("Loot Entries", EditorStyles.boldLabel);

        var entriesProperty = serializedObject.FindProperty("lootEntries");

        if (previousWeights == null || previousWeights.Length != entriesProperty.arraySize)
        {
            previousWeights = new float[entriesProperty.arraySize];
            for (int i = 0; i < entriesProperty.arraySize; i++)
            {
                var entryProperty = entriesProperty.GetArrayElementAtIndex(i);
                previousWeights[i] = entryProperty.FindPropertyRelative("weight").floatValue;
            }
        }

        EditorGUILayout.BeginHorizontal();
        if (GUILayout.Button("Add Item", GUILayout.Width(80)))
        {
            lootTable.AddLootEntry();
            System.Array.Resize(ref previousWeights, entriesProperty.arraySize + 1);
            previousWeights[previousWeights.Length - 1] = 0f;
            EditorUtility.SetDirty(target);
        }

        if (entriesProperty.arraySize > 0 && GUILayout.Button("Remove Last", GUILayout.Width(100)))
        {
            lootTable.RemoveLootEntry(entriesProperty.arraySize - 1);
            System.Array.Resize(ref previousWeights, entriesProperty.arraySize - 1);
            EditorUtility.SetDirty(target);
        }

        if (GUILayout.Button("Normalize", GUILayout.Width(80)))
        {
            NormalizeWeights(entriesProperty);
            UpdatePreviousWeights(entriesProperty);
            EditorUtility.SetDirty(target);
        }
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.Space();

        EditorGUI.indentLevel++;

        for (int i = 0; i < entriesProperty.arraySize; i++)
        {
            var entryProperty = entriesProperty.GetArrayElementAtIndex(i);
            var itemPrefabProperty = entryProperty.FindPropertyRelative("itemPrefab");
            var weightProperty = entryProperty.FindPropertyRelative("weight");
            var isLockedProperty = entryProperty.FindPropertyRelative("isLocked");

            EditorGUILayout.BeginVertical(EditorStyles.helpBox);

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.PropertyField(itemPrefabProperty, new GUIContent($"Item {i + 1}"));

            bool wasLocked = isLockedProperty.boolValue;
            GUIContent lockContent = new GUIContent(wasLocked ? "LOCKED" : "UNLOCKED", "Toggle lock state");
            GUIStyle toggleStyle = wasLocked ? EditorStyles.miniButtonMid : EditorStyles.miniButton;

            if (wasLocked)
                GUI.backgroundColor = Color.yellow;

            bool newLockState = GUILayout.Toggle(wasLocked, lockContent, toggleStyle, GUILayout.Width(80));

            GUI.backgroundColor = Color.white;

            if (newLockState != wasLocked)
            {
                isLockedProperty.boolValue = newLockState;
                EditorUtility.SetDirty(target);
            }

            GUI.backgroundColor = Color.red;
            if (GUILayout.Button("X", GUILayout.Width(25)))
            {
                lootTable.RemoveLootEntry(i);
                System.Array.Resize(ref previousWeights, entriesProperty.arraySize - 1);
                EditorUtility.SetDirty(target);
                break;
            }
            GUI.backgroundColor = Color.white;

            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();

            float currentWeight = weightProperty.floatValue;
            float maxAllowedWeight = GetMaxAllowedWeightForUnlocked(entriesProperty, i);

            if (isLockedProperty.boolValue)
            {
                GUI.backgroundColor = Color.yellow;
            }

            EditorGUI.BeginDisabledGroup(isLockedProperty.boolValue);
            float newWeight = EditorGUILayout.Slider(
                $"Weight ({currentWeight:F1}%) Max: {maxAllowedWeight:F1}%",
                currentWeight,
                0f,
                maxAllowedWeight
            );
            EditorGUI.EndDisabledGroup();

            GUI.backgroundColor = Color.white;

            if (!isLockedProperty.boolValue &&
                Mathf.Abs(newWeight - currentWeight) > 0.01f &&
                HasUnlockedEntries(entriesProperty, i))
            {
                RedistributeWeights(entriesProperty, i, newWeight);
                UpdatePreviousWeights(entriesProperty);
                EditorUtility.SetDirty(target);
            }

            EditorGUILayout.EndHorizontal();
            EditorGUILayout.EndVertical();
        }

        EditorGUI.indentLevel--;

        EditorGUILayout.Space();
        EditorGUILayout.BeginHorizontal();
        if (GUILayout.Button("Lock All"))
        {
            SetAllLocks(entriesProperty, true);
            EditorUtility.SetDirty(target);
        }
        if (GUILayout.Button("Unlock All"))
        {
            SetAllLocks(entriesProperty, false);
            EditorUtility.SetDirty(target);
        }
        EditorGUILayout.EndHorizontal();

        EditorGUILayout.Space();
        EditorGUILayout.LabelField("Probability Breakdown", EditorStyles.boldLabel);

        float totalWeight = 0f;
        float lockedWeight = 0f;
        int lockedCount = 0;

        for (int i = 0; i < entriesProperty.arraySize; i++)
        {
            var entryProperty = entriesProperty.GetArrayElementAtIndex(i);
            float weight = entryProperty.FindPropertyRelative("weight").floatValue;
            bool isLocked = entryProperty.FindPropertyRelative("isLocked").boolValue;

            totalWeight += weight;
            if (isLocked)
            {
                lockedWeight += weight;
                lockedCount++;
            }
        }

        if (totalWeight > 0)
        {
            for (int i = 0; i < entriesProperty.arraySize; i++)
            {
                var entryProperty = entriesProperty.GetArrayElementAtIndex(i);
                var itemPrefab = entryProperty.FindPropertyRelative("itemPrefab").objectReferenceValue as GameObject;
                var weight = entryProperty.FindPropertyRelative("weight").floatValue;
                var isLocked = entryProperty.FindPropertyRelative("isLocked").boolValue;

                if (itemPrefab != null)
                {
                    float percentage = (weight / totalWeight) * 100f;

                    EditorGUILayout.BeginHorizontal();

                    string itemName = itemPrefab.name;
                    if (isLocked) itemName += " [LOCKED]";

                    EditorGUILayout.LabelField(itemName, GUILayout.Width(150));

                    Rect rect = EditorGUILayout.GetControlRect(GUILayout.Height(16));

                    Color barColor = isLocked ? Color.yellow : Color.green;
                    Color originalColor = GUI.backgroundColor;
                    GUI.backgroundColor = barColor;

                    EditorGUI.ProgressBar(rect, percentage / 100f, $"{percentage:F1}%");

                    GUI.backgroundColor = originalColor;

                    EditorGUILayout.EndHorizontal();
                }
            }
        }

        if (Mathf.Abs(totalWeight - 100f) > 0.1f)
        {
            EditorGUILayout.Space();
            EditorGUILayout.HelpBox($"Total weight is {totalWeight:F1}% (should be 100%)", MessageType.Warning);
        }

        serializedObject.ApplyModifiedProperties();
    }

    /// <summary>
    /// Calculate the maximum weight available to all unlocked items combined
    /// </summary>
    private float GetMaxAllowedWeightForUnlocked(SerializedProperty entriesProperty, int currentIndex)
    {
        var currentEntryProperty = entriesProperty.GetArrayElementAtIndex(currentIndex);
        bool isCurrentLocked = currentEntryProperty.FindPropertyRelative("isLocked").boolValue;

        if (isCurrentLocked)
        {
            return 100f;
        }

        float totalLockedWeight = 0f;

        for (int i = 0; i < entriesProperty.arraySize; i++)
        {
            var entryProperty = entriesProperty.GetArrayElementAtIndex(i);
            bool isLocked = entryProperty.FindPropertyRelative("isLocked").boolValue;

            if (isLocked)
            {
                totalLockedWeight += entryProperty.FindPropertyRelative("weight").floatValue;
            }
        }

        return Mathf.Max(0f, 100f - totalLockedWeight);
    }

    private bool HasUnlockedEntries(SerializedProperty entriesProperty, int excludeIndex)
    {
        for (int i = 0; i < entriesProperty.arraySize; i++)
        {
            if (i != excludeIndex)
            {
                var entryProperty = entriesProperty.GetArrayElementAtIndex(i);
                if (!entryProperty.FindPropertyRelative("isLocked").boolValue)
                {
                    return true;
                }
            }
        }
        return false;
    }

    private void RedistributeWeights(SerializedProperty entriesProperty, int changedIndex, float newWeight)
    {
        float oldWeight = previousWeights[changedIndex];
        float weightDifference = newWeight - oldWeight;

        int unlockedCount = 0;
        for (int i = 0; i < entriesProperty.arraySize; i++)
        {
            if (i != changedIndex)
            {
                var entryProperty = entriesProperty.GetArrayElementAtIndex(i);
                if (!entryProperty.FindPropertyRelative("isLocked").boolValue)
                {
                    unlockedCount++;
                }
            }
        }

        if (unlockedCount == 0) return;

        float redistributionPerItem = -weightDifference / unlockedCount;

        for (int i = 0; i < entriesProperty.arraySize; i++)
        {
            var entryProperty = entriesProperty.GetArrayElementAtIndex(i);
            var weightProperty = entryProperty.FindPropertyRelative("weight");
            var isLockedProperty = entryProperty.FindPropertyRelative("isLocked");

            if (i == changedIndex)
            {
                weightProperty.floatValue = newWeight;
            }
            else if (!isLockedProperty.boolValue)
            {
                float newValue = Mathf.Max(0f, weightProperty.floatValue + redistributionPerItem);
                weightProperty.floatValue = newValue;
            }
        }
    }

    private void UpdatePreviousWeights(SerializedProperty entriesProperty)
    {
        for (int i = 0; i < entriesProperty.arraySize; i++)
        {
            var entryProperty = entriesProperty.GetArrayElementAtIndex(i);
            previousWeights[i] = entryProperty.FindPropertyRelative("weight").floatValue;
        }
    }

    private void SetAllLocks(SerializedProperty entriesProperty, bool lockState)
    {
        for (int i = 0; i < entriesProperty.arraySize; i++)
        {
            var entryProperty = entriesProperty.GetArrayElementAtIndex(i);
            entryProperty.FindPropertyRelative("isLocked").boolValue = lockState;
        }
    }

    private void NormalizeWeights(SerializedProperty entriesProperty)
    {
        if (entriesProperty.arraySize == 0) return;

        float totalLockedWeight = 0f;
        int unlockedCount = 0;

        for (int i = 0; i < entriesProperty.arraySize; i++)
        {
            var entryProperty = entriesProperty.GetArrayElementAtIndex(i);
            var isLocked = entryProperty.FindPropertyRelative("isLocked").boolValue;

            if (isLocked)
            {
                totalLockedWeight += entryProperty.FindPropertyRelative("weight").floatValue;
            }
            else
            {
                unlockedCount++;
            }
        }

        if (unlockedCount == 0) return;

        float remainingWeight = 100f - totalLockedWeight;
        float equalWeight = remainingWeight / unlockedCount;

        for (int i = 0; i < entriesProperty.arraySize; i++)
        {
            var entryProperty = entriesProperty.GetArrayElementAtIndex(i);
            var isLocked = entryProperty.FindPropertyRelative("isLocked").boolValue;

            if (!isLocked)
            {
                entryProperty.FindPropertyRelative("weight").floatValue = Mathf.Max(0f, equalWeight);
            }
        }
    }
}
#endif