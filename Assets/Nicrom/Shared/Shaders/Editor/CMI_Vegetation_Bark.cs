using UnityEngine;
using UnityEditor;

namespace Nicrom
{
    public class CMI_Vegetation_Bark : ShaderGUI {


        // Main properties
        MaterialProperty color = null;
        MaterialProperty albedo = null;
        MaterialProperty normal = null;
        MaterialProperty mrao = null;
        MaterialProperty metallic = null;
        MaterialProperty smoothness = null;
        MaterialProperty normalScale = null;
        MaterialProperty ambientOcclusion = null;
        MaterialProperty textureTiling = null;

        // Moss
        MaterialProperty moss_Toggle = null;
        MaterialProperty mossDebug = null;
        MaterialProperty mossColor = null;
        MaterialProperty mossAlbedo = null;
        MaterialProperty mossNormal = null;
        MaterialProperty mossNormalScale = null;
        MaterialProperty mossTiling = null;
        MaterialProperty mossOpacity = null;
        MaterialProperty mossHeight = null;
        MaterialProperty mossHeightOffset = null;
        MaterialProperty mossCoverageMin = null;
        MaterialProperty mossCoverageMax = null;
        MaterialProperty mossNoiseTexture = null;
        MaterialProperty mossNoise1Tiling = null;
        MaterialProperty mossNoise1SharpMin = null;
        MaterialProperty mossNoise1SharpMax = null;
        MaterialProperty mossNoise2Tiling = null;

        // Main Motion
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
        //MaterialProperty mmLocalPivotSource = null;

        // Detail Motion 1
        MaterialProperty dm1Toggle = null;
        MaterialProperty dm1Amplitude = null;
        MaterialProperty dm1VerticalSpeed = null;
        MaterialProperty dm1FoliageLength = null;

        // Detail Motion 2
        MaterialProperty dm2Toggle = null;
        MaterialProperty dm2Amplitude = null;
        MaterialProperty dm2Speed = null;
        MaterialProperty dm2ObjectRadius = null;

        MaterialProperty motionNoiseTexture = null;
        MaterialProperty motionNoiseTiling = null;

        // Global Variables 
        MaterialProperty gvTime = null;
        MaterialProperty gvAmplitudeScale = null;
        MaterialProperty gvBendingScale = null;
        MaterialProperty gvDirectionAngle = null;

        MaterialEditor matEditor;

        public void FindProperties(MaterialProperty[] mProps)
        {
            color                       = FindProperty("_Color", mProps);
            albedo                      = FindProperty("_Albedo", mProps);
            normal                      = FindProperty("_Normal", mProps);
            mrao                        = FindProperty("_MRAO", mProps);
            metallic                    = FindProperty("_Metallic", mProps);
            smoothness                  = FindProperty("_Smoothness", mProps);
            normalScale                 = FindProperty("_NormalScale", mProps);
            ambientOcclusion            = FindProperty("_AmbientOcclusion", mProps);
            textureTiling               = FindProperty("_TextureTiling", mProps);

            moss_Toggle                 = FindProperty("_TrunkMoss", mProps);
            mossDebug                   = FindProperty("_MossDebug", mProps);
            mossColor                   = FindProperty("_MossColor", mProps);
            mossAlbedo                  = FindProperty("_MossAlbedo", mProps);
            mossNormal                  = FindProperty("_MossNormal", mProps);
            mossNormalScale             = FindProperty("_MossNormalScale", mProps);
            mossTiling                  = FindProperty("_MossTiling", mProps);
            mossOpacity                 = FindProperty("_MossOpacity", mProps);
            mossHeight                  = FindProperty("_MossHeight", mProps);
            mossHeightOffset            = FindProperty("_MossHeightOffset", mProps);
            mossCoverageMin             = FindProperty("_MossCoverageMin", mProps);
            mossCoverageMax             = FindProperty("_MossCoverageMax", mProps);
            mossNoiseTexture            = FindProperty("_MossNoise", mProps);
            mossNoise1Tiling            = FindProperty("_MossNoise1Tiling", mProps);
            mossNoise1SharpMin          = FindProperty("_MossNoise1SharpMin", mProps);
            mossNoise1SharpMax          = FindProperty("_MossNoise1SharpMax", mProps);
            mossNoise2Tiling            = FindProperty("_MossNoise2Tiling", mProps);

            gvTime                      = FindProperty("_GVTime", mProps);
            gvAmplitudeScale            = FindProperty("_GVAmplitudeScale", mProps);
            gvBendingScale              = FindProperty("_GVBendingScale", mProps);
            gvDirectionAngle            = FindProperty("_GVDirectionAngle", mProps);

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
            //mmLocalPivotSource          = FindProperty("_MMLocalPivotSource", mProps);

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

            DrawMainPropertiesGroup(foldoutStyle);
            DrawTrunkMossGroup(foldoutStyle);
            DrawMainMotionGroup(foldoutStyle);
            DrawDetailMotionGroup(foldoutStyle);
            DrawMotionNoiseGroup(foldoutStyle);
            DrawGlobalVariablesGroup(foldoutStyle);
            DrawAdvancedGroup(foldoutStyle);
        }

