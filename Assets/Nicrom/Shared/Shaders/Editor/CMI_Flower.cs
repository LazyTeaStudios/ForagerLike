using UnityEngine;
using UnityEditor;

namespace Nicrom
{
    public class CMI_Flower : ShaderGUI {
        
        MaterialProperty albedoTex = null;
        MaterialProperty alphaCutoff = null;

        // Color
        MaterialProperty flowerColors_Enum = null;
        MaterialProperty flowerColor1A = null;
        MaterialProperty flowerColor1B = null;
        MaterialProperty flowerColor2A = null;
        MaterialProperty flowerColor2B = null;
        MaterialProperty debug_Enum = null;

        // Masks
        MaterialProperty colorMask1 = null;
        MaterialProperty colorMask2 = null;
        MaterialProperty colorMask2GPToggle = null;
        MaterialProperty colorMask2Tiling = null;
        MaterialProperty colorMask2SharpMin = null;
        MaterialProperty colorMask2SharpMax = null;
        MaterialProperty colorMask2Opacity = null;

        // Stem
        MaterialProperty stemToggle = null;
        MaterialProperty stemColorTop = null;
        MaterialProperty stemColorBottom = null;
        MaterialProperty stemColorMaskStart = null;
        MaterialProperty stemColorMaskEnd = null;

        // Terrain Blend
        MaterialProperty bwtToggle = null;
        MaterialProperty bwtTop = null;
        MaterialProperty bwtBottom = null;

        // Distance fade
        MaterialProperty distanceFade_Toggle = null;
        MaterialProperty distanceFadeUseGV_Toggle = null;
        MaterialProperty distanceFadeStart = null;
        MaterialProperty distanceFadeLength = null;

        // Main motion
        MaterialProperty mainMotion_Toggle = null;
        MaterialProperty mmBending = null;
        MaterialProperty mmBendingOffset = null;
        MaterialProperty mmAmplitude = null;
        MaterialProperty mmAmplitudeOffset = null;
        MaterialProperty mmSpeed = null;
        MaterialProperty mmPhaseShiftScale = null;
        MaterialProperty mmDirectionAngle = null;
        MaterialProperty mmPhaseShiftSource = null;
        MaterialProperty mmDirectionShift = null;
        MaterialProperty mmDirectionShiftOffset = null;
        MaterialProperty mmDirectionShiftSpeed = null;
        MaterialProperty mmDirectionShiftNoiseScale = null;
        MaterialProperty mmSineWaveLength = null;
        MaterialProperty mmObjectHeightSource = null;
        MaterialProperty mmObjectHeight = null;

        // Detail motion 1
        MaterialProperty dm1Toggle = null;
        MaterialProperty dm1Amplitude = null;
        MaterialProperty dm1VerticalSpeed = null;
        MaterialProperty dm1FoliageLength = null;

        // Detail motion 2
        MaterialProperty dm2Toggle = null;
        MaterialProperty dm2Amplitude = null;
        MaterialProperty dm2Speed = null;
        MaterialProperty dm2ObjectRadius = null;

        // Motion noise
        MaterialProperty motionNoiseTexture = null;
        MaterialProperty motionNoiseTiling = null;

        // Global Variables 
        MaterialProperty gvTime = null;
        MaterialProperty gvAmplitudeScale = null;
        MaterialProperty gvBendingScale = null;
        MaterialProperty gvDirectionAngle = null;

        // Slope Correction
        MaterialProperty slopeCorrectionToggle = null;
        MaterialProperty slopeCorrectionMagnitude = null;
        MaterialProperty slopeCorrectionOffset = null;

        // Scale
        MaterialProperty scaleOffset = null;
        MaterialProperty scaleVar_Toggle = null;
        MaterialProperty scaleVarMin = null;
        MaterialProperty scaleVarMax = null;
        MaterialProperty scaleVarNoiseTexture = null;
        MaterialProperty scaleVarNoiseTiling = null;
        MaterialProperty scaleVarNoiseSharpMin = null;
        MaterialProperty scaleVarNoiseSharpMax = null;

