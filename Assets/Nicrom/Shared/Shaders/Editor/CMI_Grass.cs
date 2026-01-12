using UnityEngine;
using UnityEditor;

namespace Nicrom
{
    public class CMI_Grass : ShaderGUI {

        // Color properties
        MaterialProperty colorsNumber_Enum = null;
        MaterialProperty color1A = null;
        MaterialProperty color1B = null;
        MaterialProperty color2A = null;
        MaterialProperty color2B = null;
        MaterialProperty colorBlendingMode_Enum = null;
        MaterialProperty debug_Enum = null;

        // Main
        MaterialProperty foliageTex = null;
        MaterialProperty alphaCutoff = null;
        // Masks
        MaterialProperty colorMask1 = null;
        MaterialProperty colorMask2 = null;
        MaterialProperty colorMask1Source_Enum = null;
        MaterialProperty colorMask1Start = null;
        MaterialProperty colorMask1End = null;
        MaterialProperty colorMask2GVToggle = null;
        MaterialProperty colorMask2Tiling = null;
        MaterialProperty colorMask2Speed = null;
        MaterialProperty colorMask2SharpMin = null;
        MaterialProperty colorMask2SharpMax = null;
        MaterialProperty colorMask2Opacity = null;
        MaterialProperty colorMask3Start = null;
        MaterialProperty colorMask3End = null;


        MaterialProperty metallic = null;
        MaterialProperty smoothness = null;

        // Terrain blend
        MaterialProperty blendWithTerrain_Toggle = null;
        MaterialProperty bwtTop = null;
        MaterialProperty bwtBottom = null;
        MaterialProperty bwtMaskToggle = null;
        MaterialProperty bwtMaskStart = null;
        MaterialProperty bwtMaskEnd = null;

        // Distance fade
        MaterialProperty distanceFade_Toggle = null;
        MaterialProperty distanceFadeUseGV_Toggle = null;
        MaterialProperty distanceFadeStart = null;
        MaterialProperty distanceFadeLength = null;

        //Motion global variables 
        MaterialProperty gvTime = null;
        MaterialProperty gvAmplitudeScale = null;
        MaterialProperty gvBendingScale = null;
        MaterialProperty gvDirectionAngle = null;

        // Main motion 
        MaterialProperty mmSpeed = null;
        MaterialProperty mmAmplitude = null;
        MaterialProperty mmAmplitudeOffset = null;
        MaterialProperty mmBending = null;
        MaterialProperty mmBendingOffset = null;
        MaterialProperty mmPhaseShiftSource = null;
        MaterialProperty mmPhaseShiftScale = null;
        MaterialProperty mmDirectionAngle = null;
        MaterialProperty mmDirectionShift = null;
        MaterialProperty mmDirectionShiftOffset = null;
        MaterialProperty mmDirectionShiftSpeed = null;
        MaterialProperty mmDirectionShiftNoiseScale = null;
        MaterialProperty mmSineWaveLength = null;
        MaterialProperty mmObjectHeightSource = null;
        MaterialProperty mmObjectHeight = null;
        MaterialProperty mmBendingMethod_Enum = null;

        // Motion Noise
        MaterialProperty noiseTexture = null;
        MaterialProperty staticNoiseTiling = null;

        // Slope correction
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
        GUIStyle foldoutStyle;

