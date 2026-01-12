using UnityEngine;
using UnityEditor;

namespace Nicrom
{
#if UNITY_EDITOR
    public class CMI_Vegetation_Leaves : ShaderGUI {

        // Main Textures
        MaterialProperty albedoTex = null;
        MaterialProperty normalTex = null;
        MaterialProperty normalScale = null;
        MaterialProperty alphaCutoff = null;

        // Color
        MaterialProperty colors_Enum = null;
        MaterialProperty color1A = null;
        MaterialProperty color1B = null;
        MaterialProperty color2A = null;
        MaterialProperty color2B = null;
        MaterialProperty colorBlendAxis = null;
        MaterialProperty debug_Enum = null;

        // Color masks and noise
        MaterialProperty colorMask1Tex = null;
        MaterialProperty colorMask1Source = null;
        MaterialProperty colorMask1Start = null;
        MaterialProperty colorMask1End = null;
        MaterialProperty colorMask1FadeStart = null;
        MaterialProperty colorMask1FadeEnd = null;
        MaterialProperty colorMask2Start = null;
        MaterialProperty colorMask2StartOffset = null;
        MaterialProperty colorMask2End = null;
        MaterialProperty colorMask2Alpha = null;
        MaterialProperty colorMask2AlphaOffset = null;
        MaterialProperty maskNoiseTex = null;
        MaterialProperty maskNoiseTiling = null;
        MaterialProperty maskNoiseSharpMin = null;
        MaterialProperty maskNoiseSharpMax = null;

        // Translucency
        MaterialProperty translucency_Toogle = null;
        MaterialProperty tColor = null;
        MaterialProperty translucency = null;
        MaterialProperty tNormalDistortion = null;
        MaterialProperty tScattering = null;
        MaterialProperty tDirect = null;
        MaterialProperty tAmbient = null;
        MaterialProperty tShadow = null;

        // Surface properties
        MaterialProperty metallic = null;
        MaterialProperty smoothness = null;

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
        //MaterialProperty localPivotSource = null;

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

        // Motion global variables 
        MaterialProperty gvTime = null;
        MaterialProperty gvAmplitudeScale = null;
        MaterialProperty gvBendingScale = null;
        MaterialProperty gvDirectionAngle = null;

        MaterialEditor matEditor;
        GUIStyle foldoutStyle;

        private bool hasTranslucency = false;

