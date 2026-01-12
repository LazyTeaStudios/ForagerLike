using UnityEngine;
using UnityEditor;

namespace Nicrom
{
    public class CMI_Skybox : ShaderGUI {

        MaterialProperty debug_toggle = null;
        MaterialProperty debug1_enum = null;
        MaterialProperty debug2_enum = null;
        MaterialProperty debug3_enum = null;
        MaterialProperty zenithColor = null;
        MaterialProperty zenithPower = null;
        MaterialProperty horizonColor = null;
        MaterialProperty horizonScale = null;


        MaterialProperty equatorColor = null;
        MaterialProperty equatorOpacity = null;
        MaterialProperty equatorOpacityAtNoon = null;
        MaterialProperty equatorMinRadius = null;
        MaterialProperty equatorMaxRadius = null;
        MaterialProperty equatorPower = null;

        MaterialProperty groundColor = null;
        MaterialProperty groundPower = null;

        MaterialProperty sunToggle = null;
        MaterialProperty sunColor = null;
        MaterialProperty sunSize = null;
        MaterialProperty sunSharpness = null;
        MaterialProperty sunBloom = null;
        MaterialProperty sunBloomBehindClouds = null;
        MaterialProperty sunBloomNearEquator = null;
        MaterialProperty sunEquatorFadeEnd = null;

        MaterialProperty moonToggle = null;
        MaterialProperty moonAlbedo = null;
        MaterialProperty moonColor = null;
        MaterialProperty moonSize = null;
        MaterialProperty moonPhase = null;
        MaterialProperty moonPhaseRotation = null;
        MaterialProperty moonOpacity = null;
        MaterialProperty moonEquatorFadeEnd = null;

        MaterialProperty starsToggle = null;
        MaterialProperty starsColor = null;
        MaterialProperty starsOpacity = null;
        MaterialProperty starsHorizonFadeMin = null;
        MaterialProperty starsHorizonFadeMax = null;
        MaterialProperty starsCubemap = null;
        MaterialProperty starsRotationX = null;
        MaterialProperty starsRotationY = null;

        MaterialProperty cloudsToggle = null;
        MaterialProperty cloudsColor = null;
        MaterialProperty cloudsOpacity = null;
        MaterialProperty cloudsCoverage = null;
        MaterialProperty cloudsSharpnessMin = null;
        MaterialProperty cloudsSharpnessMax = null;
        MaterialProperty cloudsHorizonFadeScale = null;
        MaterialProperty cloudsHorizonFadeHeight = null;
        MaterialProperty cloudLayes_Enum = null;

        MaterialProperty cl1_NoiseTex = null;
        MaterialProperty cl1_SphericalUVs = null;
        MaterialProperty cl1_Sharpness = null;
        MaterialProperty cl1_SharpMin = null;
        MaterialProperty cl1_SharpMax = null;
        MaterialProperty cl1_RemapMin = null;
        MaterialProperty cl1_RemapMax = null;
        MaterialProperty cl1_Opacity = null;
        MaterialProperty cl1_Speed = null;
        MaterialProperty cl1_Scale = null;
        MaterialProperty cl1_RotationAngle = null;
        MaterialProperty cl1_TilingOffset = null;
        
        MaterialProperty cl2_NoiseTex = null;
        MaterialProperty cl2_SphericalUVs = null;
        MaterialProperty cl2_Sharpness = null;
        MaterialProperty cl2_SharpMin = null;
        MaterialProperty cl2_SharpMax = null;
        MaterialProperty cl2_RemapMin = null;
        MaterialProperty cl2_RemapMax = null;
        MaterialProperty cl2_Opacity = null;
        MaterialProperty cl2_Speed = null;
        MaterialProperty cl2_Scale = null;
        MaterialProperty cl2_RotationAngle = null;
        MaterialProperty cl2_TilingOffset = null;

