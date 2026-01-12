using UnityEngine;
using UnityEditor;

namespace Nicrom
{
    [CustomEditor(typeof(WindProfile))]
    public class WindProfile_Editor : Editor
    {
        SerializedProperty mmVegetationSpeedMin;
        SerializedProperty mmVegetationSpeedMax;
        SerializedProperty mmVegetationAmplitudeMin;
        SerializedProperty mmVegetationAmplitudeMax;
        SerializedProperty mmVegetationBendingMin;
        SerializedProperty mmVegetationBendingMax;
        SerializedProperty dmVegetationSpeedMin;
        SerializedProperty dmVegetationSpeedMax;
        SerializedProperty dmVegetationAmplitudeMin;
        SerializedProperty dmVegetationAmplitudeMax;

        SerializedProperty mmFlowerSpeedMin;
        SerializedProperty mmFlowerSpeedMax;
        SerializedProperty mmFlowerAmplitudeMin;
        SerializedProperty mmFlowerAmplitudeMax;
        SerializedProperty mmFlowerBendingMin;
        SerializedProperty mmFlowerBendingMax;
        SerializedProperty dmFlowerSpeedMin;
        SerializedProperty dmFlowerSpeedMax;
        SerializedProperty dmFlowerAmplitudeMin;
        SerializedProperty dmFlowerAmplitudeMax;

        SerializedProperty mmGrassSpeedMin;
        SerializedProperty mmGrassSpeedMax;
        SerializedProperty mmGrassAmplitudeMin;
        SerializedProperty mmGrassAmplitudeMax;
        SerializedProperty mmGrassBendingMin;
        SerializedProperty mmGrassBendingMax;

        SerializedProperty grassColorMask2SpeedMin;
        SerializedProperty grassColorMask2SpeedMax;

        SerializedProperty mmWSPSpeedMin;
        SerializedProperty mmWSPSpeedMax;
        SerializedProperty mmWSPAmplitudeMin;
        SerializedProperty mmWSPAmplitudeMax;
        SerializedProperty dmWSPSpeedMin;
        SerializedProperty dmWSPSpeedMax;
        SerializedProperty dmWSPAmplitudeMin;
        SerializedProperty dmWSPAmplitudeMax;

        SerializedProperty combinedCloudSpeed;
        SerializedProperty cloudsSpeedMin;
        SerializedProperty cloudsSpeedMax;
        SerializedProperty cloud1SpeedMin;
        SerializedProperty cloud1SpeedMax;
        SerializedProperty cloud2SpeedMin;
        SerializedProperty cloud2SpeedMax;
        SerializedProperty cloud3SpeedMin;
        SerializedProperty cloud3SpeedMax;

        SerializedProperty cloud1DirectionOffset;
        SerializedProperty cloud2DirectionOffset;
        SerializedProperty cloud3DirectionOffset;

        SerializedProperty combinedCloudShadowSpeed;
        SerializedProperty cloudShadowSpeedMin;
        SerializedProperty cloudShadowSpeedMax;
        SerializedProperty cloudShadow1SpeedMin;
        SerializedProperty cloudShadow1SpeedMax;
        SerializedProperty cloudShadow2SpeedMin;
        SerializedProperty cloudShadow2SpeedMax;
        SerializedProperty cloudShadow3SpeedMin;
        SerializedProperty cloudShadow3SpeedMax;

        SerializedProperty combinedWaterSpeed;
        SerializedProperty waterNormalsSpeedMin;
        SerializedProperty waterNormalsSpeedMax;
        SerializedProperty waterNormalsSpeed1Min;
        SerializedProperty waterNormalsSpeed1Max;
        SerializedProperty waterNormalsSpeed2Min;
        SerializedProperty waterNormalsSpeed2Max;

        SerializedProperty waterFoamSpeedMin;
        SerializedProperty waterFoamSpeedMax;
        SerializedProperty waterFoamSpeed1Min;
        SerializedProperty waterFoamSpeed1Max;
        SerializedProperty waterFoamSpeed2Min;
        SerializedProperty waterFoamSpeed2Max;

        SerializedProperty sliderMaxVal;

        WindProfile windProfile;
        GUIStyle foldoutStyle;
        private string[] profileToolBarTitles = { "Vegetation", "Water", "Sky" };
        private int sliderMaxValue;

        private void OnEnable()
        {
            FindProperties();
        }

