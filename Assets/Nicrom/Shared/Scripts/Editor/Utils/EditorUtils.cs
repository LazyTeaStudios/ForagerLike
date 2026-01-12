using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using System;
using Nicrom.Constants;


namespace Nicrom
{
    public partial class EditorUtils
    {
        public static void DrawFoldoutHeader(Action inside, int vSpace)
        {
            GUILayout.Space(vSpace);
            DrawFoldoutHeaderBackground();
            GUI.backgroundColor = CONSTANT.BackgroundColor;
            inside();
            GUI.backgroundColor = Color.white;
            DrawHeaderLines();
        }

        public static void DrawFoldoutHeader(ref bool foldout, string label, GUIStyle foldoutStyle, float vSpace = 0)
        {
            GUILayout.Space(vSpace);
            DrawFoldoutHeaderBackground();
            GUI.backgroundColor = CONSTANT.FoldoutHeaderColor;
            foldout = EditorGUILayout.BeginFoldoutHeaderGroup(foldout, label, foldoutStyle);
            GUI.backgroundColor = Color.white;
            DrawHeaderLines();
        }

        public static void DrawFoldoutHeaderBackground()
        {
            float headerHeight = 18f;
            var fullRect = GUILayoutUtility.GetRect(0, 0, headerHeight, 0);
            var fillRect = new Rect(0, fullRect.y + 1, fullRect.xMax + 10, headerHeight);
            EditorGUI.DrawRect(fillRect, CONSTANT.CategoryColor);
            GUILayout.Space(-18);
        }

        public static void DrawHeaderLines()
        {
            float headerHeight = 18f;

            var fullRect = GUILayoutUtility.GetRect(0, 0, headerHeight, 0);
            var topLineRect = new Rect(0, fullRect.y - 1 - headerHeight, fullRect.xMax + 10, 1);
            var bottomLineRect = new Rect(0, fullRect.y - 1, fullRect.xMax + 10, 1);

            EditorGUI.DrawRect(topLineRect, CONSTANT.TopLineColor);
            EditorGUI.DrawRect(bottomLineRect, CONSTANT.BottomLineColor);
            GUILayout.Space(-18);
        }

        public static void DrawFooterButtons(Texture2D discordIcon, Texture2D publiserIcon, Texture2D documentationIcon)
        {
            var fullRect = GUILayoutUtility.GetRect(0, 0, 1, 0);
            var topLineRect = new Rect(0, fullRect.y, fullRect.xMax + 10, 1);
            EditorGUI.DrawRect(topLineRect, CONSTANT.TopLineColor);
            GUILayout.Space(5);

            EditorGUILayout.BeginHorizontal(Array.Empty<GUILayoutOption>());
            EditorGUILayout.Space();

            if (GUILayout.Button(new GUIContent(documentationIcon, "Open documentation"), new GUILayoutOption[2]
            {
                GUILayout.MaxHeight(40f),
                GUILayout.MaxWidth(40f),
            }))
                EditorUtility.OpenWithDefaultApp("Assets/Nicrom/Shared/Documentation/Nicrom_SharedAssets.pdf");

            if (GUILayout.Button(new GUIContent(discordIcon, "Get support"), new GUILayoutOption[2]
            {
                GUILayout.MaxHeight(40f),
                GUILayout.MaxWidth(40f),
            }))
                Application.OpenURL("https://discord.com/invite/RCdETwg");

            if (GUILayout.Button(new GUIContent(publiserIcon, "Write review"), new GUILayoutOption[2]
            {
                GUILayout.MaxHeight(40f),
                GUILayout.MaxWidth(40f),
            }))
                Application.OpenURL("https://assetstore.unity.com/publishers/12903");

            EditorGUILayout.Space();
            EditorGUILayout.EndHorizontal();
        }