        MaterialProperty cl3_NoiseTex = null;
        MaterialProperty cl3_SphericalUVs = null;
        MaterialProperty cl3_Sharpness = null;
        MaterialProperty cl3_SharpMin = null;
        MaterialProperty cl3_SharpMax = null;
        MaterialProperty cl3_RemapMin = null;
        MaterialProperty cl3_RemapMax = null;
        MaterialProperty cl3_Opacity = null;
        MaterialProperty cl3_Speed = null;
        MaterialProperty cl3_Scale = null;
        MaterialProperty cl3_RotationAngle = null;
        MaterialProperty cl3_TilingOffset = null;

        MaterialProperty fogToggle = null;
        MaterialProperty fogOpacity = null;

        MaterialProperty fogStartNH = null;
        MaterialProperty fogEndNH = null;
        MaterialProperty fogStartSH = null;
        MaterialProperty fogEndSH = null;

        MaterialEditor matEditor;

        public void FindProperties(MaterialProperty[] mProps)
        {
            zenithColor                         = FindProperty("_ZenithColor", mProps);
            zenithPower                         = FindProperty("_ZenithPower", mProps);
            horizonColor                        = FindProperty("_HorizonColor", mProps);
            horizonScale                        = FindProperty("_HorizonScale", mProps);
            equatorColor                        = FindProperty("_EquatorColor", mProps);
            equatorOpacity                      = FindProperty("_EquatorOpacity", mProps);
            equatorOpacityAtNoon                = FindProperty("_EquatorOpacityAtNoon", mProps);
            equatorMinRadius                    = FindProperty("_EquatorMinRadius", mProps);
            equatorMaxRadius                    = FindProperty("_EquatorMaxRadius", mProps);
            equatorPower                        = FindProperty("_EquatorPower", mProps);
            groundColor                         = FindProperty("_GroundColor", mProps);
            groundPower                         = FindProperty("_GroundPower", mProps);

            debug_toggle                        = FindProperty("_Debug", mProps);
            debug1_enum                         = FindProperty("_Debug1", mProps);
            debug2_enum                         = FindProperty("_Debug2", mProps);
            debug3_enum                         = FindProperty("_Debug3", mProps);

            sunToggle                           = FindProperty("_Sun", mProps);
            sunColor                            = FindProperty("_SunColor", mProps);
            sunSize                             = FindProperty("_SunSize", mProps);
            sunSharpness                        = FindProperty("_SunSharpness", mProps);
            sunBloom                            = FindProperty("_SunBloom", mProps);
            sunBloomBehindClouds                = FindProperty("_SunBloomBehindClouds", mProps);
            sunBloomNearEquator                 = FindProperty("_SunBloomNearEquator", mProps);
            sunEquatorFadeEnd                   = FindProperty("_SunEquatorFadeEnd", mProps);

            moonToggle                          = FindProperty("_Moon", mProps);
            moonAlbedo                          = FindProperty("_MoonAlbedo", mProps);
            moonColor                           = FindProperty("_MoonColor", mProps);
            moonSize                            = FindProperty("_MoonSize", mProps);
            moonPhase                           = FindProperty("_MoonPhase", mProps);
            moonPhaseRotation                   = FindProperty("_MoonPhaseRotation", mProps);
            moonOpacity                         = FindProperty("_MoonOpacity", mProps);
            moonEquatorFadeEnd                  = FindProperty("_MoonEquatorFadeEnd", mProps);

            starsToggle                         = FindProperty("_Stars", mProps);
            starsColor                          = FindProperty("_StarsColor", mProps);
            starsOpacity                        = FindProperty("_StarsOpacity", mProps);
            starsHorizonFadeMin                 = FindProperty("_StarsHorizonFadeMin", mProps);
            starsHorizonFadeMax                 = FindProperty("_StarsHorizonFadeMax", mProps);
            starsCubemap                        = FindProperty("_StarsCubemap", mProps);
            starsRotationX                      = FindProperty("_StarsRotationX", mProps);
            starsRotationY                      = FindProperty("_StarsRotationY", mProps);

            cloudsToggle                        = FindProperty("_Clouds", mProps);
            cloudsColor                         = FindProperty("_CloudsColor", mProps);
            cloudsOpacity                       = FindProperty("_CloudsOpacity", mProps);
            cloudsCoverage                      = FindProperty("_CloudsCoverage", mProps);
            cloudsSharpnessMin                  = FindProperty("_CloudsSharpnessMin", mProps);
            cloudsSharpnessMax                  = FindProperty("_CloudsSharpnessMax", mProps);
            cloudsHorizonFadeScale              = FindProperty("_CloudsHorizonFadeScale", mProps);
            cloudsHorizonFadeHeight             = FindProperty("_CloudsHorizonFadeHeight", mProps);
            
            cloudLayes_Enum                     = FindProperty("_CloudLayers", mProps);        
            cl1_NoiseTex                        = FindProperty("_CL1NoiseTexture", mProps);
            cl1_SphericalUVs                    = FindProperty("_CL1SphericalUVs", mProps);
            cl1_Sharpness                       = FindProperty("_CL1Sharpness", mProps);
            cl1_SharpMin                        = FindProperty("_CL1SharpMin", mProps);
            cl1_SharpMax                        = FindProperty("_CL1SharpMax", mProps);
            cl1_RemapMin                        = FindProperty("_CL1RemapMin", mProps);
            cl1_RemapMax                        = FindProperty("_CL1RemapMax", mProps);
            cl1_Opacity                         = FindProperty("_CL1Opacity", mProps);
            cl1_Speed                           = FindProperty("_CL1Speed", mProps);
            cl1_Scale                           = FindProperty("_CL1Scale", mProps);
            cl1_RotationAngle                   = FindProperty("_CL1RotationAngle", mProps);
            cl1_TilingOffset                    = FindProperty("_CL1TilingOffset", mProps);
            
            cl2_NoiseTex                        = FindProperty("_CL2NoiseTexture", mProps);
            cl2_SphericalUVs                    = FindProperty("_CL2SphericalUVs", mProps);
            cl2_Sharpness                       = FindProperty("_CL2Sharpness", mProps);
            cl2_SharpMin                        = FindProperty("_CL2SharpMin", mProps);
            cl2_SharpMax                        = FindProperty("_CL2SharpMax", mProps);
            cl2_RemapMin                        = FindProperty("_CL2RemapMin", mProps);
            cl2_RemapMax                        = FindProperty("_CL2RemapMax", mProps);
            cl2_Opacity                         = FindProperty("_CL2Opacity", mProps);
            cl2_Speed                           = FindProperty("_CL2Speed", mProps);
            cl2_Scale                           = FindProperty("_CL2Scale", mProps);
            cl2_RotationAngle                   = FindProperty("_CL2RotationAngle", mProps);
            cl2_TilingOffset                    = FindProperty("_CL2TilingOffset", mProps);

            cl3_NoiseTex                        = FindProperty("_CL3NoiseTexture", mProps);
            cl3_SphericalUVs                    = FindProperty("_CL3SphericalUVs", mProps);
            cl3_Sharpness                       = FindProperty("_CL3Sharpness", mProps);
            cl3_SharpMin                        = FindProperty("_CL3SharpMin", mProps);
            cl3_SharpMax                        = FindProperty("_CL3SharpMax", mProps);
            cl3_RemapMin                        = FindProperty("_CL3RemapMin", mProps);
            cl3_RemapMax                        = FindProperty("_CL3RemapMax", mProps);
            cl3_Opacity                         = FindProperty("_CL3Opacity", mProps);
            cl3_Speed                           = FindProperty("_CL3Speed", mProps);
            cl3_Scale                           = FindProperty("_CL3Scale", mProps);
            cl3_RotationAngle                   = FindProperty("_CL3RotationAngle", mProps);
            cl3_TilingOffset                    = FindProperty("_CL3TilingOffset", mProps);

            fogToggle                           = FindProperty("_Fog", mProps);
            fogOpacity                          = FindProperty("_FogOpacity", mProps);
            fogStartNH                          = FindProperty("_FogStartNH", mProps);
            fogEndNH                            = FindProperty("_FogEndNH", mProps);
            fogStartSH                          = FindProperty("_FogStartSH", mProps);
            fogEndSH                            = FindProperty("_FogEndSH", mProps);
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
            DrawSunGroup(foldoutStyle);
            DrawMoonGroup(foldoutStyle);
            DrawStarsGroup(foldoutStyle);
            DrawCloudsGroup(foldoutStyle);
            DrawFogGroup(foldoutStyle);
        }

