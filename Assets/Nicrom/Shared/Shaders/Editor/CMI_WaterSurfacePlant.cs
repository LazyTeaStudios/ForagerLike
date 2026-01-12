using UnityEngine;
using UnityEditor;

namespace Nicrom
{
    public class CMI_WaterSurfacePlant : ShaderGUI
    {
        MaterialProperty albedoTex = null;
        MaterialProperty normalTex = null;
        MaterialProperty normalScale = null;
        MaterialProperty alphaCutoff = null;
        MaterialProperty metallic = null;
        MaterialProperty smoothnessTex = null;
        MaterialProperty smoothnessScale = null;

        MaterialProperty colors_Enum = null;
        MaterialProperty color1A = null;
        MaterialProperty color1B = null;
        MaterialProperty color2A = null;
        MaterialProperty color2B = null;
        MaterialProperty debug_Enum = null;


        MaterialProperty colorMask1Source_Enum = null;
        MaterialProperty colorMask1StartV = null;
        MaterialProperty colorMask1EndV = null;
        MaterialProperty colorMask1StartVert = null;
        MaterialProperty colorMask1EndVert = null;
        MaterialProperty colorMask2 = null;
        MaterialProperty colorMask2Tiling = null;
        MaterialProperty colorMask2SharpMin = null;
        MaterialProperty colorMask2SharpMax = null;

        // Main Motion
        MaterialProperty mainMotion_Toggle = null;
        MaterialProperty mmAmplitude = null;
        MaterialProperty mmAmplitudeOffset = null;
        MaterialProperty mmSpeed = null;
        MaterialProperty mmPhaseShiftSource = null;
        MaterialProperty mmPhaseShiftScale = null;
        MaterialProperty mmDirectionAngle = null;
        MaterialProperty mmDirectionShift = null;
        MaterialProperty mmDirectionShiftOffset = null;
        MaterialProperty mmDirectionShiftSpeed = null;
        MaterialProperty mmDirectionShiftNoiseScale = null;
        MaterialProperty mmSineWaveLength = null;
        MaterialProperty mmObjectHeight = null;

        // Detail Motion 1
        MaterialProperty dm1Toggle = null;
        MaterialProperty dm1Speed = null;
        MaterialProperty dm1Amplitude = null;
        MaterialProperty dm1AmplitudeOffset = null;


        MaterialProperty motionNoiseTexture = null;
        MaterialProperty motionNoiseTiling = null;

        // Global Variables 
        MaterialProperty gvTime = null;
        MaterialProperty gvAmplitudeScale = null;
        MaterialProperty gvDirectionAngle = null;

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
            normalTex                   = FindProperty("_Normal", mProps);
            normalScale                 = FindProperty("_NormalScale", mProps);
            alphaCutoff                 = FindProperty("_AlphaCutoff", mProps);
            metallic                    = FindProperty("_Metallic", mProps);
            smoothnessTex               = FindProperty("_Smoothness", mProps);
            smoothnessScale             = FindProperty("_SmoothnessScale", mProps);

            colors_Enum                 = FindProperty("_Colors", mProps);
            color1A                     = FindProperty("_Color1A", mProps);
            color1B                     = FindProperty("_Color1B", mProps);
            color2A                     = FindProperty("_Color2A", mProps);
            color2B                     = FindProperty("_Color2B", mProps);
            debug_Enum                  = FindProperty("_Debug", mProps);

            colorMask1Source_Enum       = FindProperty("_ColorMask1Source", mProps);
            colorMask1StartV            = FindProperty("_ColorMask1StartV", mProps);
            colorMask1EndV              = FindProperty("_ColorMask1EndV", mProps);
            colorMask1StartVert         = FindProperty("_ColorMask1StartVert", mProps);
            colorMask1EndVert           = FindProperty("_ColorMask1EndVert", mProps);
            colorMask2                  = FindProperty("_ColorMask2", mProps);
            colorMask2Tiling            = FindProperty("_ColorMask2Tiling", mProps);
            colorMask2SharpMin          = FindProperty("_ColorMask2SharpMin", mProps);
            colorMask2SharpMax          = FindProperty("_ColorMask2SharpMax", mProps);

            mainMotion_Toggle           = FindProperty("_MainMotion", mProps);
            mmSpeed                     = FindProperty("_MMSpeed", mProps);
            mmAmplitude                 = FindProperty("_MMAmplitude", mProps);
            mmAmplitudeOffset           = FindProperty("_MMAmplitudeOffset", mProps);
            mmPhaseShiftSource          = FindProperty("_MMPhaseShiftSource", mProps);
            mmPhaseShiftScale           = FindProperty("_MMPhaseShiftScale", mProps);
            mmDirectionAngle            = FindProperty("_MMDirectionAngle", mProps);
            mmDirectionShift            = FindProperty("_MMDirectionShift", mProps);
            mmDirectionShiftOffset      = FindProperty("_MMDirectionShiftOffset", mProps);
            mmDirectionShiftSpeed       = FindProperty("_MMDirectionShiftSpeed", mProps);
            mmDirectionShiftNoiseScale  = FindProperty("_MMDirectionShiftNoiseScale", mProps);
            mmSineWaveLength            = FindProperty("_MMSineWaveLength", mProps);
            mmObjectHeight              = FindProperty("_MMObjectHeight", mProps);