        MaterialEditor matEditor;

        public void FindProperties(MaterialProperty[] mProps)
        {
            albedoTex                   = FindProperty("_Albedo", mProps);
            alphaCutoff                 = FindProperty("_AlphaCutoff", mProps);

            flowerColors_Enum           = FindProperty("_FlowerColors", mProps);
            flowerColor1A               = FindProperty("_FlowerColor1A", mProps);
            flowerColor1B               = FindProperty("_FlowerColor1B", mProps);
            flowerColor2A               = FindProperty("_FlowerColor2A", mProps);
            flowerColor2B               = FindProperty("_FlowerColor2B", mProps);
            debug_Enum                  = FindProperty("_Debug", mProps);

            colorMask1                  = FindProperty("_ColorMask1", mProps);
            colorMask2                  = FindProperty("_ColorMask2", mProps);
            colorMask2GPToggle          = FindProperty("_ColorMask2GV", mProps);
            colorMask2Tiling            = FindProperty("_ColorMask2Tiling", mProps);
            colorMask2SharpMin          = FindProperty("_ColorMask2SharpMin", mProps);
            colorMask2SharpMax          = FindProperty("_ColorMask2SharpMax", mProps);
            colorMask2Opacity           = FindProperty("_ColorMask2Opacity", mProps);

            stemToggle                  = FindProperty("_STEM", mProps);
            stemColorTop                = FindProperty("_StemColorTop", mProps);
            stemColorBottom             = FindProperty("_StemColorBottom", mProps);
            stemColorMaskStart          = FindProperty("_StemColorMaskStart", mProps);
            stemColorMaskEnd            = FindProperty("_StemColorMaskEnd", mProps);

            bwtToggle                   = FindProperty("_BlendWithTerrain", mProps);
            bwtTop                      = FindProperty("_BWTTop", mProps);
            bwtBottom                   = FindProperty("_BWTBottom", mProps);

            distanceFade_Toggle         = FindProperty("_DistanceFade", mProps);
            distanceFadeUseGV_Toggle    = FindProperty("_DistanceFadeUseGV", mProps);
            distanceFadeStart           = FindProperty("_DistanceFadeStart", mProps);
            distanceFadeLength          = FindProperty("_DistanceFadeLength", mProps);

            mainMotion_Toggle           = FindProperty("_MainMotion", mProps);
            mmBending                   = FindProperty("_MMBending", mProps);
            mmBendingOffset             = FindProperty("_MMBendingOffset", mProps);
            mmAmplitude                 = FindProperty("_MMAmplitude", mProps);
            mmAmplitudeOffset           = FindProperty("_MMAmplitudeOffset", mProps);
            mmSpeed                     = FindProperty("_MMSpeed", mProps);
            mmPhaseShiftSource          = FindProperty("_MMPhaseShiftSource", mProps);
            mmPhaseShiftScale           = FindProperty("_MMPhaseShiftScale", mProps);
            mmDirectionAngle            = FindProperty("_MMDirectionAngle", mProps);
            mmDirectionShift            = FindProperty("_MMDirectionShift", mProps);
            mmDirectionShiftOffset      = FindProperty("_MMDirectionShiftOffset", mProps);
            mmDirectionShiftSpeed       = FindProperty("_MMDirectionShiftSpeed", mProps);
            mmDirectionShiftNoiseScale  = FindProperty("_MMDirectionShiftNoiseScale", mProps);
            mmSineWaveLength            = FindProperty("_MMSineWaveLength", mProps);
            mmObjectHeightSource        = FindProperty("_MMObjectHeightSource", mProps);
            mmObjectHeight              = FindProperty("_MMObjectHeight", mProps);

            dm1Toggle                   = FindProperty("_DetailMotion1", mProps);
            dm1Amplitude                = FindProperty("_DM1Amplitude", mProps);
            dm1VerticalSpeed            = FindProperty("_DM1Speed", mProps);
            dm1FoliageLength            = FindProperty("_DM1FoliageLength", mProps);

            dm2Toggle                   = FindProperty("_DetailMotion2", mProps);
            dm2Amplitude                = FindProperty("_DM2Amplitude", mProps);
            dm2Speed                    = FindProperty("_DM2Speed", mProps);
            dm2ObjectRadius             = FindProperty("_DM2ObjectRadius", mProps);

            motionNoiseTexture          = FindProperty("_MotionNoise", mProps);
            motionNoiseTiling           = FindProperty("_MotionNoiseTiling", mProps);

            gvTime                      = FindProperty("_GVTime", mProps);
            gvAmplitudeScale            = FindProperty("_GVAmplitudeScale", mProps);
            gvBendingScale              = FindProperty("_GVBendingScale", mProps);
            gvDirectionAngle            = FindProperty("_GVDirectionAngle", mProps);

            slopeCorrectionToggle       = FindProperty("_SlopeCorrection", mProps);
            slopeCorrectionMagnitude    = FindProperty("_SlopeCorrectionMagnitude", mProps);
            slopeCorrectionOffset       = FindProperty("_SlopeCorrectionOffset", mProps);

            scaleOffset                 = FindProperty("_ScaleOffset", mProps);
            scaleVar_Toggle             = FindProperty("_ScaleVariation", mProps);
            scaleVarMin                 = FindProperty("_ScaleVarMin", mProps);
            scaleVarMax                 = FindProperty("_ScaleVarMax", mProps);
            scaleVarNoiseTexture        = FindProperty("_ScaleVarNoise", mProps);
            scaleVarNoiseTiling         = FindProperty("_ScaleVarNoiseTiling", mProps);
            scaleVarNoiseSharpMin       = FindProperty("_ScaleVarNoiseSharpMin", mProps);
            scaleVarNoiseSharpMax       = FindProperty("_ScaleVarNoiseSharpMax", mProps);
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
            
            DrawMainTexturesGroup(foldoutStyle);
            DrawFlowerColorGroup(foldoutStyle);
            DrawMasksGroup(foldoutStyle);
            DrawStemColorGroup(foldoutStyle);
            DrawBlendWithTerrainGroup(foldoutStyle);
            DrawDistanceFadeGroup(foldoutStyle);
            DrawMainMotionGroup(foldoutStyle);
            DrawDetailMotionGroup(foldoutStyle);
            DrawMotionNoiseGroup(foldoutStyle);
            DrawGlobalVariablesGroup(foldoutStyle);
            DrawSlopeCorrectionGroup(foldoutStyle);
            DrawScaleGroup(foldoutStyle);
            DrawAdvancedGroup(foldoutStyle);
        }