        public static void DrawHeaderBackgroundAndLogo(Texture2D headerBackground, Texture2D headerLogoText)
        {
            float headerHeight = 64f;

            var rect = EditorGUILayout.GetControlRect(GUILayout.Height(64));
            rect = new Rect(0, 0, rect.xMax + 10, headerHeight);
            var fullRect = GUILayoutUtility.GetRect(0, 0, headerHeight, 0);

            EditorGUI.DrawPreviewTexture(rect, headerBackground);
            rect.y -= 6;
            GUI.DrawTexture(rect, headerLogoText, ScaleMode.ScaleToFit, true);
            GUILayout.Space(-70);
        }

        public static void DrawPropertyWithToggle(SerializedProperty overrideToggle, string propertyLabel, SerializedProperty property, string tooltip = "", int toolbarIndex = 0, bool addSpace = false)
        {
            if (toolbarIndex == 1 && overrideToggle.boolValue == false)
                return;

            EditorGUILayout.BeginHorizontal();
            overrideToggle.boolValue = EditorGUILayout.ToggleLeft(GUIContent.none, overrideToggle.boolValue, GUILayout.Width(12));
            if (overrideToggle.boolValue == false)
                GUI.enabled = false;
            GUILayout.Space(2);
            EditorGUILayout.PropertyField(property, new GUIContent(propertyLabel, tooltip));
            GUI.enabled = true;
            EditorGUILayout.EndHorizontal();

            if(addSpace)
                GUILayout.Space(5);
        }

        public static void DrawShowHideToolbar(ref int toolbarIndex, GUIContent[] guiContentArray)
        {
            GUILayout.Space(2);
            GUILayout.BeginHorizontal();
            GUILayout.Label("");
            GUILayout.FlexibleSpace();
            toolbarIndex = GUILayout.Toolbar(toolbarIndex, guiContentArray, GUILayout.MaxWidth(84), GUILayout.MaxHeight(16));
            GUILayout.EndHorizontal();
        }

        public static void DrawGearSettingsButton(Texture2D image, ref bool showGearSettings)
        {
            GUIStyle bStyle = new GUIStyle(GUI.skin.button)
            {
                alignment = TextAnchor.UpperLeft,
                padding = new RectOffset(2, 2, 2, 2)
            };
            EditorGUILayout.BeginVertical();
            GUILayout.Space(-60);
            EditorGUILayout.BeginHorizontal();
            GUILayout.Label("");
            GUILayout.FlexibleSpace();
            if (GUILayout.Button(new GUIContent(image, "Manager Settings"), bStyle, GUILayout.MaxWidth(18), GUILayout.MaxHeight(18)))
                showGearSettings = !showGearSettings;
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.EndVertical();
        }

        public static void DrawMinMax(GUIContent label, ref float valMin, ref float valMax, float min, float max)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.PrefixLabel(label);
            valMin = EditorGUILayout.FloatField(valMin, GUILayout.Width(38));
            EditorGUILayout.MinMaxSlider(ref valMin, ref valMax, min, max);
            valMax = EditorGUILayout.FloatField(valMax, GUILayout.Width(38));
            EditorGUILayout.EndHorizontal();
        }

        public static void MinMaxSlider(string label, ref SerializedProperty spMin, ref SerializedProperty spMax, float min, float max)
        {
            var valMin = spMin.floatValue;
            var valMax = spMax.floatValue;

            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.PrefixLabel(new GUIContent(label));
            EditorGUI.BeginChangeCheck();
            valMin = EditorGUILayout.FloatField(valMin, GUILayout.Width(38));
            EditorGUILayout.MinMaxSlider(ref valMin, ref valMax, min, max);
            valMax = EditorGUILayout.FloatField(valMax, GUILayout.Width(38));
            if (EditorGUI.EndChangeCheck())
            {
                spMin.floatValue = Mathf.Clamp(valMin, min, max);
                spMax.floatValue = Mathf.Clamp(valMax, min, max);
            }
            EditorGUILayout.EndHorizontal();
        }
    }
}
