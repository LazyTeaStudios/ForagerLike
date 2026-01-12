using UnityEngine;
using UnityEditor;

namespace Nicrom
{
    public class CMI_Surface : ShaderGUI
    {
        // Main
        MaterialProperty albedo = null;
        MaterialProperty normal = null;
        MaterialProperty mrao = null;
        MaterialProperty color = null;
        MaterialProperty metallic = null;
        MaterialProperty smoothness = null;
        MaterialProperty normalScale = null;
        MaterialProperty ambientOcclusion = null;
        MaterialProperty debug = null;

        // Edge highlight
        MaterialProperty edgeHighlight = null;
        MaterialProperty curvatureMap = null;
        MaterialProperty edgeHighlightColor = null;
        MaterialProperty edgeHighlightSharpMin = null;
        MaterialProperty edgeHighlightSharpMax = null;

        // Triplanar projection
        MaterialProperty triplanarProjection = null;
        MaterialProperty triplanarAlbedo = null;
        MaterialProperty triplanarNormal = null;
        MaterialProperty triplanarColor = null;
        MaterialProperty triplanarTiling = null;
        MaterialProperty triplanarTilingSpace = null;
        MaterialProperty triplanarAlbedoIntensity = null;
        MaterialProperty triplanarNormalScale = null;

        // Coverage
        MaterialProperty coverage = null;
        MaterialProperty coverageAlbedo = null;
        MaterialProperty coverageNormal = null;
        MaterialProperty coverageColor = null;
        MaterialProperty coverageTiling = null;
        MaterialProperty coverageSmoothness = null;
        MaterialProperty coverageNormalScale = null;
        MaterialProperty coverageSoace = null;
        MaterialProperty coverageAmount = null;
        MaterialProperty coverageFalloff = null;
        MaterialProperty coverageNormalBlend = null;

        MaterialEditor matEditor;
        GUIStyle foldoutStyle;


        private void OnEnable()
        {

        }