        public void FindProperties(MaterialProperty[] mProps)
        {
            colorsNumber_Enum           = FindProperty("_Colors", mProps);
            colorBlendingMode_Enum      = FindProperty("_ColorBlendingMode", mProps);
            color1A                     = FindProperty("_Color1A", mProps);
            color1B                     = FindProperty("_Color1B", mProps);
            color2A                     = FindProperty("_Color2A", mProps);
            color2B                     = FindProperty("_Color2B", mProps);
            debug_Enum                  = FindProperty("_Debug", mProps);

            foliageTex                  = FindProperty("_Albedo", mProps);
            colorMask1                  = FindProperty("_ColorMask1", mProps);
            colorMask2                  = FindProperty("_ColorMask2", mProps);
            colorMask1Source_Enum       = FindProperty("_ColorMask1Source", mProps);
            colorMask1Start             = FindProperty("_ColorMask1Start", mProps);
            colorMask1End               = FindProperty("_ColorMask1End", mProps);
            colorMask2GVToggle          = FindProperty("_ColorMask2GV", mProps);
            colorMask2Tiling            = FindProperty("_ColorMask2Tiling", mProps);
            colorMask2Speed             = FindProperty("_ColorMask2Speed", mProps);
            colorMask2SharpMin          = FindProperty("_ColorMask2SharpnessMin", mProps);
            colorMask2SharpMax          = FindProperty("_ColorMask2SharpnessMax", mProps);
            colorMask2Opacity           = FindProperty("_ColorMask2Opacity", mProps);
            colorMask3Start             = FindProperty("_ColorMask3Start", mProps);
            colorMask3End               = FindProperty("_ColorMask3End", mProps);
            alphaCutoff                 = FindProperty("_AlphaCutoff", mProps);

            metallic                    = FindProperty("_Metallic", mProps);
            smoothness                  = FindProperty("_Smoothness", mProps);

            blendWithTerrain_Toggle     = FindProperty("_BlendWithTerrain", mProps);
            bwtTop                      = FindProperty("_BWTTop", mProps);
            bwtBottom                   = FindProperty("_BWTBottom", mProps);
            bwtMaskToggle               = FindProperty("_BWTMask", mProps);
            bwtMaskStart                = FindProperty("_BWTMaskStart", mProps);
            bwtMaskEnd                  = FindProperty("_BWTMaskEnd", mProps);

            distanceFade_Toggle         = FindProperty("_DistanceFade", mProps);
            distanceFadeUseGV_Toggle    = FindProperty("_DistanceFadeUseGV", mProps);
            distanceFadeStart           = FindProperty("_DistanceFadeStart", mProps);
            distanceFadeLength          = FindProperty("_DistanceFadeLength", mProps);

            gvTime                      = FindProperty("_GVTime", mProps);
            gvAmplitudeScale            = FindProperty("_GVAmplitudeScale", mProps);
            gvBendingScale              = FindProperty("_GVBendingScale", mProps);
            gvDirectionAngle            = FindProperty("_GVDirectionAngle", mProps);

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
            mmBendingMethod_Enum        = FindProperty("_MMBendingMethod", mProps);

            noiseTexture                = FindProperty("_MotionNoise", mProps);
            staticNoiseTiling           = FindProperty("_StaticNoiseTiling", mProps);

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
            foldoutStyle = new GUIStyle(EditorStyles.foldoutHeader);

            DrawMainGroup();
            DrawColorGroup();
            DrawColorMaskGroup();
            DrawBlendWithTerrainGroup();
            DrawDistanceFadeGroup();
            DrawMainMotionGroup();
            DrawMotionNoiseGroup();
            DrawMotionGlobalVariablesGroup();
            DrawSlopeCorrectionGroup();
            DrawScaleGroup();
            DrawAdvancedGroup();
        }

        private void DrawMainGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showGrassMainGroup, "Main Properties", foldoutStyle, -10);

            if (FoldoutStates.showGrassMainGroup)
            {
                GUILayout.Space(5);
                matEditor.TexturePropertySingleLine(new GUIContent("Albedo"), foliageTex);
                matEditor.ShaderProperty(alphaCutoff, new GUIContent("Alpha Cutoff"));
                GUILayout.Space(5);
                matEditor.ShaderProperty(metallic, "Metallic");
                matEditor.ShaderProperty(smoothness, "Smoothness");
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawColorGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showGrassColorGroup, "Color", foldoutStyle, -2);

