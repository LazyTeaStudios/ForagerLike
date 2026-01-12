using UnityEngine;
using UnityEditor;

namespace Nicrom
{
    public class CMI_CloudShadows : ShaderGUI
    {
        MaterialProperty shadowStrength = null;
        MaterialProperty shadowCoverage = null;
        MaterialProperty shadowSharpMin = null;
        MaterialProperty shadowSharpMax = null;
        MaterialProperty shadowLayers = null;

        MaterialProperty sl1_Noise = null;
        MaterialProperty sl1_Speed = null;
        MaterialProperty sl1_Opacity = null;
        MaterialProperty sl1_Sharpness = null;
        MaterialProperty sl1_SharpMin = null;
        MaterialProperty sl1_SharpMax = null;
        MaterialProperty sl1_RemapMin = null;
        MaterialProperty sl1_RemapMax = null;

        MaterialProperty sl2_Noise = null;
        MaterialProperty sl2_Speed = null;
        MaterialProperty sl2_Opacity = null;
        MaterialProperty sl2_Sharpness = null;
        MaterialProperty sl2_SharpMin = null;
        MaterialProperty sl2_SharpMax = null;
        MaterialProperty sl2_RemapMin = null;
        MaterialProperty sl2_RemapMax = null;

        MaterialProperty sl3_Noise = null;
        MaterialProperty sl3_Speed = null;
        MaterialProperty sl3_Opacity = null;
        MaterialProperty sl3_Sharpness = null;
        MaterialProperty sl3_SharpMin = null;
        MaterialProperty sl3_SharpMax = null;
        MaterialProperty sl3_RemapMin = null;
        MaterialProperty sl3_RemapMax = null;

        MaterialEditor matEditor;
        GUIStyle foldoutStyle;

