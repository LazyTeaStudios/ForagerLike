using UnityEditor;
using UnityEngine;

namespace Nicrom
{
    public class CMI_Water : ShaderGUI {

        MaterialProperty metallic = null;
        MaterialProperty smoothness = null;

        MaterialProperty shallowWater = null;
        MaterialProperty deepWater = null;
        MaterialProperty opacityAbove = null;
        MaterialProperty opacityUnder = null;
        MaterialProperty waterDepth = null;
        MaterialProperty edgeFade = null;
        MaterialProperty edgeFadeOffset = null;
        MaterialProperty edgeFadeOffsetSpeed = null;

        MaterialProperty normalMap1 = null;
        MaterialProperty normalMap1Speed = null;
        MaterialProperty normalMap1Tiling = null;
        MaterialProperty normalMap1Strength = null;

        MaterialProperty normalMap2 = null;
        MaterialProperty normalMap2Speed = null;
        MaterialProperty normalMap2Tiling = null;
        MaterialProperty normalMap2Strength = null;

        MaterialProperty refractionToggle = null;
        MaterialProperty refractionStrength = null;
        MaterialProperty refractionFadeStart = null;
        MaterialProperty refractionFadeLength = null;
        MaterialProperty refractionMap = null;
        MaterialProperty refractionMap1Tiling = null;
        MaterialProperty refractionMap2Tiling = null;
        MaterialProperty refractionMap1Speed = null;
        MaterialProperty refractionMap2Speed = null;

        MaterialProperty foamToggle = null;
        MaterialProperty foamColor = null;
        MaterialProperty foamOpacity = null;
        MaterialProperty foamWidth = null;
        MaterialProperty foamDepth = null;
        MaterialProperty foamCoverage = null;
        MaterialProperty foamSharpMin = null;
        MaterialProperty foamSharpMax = null;
        MaterialProperty foamEdgeRoughness = null;
        MaterialProperty foamMap1 = null;
        MaterialProperty foamMap2 = null;
        MaterialProperty foamMap1Speed = null;
        MaterialProperty foamMap2Speed = null;
        MaterialProperty foamMap1Tiling = null;
        MaterialProperty foamMap2Tiling = null;
        MaterialProperty debug_Enum = null;

        MaterialEditor matEditor;

        public void FindProperties(MaterialProperty[] mProps)
        {
            shallowWater                        = FindProperty("_ShallowWaterColor", mProps);
            deepWater                           = FindProperty("_DeepWaterColor", mProps);
            opacityAbove                        = FindProperty("_OpacityAbove", mProps);
            opacityUnder                        = FindProperty("_OpacityUnder", mProps);
            waterDepth                          = FindProperty("_Depth", mProps);
            edgeFade                            = FindProperty("_EdgeFade", mProps);
            edgeFadeOffset                      = FindProperty("_EdgeFadeOffset", mProps);
            edgeFadeOffsetSpeed                 = FindProperty("_EdgeFadeOffsetSpeed", mProps);

            metallic                            = FindProperty("_Metallic", mProps);
            smoothness                          = FindProperty("_Smoothness", mProps);

            normalMap1                          = FindProperty("_NormalMap1", mProps);
            normalMap1Speed                     = FindProperty("_NormalMap1Speed", mProps);
            normalMap1Tiling                    = FindProperty("_NormalMap1Tiling", mProps);
            normalMap1Strength                  = FindProperty("_NormalMap1Strength", mProps);
            normalMap2                          = FindProperty("_NormalMap2", mProps);
            normalMap2Speed                     = FindProperty("_NormalMap2Speed", mProps);
            normalMap2Tiling                    = FindProperty("_NormalMap2Tiling", mProps);
            normalMap2Strength                  = FindProperty("_NormalMap2Strength", mProps);

            refractionToggle                    = FindProperty("_REFRACTION", mProps);
            refractionStrength                  = FindProperty("_RefractionStrength", mProps);
            refractionFadeStart                 = FindProperty("_RefractionFadeStart", mProps);
            refractionFadeLength                = FindProperty("_RefractionFadeLength", mProps);
            refractionMap                       = FindProperty("_RefractionMap", mProps);
            refractionMap1Tiling                = FindProperty("_RefractionMap1Tiling", mProps);
            refractionMap2Tiling                = FindProperty("_RefractionMap2Tiling", mProps);
            refractionMap1Speed                 = FindProperty("_RefractionMap1Speed", mProps);
            refractionMap2Speed                 = FindProperty("_RefractionMap2Speed", mProps);

            foamToggle                          = FindProperty("_FOAM", mProps);
            foamColor                           = FindProperty("_FoamColor", mProps);
            foamOpacity                         = FindProperty("_FoamOpacity", mProps);
            foamWidth                           = FindProperty("_FoamWidth", mProps);
            foamDepth                           = FindProperty("_FoamDepth", mProps);
            foamCoverage                        = FindProperty("_FoamCoverage", mProps);
            foamSharpMin                        = FindProperty("_FoamSharpnessMin", mProps);
            foamSharpMax                        = FindProperty("_FoamSharpnessMax", mProps);
            foamEdgeRoughness                   = FindProperty("_FoamEdgeRoughness", mProps);
            foamMap1                            = FindProperty("_FoamMap1", mProps);
            foamMap1Speed                       = FindProperty("_FoamMap1Speed", mProps);
            foamMap1Tiling                      = FindProperty("_FoamMap1Tiling", mProps);

            foamMap2                            = FindProperty("_FoamMap2", mProps);
            foamMap2Speed                       = FindProperty("_FoamMap2Speed", mProps);
            foamMap2Tiling                      = FindProperty("_FoamMap2Tiling", mProps);

            debug_Enum                          = FindProperty("_Debug", mProps);
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
            GUIStyle foldoutStyle = new GUIStyle(EditorStyles.foldoutHeader);

            DrawColorGroup(foldoutStyle);
            DrawNormalsGroup(foldoutStyle);
            DrawRefractionGroup(foldoutStyle);
            DrawFoamGroup(foldoutStyle);
            DrawAdvancedGroup(foldoutStyle);
        }