        private void FindProperties()
        {
            sliderMaxVal                = serializedObject.FindProperty("sliderMaxValue");

            mmVegetationSpeedMin        = serializedObject.FindProperty("mmVegetationSpeedMin");
            mmVegetationSpeedMax        = serializedObject.FindProperty("mmVegetationSpeedMax");
            mmVegetationAmplitudeMin    = serializedObject.FindProperty("mmVegetationAmplitudeMin");
            mmVegetationAmplitudeMax    = serializedObject.FindProperty("mmVegetationAmplitudeMax");
            mmVegetationBendingMin      = serializedObject.FindProperty("mmVegetationBendingMin");
            mmVegetationBendingMax      = serializedObject.FindProperty("mmVegetationBendingMax");
            dmVegetationSpeedMin        = serializedObject.FindProperty("dmVegetationSpeedMin");
            dmVegetationSpeedMax        = serializedObject.FindProperty("dmVegetationSpeedMax");
            dmVegetationAmplitudeMin    = serializedObject.FindProperty("dmVegetationAmplitudeMin");
            dmVegetationAmplitudeMax    = serializedObject.FindProperty("dmVegetationAmplitudeMax");

            mmFlowerSpeedMin            = serializedObject.FindProperty("mmFlowerSpeedMin");
            mmFlowerSpeedMax            = serializedObject.FindProperty("mmFlowerSpeedMax");
            mmFlowerAmplitudeMin        = serializedObject.FindProperty("mmFlowerAmplitudeMin");
            mmFlowerAmplitudeMax        = serializedObject.FindProperty("mmFlowerAmplitudeMax");
            mmFlowerBendingMin          = serializedObject.FindProperty("mmFlowerBendingMin");
            mmFlowerBendingMax          = serializedObject.FindProperty("mmFlowerBendingMax");
            dmFlowerSpeedMin            = serializedObject.FindProperty("dmFlowerSpeedMin");
            dmFlowerSpeedMax            = serializedObject.FindProperty("dmFlowerSpeedMax");
            dmFlowerAmplitudeMin        = serializedObject.FindProperty("dmFlowerAmplitudeMin");
            dmFlowerAmplitudeMax        = serializedObject.FindProperty("dmFlowerAmplitudeMax");

            mmGrassSpeedMin             = serializedObject.FindProperty("mmGrassSpeedMin");
            mmGrassSpeedMax             = serializedObject.FindProperty("mmGrassSpeedMax");
            mmGrassAmplitudeMin         = serializedObject.FindProperty("mmGrassAmplitudeMin");
            mmGrassAmplitudeMax         = serializedObject.FindProperty("mmGrassAmplitudeMax");
            mmGrassBendingMin           = serializedObject.FindProperty("mmGrassBendingMin");
            mmGrassBendingMax           = serializedObject.FindProperty("mmGrassBendingMax");

            grassColorMask2SpeedMin     = serializedObject.FindProperty("grassColorMask2SpeedMin");
            grassColorMask2SpeedMax     = serializedObject.FindProperty("grassColorMask2SpeedMax");

            mmWSPSpeedMin               = serializedObject.FindProperty("mmWSPSpeedMin");
            mmWSPSpeedMax               = serializedObject.FindProperty("mmWSPSpeedMax");
            mmWSPAmplitudeMin           = serializedObject.FindProperty("mmWSPAmplitudeMin");
            mmWSPAmplitudeMax           = serializedObject.FindProperty("mmWSPAmplitudeMax");
            dmWSPSpeedMin               = serializedObject.FindProperty("dmWSPSpeedMin");
            dmWSPSpeedMax               = serializedObject.FindProperty("dmWSPSpeedMax");
            dmWSPAmplitudeMin           = serializedObject.FindProperty("dmWSPAmplitudeMin");
            dmWSPAmplitudeMax           = serializedObject.FindProperty("dmWSPAmplitudeMax");

            combinedCloudSpeed          = serializedObject.FindProperty("combinedCloudSpeed");
            cloudsSpeedMin              = serializedObject.FindProperty("cloudSpeedMin");
            cloudsSpeedMax              = serializedObject.FindProperty("cloudSpeedMax");
            cloud1SpeedMin              = serializedObject.FindProperty("cloud1SpeedMin");
            cloud1SpeedMax              = serializedObject.FindProperty("cloud1SpeedMax");
            cloud2SpeedMin              = serializedObject.FindProperty("cloud2SpeedMin");
            cloud2SpeedMax              = serializedObject.FindProperty("cloud2SpeedMax");
            cloud3SpeedMin              = serializedObject.FindProperty("cloud3SpeedMin");
            cloud3SpeedMax              = serializedObject.FindProperty("cloud3SpeedMax");

            cloud1DirectionOffset       = serializedObject.FindProperty("cloud1DirOffset");
            cloud2DirectionOffset       = serializedObject.FindProperty("cloud2DirOffset");
            cloud3DirectionOffset       = serializedObject.FindProperty("cloud3DirOffset");

            combinedCloudShadowSpeed    = serializedObject.FindProperty("combinedCloudShadowSpeed");
            cloudShadowSpeedMin         = serializedObject.FindProperty("cloudShadowSpeedMin");
            cloudShadowSpeedMax         = serializedObject.FindProperty("cloudShadowSpeedMax");
            cloudShadow1SpeedMin        = serializedObject.FindProperty("cloudShadow1SpeedMin");
            cloudShadow1SpeedMax        = serializedObject.FindProperty("cloudShadow1SpeedMax");
            cloudShadow2SpeedMin        = serializedObject.FindProperty("cloudShadow2SpeedMin");
            cloudShadow2SpeedMax        = serializedObject.FindProperty("cloudShadow2SpeedMax");
            cloudShadow3SpeedMin        = serializedObject.FindProperty("cloudShadow3SpeedMin");
            cloudShadow3SpeedMax        = serializedObject.FindProperty("cloudShadow3SpeedMax");

            combinedWaterSpeed          = serializedObject.FindProperty("combinedWaterSpeed");
            waterNormalsSpeedMin        = serializedObject.FindProperty("waterNormalsSpeedMin");
            waterNormalsSpeedMax        = serializedObject.FindProperty("waterNormalsSpeedMax");
            waterNormalsSpeed1Min       = serializedObject.FindProperty("waterNormalsSpeed1Min");
            waterNormalsSpeed1Max       = serializedObject.FindProperty("waterNormalsSpeed1Max");
            waterNormalsSpeed2Min       = serializedObject.FindProperty("waterNormalsSpeed2Min");
            waterNormalsSpeed2Max       = serializedObject.FindProperty("waterNormalsSpeed2Max");

            waterFoamSpeedMin           = serializedObject.FindProperty("waterFoamSpeedMin");
            waterFoamSpeedMax           = serializedObject.FindProperty("waterFoamSpeedMax");
            waterFoamSpeed1Min          = serializedObject.FindProperty("waterFoamSpeed1Min");
            waterFoamSpeed1Max          = serializedObject.FindProperty("waterFoamSpeed1Max");
            waterFoamSpeed2Min          = serializedObject.FindProperty("waterFoamSpeed2Min");
            waterFoamSpeed2Max          = serializedObject.FindProperty("waterFoamSpeed2Max");
        }