        private void DrawMainPropertiesGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showVegetationColorGroup, "Main Properties", foldoutStyle, -10);

            if (FoldoutStates.showVegetationColorGroup)
            {
                matEditor.ShaderProperty(color, new GUIContent("Color"));
                matEditor.TexturePropertySingleLine(new GUIContent("Albedo"), albedo);
                matEditor.TexturePropertySingleLine(new GUIContent("Normal"), normal);
                matEditor.TexturePropertySingleLine(new GUIContent("MRAO"), mrao);
                matEditor.ShaderProperty(metallic, "Metallic");
                matEditor.ShaderProperty(smoothness, "Smoothness");
                matEditor.ShaderProperty(normalScale, new GUIContent("Normal Scale"));
                matEditor.ShaderProperty(ambientOcclusion, new GUIContent("Ambient Occlusion"));
                matEditor.ShaderProperty(textureTiling, new GUIContent("Texture Tiling"));

                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawTrunkMossGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showVegetationTrunkMossGroup, "Trunk Moss", foldoutStyle, -2);

            if (FoldoutStates.showVegetationTrunkMossGroup)
            {
                matEditor.ShaderProperty(moss_Toggle, new GUIContent("Enable", "Enables/Disables the trunk moss."));
                GUILayout.Space(5);
                if (moss_Toggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(mossColor, new GUIContent("Color"));
                    matEditor.TexturePropertySingleLine(new GUIContent("Albedo"), mossAlbedo);
                    matEditor.TexturePropertySingleLine(new GUIContent("Normal"), mossNormal);
                    matEditor.ShaderProperty(mossNormalScale, new GUIContent("Normal Scale"));
                    matEditor.ShaderProperty(mossTiling, new GUIContent("Texture Tiling"));
                    GUILayout.Space(-5);
                    matEditor.ShaderProperty(mossOpacity, new GUIContent("Opacity"));
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(mossHeight, new GUIContent("Height"));
                    matEditor.ShaderProperty(mossHeightOffset, new GUIContent("Height Offset"));
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(mossCoverageMin, new GUIContent("Coverage Min"));
                    matEditor.ShaderProperty(mossCoverageMax, new GUIContent("Coverage Max"));
                    GUILayout.Space(5);
                    matEditor.TexturePropertySingleLine(new GUIContent("Noise Texture"), mossNoiseTexture);
                    matEditor.ShaderProperty(mossNoise1Tiling, new GUIContent("Noise 1 Tiling"));
                    matEditor.ShaderProperty(mossNoise1SharpMin, new GUIContent("Noise 1 Sharpness Min"));
                    matEditor.ShaderProperty(mossNoise1SharpMax, new GUIContent("Noise 1 Sharpness Max"));
                    matEditor.ShaderProperty(mossNoise2Tiling, new GUIContent("Noise 2 Tiling"));
                    matEditor.ShaderProperty(mossDebug, new GUIContent("Debug"));
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawMainMotionGroup(GUIStyle foldoutStyle)
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

                    //matEditor.ShaderProperty(mmLocalPivotSource, new GUIContent("Local Pivot Source"));
                    GUILayout.Space(5);
                }
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawDetailMotionGroup(GUIStyle foldoutStyle)
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

        private void DrawMotionNoiseGroup(GUIStyle foldoutStyle)
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

        private void DrawGlobalVariablesGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showVegetationGVGroup, "Global Variables", foldoutStyle, -2);

            if (FoldoutStates.showVegetationGVGroup)
            {
                matEditor.ShaderProperty(gvTime, new GUIContent("Time", Tooltips.gvTime));
                matEditor.ShaderProperty(gvAmplitudeScale, new GUIContent("Amplitude", Tooltips.gvAmplitudeScale));
                matEditor.ShaderProperty(gvBendingScale, new GUIContent("Bending", Tooltips.gvBendingScale));
                matEditor.ShaderProperty(gvDirectionAngle, new GUIContent("Direction Angle", Tooltips.gvDirectionAngle));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawAdvancedGroup(GUIStyle foldoutStyle)
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
}