        private void DrawMainTexturesGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showFlowerMainTexGroup, "Main Properties", foldoutStyle, -10);

            if (FoldoutStates.showFlowerMainTexGroup)
            {
                GUILayout.Space(5);
                matEditor.TexturePropertySingleLine(new GUIContent("Albedo"), albedoTex);
                matEditor.ShaderProperty(alphaCutoff, new GUIContent("Alpha Cutoff"));
                GUILayout.Space(5);          
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawFlowerColorGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showFlowerColorGroup, "Flower Color", foldoutStyle, -2);

            if (FoldoutStates.showFlowerColorGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(flowerColors_Enum, new GUIContent("Colors"));
                matEditor.ShaderProperty(flowerColor1A, new GUIContent("Color 1A", "The color that is applied to the edge part of the flower."));
                matEditor.ShaderProperty(flowerColor1B, new GUIContent("Color 1B", "The color that is applied to the center part of the flower."));

                if (flowerColors_Enum.floatValue == 1)
                {
                    matEditor.ShaderProperty(flowerColor2A, new GUIContent("Color 2A", "The color that is applied to the edge part of the edge."));
                    matEditor.ShaderProperty(flowerColor2B, new GUIContent("Color 2B", "The color that is applied to the center part of the center."));
                }
                matEditor.ShaderProperty(debug_Enum, new GUIContent("Debug"));

                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawMasksGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showFlowerMaskGroup, "Flower Color Masks", foldoutStyle, -2);
            