        public override void OnInspectorGUI()
        {
            windProfile = (WindProfile)target;
            foldoutStyle = new GUIStyle(EditorStyles.foldoutHeader);

            DrawCustomInspector();      
        }

        private void DrawCustomInspector()
        {
            serializedObject.Update();

            DrawToolbar();

            if (windProfile.selectedToolBar == 0)
            {
                DrawVegetationGroup();
                DrawGrassGroup();
                DrawFlowerGroup();
                DrawWSPGroup();
            }

            if (windProfile.selectedToolBar == 1)
                DrawWaterGroup();

            if (windProfile.selectedToolBar == 2)
            {
                DrawSkyboxCloudsGroup();
                DrawCloudShadowsGroup();
            }

            serializedObject.ApplyModifiedProperties();
        }

        private void DrawToolbar()
        {
            GUILayout.BeginHorizontal();
            GUILayout.Space(-18);
            windProfile.selectedToolBar = GUILayout.Toolbar(windProfile.selectedToolBar, profileToolBarTitles);
            GUILayout.EndHorizontal();
            GUILayout.Space(5);
            EditorGUI.BeginChangeCheck();
            EditorGUILayout.PropertyField(sliderMaxVal, new GUIContent("Slider Max Value"));
            if (EditorGUI.EndChangeCheck())
                ClampSliderValues();
            GUILayout.Space(5);

            sliderMaxValue = windProfile.sliderMaxValue;
        }

        private void DrawVegetationGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref windProfile.showVegetationGroup, "Vegetation Shader", foldoutStyle, -2);