        private void DrawColorGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showSkyboxColorGroup, "Color", foldoutStyle, -12);
            
            if (FoldoutStates.showSkyboxColorGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(zenithColor,           new GUIContent("Zenith Color"));
                matEditor.ShaderProperty(zenithPower,           new GUIContent("Zenith Power"));
                GUILayout.Space(5);
                matEditor.ShaderProperty(horizonColor,          new GUIContent("Horizon Color"));
                matEditor.ShaderProperty(horizonScale,          new GUIContent("Horizon Scale"));
                GUILayout.Space(5);
                matEditor.ShaderProperty(equatorColor,          new GUIContent("Equator Color"));
                matEditor.ShaderProperty(equatorOpacity,        new GUIContent("Equator Opacity"));
                matEditor.ShaderProperty(equatorOpacityAtNoon,  new GUIContent("Equator Opacity At Noon"));
                matEditor.ShaderProperty(equatorMinRadius,      new GUIContent("Equator Glow Min Radius"));
                matEditor.ShaderProperty(equatorMaxRadius,      new GUIContent("Equator Glow Max Radius"));
                matEditor.ShaderProperty(equatorPower,          new GUIContent("Equator Power"));
                GUILayout.Space(5);
                matEditor.ShaderProperty(groundColor, new GUIContent("Ground Color"));
                matEditor.ShaderProperty(groundPower, new GUIContent("Ground Power"));
                GUILayout.Space(5);

                matEditor.ShaderProperty(debug_toggle, new GUIContent("Debug"));
                
                if (debug_toggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(debug1_enum, new GUIContent("Debug 1"));
                    matEditor.ShaderProperty(debug2_enum, new GUIContent("Debug 2"));
                    matEditor.ShaderProperty(debug3_enum, new GUIContent("Debug 3"));
                }

                GUILayout.Space(5);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawSunGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showSkyboxSunGroup, "Sun", foldoutStyle, -2);