        public void FindProperties(MaterialProperty[] mProps)
        {
            albedoTex                   = FindProperty("_Albedo", mProps);
            normalTex                   = FindProperty("_Normal", mProps);
            normalScale                 = FindProperty("_NormalScale", mProps);
            alphaCutoff                 = FindProperty("_AlphaCutoff", mProps);

            colors_Enum                 = FindProperty("_Colors", mProps);
            color1A                     = FindProperty("_Color1A", mProps);
            color1B                     = FindProperty("_Color1B", mProps);
            color2A                     = FindProperty("_Color2A", mProps);
            color2B                     = FindProperty("_Color2B", mProps);
            colorBlendAxis              = FindProperty("_ColorBlendAxis", mProps);
            debug_Enum                  = FindProperty("_Debug", mProps);

            colorMask1Source            = FindProperty("_ColorMask1Source", mProps);
            colorMask1Tex               = FindProperty("_ColorMask1", mProps);
            colorMask1Start             = FindProperty("_ColorMask1Start", mProps);
            colorMask1End               = FindProperty("_ColorMask1End", mProps);
            colorMask1FadeStart         = FindProperty("_ColorMask1FadeStart", mProps);
            colorMask1FadeEnd           = FindProperty("_ColorMask1FadeEnd", mProps);
            colorMask2Start             = FindProperty("_ColorMask2Start", mProps);
            colorMask2StartOffset       = FindProperty("_ColorMask2StartOffset", mProps);
            colorMask2End               = FindProperty("_ColorMask2End", mProps);
            colorMask2Alpha             = FindProperty("_ColorMask2Alpha", mProps);
            colorMask2AlphaOffset       = FindProperty("_ColorMask2AlphaOffset", mProps);
            maskNoiseTex                = FindProperty("_MaskNoise", mProps);
            maskNoiseTiling             = FindProperty("_MaskNoiseTiling", mProps);
            maskNoiseSharpMin           = FindProperty("_MaskNoiseSharpMin", mProps);
            maskNoiseSharpMax           = FindProperty("_MaskNoiseSharpMax", mProps);

            if (hasTranslucency)
            {
                translucency_Toogle     = FindProperty("_SubsurfaceScatering", mProps);
                translucency            = FindProperty("_TransStrength", mProps);
                tNormalDistortion       = FindProperty("_TransNormal", mProps);
                tScattering             = FindProperty("_TransScattering", mProps);
                tDirect                 = FindProperty("_TransDirect", mProps);
                tAmbient                = FindProperty("_TransAmbient", mProps);
                tShadow                 = FindProperty("_TransShadow", mProps);
                tColor                  = FindProperty("_SSColor", mProps);
            }

            metallic                    = FindProperty("_Metallic", mProps);
            smoothness                  = FindProperty("_Smoothness", mProps);

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
            //localPivotSource            = FindProperty("_LocalPivotSource", mProps);

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
        }

        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] mProps)
        {
            matEditor = materialEditor;
            Material material = materialEditor.target as Material;

            if (material.HasProperty("_SubsurfaceScatering"))
                hasTranslucency = true;
            else
                hasTranslucency = false;

            FindProperties(mProps);
            ShaderPropertiesGUI(material);
        }

        public void ShaderPropertiesGUI(Material material)
        {
            foldoutStyle = new GUIStyle(EditorStyles.foldoutHeader);

            DrawTextureGroup();
            DrawColorGroup();
            DrawMaskAndNoiseGroup();
            if(hasTranslucency)
                DrawTranslucencyGroup();
            DrawMainMotionGroup();
            DrawDetailMotionGroup();
            DrawMotionNoiseGroup();
            DrawGlobalVariablesGroup();
            DrawAdvancedGroup();
        }

        private void DrawTextureGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showVegetationTextureGroup, "Main Properties", foldoutStyle, -10);

            if (FoldoutStates.showVegetationTextureGroup)
            {
                GUILayout.Space(5);
                matEditor.TexturePropertySingleLine(new GUIContent("Albedo"), albedoTex);
                matEditor.TexturePropertySingleLine(new GUIContent("Normal"), normalTex);
                GUILayout.Space(5);
                matEditor.ShaderProperty(alphaCutoff, new GUIContent("Alpha Cutoff"));
                matEditor.ShaderProperty(normalScale, new GUIContent("Normal Scale"));
                GUILayout.Space(5);
                matEditor.ShaderProperty(metallic, "Metallic");
                matEditor.ShaderProperty(smoothness, "Smoothness");
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawColorGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showVegetationColorGroup, "Color", foldoutStyle, -2);

            if (FoldoutStates.showVegetationColorGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(colors_Enum, new GUIContent("Colors"));
                GUILayout.Space(5);
                matEditor.ShaderProperty(color1A, "Color 1A");
                matEditor.ShaderProperty(color1B, "Color 1B");

                if (colors_Enum.floatValue == 1)
                {
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(color2A, "Color 2A");
                    matEditor.ShaderProperty(color2B, "Color 2B");
                }

                if (colors_Enum.floatValue == 1)
                    matEditor.ShaderProperty(colorBlendAxis, new GUIContent("Color Blend Axis", "Specifies the axis on which the blending between color 1 and 2 happens."));
                        
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawMaskAndNoiseGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showVegetationMaskAndNoiseGroup, "Color Masks", foldoutStyle, -2);

            if (FoldoutStates.showVegetationMaskAndNoiseGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(colorMask1Source, new GUIContent("Mask 1 Source", "Specifies the source of the mask that is used to blend between color A and B."));

                if (colorMask1Source.floatValue == 1)
                {
                    matEditor.ShaderProperty(colorMask1Start, new GUIContent("Mask 1 Start", "Controls the point where the blend between color A and B starts."));
                    matEditor.ShaderProperty(colorMask1End, new GUIContent("Mask 1 End", "Controls the point where the blend between color A and B ends."));
                }

                matEditor.ShaderProperty(colorMask1FadeStart, new GUIContent("Mask 1 Fade Start", "Controls the point on the Y axis where mask 1 starts to fade to 0 or 1. Fade Start/End sliders can be used to make the top or bottom part of a model use only color A or B."));
                matEditor.ShaderProperty(colorMask1FadeEnd, new GUIContent("Mask 1 Fade End", "Controls the point on the Y axis where the fade to 0 or 1 ends. Fade Start/End sliders can be used to make the top or bottom part of a model use only color A or B"));

                if (colorMask1Source.floatValue == 0)
                    matEditor.TexturePropertySingleLine(new GUIContent("Mask 1", "Gradient texture that is used to blend between color A and B."), colorMask1Tex);

                if (colorBlendAxis.floatValue == 0)
                {
                    matEditor.ShaderProperty(colorMask2Start, new GUIContent("Mask 2 Start", "Controls the point on the Y axis where the blend between color 1 and 2 starts."));
                    matEditor.ShaderProperty(colorMask2StartOffset, new GUIContent("Mask 2 Start Offset", "Controls the offset value that is added to mask 2 start."));
                    matEditor.ShaderProperty(colorMask2End, new GUIContent("Mask 2 End", "Controls the point on the Y axis where the blend between color 1 and 2 ends"));
                }

                if (colors_Enum.floatValue == 1)
                {
                    matEditor.ShaderProperty(colorMask2Alpha, new GUIContent("Mask 2 Alpha", "Controls the alpha of mask 2"));
                    matEditor.ShaderProperty(colorMask2AlphaOffset, new GUIContent("Mask 2 Alpha Offset", "Controls the offset value that is added to the mask 2 alpha."));
                }

                GUILayout.Space(5);
                matEditor.TexturePropertySingleLine(new GUIContent("Mask Noise"), maskNoiseTex);
                matEditor.ShaderProperty(maskNoiseTiling, new GUIContent("Mask Noise Tiling"));
                matEditor.ShaderProperty(maskNoiseSharpMin, new GUIContent("Mask Noise Sharp Min", "Controls the sharpness of the noise texture. Values that are below the value of this field will be set to 0."));
                matEditor.ShaderProperty(maskNoiseSharpMax, new GUIContent("Mask Noise Sharp Max", "Controls the sharpness of the noise texture. Values that are above the value of this field will be set to 1."));
                matEditor.ShaderProperty(debug_Enum, new GUIContent("Mask Debug", "List of debug options."));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawTranslucencyGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showVegetationTranslucencyGroup, "Translucency", foldoutStyle, -2);

            if (FoldoutStates.showVegetationTranslucencyGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(translucency_Toogle, new GUIContent("Enable", "Enables/Disables the translucency effect."));

                if (translucency_Toogle.floatValue == 1)
                {
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(tColor, new GUIContent("Color"));
                    matEditor.ShaderProperty(translucency, new GUIContent("Strength"));
                    matEditor.ShaderProperty(tNormalDistortion, new GUIContent("Normal Distortion"));
                    matEditor.ShaderProperty(tScattering, new GUIContent("Scaterring Falloff"));
                    matEditor.ShaderProperty(tDirect, new GUIContent("Direct", ""));
                    matEditor.ShaderProperty(tAmbient, new GUIContent("Ambient"));
                    matEditor.ShaderProperty(tShadow, new GUIContent("Shadow"));
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawMainMotionGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showVegetationMMGroup, "Main Motion", foldoutStyle, -2);

            if (FoldoutStates.showVegetationMMGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(mainMotion_Toggle, new GUIContent("Enable", Tooltips.mmToggle));
                GUILayout.Space(5);
                if (mainMotion_Toggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(mmSpeed, new GUIContent("Speed", Tooltips.mmSpeed));
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

                    //matEditor.ShaderProperty(localPivotSource, new GUIContent("Local Pivot Source"));
                    GUILayout.Space(5);
                }
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawDetailMotionGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showVegetationDMGroup, "Detail Motion", foldoutStyle, -2);

            if (FoldoutStates.showVegetationDMGroup)
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

        private void DrawMotionNoiseGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showVegetationMNGroup, "Motion Noise", foldoutStyle, -2);

            if (FoldoutStates.showVegetationMNGroup)
            {
                GUILayout.Space(5);
                matEditor.TexturePropertySingleLine(new GUIContent("Noise Texture"), motionNoiseTexture);
                matEditor.ShaderProperty(motionNoiseTiling, new GUIContent("Noise Tiling"));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawGlobalVariablesGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showVegetationGVGroup, "Motion Global Variables", foldoutStyle, -2);

            if (FoldoutStates.showVegetationGVGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(gvTime, new GUIContent("Time", Tooltips.gvTime));
                matEditor.ShaderProperty(gvAmplitudeScale, new GUIContent("Amplitude", Tooltips.gvAmplitudeScale));
                matEditor.ShaderProperty(gvBendingScale, new GUIContent("Bending", Tooltips.gvBendingScale));
                matEditor.ShaderProperty(gvDirectionAngle, new GUIContent("Direction Angle", Tooltips.gvDirectionAngle));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawAdvancedGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showVegetationAdvancedGroup, "Advanced Options", foldoutStyle, -2);

            if (FoldoutStates.showVegetationAdvancedGroup)
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
#endif
}