            if (FoldoutStates.showGrassColorGroup)
            {
                matEditor.ShaderProperty(colorsNumber_Enum, new GUIContent("Colors", "Specifies the number of colors."));
                if (colorsNumber_Enum.floatValue == 1 || colorsNumber_Enum.floatValue == 2)
                {
                    string tooltip = "";

                    if (colorBlendingMode_Enum.floatValue == 0)
                    {
                        if (colorsNumber_Enum.floatValue == 1)
                            tooltip = Tooltips.grassColorBlendingMode_MA3C;
                        if (colorsNumber_Enum.floatValue == 2)
                            tooltip = Tooltips.grassColorBlendingMode_MA4C;
                    }
                    else
                    {
                        if (colorsNumber_Enum.floatValue == 1)
                            tooltip = Tooltips.grassColorBlendingMode_MB3C;
                        if (colorsNumber_Enum.floatValue == 2)
                            tooltip = Tooltips.grassColorBlendingMode_MB4C;
                    }

                    matEditor.ShaderProperty(colorBlendingMode_Enum, new GUIContent("Color Blend Mode", tooltip));
                }
                GUILayout.Space(5);

                if (colorsNumber_Enum.floatValue == 0)
                {
                    matEditor.ShaderProperty(color1A, new GUIContent("Color 1A - Top"));
                    matEditor.ShaderProperty(color1B, new GUIContent("Color 1B - Bottom"));
                }
                else if (colorsNumber_Enum.floatValue == 1)
                {
                    matEditor.ShaderProperty(color1A, new GUIContent("Color 1A - Top"));
                    matEditor.ShaderProperty(color1B, new GUIContent("Color 1B - Bottom"));
                    matEditor.ShaderProperty(color2A, new GUIContent("Color 2A - Top"));
                }
                else
                {
                    matEditor.ShaderProperty(color1A, new GUIContent("Color 1A - Top"));
                    matEditor.ShaderProperty(color1B, new GUIContent("Color 1B - Bottom"));
                    matEditor.ShaderProperty(color2A, new GUIContent("Color 2A - Top"));

                    if (colorBlendingMode_Enum.floatValue == 0)
                        matEditor.ShaderProperty(color2B, new GUIContent("Color 2B - Bottom"));
                    else
                        matEditor.ShaderProperty(color2B, new GUIContent("Color 2B - Top"));
                }

                GUILayout.Space(5);
                matEditor.ShaderProperty(debug_Enum, new GUIContent("Debug"));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawColorMaskGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showGrassMaskGroup, "Color Masks", foldoutStyle, -2);