            if (windProfile.showVegetationGroup)
            {
                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Main Motion"), EditorStyles.boldLabel);
                EditorUtils.MinMaxSlider("Speed", ref mmVegetationSpeedMin, ref mmVegetationSpeedMax, 0.0f, sliderMaxValue);
                EditorUtils.MinMaxSlider("Amplitude", ref mmVegetationAmplitudeMin, ref mmVegetationAmplitudeMax, 0.0f, sliderMaxValue);
                EditorUtils.MinMaxSlider("Bending", ref mmVegetationBendingMin, ref mmVegetationBendingMax, 0.0f, sliderMaxValue);

                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Detail Motion"), EditorStyles.boldLabel);
                EditorUtils.MinMaxSlider("Speed", ref dmVegetationSpeedMin, ref dmVegetationSpeedMax, 0.0f, sliderMaxValue);
                EditorUtils.MinMaxSlider("Amplitude", ref dmVegetationAmplitudeMin, ref dmVegetationAmplitudeMax, 0.0f, sliderMaxValue);
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawFlowerGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref windProfile.showFlowerGroup, "Flowers Shader", foldoutStyle, -2);

            if (windProfile.showFlowerGroup)
            {
                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Main Motion"), EditorStyles.boldLabel);
                EditorUtils.MinMaxSlider("Speed", ref mmFlowerSpeedMin, ref mmFlowerSpeedMax, 0.0f, sliderMaxValue);
                EditorUtils.MinMaxSlider("Amplitude", ref mmFlowerAmplitudeMin, ref mmFlowerAmplitudeMax, 0.0f, sliderMaxValue);
                EditorUtils.MinMaxSlider("Bending", ref mmFlowerBendingMin, ref mmFlowerBendingMax, 0.0f, sliderMaxValue);

                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Detail Motion"), EditorStyles.boldLabel);
                EditorUtils.MinMaxSlider("Speed", ref dmFlowerSpeedMin, ref dmFlowerSpeedMax, 0.0f, sliderMaxValue);
                EditorUtils.MinMaxSlider("Amplitude", ref dmFlowerAmplitudeMin, ref dmFlowerAmplitudeMax, 0.0f, sliderMaxValue);
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawGrassGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref windProfile.showGrassGroup, "Grass Shader", foldoutStyle, -2);

            if (windProfile.showGrassGroup)
            {
                GUILayout.Space(5);
                EditorUtils.MinMaxSlider("Speed", ref mmGrassSpeedMin, ref mmGrassSpeedMax, 0.0f, sliderMaxValue);
                EditorUtils.MinMaxSlider("Amplitude", ref mmGrassAmplitudeMin, ref mmGrassAmplitudeMax, 0.0f, sliderMaxValue);
                EditorUtils.MinMaxSlider("Bending", ref mmGrassBendingMin, ref mmGrassBendingMax, 0.0f, sliderMaxValue);
                GUILayout.Space(5);
                EditorUtils.MinMaxSlider("Mask 2 Speed", ref grassColorMask2SpeedMin, ref grassColorMask2SpeedMax, 0.0f, sliderMaxValue);
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawWSPGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref windProfile.showWSPGroup, "WSP Shader", foldoutStyle, -2);

            if (windProfile.showWSPGroup)
            {
                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Main Motion"), EditorStyles.boldLabel);
                EditorUtils.MinMaxSlider("Speed", ref mmWSPSpeedMin, ref mmWSPSpeedMax, 0.0f, sliderMaxValue);
                EditorUtils.MinMaxSlider("Amplitude", ref mmWSPAmplitudeMin, ref mmWSPAmplitudeMax, 0.0f, sliderMaxValue);

                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Detail Motion"), EditorStyles.boldLabel);
                EditorUtils.MinMaxSlider("Speed", ref dmWSPSpeedMin, ref dmWSPSpeedMax, 0.0f, sliderMaxValue);
                EditorUtils.MinMaxSlider("Amplitude", ref dmWSPAmplitudeMin, ref dmWSPAmplitudeMax, 0.0f, sliderMaxValue);
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawSkyboxCloudsGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref windProfile.showSkyboxCloudsGroup, "Skybox Shader", foldoutStyle, -2);