        public void FindProperties(MaterialProperty[] mProps)
        {
            shadowStrength = FindProperty("_ShadowStrength", mProps);
            shadowCoverage = FindProperty("_ShadowCoverage", mProps);
            shadowSharpMin = FindProperty("_ShadowSharpMin", mProps);
            shadowSharpMax = FindProperty("_ShadowSharpMax", mProps);
            shadowLayers = FindProperty("_ShadowLayers", mProps);

            sl1_Noise = FindProperty("_SL1Noise", mProps);
            sl1_Speed = FindProperty("_SL1Speed", mProps);
            sl1_Opacity = FindProperty("_SL1Opacity", mProps);
            sl1_Sharpness = FindProperty("_SL1Sharpness", mProps);
            sl1_SharpMin = FindProperty("_SL1SharpMin", mProps);
            sl1_SharpMax = FindProperty("_SL1SharpMax", mProps);
            sl1_RemapMin = FindProperty("_SL1RemapMin", mProps);
            sl1_RemapMax = FindProperty("_SL1RemapMax", mProps);

            sl2_Noise = FindProperty("_SL2Noise", mProps);
            sl2_Speed = FindProperty("_SL2Speed", mProps);
            sl2_Opacity = FindProperty("_SL2Opacity", mProps);
            sl2_Sharpness = FindProperty("_SL2Sharpness", mProps);
            sl2_SharpMin = FindProperty("_SL2SharpMin", mProps);
            sl2_SharpMax = FindProperty("_SL2SharpMax", mProps);
            sl2_RemapMin = FindProperty("_SL2RemapMin", mProps);
            sl2_RemapMax = FindProperty("_SL2RemapMax", mProps);

            sl3_Noise = FindProperty("_SL3Noise", mProps);
            sl3_Speed = FindProperty("_SL3Speed", mProps);
            sl3_Opacity = FindProperty("_SL3Opacity", mProps);
            sl3_Sharpness = FindProperty("_SL3Sharpness", mProps);
            sl3_SharpMin = FindProperty("_SL3SharpMin", mProps);
            sl3_SharpMax = FindProperty("_SL3SharpMax", mProps);
            sl3_RemapMin = FindProperty("_SL3RemapMin", mProps);
            sl3_RemapMax = FindProperty("_SL3RemapMax", mProps);
        }

        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] mProps)
        {
            matEditor = materialEditor;
            Material material = materialEditor.target as Material;

            FindProperties(mProps);
            ShaderPropertiesGUI(material);
        }

        public void ShaderPropertiesGUI(Material material)
        {
            foldoutStyle = new GUIStyle(EditorStyles.foldoutHeader);

            DrawMainGroup();
            DrawLayerGroup();
        }

        private void DrawMainGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showCloudShadowsMainGroup, "Main Properties", foldoutStyle, -12);

            if (FoldoutStates.showCloudShadowsMainGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(shadowStrength, new GUIContent("Strength"));
                matEditor.ShaderProperty(shadowCoverage, new GUIContent("Coverage"));
                matEditor.ShaderProperty(shadowSharpMin, new GUIContent("Sharp Min"));
                matEditor.ShaderProperty(shadowSharpMax, new GUIContent("Sharp Max"));
                GUILayout.Space(5);
            }

            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawLayerGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showCloudShadowsLayerGroup, "Layer Properties", foldoutStyle, -2);

            if (FoldoutStates.showCloudShadowsLayerGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(shadowLayers, new GUIContent("Shadow Layers"));
                
                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Shadow Layer 1"), EditorStyles.boldLabel);
                matEditor.TexturePropertySingleLine(new GUIContent("SL1 Noise"), sl1_Noise);
                matEditor.ShaderProperty(sl1_Speed, new GUIContent("SL1 Speed"));
                matEditor.ShaderProperty(sl1_Opacity, new GUIContent("SL1 Opacity"));
                GUILayout.Space(5);
                matEditor.ShaderProperty(sl1_Sharpness, new GUIContent("SL1 Sharpness"));
                if(sl1_Sharpness.floatValue == 1)
                {
                    matEditor.ShaderProperty(sl1_SharpMin, new GUIContent("SL1 Sharp Min"));
                    matEditor.ShaderProperty(sl1_SharpMax, new GUIContent("SL1 Sharp Max"));
                }
                GUILayout.Space(5);
                matEditor.ShaderProperty(sl1_RemapMin, new GUIContent("SL1 Remap Min"));
                matEditor.ShaderProperty(sl1_RemapMax, new GUIContent("SL1 Remap Max"));
                
                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Shadow Layer 2"), EditorStyles.boldLabel);
                matEditor.TexturePropertySingleLine(new GUIContent("SL2 Noise"), sl2_Noise);
                matEditor.ShaderProperty(sl2_Speed, new GUIContent("SL2 Speed"));
                matEditor.ShaderProperty(sl2_Opacity, new GUIContent("SL2 Opacity"));
                GUILayout.Space(5);
                matEditor.ShaderProperty(sl2_Sharpness, new GUIContent("SL2 Sharpness"));
                if (sl2_Sharpness.floatValue == 1)
                {
                    matEditor.ShaderProperty(sl2_SharpMin, new GUIContent("SL2 Sharp Min"));
                    matEditor.ShaderProperty(sl2_SharpMax, new GUIContent("SL2 Sharp Max"));
                }
                GUILayout.Space(5);
                matEditor.ShaderProperty(sl2_RemapMin, new GUIContent("SL2 Remap Min"));
                matEditor.ShaderProperty(sl2_RemapMax, new GUIContent("SL2 Remap Max"));

                if (shadowLayers.floatValue == 1)
                {
                    GUILayout.Space(5);
                    EditorGUILayout.LabelField(new GUIContent("Shadow Layer 3"), EditorStyles.boldLabel);
                    matEditor.TexturePropertySingleLine(new GUIContent("SL3 Noise"), sl3_Noise);
                    matEditor.ShaderProperty(sl3_Speed, new GUIContent("SL3 Speed"));
                    matEditor.ShaderProperty(sl3_Opacity, new GUIContent("SL3 Opacity"));
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(sl3_Sharpness, new GUIContent("SL3 Sharpness"));
                    if (sl3_Sharpness.floatValue == 1)
                    {
                        matEditor.ShaderProperty(sl3_SharpMin, new GUIContent("SL3 Sharp Min"));
                        matEditor.ShaderProperty(sl3_SharpMax, new GUIContent("SL3 Sharp Max"));
                    }
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(sl3_RemapMin, new GUIContent("SL3 Remap Min"));
                    matEditor.ShaderProperty(sl3_RemapMax, new GUIContent("SL3 Remap Max"));
                }

                GUILayout.Space(5);
            }

            EditorGUILayout.EndFoldoutHeaderGroup();
        }
    }
}