            if (FoldoutStates.showGrassMaskGroup)
            {
                GUILayout.Space(5);



                if (colorBlendingMode_Enum.floatValue == 0)
                    matEditor.ShaderProperty(colorMask1Source_Enum, new GUIContent("Mask 1 Source", "Specifies the source of Mask 1. When set to Texture, a gradient texture is used as a mask. " 
                        + " When set to Vertex, the position of a vertex on the Y Axis is used as a mask."));

                if (colorMask1Source_Enum.floatValue == 0 || colorBlendingMode_Enum.floatValue == 1)
                    matEditor.TexturePropertySingleLine(new GUIContent("Mask 1", "Gradient texture used to blend between colors"), colorMask1);

                if (colorMask1Source_Enum.floatValue == 1 && colorBlendingMode_Enum.floatValue == 0)
                {
                    matEditor.ShaderProperty(colorMask1Start, new GUIContent("Mask 1 Start", "Controls the point where the blend between the Top and Bottom color starts."));
                    matEditor.ShaderProperty(colorMask1End, new GUIContent("Mask 1 End", "Controls the point where the blend between the Top and Bottom color ends."));
                    GUILayout.Space(5);
                }



                if (colorsNumber_Enum.floatValue != 0)
                {
                    
                    matEditor.TexturePropertySingleLine(new GUIContent("Mask 2", "Noise texture that is used to blend between colors"), colorMask2);
                    matEditor.ShaderProperty(colorMask2GVToggle, new GUIContent("Mask 2 Global Properties", "Enables/Disables the use of Global Properties to control the properties of Mask 2."));
                    if (colorMask2GVToggle.floatValue == 0)
                    {
                        matEditor.ShaderProperty(colorMask2Tiling, new GUIContent("Mask 2 Tiling", "Tiling of the noise texture that is used to blend between colors."));
                        matEditor.ShaderProperty(colorMask2Speed, new GUIContent("Mask 2 Speed", "Controls the speed of mask 2."));
                        matEditor.ShaderProperty(colorMask2SharpMin, new GUIContent("Mask 2 Sharp Min", "Controls the sharpness of mask 2. Noise values that are below the value of this field will be set to 0."));
                        matEditor.ShaderProperty(colorMask2SharpMax, new GUIContent("Mask 2 Sharp Max", "Controls the sharpness of mask 2. Noise values that are above the value of this field will be set to 1."));
                        matEditor.ShaderProperty(colorMask2Opacity, new GUIContent("Mask 2 Opacity", "Controls the opacity of mask 2."));
                    }

                }
                GUILayout.Space(5);

                if (colorBlendingMode_Enum.floatValue == 1)
                {
                    matEditor.ShaderProperty(colorMask3Start, new GUIContent("Mask 3 Start", "Controls the point where the blend between the Top and Bottom color starts."));
                    matEditor.ShaderProperty(colorMask3End, new GUIContent("Mask 3 End", "Controls the point where the blend between the Top and Bottom color ends."));
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawBlendWithTerrainGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showGrassBWTGroup, "Blend With Terrain", foldoutStyle, -2);

            if (FoldoutStates.showGrassBWTGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(blendWithTerrain_Toggle, new GUIContent("Enable", "Enables/Disables the blending with the terrain color."));

                if (blendWithTerrain_Toggle.floatValue == 1)
                {
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(bwtTop, new GUIContent("Top Color", "Controls the blend between the terrain color and the Top color."));
                    matEditor.ShaderProperty(bwtBottom, new GUIContent("Bottom Color", "Controls the blend between the terrain color and the Bottom color."));
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(bwtMaskToggle, new GUIContent("Mask", ""));
                    if (bwtMaskToggle.floatValue == 1)
                    {
                        matEditor.ShaderProperty(bwtMaskStart, new GUIContent("Mask Start", ""));
                        matEditor.ShaderProperty(bwtMaskEnd, new GUIContent("Mask End", ""));
                    }
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawDistanceFadeGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showGrassDFGroup, "Distance Fade", foldoutStyle, -2);

            if (FoldoutStates.showGrassDFGroup)
            {
                matEditor.ShaderProperty(distanceFade_Toggle, new GUIContent("Enable", "Enables/Disables the distance fade."));
              
                if (distanceFade_Toggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(distanceFadeUseGV_Toggle, new GUIContent("Global Properties", "Enables/Disables the use of global properties that control the start and length of the distance fade."));
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

        private void DrawMotionGlobalVariablesGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showGrassGVGroup, "Motion Global Properties", foldoutStyle, -2);

            if (FoldoutStates.showGrassGVGroup)
            {
                matEditor.ShaderProperty(gvTime, new GUIContent("Time", "Enables/Disables the use of the time global property to drive the motion."));
                matEditor.ShaderProperty(gvAmplitudeScale, new GUIContent("Amplitude", "Enables/Disables the use of the amplitude scale global property."));
                matEditor.ShaderProperty(gvBendingScale, new GUIContent("Bending", "Enables/Disables the use of the bending scale global variable."));
                matEditor.ShaderProperty(gvDirectionAngle, new GUIContent("Direction", "Enables/Disables the use of the direction global property."));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawMainMotionGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showGrassMMGroup, "Motion", foldoutStyle, -2);

            if (FoldoutStates.showGrassMMGroup)
            {
                matEditor.ShaderProperty(mmSpeed, new GUIContent("Speed", Tooltips.mmSpeed));

                GUILayout.Space(5);
                matEditor.ShaderProperty(mmAmplitude, new GUIContent("Amplitude", Tooltips.mmAmplitude));
                matEditor.ShaderProperty(mmAmplitudeOffset, new GUIContent("Amplitude Offset", Tooltips.mmAmplitudeOffset));

                GUILayout.Space(5);
                matEditor.ShaderProperty(mmBending, new GUIContent("Bending", Tooltips.mmBending));
                matEditor.ShaderProperty(mmBendingOffset, new GUIContent("Bending Offset", Tooltips.mmBendingOffset));
                matEditor.ShaderProperty(mmBendingMethod_Enum, new GUIContent("Bending Method"));

                GUILayout.Space(5);
                matEditor.ShaderProperty(mmPhaseShiftScale, new GUIContent("Phase Shift Scale", Tooltips.mmPhaseShiftScale));
                matEditor.ShaderProperty(mmPhaseShiftSource, new GUIContent("Phase Shift Source", "Specifies the source of the main motion phase shift."));
                

                GUILayout.Space(5);
                if (gvDirectionAngle.floatValue == 0)
                    matEditor.ShaderProperty(mmDirectionAngle, new GUIContent("Direction Angle", Tooltips.mmDirAngle));

                matEditor.ShaderProperty(mmDirectionShift, new GUIContent("Direction Shift", Tooltips.mmDirShift));
                matEditor.ShaderProperty(mmDirectionShiftOffset, new GUIContent("Direction Shift Offset", Tooltips.mmDirShiftOffset));

                matEditor.ShaderProperty(mmDirectionShiftSpeed, new GUIContent("Direction Shift Speed", Tooltips.mmDirShiftSpeed));
                matEditor.ShaderProperty(mmDirectionShiftNoiseScale, new GUIContent("Direction Shift Noise Scale", Tooltips.mmDirShiftNoiseScale));

                GUILayout.Space(5);
                matEditor.ShaderProperty(mmSineWaveLength, new GUIContent("Sine Wave Length", Tooltips.mmSineWaveLength));

                //GUILayout.Space(5);
                matEditor.ShaderProperty(mmObjectHeightSource, new GUIContent("Object Height Source", Tooltips.mmObjectHeightSource));
                if (mmObjectHeightSource.floatValue == 0)
                    matEditor.ShaderProperty(mmObjectHeight, new GUIContent("Object Height", Tooltips.mmObjectHeight));

                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawMotionNoiseGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showGrassMNGroup, "Motion Noise", foldoutStyle, -2);

            if (FoldoutStates.showGrassMNGroup)
            {
                GUILayout.Space(5);
                matEditor.TexturePropertySingleLine(new GUIContent("Noise Texture"), noiseTexture);
                matEditor.ShaderProperty(staticNoiseTiling, new GUIContent("Noise Tiling"));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawSlopeCorrectionGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showGrassSCGroup, "Slope Correction", foldoutStyle, -2);

            if (FoldoutStates.showGrassSCGroup)
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

        private void DrawScaleGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showGrassScaleGroup, "Scale", foldoutStyle, -2);

            if (FoldoutStates.showGrassScaleGroup)
            {
                matEditor.ShaderProperty(scaleOffset, new GUIContent("Scale Offset", ""));
                matEditor.ShaderProperty(scaleVar_Toggle, new GUIContent("Scale Variation", ""));
                if (scaleVar_Toggle.floatValue == 1)
                {
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(scaleVarMin, new GUIContent("Scale Var Min", ""));
                    matEditor.ShaderProperty(scaleVarMax, new GUIContent("Scale Var Max", ""));
                    GUILayout.Space(5);
                    matEditor.TexturePropertySingleLine(new GUIContent("Scale Var Texture", ""), scaleVarNoiseTexture);
                    matEditor.ShaderProperty(scaleVarNoiseTiling, new GUIContent("Scale Var Tiling", ""));
                    matEditor.ShaderProperty(scaleVarNoiseSharpMin, new GUIContent("Scale Var Sharp Min", ""));
                    matEditor.ShaderProperty(scaleVarNoiseSharpMax, new GUIContent("Scale Var Sharp Max", ""));
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawAdvancedGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showGrassAdvancedGroup, "Advanced Options", foldoutStyle, -2);

            if (FoldoutStates.showGrassAdvancedGroup)
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