            dm1Toggle                   = FindProperty("_DetailMotion1", mProps);
            dm1Speed                    = FindProperty("_DM1Speed", mProps);
            dm1Amplitude                = FindProperty("_DM1Amplitude", mProps);
            dm1AmplitudeOffset          = FindProperty("_DM1AmplitudeOffset", mProps);

            motionNoiseTexture          = FindProperty("_MotionNoise", mProps);
            motionNoiseTiling           = FindProperty("_MotionNoiseTiling", mProps);

            gvTime                      = FindProperty("_GVTime", mProps);
            gvAmplitudeScale            = FindProperty("_GVAmplitudeScale", mProps);
            gvDirectionAngle            = FindProperty("_GVDirectionAngle", mProps);

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

            DrawMainGroup(foldoutStyle);
            DrawColorGroup(foldoutStyle);
            DrawMaskGroup(foldoutStyle);
            DrawMainMotionGroup(foldoutStyle);
            DrawDetailMotion1Group(foldoutStyle);
            DrawMotionNoiseGroup(foldoutStyle);
            DrawGlobalVariablesGroup(foldoutStyle);
            DrawScaleGroup(foldoutStyle);
            DrawAdvancedGroup(foldoutStyle);
        }

        private void DrawMainGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showWSP_MainGroup, "Main Properties", foldoutStyle, -2);

            if (FoldoutStates.showWSP_MainGroup)
            {
                GUILayout.Space(5);
                matEditor.TexturePropertySingleLine(new GUIContent("Albedo"), albedoTex);
                matEditor.TexturePropertySingleLine(new GUIContent("Normal"), normalTex);
                matEditor.TexturePropertySingleLine(new GUIContent("Smoothness"), smoothnessTex);
                GUILayout.Space(5);
                matEditor.ShaderProperty(alphaCutoff, new GUIContent("Alpha Cutoff"));
                matEditor.ShaderProperty(normalScale, new GUIContent("Normal Scale"));
                matEditor.ShaderProperty(metallic, "Metallic");
                matEditor.ShaderProperty(smoothnessScale, "Smoothness Scale");
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawColorGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showWSP_ColorGroup, "Color", foldoutStyle, -2);

            if (FoldoutStates.showWSP_ColorGroup)
            {
                GUILayout.Space(5);

                EditorGUI.BeginChangeCheck();
                matEditor.ShaderProperty(colors_Enum, "Colors");
                if (EditorGUI.EndChangeCheck())
                {
                    if (colors_Enum.floatValue == 0)
                        debug_Enum.floatValue = 0;
                }
                matEditor.ShaderProperty(color1A, "Color 1A");
                
                if (colors_Enum.floatValue == 1 || colors_Enum.floatValue == 2)
                    matEditor.ShaderProperty(color1B, "Color 1B");

                if (colors_Enum.floatValue == 2)
                {
                    matEditor.ShaderProperty(color2A, "Color 2A");
                    matEditor.ShaderProperty(color2B, "Color 2B");
                }

                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawMaskGroup(GUIStyle foldoutStyle)
        {
            if (colors_Enum.floatValue != 0)
            {
                EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showWSP_MaskGroup, "Color Mask", foldoutStyle, -2);

                if (FoldoutStates.showWSP_MaskGroup)
                {
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(colorMask1Source_Enum, new GUIContent("Mask 1 Source"));
                    if (colorMask1Source_Enum.floatValue == 0)
                    {
                        matEditor.ShaderProperty(colorMask1StartV, new GUIContent("Mask 1 Start"));
                        matEditor.ShaderProperty(colorMask1EndV, new GUIContent("Mask 1 End"));
                    }
                    else
                    {
                        matEditor.ShaderProperty(colorMask1StartVert, new GUIContent("Mask 1 Start"));
                        matEditor.ShaderProperty(colorMask1EndVert, new GUIContent("Mask 1 End"));
                    }

                    GUILayout.Space(5);
                    matEditor.TexturePropertySingleLine(new GUIContent("Mask 2"), colorMask2);
                    matEditor.ShaderProperty(colorMask2Tiling, new GUIContent("Mask 2 Tiling", "Tiling of the noise texture that is used to blend between color 1 and 2."));
                    matEditor.ShaderProperty(colorMask2SharpMin, new GUIContent("Mask 2 Sharp Min", "Controls the sharpness of mask 2. Noise values that are below the value of this field will be set to 0."));
                    matEditor.ShaderProperty(colorMask2SharpMax, new GUIContent("Mask 2 Sharp Max", "Controls the sharpness of mask 2. Noise values that are above the value of this field will be set to 1."));
                    matEditor.ShaderProperty(debug_Enum, "Mask Debug");
                    GUILayout.Space(5);
                }
                EditorGUILayout.EndFoldoutHeaderGroup();
            }
        }

        private void DrawGlobalVariablesGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showWSP_GVGroup, "Global Variables", foldoutStyle, -2);

            if (FoldoutStates.showWSP_GVGroup)
            {
                matEditor.ShaderProperty(gvTime, new GUIContent("Time", Tooltips.gvTime));
                matEditor.ShaderProperty(gvAmplitudeScale, new GUIContent("Amplitude", Tooltips.gvAmplitudeScale));

                matEditor.ShaderProperty(gvDirectionAngle, new GUIContent("Direction", Tooltips.gvDirectionAngle));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawMainMotionGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showWSP_MMGroup, "Main Motion", foldoutStyle);

            if (FoldoutStates.showWSP_MMGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(mainMotion_Toggle, new GUIContent("Enable", Tooltips.mmToggle));
                if (mainMotion_Toggle.floatValue == 1)
                {
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(mmSpeed, new GUIContent("Speed", Tooltips.mmSpeed));
                    matEditor.ShaderProperty(mmAmplitude, new GUIContent("Amplitude", Tooltips.mmAmplitude));
                    matEditor.ShaderProperty(mmAmplitudeOffset, new GUIContent("Amplitude Offset", Tooltips.mmAmplitudeOffset));

                    GUILayout.Space(5);
                    matEditor.ShaderProperty(mmPhaseShiftSource, new GUIContent("Phase Shift Source", "Specifies the source of the main motion phase shift."));
                    matEditor.ShaderProperty(mmPhaseShiftScale, new GUIContent("Phase Shift Scale", Tooltips.mmPhaseShiftScale));

                    GUILayout.Space(5);
                    if (gvDirectionAngle.floatValue == 0)
                        matEditor.ShaderProperty(mmDirectionAngle, new GUIContent("Direction Angle", Tooltips.mmDirAngle));
                    matEditor.ShaderProperty(mmDirectionShift, new GUIContent("Direction Shift", Tooltips.mmDirShift));
                    matEditor.ShaderProperty(mmDirectionShiftOffset, new GUIContent("Direction Shift Offset", Tooltips.mmDirShiftOffset));

                    matEditor.ShaderProperty(mmDirectionShiftSpeed, new GUIContent("Direction Shift Speed", Tooltips.mmDirShiftSpeed));
                    matEditor.ShaderProperty(mmDirectionShiftNoiseScale, new GUIContent("Direction Shift Noise Scale", Tooltips.mmDirShiftNoiseScale));

                    GUILayout.Space(5);
                    matEditor.ShaderProperty(mmSineWaveLength, new GUIContent("Sine Wave Length", Tooltips.mmSineWaveLength));
                    matEditor.ShaderProperty(mmObjectHeight, new GUIContent("Object Height", Tooltips.mmObjectHeight));
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawDetailMotion1Group(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showWSP_DM1Group, "Detail Motion", foldoutStyle);

            if (FoldoutStates.showWSP_DM1Group)
            {
                matEditor.ShaderProperty(dm1Toggle, new GUIContent("Enable", "Enables/Disables the detail motion 1. This motion affects only to the branches/leaves of a model."));
                GUILayout.Space(5);
                if (dm1Toggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(dm1Speed, new GUIContent("Speed", "Controls the speed of the motion."));
                    matEditor.ShaderProperty(dm1Amplitude, new GUIContent("Amplitude", "Controls the amplitude of the motion."));
                    matEditor.ShaderProperty(dm1AmplitudeOffset, new GUIContent("Amplitude Offset"));
                    GUILayout.Space(5);
                }

            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawMotionNoiseGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showWSP_MNGroup, "Motion Noise", foldoutStyle, -2);

            if (FoldoutStates.showWSP_MNGroup)
            {
                GUILayout.Space(5);
                matEditor.TexturePropertySingleLine(new GUIContent("Motion Noise Texture"), motionNoiseTexture);
                matEditor.ShaderProperty(motionNoiseTiling, new GUIContent("Motion Noise Tiling"));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawScaleGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showWSP_ScaleGroup, "Scale", foldoutStyle, -2);

            if (FoldoutStates.showWSP_ScaleGroup)
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
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showWSP_AdvancedGroup, "Advanced Options", foldoutStyle, -2);

            if (FoldoutStates.showWSP_AdvancedGroup)
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