            if (windProfile.showSkyboxCloudsGroup)
            {
                GUILayout.Space(5);
                EditorGUILayout.PropertyField(combinedCloudSpeed, new GUIContent("Combined Speed"));

                if (windProfile.combinedCloudSpeed)
                {
                    EditorUtils.MinMaxSlider("Speed", ref cloudsSpeedMin, ref cloudsSpeedMax, 0.0f, sliderMaxValue);
                }
                else
                {
                    EditorUtils.MinMaxSlider("Speed 1", ref cloud1SpeedMin, ref cloud1SpeedMax, 0.0f, sliderMaxValue);
                    EditorUtils.MinMaxSlider("Speed 2", ref cloud2SpeedMin, ref cloud2SpeedMax, 0.0f, sliderMaxValue);
                    EditorUtils.MinMaxSlider("Speed 3", ref cloud3SpeedMin, ref cloud3SpeedMax, 0.0f, sliderMaxValue);
                }

                GUILayout.Space(5);
                EditorGUILayout.Slider(cloud1DirectionOffset, -180, 180, new GUIContent("Direction Offset 1"));
                EditorGUILayout.Slider(cloud2DirectionOffset, -180, 180, new GUIContent("Direction Offset 2"));
                EditorGUILayout.Slider(cloud3DirectionOffset, -180, 180, new GUIContent("Direction Offset 3"));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawCloudShadowsGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref windProfile.showCloudShadowGroup, "Cloud Shadows Shader", foldoutStyle, -2);

