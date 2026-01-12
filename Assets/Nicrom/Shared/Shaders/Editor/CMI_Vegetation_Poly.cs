using UnityEngine;
using UnityEditor;


namespace Nicrom
{
    public class CMI_Vegetation_Poly : ShaderGUI {

        MaterialProperty metallic = null;
        MaterialProperty smoothness = null;

        MaterialProperty baseColor = null;
        MaterialProperty mainTex = null;
        MaterialProperty occlusionToggle = null;
        MaterialProperty occlusionColor = null;
        MaterialProperty occlusionMinRadius = null;
        MaterialProperty occlusionMaxRadius = null;
        MaterialProperty noiseTexture = null;
        MaterialProperty staticNoiseTiling = null;

        // Global Variables 
        MaterialProperty gvTime = null;
        MaterialProperty gvAmplitudeScale = null;
        MaterialProperty gvBendingScale = null;
        MaterialProperty gvDirectionAngle = null;

        // Main Motion
        MaterialProperty mmBending = null;
        MaterialProperty mmBendingOffset = null;
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
        MaterialProperty mmObjectHeightSource = null;
        MaterialProperty mmObjectHeight = null;
        MaterialProperty localPivotSource = null;

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

        MaterialEditor matEditor;
        GUIStyle foldoutStyle;

        public void FindProperties(MaterialProperty[] mProps)
        {
            metallic                    = FindProperty("_Metallic", mProps);
            smoothness                  = FindProperty("_Smoothness", mProps);

            baseColor                   = FindProperty("_BaseColor", mProps);
            mainTex                     = FindProperty("_MainTex", mProps);
            occlusionToggle             = FindProperty("_Occlusion", mProps);
            occlusionColor              = FindProperty("_OcclusionColor", mProps);
            occlusionMinRadius          = FindProperty("_OcclusionMinRadius", mProps);
            occlusionMaxRadius          = FindProperty("_OcclusionMaxRadius", mProps);


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
            localPivotSource            = FindProperty("_LocalPivotSource", mProps);

            dm1Toggle                   = FindProperty("_DetailMotion1", mProps);
            dm1Amplitude                = FindProperty("_DM1Amplitude", mProps);
            dm1VerticalSpeed            = FindProperty("_DM1Speed", mProps);
            dm1FoliageLength            = FindProperty("_DM1FoliageLength", mProps);

            dm2Toggle                   = FindProperty("_DetailMotion2", mProps);
            dm2Amplitude                = FindProperty("_DM2Amplitude", mProps);
            dm2Speed                    = FindProperty("_DM2Speed", mProps);
            dm2ObjectRadius             = FindProperty("_DM2ObjectRadius", mProps);

            noiseTexture                = FindProperty("_MotionNoise", mProps);
            staticNoiseTiling           = FindProperty("_MotionNoiseTiling", mProps);
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

            DrawColorAndTexturesGroup();
            DrawMainMotionGroup();
            DrawDetailMotionGroup();
            DrawMotionNoiseGroup();
            DrawGlobalVariablesGroup();
            DrawAdvancedGroup();
        }

        private void DrawColorAndTexturesGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showVegetationColorGroup, "Main Properties", foldoutStyle, -2);

            if (FoldoutStates.showVegetationColorGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(baseColor, "Color");
                matEditor.TexturePropertySingleLine(new GUIContent("Albedo"), mainTex);

                GUILayout.Space(5);
                matEditor.ShaderProperty(metallic, "Metallic");
                matEditor.ShaderProperty(smoothness, "Smoothness");
                GUILayout.Space(5);
                matEditor.ShaderProperty(occlusionToggle, new GUIContent("Occlusion"));

                if (occlusionToggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(occlusionColor, "Color");
                    matEditor.ShaderProperty(occlusionMinRadius, "Min Radius");
                    matEditor.ShaderProperty(occlusionMaxRadius, "Max Radius");
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
                //GUILayout.Space(5);
                matEditor.ShaderProperty(localPivotSource, new GUIContent("Local Pivot Source"));
                GUILayout.Space(5);
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
                matEditor.TexturePropertySingleLine(new GUIContent("Noise Texture"), noiseTexture);
                matEditor.ShaderProperty(staticNoiseTiling, new GUIContent("Static Noise Tiling"));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawGlobalVariablesGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showVegetationGVGroup, "Global Variables", foldoutStyle, -2);

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
}