            if (FoldoutStates.showFlowerMaskGroup)
            {
                GUILayout.Space(5);
                matEditor.TexturePropertySingleLine(new GUIContent("Mask 1"), colorMask1);

                if (flowerColors_Enum.floatValue == 1)
                {
                    matEditor.TexturePropertySingleLine(new GUIContent("Mask 2"), colorMask2);
                    matEditor.ShaderProperty(colorMask2GPToggle, new GUIContent("Global Properties"));

                    if (colorMask2GPToggle.floatValue == 0)
                    {
                        matEditor.ShaderProperty(colorMask2Tiling, new GUIContent("Mask 2 Tiling"));
                        matEditor.ShaderProperty(colorMask2SharpMin, new GUIContent("Mask 2 Sharp Min"));
                        matEditor.ShaderProperty(colorMask2SharpMax, new GUIContent("Mask 2 Sharp Max"));
                        matEditor.ShaderProperty(colorMask2Opacity, new GUIContent("Mask 2 Opacity"));
                    }
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawStemColorGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showFlowerStemGroup, "Stem Color", foldoutStyle, -2);

            if (FoldoutStates.showFlowerStemGroup)
            {
                matEditor.ShaderProperty(stemToggle, new GUIContent("Stem", "Enables/disables the flower stem."));
                if (stemToggle.floatValue == 1)
                {
                    GUILayout.Space(5);

                    matEditor.ShaderProperty(stemColorTop, new GUIContent("Top", "The color of the stem at the top."));
                    matEditor.ShaderProperty(stemColorBottom, new GUIContent("Bottom", "The color of the stem at the Bottom."));

                    matEditor.ShaderProperty(stemColorMaskStart, new GUIContent("Mask Start", "Controls the point where the blend between the Top and Bottom stem colors starts."));
                    matEditor.ShaderProperty(stemColorMaskEnd, new GUIContent("Mask End", "Controls the point where the blend between the Top and Bottom stem colors ends."));
                }

                if (stemToggle.floatValue == 0 && bwtToggle.floatValue == 1)
                    bwtToggle.floatValue = 0;
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawBlendWithTerrainGroup(GUIStyle foldoutStyle)
        {
            if (stemToggle.floatValue == 1)
            {
                EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showFlowerBWTGroup, "Blend With Terrain", foldoutStyle, -2);
                
                if (FoldoutStates.showFlowerBWTGroup)
                {
                    matEditor.ShaderProperty(bwtToggle, new GUIContent("Enable"));
                    if (bwtToggle.floatValue == 1)
                    {
                        matEditor.ShaderProperty(bwtTop, new GUIContent("Top Color", "Controls the blend between the terrain color and the Top color."));
                        matEditor.ShaderProperty(bwtBottom, new GUIContent("Bottom Color", "Controls the blend between the terrain color and the Bottom color."));
                    }
                    GUILayout.Space(5);
                }
                EditorGUILayout.EndFoldoutHeaderGroup();
            }
        }

        private void DrawDistanceFadeGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showFlowerDFGroup, "Distance Fade", foldoutStyle, -2);
            