            if (FoldoutStates.showSkyboxSunGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(sunToggle, new GUIContent("Enable"));
                GUILayout.Space(5);

                if (sunToggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(sunColor, new GUIContent("Color"));
                    matEditor.ShaderProperty(sunSize, new GUIContent("Size"));
                    matEditor.ShaderProperty(sunSharpness, new GUIContent("Sharpness"));
                    matEditor.ShaderProperty(sunBloom, new GUIContent("Bloom"));
                    matEditor.ShaderProperty(sunBloomBehindClouds, new GUIContent("Bloom Behind Clouds"));
                    matEditor.ShaderProperty(sunBloomNearEquator, new GUIContent("Bloom Near Equator"));
                    matEditor.ShaderProperty(sunEquatorFadeEnd, new GUIContent("Equator Fade End"));
                    GUILayout.Space(5);

                }
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawMoonGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showSkyboxMoonGroup, "Moon", foldoutStyle, -2);

            if (FoldoutStates.showSkyboxMoonGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(moonToggle, new GUIContent("Enable"));
                GUILayout.Space(5);

                if (moonToggle.floatValue == 1)
                {
                    matEditor.TexturePropertySingleLine(new GUIContent("Albedo"), moonAlbedo);
                    matEditor.ShaderProperty(moonColor, new GUIContent("Color"));
                    matEditor.ShaderProperty(moonSize, new GUIContent("Size"));
                    matEditor.ShaderProperty(moonOpacity, new GUIContent("Opacity"));
                    matEditor.ShaderProperty(moonPhase, new GUIContent("Phase"));

                    if(moonPhase.floatValue > 0 && moonPhase.floatValue < 1)
                        matEditor.ShaderProperty(moonPhaseRotation, new GUIContent("Phase Rotation"));

                    matEditor.ShaderProperty(moonEquatorFadeEnd, new GUIContent("Equator Fade"));
                    GUILayout.Space(5);

                }
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawStarsGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showSkyboxStarsGroup, "Stars", foldoutStyle, -2);