            if (windProfile.showCloudShadowGroup)
            {
                GUILayout.Space(5);
                EditorGUILayout.PropertyField(combinedCloudShadowSpeed, new GUIContent("Combined Speed"));

                if (windProfile.combinedCloudShadowSpeed)
                {
                    EditorUtils.MinMaxSlider("Speed", ref cloudShadowSpeedMin, ref cloudShadowSpeedMax, 0.0f, sliderMaxValue);
                }
                else
                {
                    EditorUtils.MinMaxSlider("Speed 1", ref cloudShadow1SpeedMin, ref cloudShadow1SpeedMax, 0.0f, sliderMaxValue);
                    EditorUtils.MinMaxSlider("Speed 2", ref cloudShadow2SpeedMin, ref cloudShadow2SpeedMax, 0.0f, sliderMaxValue);
                    EditorUtils.MinMaxSlider("Speed 3", ref cloudShadow3SpeedMin, ref cloudShadow3SpeedMax, 0.0f, sliderMaxValue);
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawWaterGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref windProfile.showWaterGroup, "Water Shader", foldoutStyle, -2);

            if (windProfile.showWaterGroup)
            {
                GUILayout.Space(5);
                EditorGUILayout.PropertyField(combinedWaterSpeed, new GUIContent("Combined Speed"));
                GUILayout.Space(5);

                EditorGUILayout.LabelField(new GUIContent("Normals"), EditorStyles.boldLabel);
                if (windProfile.combinedWaterSpeed)
                {
                    EditorUtils.MinMaxSlider("Speed", ref waterNormalsSpeedMin, ref waterNormalsSpeedMax, 0.0f, sliderMaxValue);
                }
                else
                {
                    EditorUtils.MinMaxSlider("Speed 1", ref waterNormalsSpeed1Min, ref waterNormalsSpeed1Max, 0.0f, sliderMaxValue);
                    EditorUtils.MinMaxSlider("Speed 2", ref waterNormalsSpeed2Min, ref waterNormalsSpeed2Max, 0.0f, sliderMaxValue);
                }

                GUILayout.Space(5);
                EditorGUILayout.LabelField(new GUIContent("Foam"), EditorStyles.boldLabel);
                if (windProfile.combinedWaterSpeed)
                {
                    EditorUtils.MinMaxSlider("Speed", ref waterFoamSpeedMin, ref waterFoamSpeedMax, 0.0f, sliderMaxValue);
                }
                else
                {
                    EditorUtils.MinMaxSlider("Speed 1", ref waterFoamSpeed1Min, ref waterFoamSpeed1Max, 0.0f, sliderMaxValue);
                    EditorUtils.MinMaxSlider("Speed 2", ref waterFoamSpeed2Min, ref waterFoamSpeed2Max, 0.0f, sliderMaxValue);
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void ClampSliderValues()
        {
            sliderMaxVal.serializedObject.ApplyModifiedProperties();

            int max = windProfile.sliderMaxValue;

            if (windProfile.mmVegetationSpeedMin > windProfile.mmVegetationSpeedMax)
                windProfile.mmVegetationSpeedMin = 0;
            if (windProfile.mmVegetationSpeedMax > max)
                windProfile.mmVegetationSpeedMax = max;
            if (windProfile.mmVegetationAmplitudeMin > windProfile.mmVegetationAmplitudeMax)
                windProfile.mmVegetationAmplitudeMin = 0;
            if (windProfile.mmVegetationAmplitudeMax > max)
                windProfile.mmVegetationAmplitudeMax = max;
            if (windProfile.mmVegetationBendingMin > windProfile.mmVegetationBendingMax)
                windProfile.mmVegetationBendingMin = 0;
            if (windProfile.mmVegetationBendingMax > max)
                windProfile.mmVegetationBendingMax = max;
            if (windProfile.dmVegetationSpeedMin > windProfile.dmVegetationSpeedMax)
                windProfile.dmVegetationSpeedMin = 0;
            if (windProfile.dmVegetationSpeedMax > max)
                windProfile.dmVegetationSpeedMax = max;
            if (windProfile.dmVegetationAmplitudeMin > windProfile.dmVegetationAmplitudeMax)
                windProfile.dmVegetationAmplitudeMin = 0;
            if (windProfile.dmVegetationAmplitudeMax > max)
                windProfile.dmVegetationAmplitudeMax = max;

            if (windProfile.mmFlowerSpeedMin > windProfile.mmFlowerSpeedMax)
                windProfile.mmFlowerSpeedMin = 0;
            if (windProfile.mmFlowerSpeedMax > max)
                windProfile.mmFlowerSpeedMax = max;
            if (windProfile.mmFlowerAmplitudeMin > windProfile.mmFlowerAmplitudeMax)
                windProfile.mmFlowerAmplitudeMin = 0;
            if (windProfile.mmFlowerAmplitudeMax > max)
                windProfile.mmFlowerAmplitudeMax = max;
            if (windProfile.mmFlowerBendingMin > windProfile.mmFlowerBendingMax)
                windProfile.mmFlowerBendingMin = 0;
            if (windProfile.mmFlowerBendingMax > max)
                windProfile.mmFlowerBendingMax = max;
            if (windProfile.dmFlowerSpeedMin > windProfile.dmFlowerSpeedMax)
                windProfile.dmFlowerSpeedMin = 0;
            if (windProfile.dmFlowerSpeedMax > max)
                windProfile.dmFlowerSpeedMax = max;
            if (windProfile.dmFlowerAmplitudeMin > windProfile.dmFlowerAmplitudeMax)
                windProfile.dmFlowerAmplitudeMin = 0;
            if (windProfile.dmFlowerAmplitudeMax > max)
                windProfile.dmFlowerAmplitudeMax = max;

            if (windProfile.mmGrassSpeedMin > windProfile.mmGrassSpeedMax)
                windProfile.mmGrassSpeedMin = 0;
            if (windProfile.mmGrassSpeedMax > max)
                windProfile.mmGrassSpeedMax = max;
            if (windProfile.mmGrassAmplitudeMin > windProfile.mmGrassAmplitudeMax)
                windProfile.mmGrassAmplitudeMin = 0;
            if (windProfile.mmGrassAmplitudeMax > max)
                windProfile.mmGrassAmplitudeMax = max;
            if (windProfile.mmGrassBendingMin > windProfile.mmGrassBendingMax)
                windProfile.mmGrassBendingMin = 0;
            if (windProfile.mmGrassBendingMax > max)
                windProfile.mmGrassBendingMax = max;

            if (windProfile.mmWSPSpeedMin > windProfile.mmWSPSpeedMax)
                windProfile.mmWSPSpeedMin = 0;
            if (windProfile.mmWSPSpeedMax > max)
                windProfile.mmWSPSpeedMax = max;
            if (windProfile.mmWSPAmplitudeMin > windProfile.mmWSPAmplitudeMax)
                windProfile.mmWSPAmplitudeMin = 0;
            if (windProfile.mmWSPAmplitudeMax > max)
                windProfile.mmWSPAmplitudeMax = max;
            if (windProfile.dmWSPSpeedMin > windProfile.dmWSPSpeedMax)
                windProfile.dmWSPSpeedMin = 0;
            if (windProfile.dmWSPSpeedMax > max)
                windProfile.dmWSPSpeedMax = max;
            if (windProfile.dmWSPAmplitudeMin > windProfile.dmWSPAmplitudeMax)
                windProfile.dmWSPAmplitudeMin = 0;
            if (windProfile.dmWSPAmplitudeMax > max)
                windProfile.dmWSPAmplitudeMax = max;

            serializedObject.ApplyModifiedProperties();
        }
    }
}
