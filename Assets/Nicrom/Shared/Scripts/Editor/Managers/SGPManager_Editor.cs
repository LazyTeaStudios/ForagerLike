using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace Nicrom
{
    [CustomEditor(typeof(SGPManager))]
    public class SGPManager_Editor : Editor
    {
        SerializedProperty blendWithTerrain;
        SerializedProperty terrainColorMap;
        SerializedProperty terrainSize;
        SerializedProperty terrainPosition;

        SerializedProperty grassDistanceFadeStart;
        SerializedProperty grassDistanceFadeLength;
        SerializedProperty grassMask2Tiling;
        SerializedProperty grassMask2Speed;
        SerializedProperty grassMask2SharpMin;
        SerializedProperty grassMask2SharpMax;
        SerializedProperty grassMask2Opacity;


        SerializedProperty flowerDistanceFadeStart;
        SerializedProperty flowerDistanceFadeLength;
        SerializedProperty flowerMask2Tiling;
        SerializedProperty flowerMask2SharpMin;
        SerializedProperty flowerMask2SharpMax;
        SerializedProperty flowerMask2Opacity;

        private Texture2D discordIcon;
        private Texture2D documentationIcon;
        private Texture2D publiserIcon;
        private Texture2D headerBackground;
        private Texture2D headerText;

        SGPManager sgpManager;
        GUIStyle foldoutStyle;

        private void OnEnable()
        {
            sgpManager = (SGPManager)target;
            FindProperties();
            sgpManager.SetShaderGlobalProperties();
        }

        private void FindProperties()
        {
            headerBackground = Resources.Load<Texture2D>("Nicrom_Header_Background_01");
            headerText = Resources.Load<Texture2D>("Nicrom_Header_SGPManager_Text");
            discordIcon = Resources.Load<Texture2D>("Nicrom_Footer_Discord");
            publiserIcon = Resources.Load<Texture2D>("Nicrom_Footer_Review");
            documentationIcon = Resources.Load<Texture2D>("Nicrom_Footer_Documentation");

            blendWithTerrain = serializedObject.FindProperty("blendWithTerrain");
            terrainColorMap = serializedObject.FindProperty("terrainColorMap");
            terrainSize = serializedObject.FindProperty("terrainSize");
            terrainPosition = serializedObject.FindProperty("terrainPosition");

            grassDistanceFadeStart = serializedObject.FindProperty("grassDistanceFadeStart");
            grassDistanceFadeLength = serializedObject.FindProperty("grassDistanceFadeLength");
            grassMask2Tiling = serializedObject.FindProperty("grassMask2Tiling");
            grassMask2Speed = serializedObject.FindProperty("grassMask2Speed");
            grassMask2SharpMin = serializedObject.FindProperty("grassMask2SharpMin");
            grassMask2SharpMax = serializedObject.FindProperty("grassMask2SharpMax");
            grassMask2Opacity = serializedObject.FindProperty("grassMask2Opacity");


            flowerDistanceFadeStart = serializedObject.FindProperty("flowerDistanceFadeStart");
            flowerDistanceFadeLength = serializedObject.FindProperty("flowerDistanceFadeLength");
            flowerMask2Tiling = serializedObject.FindProperty("flowerMask2Tiling");
            flowerMask2SharpMin = serializedObject.FindProperty("flowerMask2SharpMin");
            flowerMask2SharpMax = serializedObject.FindProperty("flowerMask2SharpMax");
            flowerMask2Opacity = serializedObject.FindProperty("flowerMask2Opacity");

        }

        public override void OnInspectorGUI()
        {
            sgpManager = (SGPManager)target;
            foldoutStyle = new GUIStyle(EditorStyles.foldoutHeader);
            
            DrawCustomInspector();       
        }

        private void DrawCustomInspector()
        {
            EditorUtils.DrawHeaderBackgroundAndLogo(headerBackground, headerText);

            EditorGUI.BeginChangeCheck();
            DrawBlendWithTerrainGroup();
            DrawGrassGroup();
            DrawFlowerGroup();

            if (EditorGUI.EndChangeCheck())
            {
                if (serializedObject.ApplyModifiedProperties())
                    EditorUtility.SetDirty(target);

                sgpManager.SetShaderGlobalProperties();
            }

            if (serializedObject.ApplyModifiedProperties())
                EditorUtility.SetDirty(target);

            if (GUI.changed)
                EditorUtility.SetDirty(target);

            EditorUtils.DrawFooterButtons(discordIcon, publiserIcon, documentationIcon);
        }

        private void DrawBlendWithTerrainGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref sgpManager.showBlendWithTerrainGroup, "Blend With Terrain", foldoutStyle, -2);

            if (sgpManager.showBlendWithTerrainGroup)
            {
                GUILayout.Space(5);
                EditorGUILayout.PropertyField(blendWithTerrain, new GUIContent("Enable"));

                if (blendWithTerrain.boolValue)
                {
                    GUILayout.Space(5);
                    EditorGUILayout.PropertyField(terrainColorMap, new GUIContent("Terrain Color Map"));
                    EditorGUILayout.PropertyField(terrainPosition, new GUIContent("Terrain Position"));
                    EditorGUILayout.PropertyField(terrainSize, new GUIContent("Terrain Size"));             
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawGrassGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref sgpManager.showGrassGroup, "Grass Shader", foldoutStyle, -2);

            if (sgpManager.showGrassGroup)
            {
                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Distance Fade"), EditorStyles.boldLabel);
                EditorGUILayout.PropertyField(grassDistanceFadeStart, new GUIContent("Start"));
                EditorGUILayout.PropertyField(grassDistanceFadeLength, new GUIContent("Length"));
                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Color Mask 2"), EditorStyles.boldLabel);
                EditorGUILayout.PropertyField(grassMask2Tiling, new GUIContent("Tilling"));
                EditorGUILayout.PropertyField(grassMask2Speed, new GUIContent("Speed"));
                EditorGUILayout.PropertyField(grassMask2SharpMin, new GUIContent("Sharp Min"));
                EditorGUILayout.PropertyField(grassMask2SharpMax, new GUIContent("Sharp Max"));
                EditorGUILayout.PropertyField(grassMask2Opacity, new GUIContent("Opacity"));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawFlowerGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref sgpManager.showFlowerGroup, "Flower Shader", foldoutStyle, -2);

            if (sgpManager.showFlowerGroup)
            {
                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Distance Fade"), EditorStyles.boldLabel);
                EditorGUILayout.PropertyField(flowerDistanceFadeStart, new GUIContent("Start"));
                EditorGUILayout.PropertyField(flowerDistanceFadeLength, new GUIContent("Length"));

                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Color Mask 2"), EditorStyles.boldLabel);
                EditorGUILayout.PropertyField(flowerMask2Tiling, new GUIContent("Tilling"));
                EditorGUILayout.PropertyField(flowerMask2SharpMin, new GUIContent("Sharp Min"));
                EditorGUILayout.PropertyField(flowerMask2SharpMax, new GUIContent("Sharp Max"));
                EditorGUILayout.PropertyField(flowerMask2Opacity, new GUIContent("Opacity"));
                GUILayout.Space(5);

            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }
    }
}