            if (FoldoutStates.showSkyboxStarsGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(starsToggle, new GUIContent("Enable"));
                GUILayout.Space(5);

                if (starsToggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(starsColor, new GUIContent("Color"));
                    matEditor.ShaderProperty(starsOpacity, new GUIContent("Opacity"));
                    matEditor.ShaderProperty(starsHorizonFadeMin, new GUIContent("Horizon Fade Min"));
                    matEditor.ShaderProperty(starsHorizonFadeMax, new GUIContent("Horizon Fade Max"));
                    matEditor.ShaderProperty(starsRotationX, new GUIContent("Rotation X"));
                    matEditor.ShaderProperty(starsRotationY, new GUIContent("Rotation Y"));
                    matEditor.TexturePropertySingleLine(new GUIContent("Cubemap"), starsCubemap);
                    GUILayout.Space(5);

                }
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawCloudsGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showSkyboxCloudsGroup, "Clouds", foldoutStyle, -2);

            if (FoldoutStates.showSkyboxCloudsGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(cloudsToggle, new GUIContent("Enable"));
                GUILayout.Space(5);

                if (cloudsToggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(cloudsColor, new GUIContent("Color"));
                    matEditor.ShaderProperty(cloudsOpacity, new GUIContent("Opacity"));
                    matEditor.ShaderProperty(cloudsCoverage, new GUIContent("Coverage"));
                    matEditor.ShaderProperty(cloudsSharpnessMin, new GUIContent("Sharpness Min"));
                    matEditor.ShaderProperty(cloudsSharpnessMax, new GUIContent("Sharpness Max"));
                    matEditor.ShaderProperty(cloudsHorizonFadeScale, new GUIContent("Horizon Fade Scale"));
                    matEditor.ShaderProperty(cloudsHorizonFadeHeight, new GUIContent("Horizon Fade Height"));

                    GUILayout.Space(5);
                    matEditor.ShaderProperty(cloudLayes_Enum, new GUIContent("Cloud Layers"));
                    matEditor.TexturePropertySingleLine(new GUIContent("CL1 Noise"), cl1_NoiseTex);
                    matEditor.ShaderProperty(cl1_SphericalUVs, new GUIContent("CL1 Spherical UVs"));
                    matEditor.ShaderProperty(cl1_Opacity, new GUIContent("CL1 Opacity"));
                    matEditor.ShaderProperty(cl1_Speed, new GUIContent("CL1 Speed"));

                    matEditor.ShaderProperty(cl1_Sharpness, new GUIContent("CL1 Sharpness"));
                    if (cl1_Sharpness.floatValue == 1)
                    {
                        matEditor.ShaderProperty(cl1_SharpMin, new GUIContent("CL1 Sharp Min"));
                        matEditor.ShaderProperty(cl1_SharpMax, new GUIContent("CL1 Sharp Max"));
                    }

                    matEditor.ShaderProperty(cl1_RemapMin, new GUIContent("CL1 Remap Min"));
                    matEditor.ShaderProperty(cl1_RemapMax, new GUIContent("CL1 Remap Max"));

                    matEditor.ShaderProperty(cl1_Scale, new GUIContent("CL1 Scale"));
                    matEditor.ShaderProperty(cl1_RotationAngle, new GUIContent("CL1 Rotation Angle"));
                    matEditor.ShaderProperty(cl1_TilingOffset, new GUIContent("CL1 Tiling & Offset"));
                    
                    GUILayout.Space(-10);
                    matEditor.TexturePropertySingleLine(new GUIContent("CL2 Noise"), cl2_NoiseTex);
                    matEditor.ShaderProperty(cl2_SphericalUVs, new GUIContent("CL2 Spherical UVs"));
                    matEditor.ShaderProperty(cl2_Opacity, new GUIContent("CL2 Opacity"));
                    matEditor.ShaderProperty(cl2_Speed, new GUIContent("CL2 Speed"));
                    matEditor.ShaderProperty(cl2_Sharpness, new GUIContent("CL2 Sharpness"));
                    if (cl2_Sharpness.floatValue == 1)
                    {
                        matEditor.ShaderProperty(cl2_SharpMin, new GUIContent("CL2 Sharp Min"));
                        matEditor.ShaderProperty(cl2_SharpMax, new GUIContent("CL2 Sharp Max"));
                    }
                    matEditor.ShaderProperty(cl2_RemapMin, new GUIContent("CL2 Remap Min"));
                    matEditor.ShaderProperty(cl2_RemapMax, new GUIContent("CL2 Remap Max"));

                    matEditor.ShaderProperty(cl2_Scale, new GUIContent("CL2 Scale"));
                    matEditor.ShaderProperty(cl2_RotationAngle, new GUIContent("CL2 Rotation Angle"));
                    matEditor.ShaderProperty(cl2_TilingOffset, new GUIContent("CL2 Tiling & Offset"));

                    if (cloudLayes_Enum.floatValue == 1)
                    {
                        GUILayout.Space(-10);
                        matEditor.TexturePropertySingleLine(new GUIContent("CL3 Noise"), cl3_NoiseTex);
                        matEditor.ShaderProperty(cl3_SphericalUVs, new GUIContent("CL3 Spherical UVs"));
                        matEditor.ShaderProperty(cl3_Opacity, new GUIContent("CL3 Opacity"));
                        matEditor.ShaderProperty(cl3_Speed, new GUIContent("CL3 Speed"));

                        matEditor.ShaderProperty(cl3_Sharpness, new GUIContent("CL3 Sharpness"));
                        if (cl3_Sharpness.floatValue == 1)
                        {
                            matEditor.ShaderProperty(cl3_SharpMin, new GUIContent("CL3 Sharp Min"));
                            matEditor.ShaderProperty(cl3_SharpMax, new GUIContent("CL3 Sharp Max"));
                        }
                        matEditor.ShaderProperty(cl3_RemapMin, new GUIContent("CL3 Remap Min"));
                        matEditor.ShaderProperty(cl3_RemapMax, new GUIContent("CL3 Remap Max"));

                        matEditor.ShaderProperty(cl3_Scale, new GUIContent("CL3 Scale"));
                        matEditor.ShaderProperty(cl3_RotationAngle, new GUIContent("CL3 Rotation Angle"));
                        matEditor.ShaderProperty(cl3_TilingOffset, new GUIContent("CL3 Tiling & Offset"));
                    }
                }
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }

        private void DrawFogGroup(GUIStyle foldoutStyle)
        {
            EditorUtils.DrawFoldoutHeader(ref FoldoutStates.showSkyboxFogGroup, "Fog", foldoutStyle, -2);

            if (FoldoutStates.showSkyboxFogGroup)
            {
                GUILayout.Space(5);
                matEditor.ShaderProperty(fogToggle, new GUIContent("Enable"));
                GUILayout.Space(5);

                if (fogToggle.floatValue == 1)
                {
                    matEditor.ShaderProperty(fogOpacity, new GUIContent("Opacity"));
                    matEditor.ShaderProperty(fogStartNH, new GUIContent("Start NH"));
                    matEditor.ShaderProperty(fogEndNH, new GUIContent("End NH"));
                    matEditor.ShaderProperty(fogStartSH, new GUIContent("Start SH"));
                    matEditor.ShaderProperty(fogEndSH, new GUIContent("End SH"));
                    GUILayout.Space(5);
                }
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
            GUILayout.Space(8);
        }
    }
}