        public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] mProps)
        {
            matEditor = materialEditor;
            Material material = materialEditor.target as Material;


            FindProperties(mProps);
            ShaderPropertiesGUI(material);
        }

        public void FindProperties(MaterialProperty[] mProps)
        {
            albedo                      = FindProperty("_Albedo", mProps);
            normal                      = FindProperty("_Normal", mProps);
            mrao                        = FindProperty("_MRAO", mProps);
            color                       = FindProperty("_Color", mProps);
            metallic                    = FindProperty("_Metallic", mProps);
            smoothness                  = FindProperty("_Smoothness", mProps);
            normalScale                 = FindProperty("_NormalScale", mProps);
            ambientOcclusion            = FindProperty("_AmbientOcclusion", mProps);
            debug                       = FindProperty("_Debug", mProps);

            edgeHighlight               = FindProperty("_EdgeHighlight", mProps);
            curvatureMap                = FindProperty("_CurvatureMap", mProps);
            edgeHighlightColor          = FindProperty("_EdgeHighlightColor", mProps);
            edgeHighlightSharpMin       = FindProperty("_EdgeHighlightSharpMin", mProps);
            edgeHighlightSharpMax       = FindProperty("_EdgeHighlightSharpMax", mProps);

            triplanarProjection         = FindProperty("_TriplanarProjection", mProps);
            triplanarAlbedo             = FindProperty("_TriplanarAlbedo", mProps);
            triplanarNormal             = FindProperty("_TriplanarNormal", mProps);
            triplanarColor              = FindProperty("_TriplanarColor", mProps);
            triplanarTiling             = FindProperty("_TriplanarTiling", mProps);
            triplanarTilingSpace        = FindProperty("_TriplanarTilingSpace", mProps);
            triplanarAlbedoIntensity    = FindProperty("_TriplanarAlbedoIntensity", mProps);
            triplanarNormalScale        = FindProperty("_TriplanarNormalScale", mProps);



            coverage                    = FindProperty("_Coverage", mProps);
            coverageAlbedo              = FindProperty("_CoverageAlbedo", mProps);
            coverageNormal              = FindProperty("_CoverageNormal", mProps);
            coverageColor               = FindProperty("_CoverageColor", mProps);
            coverageTiling              = FindProperty("_CoverageTiling", mProps);
            coverageSmoothness          = FindProperty("_CoverageSmoothness", mProps);
            coverageNormalScale         = FindProperty("_CoverageNormalScale", mProps);
            coverageSoace               = FindProperty("_CoverageSpace", mProps);
            coverageAmount              = FindProperty("_CoverageAmount", mProps);
            coverageFalloff             = FindProperty("_CoverageFalloff", mProps);
            coverageNormalBlend         = FindProperty("_CoverageNormalBlend", mProps);
        }

        public void ShaderPropertiesGUI(Material material)
        {
            foldoutStyle = new GUIStyle(EditorStyles.foldoutHeader);

            DrawMainGroup();
            DrawEdgeHighlightGroup();
            DrawTriplanarProjectionGroup();
            DrawCoverageGroup();
            DrawAdvancedGroup();
        }

        private void DrawMainGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showSurfaceMainGroup, "Main Properties", foldoutStyle, -10);

            if (FoldoutStates.showSurfaceMainGroup)
            {
                GUILayout.Space(5);
                matEditor.TexturePropertySingleLine(new GUIContent("Albedo"), albedo);
                matEditor.TexturePropertySingleLine(new GUIContent("Normal"), normal);
                matEditor.TexturePropertySingleLine(new GUIContent("MRAO"), mrao);
                GUILayout.Space(5);
                matEditor.ShaderProperty(color, new GUIContent("Color"));
                matEditor.ShaderProperty(metallic, new GUIContent("Metallic"));
                matEditor.ShaderProperty(smoothness, new GUIContent("Smoothness"));
                matEditor.ShaderProperty(normalScale, new GUIContent("Normal Scale"));
                matEditor.ShaderProperty(ambientOcclusion, new GUIContent("Ambient Occlusion"));
                GUILayout.Space(5);
                matEditor.ShaderProperty(debug, new GUIContent("Debug"));
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawEdgeHighlightGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showSurfaceEdgeHighlightGroup, "Edge Highlight", foldoutStyle, -2);

            if (FoldoutStates.showSurfaceEdgeHighlightGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(edgeHighlight, new GUIContent("Enable"));

                if(edgeHighlight.floatValue == 1)
                {
                    GUILayout.Space(5);

                    matEditor.ShaderProperty(edgeHighlightColor, new GUIContent("Color"));
                    matEditor.ShaderProperty(edgeHighlightSharpMin, new GUIContent("Sharp Min"));
                    matEditor.ShaderProperty(edgeHighlightSharpMax, new GUIContent("Sharp Max"));
                    GUILayout.Space(5);
                    matEditor.TexturePropertySingleLine(new GUIContent("Curvature Map"), curvatureMap);

                    
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawTriplanarProjectionGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showSurfaceTriplanarGroup, "Triplanar Projection", foldoutStyle, -2);

            if (FoldoutStates.showSurfaceTriplanarGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(triplanarProjection, new GUIContent("Enable"));

                if (triplanarProjection.floatValue == 1)
                {
                    GUILayout.Space(5);
                    matEditor.TexturePropertySingleLine(new GUIContent("Albedo"), triplanarAlbedo);
                    matEditor.TexturePropertySingleLine(new GUIContent("Normal"), triplanarNormal);
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(triplanarColor, new GUIContent("Color"));
                    matEditor.ShaderProperty(triplanarTiling, new GUIContent("Tiling"));
                    matEditor.ShaderProperty(triplanarTilingSpace, new GUIContent("Tiling Space"));
                    matEditor.ShaderProperty(triplanarAlbedoIntensity, new GUIContent("Albedo Intensity"));
                    matEditor.ShaderProperty(triplanarNormalScale, new GUIContent("Normal Scale"));
                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawCoverageGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showSurfaceCoverageGroup, "Coverage", foldoutStyle, -2);

            if (FoldoutStates.showSurfaceCoverageGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(coverage, new GUIContent("Enable"));

                if (coverage.floatValue == 1)
                {
                    GUILayout.Space(5);
                    matEditor.TexturePropertySingleLine(new GUIContent("Albedo"), coverageAlbedo);
                    matEditor.TexturePropertySingleLine(new GUIContent("Normal"), coverageNormal);
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(coverageColor, new GUIContent("Color"));
                    matEditor.ShaderProperty(coverageTiling, new GUIContent("Tiling"));
                    matEditor.ShaderProperty(coverageSmoothness, new GUIContent("Smoothness"));
                    matEditor.ShaderProperty(coverageNormalScale, new GUIContent("Normal Scale"));
                    if (triplanarProjection.floatValue == 1)
                        matEditor.ShaderProperty(coverageNormalBlend, new GUIContent("Normal Blend"));
                    GUILayout.Space(5);
                    matEditor.ShaderProperty(coverageSoace, new GUIContent("Space"));
                    matEditor.ShaderProperty(coverageAmount, new GUIContent("Amount"));
                    matEditor.ShaderProperty(coverageFalloff, new GUIContent("Falloff"));


                }
                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawAdvancedGroup()
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showSurfaceAdvancedGroup, "Advanced Options", foldoutStyle, -2);

            if (FoldoutStates.showSurfaceAdvancedGroup)
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