            if (FoldoutStates.showFlowerDFGroup)
            {
                matEditor.ShaderProperty(distanceFade_Toggle, new GUIContent("Enable", "Enables/Disables the distance fade."));

                if (distanceFade_Toggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(distanceFadeUseGV_Toggle, new GUIContent("Global Properties", "Enables/Disables the use of global properties to control the start and length of the distance fade."));
                    GUILayout.Space(5);
                    if (distanceFadeUseGV_Toggle.floatValue == 0)
                    {
                        matEditor.ShaderProperty(distanceFadeStart, new GUIContent("Distance Fade Start", "Specifies the distance from the camera where the fade should start."));
                        matEditor.ShaderProperty(distanceFadeLength, new GUIContent("Distance Fade Length", "Specifies the length of the fade."));
                    }

                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawMainMotionGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showFlowerMMGroup, "Main Motion", foldoutStyle, -2);
            
            if (FoldoutStates.showFlowerMMGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(mainMotion_Toggle, new GUIContent("Enable", Tooltips.mmToggle));
                GUILayout.Space(5);
                if (mainMotion_Toggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(mmSpeed, new GUIContent("Speed", Tooltips.mmSpeed));

                    GUILayout.Space(5);
                    matEditor.ShaderProperty(mmAmplitude, new GUIContent("Amplitude", Tooltips.mmAmplitude));
                    matEditor.ShaderProperty(mmAmplitudeOffset, new GUIContent("Amplitude Offset", Tooltips.mmAmplitudeOffset));
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(mmBending, new GUIContent("Bending", Tooltips.mmBending));
                    matEditor.ShaderProperty(mmBendingOffset, new GUIContent("Bending Offset", Tooltips.mmBendingOffset));

                    GUILayout.Space(5);
                    matEditor.ShaderProperty(mmPhaseShiftSource, new GUIContent("Phase Shift Source"));
                    matEditor.ShaderProperty(mmPhaseShiftScale, new GUIContent("Phase Shift Scale", Tooltips.mmPhaseShiftScale));

                    if (gvDirectionAngle.floatValue == 0)
                        matEditor.ShaderProperty(mmDirectionAngle, new GUIContent("Direction Angle", Tooltips.mmDirAngle));

                    GUILayout.Space(5);
                    matEditor.ShaderProperty(mmDirectionShift, new GUIContent("Direction Shift", Tooltips.mmDirShift));
                    matEditor.ShaderProperty(mmDirectionShiftOffset, new GUIContent("Direction Shift Offset", Tooltips.mmDirShiftOffset));

                    matEditor.ShaderProperty(mmDirectionShiftSpeed, new GUIContent("Direction Shift Speed", Tooltips.mmDirShiftSpeed));
                    matEditor.ShaderProperty(mmDirectionShiftNoiseScale, new GUIContent("Direction Shift Noise Scale", Tooltips.mmDirShiftNoiseScale));

                    GUILayout.Space(5);
                    matEditor.ShaderProperty(mmSineWaveLength, new GUIContent("Sine Wave Length", Tooltips.mmSineWaveLength));

                    matEditor.ShaderProperty(mmObjectHeightSource, new GUIContent("Object Height Source", Tooltips.mmObjectHeightSource));
                    if (mmObjectHeightSource.floatValue == 0)
                        matEditor.ShaderProperty(mmObjectHeight, new GUIContent("Object Height", Tooltips.mmObjectHeight));
                    GUILayout.Space(5);
                }
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawDetailMotionGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showFlowerDM1Group, "Detail Motion", foldoutStyle, -2);

            if (FoldoutStates.showFlowerDM1Group)
            {
                GUILayout.Space(5);
                EditorStyles.label.fontStyle = FontStyle.Bold;
                matEditor.ShaderProperty(dm1Toggle, new GUIContent("Detail Motion 1", Tooltips.dm1Toggle));
                EditorStyles.label.fontStyle = FontStyle.Normal;
               
                if (dm1Toggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(dm1Amplitude, new GUIContent("Amplitude", Tooltips.dm1Amplitude));
                    matEditor.ShaderProperty(dm1VerticalSpeed, new GUIContent("Speed", Tooltips.dm1Speed));
                    matEditor.ShaderProperty(dm1FoliageLength, new GUIContent("Length", Tooltips.dm1Length));
                }

                GUILayout.Space(5);
                EditorStyles.label.fontStyle = FontStyle.Bold;
                matEditor.ShaderProperty(dm2Toggle, new GUIContent("Detail Motion 2", Tooltips.dm2Toggle));
                EditorStyles.label.fontStyle = FontStyle.Normal;
           
                if (dm2Toggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(dm2Amplitude, new GUIContent("Amplitude", Tooltips.dm2Amplitude));
                    matEditor.ShaderProperty(dm2Speed, new GUIContent("Speed", Tooltips.dm2Speed));
                    matEditor.ShaderProperty(dm2ObjectRadius, new GUIContent("Object Radius", Tooltips.dm2Radius));
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawMotionNoiseGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showFlowerMNGroup, "Motion Noise", foldoutStyle, -2);

            if (FoldoutStates.showFlowerMNGroup)
            {
                GUILayout.Space(5);
                matEditor.TexturePropertySingleLine(new GUIContent("Noise Texture"), motionNoiseTexture);
                matEditor.ShaderProperty(motionNoiseTiling, new GUIContent("Noise Tiling"));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawGlobalVariablesGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showFlowerGVGroup, "Motion Global Properties", foldoutStyle, -2);
            
            if (FoldoutStates.showFlowerGVGroup)
            {
                matEditor.ShaderProperty(gvTime, new GUIContent("Time", "Specifies the source of the time."));
                matEditor.ShaderProperty(gvAmplitudeScale, new GUIContent("Amplitude", "Specifies the source of the amplitude scale."));
                matEditor.ShaderProperty(gvBendingScale, new GUIContent("Bending", "Specifies the source of the bending scale."));
                matEditor.ShaderProperty(gvDirectionAngle, new GUIContent("Direction Angle", "Specifies the source of the direction angle."));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawSlopeCorrectionGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showFlowerSCGroup, "Slope Correction", foldoutStyle, -2);
            
            if (FoldoutStates.showFlowerSCGroup)
            {
                matEditor.ShaderProperty(slopeCorrectionToggle, new GUIContent("Enable", "Enables/Disables the slope correction. When enabled the blades will point upwards even when placed on steep slopes."));
                if (slopeCorrectionToggle.floatValue == 1)
                {
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(slopeCorrectionMagnitude, new GUIContent("Magnitude", "The slope correction magnitude. A value of 1 will make the grass point upwards."));
                    matEditor.ShaderProperty(slopeCorrectionOffset, new GUIContent("Magnitude Offset", "The slope corection magnitude offset. The value of this field is multiplied with a static noise value and added to the correction magnitude."));
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawScaleGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showFlowerScaleGroup, "Scale", foldoutStyle, -2);
            
            if (FoldoutStates.showFlowerScaleGroup)
            {
                matEditor.ShaderProperty(scaleOffset, new GUIContent("Scale Offset", ""));
                matEditor.ShaderProperty(scaleVar_Toggle, new GUIContent("Scale Variation", ""));
                if (scaleVar_Toggle.floatValue == 1)
                {
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(scaleVarMin, new GUIContent("Scale Var Min", ""));
                    matEditor.ShaderProperty(scaleVarMax, new GUIContent("Scale Var Max", ""));
                    GUILayout.Space(5);
                    matEditor.TexturePropertySingleLine(new GUIContent("Scale Var Noise Texture", ""), scaleVarNoiseTexture);
                    matEditor.ShaderProperty(scaleVarNoiseTiling, new GUIContent("Scale Var Noise Tiling", ""));
                    matEditor.ShaderProperty(scaleVarNoiseSharpMin, new GUIContent("Scale Var Noise Sharp Min", ""));
                    matEditor.ShaderProperty(scaleVarNoiseSharpMax, new GUIContent("Scale Var Noise Sharp Max", ""));
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawAdvancedGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showFlowerAdvancedGroup, "Advanced Options", foldoutStyle, -2);
            
            if (FoldoutStates.showFlowerAdvancedGroup)
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