        private void DrawColorGroup(GUIStyle foldoutStyle)
        {
            GUILayout.Space(-8);
            //GUIUtils.DrawFoldoutHeader(ref Tooltips.showWaterColorGroup, "Color", foldoutStyle);

            EditorUtils.DrawFoldoutHeader(() => FoldoutStates.showWaterColorGroup = EditorGUILayout.BeginFoldoutHeaderGroup(
                FoldoutStates.showWaterColorGroup, "Color", foldoutStyle), -2);

            if (FoldoutStates.showWaterColorGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(shallowWater, new GUIContent("Shallow Color"));
                matEditor.ShaderProperty(deepWater, new GUIContent("Deep Color"));

                matEditor.ShaderProperty(opacityAbove, new GUIContent("Opacity Above"));
                matEditor.ShaderProperty(opacityUnder, new GUIContent("Opacity Under"));

                matEditor.ShaderProperty(waterDepth, new GUIContent("Depth"));

                matEditor.ShaderProperty(edgeFade, new GUIContent("Edge Fade"));
                matEditor.ShaderProperty(edgeFadeOffset, new GUIContent("Edge Fade Offset"));
                matEditor.ShaderProperty(edgeFadeOffsetSpeed, new GUIContent("Edge Fade Offset Speed"));

                matEditor.ShaderProperty(metallic, "Metallic");
                matEditor.ShaderProperty(smoothness, "Smoothness");
                GUILayout.Space(5);
                matEditor.ShaderProperty(debug_Enum, "Debug");
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawNormalsGroup(GUIStyle foldoutStyle)
        {
            //GUILayout.Space(-2);
            //GUIUtils.DrawFoldoutHeader(ref Tooltips.showWaterNormalsGroup, "Normals", foldoutStyle);

            EditorUtils.DrawFoldoutHeader(() => FoldoutStates.showWaterNormalsGroup = EditorGUILayout.BeginFoldoutHeaderGroup(
                FoldoutStates.showWaterNormalsGroup, "Normals", foldoutStyle), -2);

            if (FoldoutStates.showWaterNormalsGroup)
            {
                GUILayout.Space(5);
                matEditor.TexturePropertySingleLine(new GUIContent("Map 1"), normalMap1);
                matEditor.ShaderProperty(normalMap1Strength, new GUIContent("Map 1 Strength"));
                matEditor.ShaderProperty(normalMap1Speed, new GUIContent("Map 1 Speed"));
                matEditor.ShaderProperty(normalMap1Tiling, new GUIContent("Map 1 Tiling"));
                GUILayout.Space(-5);
                matEditor.TexturePropertySingleLine(new GUIContent("Map 2"), normalMap2);
                matEditor.ShaderProperty(normalMap2Strength, new GUIContent("Map 2 Strength"));
                matEditor.ShaderProperty(normalMap2Speed, new GUIContent("Map 2 Speed"));
                matEditor.ShaderProperty(normalMap2Tiling, new GUIContent("Map 2 Tiling"));
                GUILayout.Space(-10);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawRefractionGroup(GUIStyle foldoutStyle)
        {
            //GUILayout.Space(-2);
            //GUIUtils.DrawFoldoutHeader(ref Tooltips.showWaterRefractionGroup, "Refraction", foldoutStyle);

            EditorUtils.DrawFoldoutHeader(() => FoldoutStates.showWaterRefractionGroup = EditorGUILayout.BeginFoldoutHeaderGroup(
                FoldoutStates.showWaterRefractionGroup, "Refraction", foldoutStyle), -2);

            if (FoldoutStates.showWaterRefractionGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(refractionToggle, new GUIContent("Enable"));
                GUILayout.Space(5);

                if (refractionToggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(refractionStrength, new GUIContent("Strength"));

                    matEditor.ShaderProperty(refractionFadeStart, new GUIContent("Fade Start"));
                    matEditor.ShaderProperty(refractionFadeLength, new GUIContent("Fade Length"));

                    GUILayout.Space(5);
                    matEditor.TexturePropertySingleLine(new GUIContent("Refraction Map"), refractionMap);
                    matEditor.ShaderProperty(refractionMap1Tiling, new GUIContent("Map 1 Tiling"));
                    GUILayout.Space(-18);
                    matEditor.ShaderProperty(refractionMap1Speed, new GUIContent("Map 1 Speed"));
                    GUILayout.Space(-10);
                    matEditor.ShaderProperty(refractionMap2Tiling, new GUIContent("Map 2 Tiling"));
                    GUILayout.Space(-18);
                    matEditor.ShaderProperty(refractionMap2Speed, new GUIContent("Map 2 Speed"));
                }
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawFoamGroup(GUIStyle foldoutStyle)
        {
            //GUILayout.Space(-2);
            //GUIUtils.DrawFoldoutHeader(ref Tooltips.showWaterFoamGroup, "Foam", foldoutStyle);

            EditorUtils.DrawFoldoutHeader(() => FoldoutStates.showWaterFoamGroup = EditorGUILayout.BeginFoldoutHeaderGroup(
                FoldoutStates.showWaterFoamGroup, "Foam", foldoutStyle), -2);

            if (FoldoutStates.showWaterFoamGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(foamToggle, new GUIContent("Enable"));
                GUILayout.Space(5);

                if (foamToggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(foamColor, new GUIContent("Foam Color"));
                    matEditor.ShaderProperty(foamOpacity, new GUIContent("Foam Opacity"));

                    matEditor.ShaderProperty(foamWidth, new GUIContent("Foam Width"));
                    matEditor.ShaderProperty(foamDepth, new GUIContent("Foam Depth"));

                    matEditor.ShaderProperty(foamCoverage, new GUIContent("Foam Coverage"));
                    matEditor.ShaderProperty(foamSharpMin, new GUIContent("Foam Sharpness Min"));
                    matEditor.ShaderProperty(foamSharpMax, new GUIContent("Foam Sharpness Max"));

                    matEditor.ShaderProperty(foamEdgeRoughness, new GUIContent("Foam Edge Roughness"));

                    matEditor.TexturePropertySingleLine(new GUIContent("Foam 1"), foamMap1);
                    matEditor.ShaderProperty(foamMap1Speed, new GUIContent("Foam 1 Speed"));
                    matEditor.ShaderProperty(foamMap1Tiling, new GUIContent("Foam 1 Tiling"));
                    GUILayout.Space(-5);
                    matEditor.TexturePropertySingleLine( new GUIContent("Foam 2"), foamMap2);
                    matEditor.ShaderProperty(foamMap2Speed, new GUIContent("Foam 2 Speed"));
                    matEditor.ShaderProperty(foamMap2Tiling, new GUIContent("Foam 2 Tiling"));
                    GUILayout.Space(-5);
                }
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawAdvancedGroup(GUIStyle foldoutStyle)
        {
            //GUILayout.Space(-2);
            //GUIUtils.DrawFoldoutHeader(ref Tooltips.showWaterAdvancedGroup, "Advanced Options", foldoutStyle);

            EditorUtils.DrawFoldoutHeader(() => FoldoutStates.showWaterAdvancedGroup = EditorGUILayout.BeginFoldoutHeaderGroup(
                FoldoutStates.showWaterAdvancedGroup, "Advanced Options", foldoutStyle), -2);

            if (FoldoutStates.showWaterAdvancedGroup)
            {
                GUILayout.Space(5);
                matEditor.RenderQueueField();
                matEditor.EnableInstancingField();
                matEditor.DoubleSidedGIField();
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }
    }
}
