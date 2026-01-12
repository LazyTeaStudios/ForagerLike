// Made with Amplify Shader Editor v1.9.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Nicrom/ASE/Vegetation/Flower"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		_AlphaCutoff( "Alpha Cutoff", Range( 0, 1 ) ) = 0.5
		[NoScaleOffset][SingleLineTexture] _Albedo( "Albedo", 2D ) = "white" {}
		[KeywordEnum( Two,Four )] _FlowerColors( "Flower Colors", Float ) = 0
		_FlowerColor1A( "Flower Color 1A", Color ) = ( 0.9716981, 0.9698267, 0.9127676 )
		_FlowerColor1B( "Flower Color 1B", Color ) = ( 0.6784314, 0.4431373, 0.2196078 )
		_FlowerColor2A( "Flower Color 2A", Color ) = ( 0.9433962, 0.9309318, 0.3966841 )
		_FlowerColor2B( "Flower Color 2B", Color ) = ( 0.6784314, 0.4431373, 0.2196078 )
		[Enum(None,0,Color Mask 1  R,1,Color Mask 1  G,2,Color Mask 2,3,Scale Var Noise,4)] _Debug( "Debug", Float ) = 0
		[SingleLineTexture] _ColorMask1( "Color Mask 1", 2D ) = "white" {}
		[SingleLineTexture] _ColorMask2( "Color Mask 2", 2D ) = "white" {}
		[Toggle] _ColorMask2GV( "Color Mask 2 GV", Float ) = 0
		_ColorMask2Tiling( "Color Mask 2 Tiling", Range( 0.0001, 4 ) ) = 0.05
		_ColorMask2SharpMin( "Color Mask 2 Sharp Min", Range( 0, 1 ) ) = 0
		_ColorMask2SharpMax( "Color Mask 2 Sharp Max", Range( 0, 1 ) ) = 0.5
		_ColorMask2Opacity( "Color Mask 2 Opacity", Range( 0, 1 ) ) = 1
		[Toggle][Space] _STEM( "STEM", Range( 0, 1 ) ) = 0
		_StemColorTop( "Stem Color - Top", Color ) = ( 0.5294118, 0.6588235, 0.3098039 )
		_StemColorBottom( "Stem Color -  Bottom", Color ) = ( 0.3960784, 0.5294118, 0.1568628 )
		_StemColorMaskStart( "Stem Color Mask Start", Range( 0, 2 ) ) = 0
		_StemColorMaskEnd( "Stem Color Mask End", Range( 0, 2 ) ) = 1
		[Space][Toggle( _BLENDWITHTERRAIN_ON )] _BlendWithTerrain( "Blend With Terrain", Float ) = 0
		_BWTTop( "BWT Top", Range( 0, 1 ) ) = 0
		_BWTBottom( "BWT Bottom", Range( 0, 1 ) ) = 1
		[Space][Toggle( _DISTANCEFADE_ON )] _DistanceFade( "Distance Fade", Float ) = 1
		[Toggle] _DistanceFadeUseGV( "DistanceFade Use GV", Float ) = 0
		_DistanceFadeStart( "Distance Fade Start", Range( 0, 2000 ) ) = 50
		_DistanceFadeLength( "Distance Fade Length", Range( 0, 20000 ) ) = 50
		[Toggle( _MAINMOTION_ON )] _MainMotion( "Main Motion", Float ) = 1
		[Toggle] _GVTime( "GV Time", Float ) = 1
		[Toggle] _GVBendingScale( "GV Bending Scale", Float ) = 1
		[Toggle] _GVAmplitudeScale( "GV Amplitude Scale", Float ) = 1
		[Toggle] _GVDirectionAngle( "GV Direction Angle", Float ) = 1
		_MMSpeed( "MM Speed", Range( 0, 3 ) ) = 0.4
		_MMAmplitude( "MM Amplitude", Range( 0, 90 ) ) = 1.5
		_MMAmplitudeOffset( "MM Amplitude Offset", Range( 0, 90 ) ) = 2
		_MMBending( "MM Bending", Range( 0, 90 ) ) = 30
		_MMBendingOffset( "MM Bending Offset", Range( 0, 90 ) ) = 10
		[Enum(Vertex Colors,0,Noise Texture,1)] _MMPhaseShiftSource( "MM Phase Shift Source", Float ) = 1
		_MMPhaseShiftScale( "MM Phase Shift Scale", Range( 0, 1 ) ) = 1
		_MMDirectionShift( "MM Direction Shift", Range( 0, 90 ) ) = 20
		_MMDirectionShiftOffset( "MM Direction Shift Offset", Range( 0, 90 ) ) = 10
		_MMDirectionShiftSpeed( "MM Direction Shift Speed", Range( 0, 5 ) ) = 1
		_MMDirectionShiftNoiseScale( "MM Direction Shift Noise Scale", Range( 0, 1 ) ) = 1
		_MMDirectionAngle( "MM Direction Angle", Range( 0, 360 ) ) = 0
		_MMSineWaveLength( "MM Sine Wave Length", Range( 0.001, 20 ) ) = 6
		[Enum(Material Property,0,Vertex Colors,1)] _MMObjectHeightSource( "MM Object Height Source", Range( 0, 1 ) ) = 1
		_MMObjectHeight( "MM Object Height", Range( 0, 100 ) ) = 1
		[Toggle( _DETAILMOTION1_ON )] _DetailMotion1( "Detail Motion 1", Float ) = 1
		_DM1Amplitude( "DM1 Amplitude", Range( 0, 30 ) ) = 1
		_DM1Speed( "DM1 Speed", Range( 0, 5 ) ) = 1
		_DM1FoliageLength( "DM1 Foliage Length", Range( 0.001, 10 ) ) = 1
		[Toggle( _DETAILMOTION2_ON )] _DetailMotion2( "Detail Motion 2", Float ) = 1
		_DM2Amplitude( "DM2 Amplitude", Range( 0, 45 ) ) = 2
		_DM2Speed( "DM2 Speed", Range( 0, 5 ) ) = 1
		_DM2ObjectRadius( "DM2 Object Radius", Range( 0.001, 10 ) ) = 1
		[NoScaleOffset][SingleLineTexture] _MotionNoise( "Motion Noise", 2D ) = "white" {}
		_MotionNoiseTiling( "Motion Noise Tiling", Range( 0, 4 ) ) = 0.1
		[Space][Toggle( _SLOPECORRECTION_ON )] _SlopeCorrection( "Slope Correction", Float ) = 1
		_SlopeCorrectionMagnitude( "Slope Correction Magnitude", Range( 0, 1 ) ) = 1
		_SlopeCorrectionOffset( "Slope Correction Offset", Range( 0, 1 ) ) = 0
		_ScaleOffset( "Scale Offset", Range( -1, 5 ) ) = 0
		[Toggle( _SCALEVARIATION_ON )] _ScaleVariation( "Scale Variation", Float ) = 0
		_ScaleVarMin( "Scale Var Min", Range( -1, 2 ) ) = 0
		_ScaleVarMax( "Scale Var Max", Range( -1, 2 ) ) = 0.2
		[SingleLineTexture][Space] _ScaleVarNoise( "Scale Var Noise", 2D ) = "white" {}
		_ScaleVarNoiseTiling( "Scale Var Noise Tiling", Range( 0.0001, 5 ) ) = 1
		_ScaleVarNoiseSharpMin( "Scale Var Noise Sharp Min", Range( 0, 1 ) ) = 0
		_ScaleVarNoiseSharpMax( "Scale Var Noise Sharp Max", Range( 0, 1 ) ) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}

		//[HideInInspector][ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
	}

	SubShader
	{
		LOD 0

		

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull Off
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#pragma multi_compile_local _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_VERSION 19901
			#define ASE_SRP_VERSION 170003


			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
            #pragma multi_compile _ EVALUATE_SH_MIXED EVALUATE_SH_VERTEX
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _FORWARD_PLUS

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ USE_LEGACY_LIGHTMAPS

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_FORWARD

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ProbeVolumeVariants.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _FLOWERCOLORS_TWO _FLOWERCOLORS_FOUR
			#pragma shader_feature_local _BLENDWITHTERRAIN_ON
			#pragma shader_feature_local _DISTANCEFADE_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					float4 texcoord1 : TEXCOORD1;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					float4 texcoord2 : TEXCOORD2;
				#endif
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				half3 normalWS : TEXCOORD1;
				half4 tangentWS : TEXCOORD2;
				float4 lightmapUVOrVertexSH : TEXCOORD3;
				#if defined(ASE_FOG) || defined(_ADDITIONAL_LIGHTS_VERTEX)
					half4 fogFactorAndVertexLight : TEXCOORD4;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD5;
				#endif
				#if defined(USE_APV_PROBE_OCCLUSION)
					float4 probeOcclusion : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 Nicrom_TerrainColorMap_TexelSize;
			float4 _ColorMask1_ST;
			float3 _FlowerColor1B;
			float3 _StemColorTop;
			float3 _FlowerColor1A;
			float3 _StemColorBottom;
			float3 _FlowerColor2B;
			float3 _FlowerColor2A;
			half _GVBendingScale;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ScaleVarMax;
			float _ColorMask2Tiling;
			float _ColorMask2Opacity;
			float _BWTBottom;
			float _BWTTop;
			float _StemColorMaskStart;
			float _StemColorMaskEnd;
			float _STEM;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _ScaleVarMin;
			float _SlopeCorrectionOffset;
			float _DM1Amplitude;
			float _GVTime;
			float _DM1Speed;
			float _DM1FoliageLength;
			float _DM2Amplitude;
			float _DM2Speed;
			float _DM2ObjectRadius;
			half _MMDirectionAngle;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _MotionNoiseTiling;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVAmplitudeScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionMagnitude;
			float _AlphaCutoff;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float Nicrom_DM_AmpScale_Flower;
			float Nicrom_DM_Time_Flower;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Flower;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Flower;
			float Nicrom_MM_SpeedScale_Flower;
			float Nicrom_MM_BendScale_Flowers;
			float Nicrom_MM_AmpScale_Flower;
			sampler2D _ScaleVarNoise;
			sampler2D _ColorMask1;
			float Nicrom_Flower_CM2_SharpMin;
			float Nicrom_Flower_CM2_SharpMax;
			sampler2D _ColorMask2;
			float Nicrom_Flower_CM2_Tilling;
			sampler2D Nicrom_TerrainColorMap;
			float2 Nicrom_TerrainPosition;
			float Nicrom_TerrainSize;
			sampler2D _Albedo;
			float Nicrom_Flower_DF_Length;
			float Nicrom_Flower_DF_Start;


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float4 Debug203_g1474( float Debug_Target, float4 Albedo, float ColorMask1R, float ColorMask1G, float ColorMask2, float ScaleVarNoise )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1R;
				else if(Debug_Target ==2)
				    return ColorMask1G;
				else if(Debug_Target ==3)
				    return ColorMask2;
				else
				    return ScaleVarNoise;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g1447 = radians( ( 90.0 + ( input.texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g1447 = (float3(cos( temp_output_23_0_g1447 ) , 0.0 , sin( temp_output_23_0_g1447 )));
				float3 DB_RotationAxis87_g1445 = appendResult25_g1447;
				float GV_AmplitudeScale175_g1445 = _GVBendingScale;
				float lerpResult186_g1445 = lerp( 1.0 , Nicrom_DM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float DM_AmplitudeScale168_g1445 = lerpResult186_g1445;
				float DM1_Amplitude28_g1445 = _DM1Amplitude;
				float3 objToWorld80_g1455 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g1445 = _GVTime;
				float lerpResult187_g1445 = lerp( _TimeParameters.x , Nicrom_DM_Time_Flower , GV_Time174_g1445);
				float ApplicationIsPlaying241_g1445 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g1445 = lerp( _TimeParameters.x , lerpResult187_g1445 , ApplicationIsPlaying241_g1445);
				float DM_Time169_g1445 = lerpResult256_g1445;
				float Time90_g1455 = DM_Time169_g1445;
				float DM1_Speed29_g1445 = _DM1Speed;
				float Speed45_g1455 = DM1_Speed29_g1445;
				float temp_output_244_0_g1445 = Nicrom_DM_SpeedScale_Flower;
				float lerpResult261_g1445 = lerp( temp_output_244_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult262_g1445 = lerp( temp_output_244_0_g1445 , lerpResult261_g1445 , ApplicationIsPlaying241_g1445);
				float DM_SpeedScale265_g1445 = lerpResult262_g1445;
				float SpeedScale95_g1455 = DM_SpeedScale265_g1445;
				float DM_PhaseShift91_g1445 = input.ase_color.a;
				float PhaseShift48_g1455 = DM_PhaseShift91_g1445;
				float3 appendResult24_g1447 = (float3(0.0 , input.texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g1445 = appendResult24_g1447;
				float3 PivotPosOnYAxis56_g1455 = DM_PivotPosOnYAxis88_g1445;
				float DM1_FoliageLength32_g1445 = _DM1FoliageLength;
				float3 rotatedValue29_g1455 = RotateAroundAxis( PivotPosOnYAxis56_g1455, input.positionOS.xyz, DB_RotationAxis87_g1445, radians( ( ( ( DM_AmplitudeScale168_g1445 * DM1_Amplitude28_g1445 ) * sin( ( ( ( objToWorld80_g1455.x + objToWorld80_g1455.z ) + ( ( Time90_g1455 * ( Speed45_g1455 * SpeedScale95_g1455 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g1455 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g1455 ) / DM1_FoliageLength32_g1445 ) ) ) );
				float DM1_MotionMask89_g1445 = step( 1.5 , input.texcoord.y );
				float3 DM1_VertexOffset231_g1445 = ( ( rotatedValue29_g1455 - input.positionOS.xyz ) * DM1_MotionMask89_g1445 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g1445 = DM1_VertexOffset231_g1445;
				#else
				float3 staticSwitch104_g1445 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g1445 = _DM2Amplitude;
				float Amplitude58_g1456 = DM2_Amplitude30_g1445;
				float3 appendResult28_g1444 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 LocalPivot159_g1445 = -appendResult28_g1444;
				float3 PivotPoint49_g1456 = LocalPivot159_g1445;
				float3 objToWorld53_g1456 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g1456, 1 ) ).xyz;
				float Time87_g1456 = DM_Time169_g1445;
				float SpeedScale93_g1456 = DM_SpeedScale265_g1445;
				float DM2_Speed31_g1445 = _DM2Speed;
				float Speed41_g1456 = DM2_Speed31_g1445;
				float PhaseShift54_g1456 = DM_PhaseShift91_g1445;
				float3 break52_g1456 = PivotPoint49_g1456;
				float3 appendResult20_g1456 = (float3(break52_g1456.x , input.positionOS.xyz.y , break52_g1456.z));
				float DM2_ObjectRadius33_g1445 = _DM2ObjectRadius;
				float ObjectRadius60_g1456 = DM2_ObjectRadius33_g1445;
				float3 rotatedValue33_g1456 = RotateAroundAxis( PivotPoint49_g1456, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g1445 * Amplitude58_g1456 ) * sin( ( ( ( objToWorld53_g1456.x + objToWorld53_g1456.z ) + ( ( Time87_g1456 * ( SpeedScale93_g1456 * Speed41_g1456 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g1456 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g1456 ) / ObjectRadius60_g1456 ) ) ) );
				float DM2_MotionMask90_g1445 = step( 1.5 , input.texcoord.x );
				float BendingMask62_g1456 = DM2_MotionMask90_g1445;
				float3 DM2_VertexOffset232_g1445 = ( ( rotatedValue33_g1456 - input.positionOS.xyz ) * BendingMask62_g1456 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g1445 = DM2_VertexOffset232_g1445;
				#else
				float3 staticSwitch103_g1445 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g1445 = ( staticSwitch104_g1445 + staticSwitch103_g1445 );
				float lerpResult56_g1453 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g1445 = lerpResult56_g1453;
				float MM_DirShift59_g1445 = _MMDirectionShift;
				float MM_DirShiftOffset60_g1445 = _MMDirectionShiftOffset;
				float3 objToWorld11_g1450 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float2 appendResult10_g1450 = (float2(objToWorld11_g1450.x , objToWorld11_g1450.z));
				float MotionNoiseTiling20_g1445 = _MotionNoiseTiling;
				float4 temp_output_73_0_g1445 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g1450 * MotionNoiseTiling20_g1445 ), 0, 0.0) );
				float4 StaticWorldNoise78_g1445 = temp_output_73_0_g1445;
				float4 StaticWorldNoise55_g1449 = StaticWorldNoise78_g1445;
				float3 objToWorld50_g1449 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float lerpResult182_g1445 = lerp( _TimeParameters.x , Nicrom_MM_Time_Flower , GV_Time174_g1445);
				float lerpResult246_g1445 = lerp( _TimeParameters.x , lerpResult182_g1445 , ApplicationIsPlaying241_g1445);
				float MM_Time13_g1445 = lerpResult246_g1445;
				float Time76_g1449 = MM_Time13_g1445;
				float temp_output_243_0_g1445 = Nicrom_MM_SpeedScale_Flower;
				float lerpResult245_g1445 = lerp( temp_output_243_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult249_g1445 = lerp( temp_output_243_0_g1445 , lerpResult245_g1445 , ApplicationIsPlaying241_g1445);
				float MM_SpeedScale253_g1445 = lerpResult249_g1445;
				float SpeedScale_RA80_g1449 = MM_SpeedScale253_g1445;
				float MM_DirShiftSpeed56_g1445 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g1445 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1449 = radians( ( ( MM_DirAngle51_g1445 + ( ( MM_DirShift59_g1445 + ( MM_DirShiftOffset60_g1445 * (StaticWorldNoise55_g1449).x ) ) * sin( ( ( objToWorld50_g1449.x + objToWorld50_g1449.z ) + ( ( Time76_g1449 * ( SpeedScale_RA80_g1449 * MM_DirShiftSpeed56_g1445 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1449).z * MM_DirShiftNoiseScale57_g1445 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1449 = (float3(cos( temp_output_11_0_g1449 ) , 0.0 , sin( temp_output_11_0_g1449 )));
				float3 worldToObj35_g1449 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1449, 1 ) ).xyz;
				float3 worldToObj36_g1449 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1449 = normalize( (( worldToObj35_g1449 - worldToObj36_g1449 )).xyz );
				float3 MB_RotationAxis129_g1445 = normalizeResult34_g1449;
				float3 RotationAxis56_g1448 = MB_RotationAxis129_g1445;
				float4 StaticWorldNoise31_g1454 = StaticWorldNoise78_g1445;
				float MM_BendingOfset37_g1445 = _MMBendingOffset;
				float MM_Bending35_g1445 = _MMBending;
				float GV_BendingScale176_g1445 = _GVAmplitudeScale;
				float lerpResult188_g1445 = lerp( 1.0 , Nicrom_MM_BendScale_Flowers , GV_BendingScale176_g1445);
				float MM_BendingScale17_g1445 = lerpResult188_g1445;
				float MM_AmplitudeOffset52_g1445 = _MMAmplitudeOffset;
				float MM_Amplitude66_g1445 = _MMAmplitude;
				float lerpResult189_g1445 = lerp( 1.0 , Nicrom_MM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float MM_AmplitudeScale15_g1445 = lerpResult189_g1445;
				float3 objToWorld170_g1454 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1454 = MM_Time13_g1445;
				float MM_Speed53_g1445 = _MMSpeed;
				float Speed125_g1454 = MM_Speed53_g1445;
				float SpeedScale_RotAng201_g1454 = MM_SpeedScale253_g1445;
				float MM_SineWaveLength58_g1445 = _MMSineWaveLength;
				float WaveLength63_g1454 = MM_SineWaveLength58_g1445;
				float MM_PhaseShiftSource207_g1445 = _MMPhaseShiftSource;
				float lerpResult154_g1445 = lerp( input.ase_color.a , (StaticWorldNoise78_g1445).g , MM_PhaseShiftSource207_g1445);
				float MM_PhaseShiftScale39_g1445 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g1445 = ( lerpResult154_g1445 * MM_PhaseShiftScale39_g1445 );
				float PhaseShift127_g1454 = MB_PhaseShift79_g1445;
				float temp_output_20_0_g1454 = sin( ( ( ( objToWorld170_g1454.x + objToWorld170_g1454.z ) + ( ( Time167_g1454 * ( ( Speed125_g1454 * SpeedScale_RotAng201_g1454 ) * WaveLength63_g1454 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1454 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1454 ) ) );
				float MM_MaxHeight55_g1445 = _MMObjectHeight;
				float3 gammaToLinear56_g1454 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g1445 = _MMObjectHeightSource;
				float lerpResult57_g1454 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g1445 ) , (gammaToLinear56_g1454).x , MM_ObjectHeightSource54_g1445);
				float BendingMask189_g1454 = lerpResult57_g1454;
				float MB_RotationAngle130_g1445 = radians( ( ( ( ( ( (StaticWorldNoise31_g1454).y * MM_BendingOfset37_g1445 ) + MM_Bending35_g1445 ) * MM_BendingScale17_g1445 ) + ( ( ( ( (StaticWorldNoise31_g1454).x * MM_AmplitudeOffset52_g1445 ) + MM_Amplitude66_g1445 ) * MM_AmplitudeScale15_g1445 ) * temp_output_20_0_g1454 ) ) * BendingMask189_g1454 ) );
				float RotationAngle54_g1448 = MB_RotationAngle130_g1445;
				float3 LocalPivotPos60_g1448 = LocalPivot159_g1445;
				float3 break62_g1448 = LocalPivotPos60_g1448;
				float VertexPos_Y67_g1448 = input.positionOS.xyz.y;
				float3 appendResult45_g1448 = (float3(break62_g1448.x , VertexPos_Y67_g1448 , break62_g1448.z));
				float3 VertexPos66_g1448 = input.positionOS.xyz;
				float3 rotatedValue30_g1448 = RotateAroundAxis( appendResult45_g1448, VertexPos66_g1448, RotationAxis56_g1448, RotationAngle54_g1448 );
				float3 DetailMotionVO73_g1448 = DM_VertexOffset128_g1445;
				float3 rotatedValue34_g1448 = RotateAroundAxis( LocalPivotPos60_g1448, ( rotatedValue30_g1448 + DetailMotionVO73_g1448 ), RotationAxis56_g1448, RotationAngle54_g1448 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g1445 = ( ( rotatedValue34_g1448 - VertexPos66_g1448 ) * step( 0.01 , VertexPos_Y67_g1448 ) );
				#else
				float3 staticSwitch205_g1445 = DM_VertexOffset128_g1445;
				#endif
				float3 LocalVertexOffset89_g1457 = staticSwitch205_g1445;
				float3 appendResult15_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1457, 1 ) ).xyz;
				float3 objToWorld102_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1457 = ( objToWorld98_g1457 - objToWorld102_g1457 );
				float3 appendResult24_g1457 = (float3(-break20_g1457.z , 0.0 , break20_g1457.x));
				float3 appendResult3_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1457, 1 ) ).xyz;
				float3 objToWorld106_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1457 = ( objToWorld100_g1457 - objToWorld106_g1457 );
				float3 break108_g1457 = temp_output_107_0_g1457;
				float3 lerpResult84_g1457 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1457 , step( 0.001 , ( abs( break108_g1457.x ) + abs( break108_g1457.z ) ) ));
				float3 normalizeResult7_g1457 = ASESafeNormalize( lerpResult84_g1457 );
				float dotResult9_g1457 = dot( normalizeResult7_g1457 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1457 = acos( dotResult9_g1457 );
				float NaNPrevention21_g1457 = step( 0.01 , abs( ( temp_output_12_0_g1457 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1457 = lerp( float3( 1, 0, 0 ) , appendResult24_g1457 , NaNPrevention21_g1457);
				float3 worldToObj99_g1457 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1457, 1 ) ).xyz;
				float3 worldToObj105_g1457 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1457 = normalize( ( worldToObj99_g1457 - worldToObj105_g1457 ) );
				float3 RotationAxis30_g1457 = normalizeResult49_g1457;
				float4 WorldSpaceNoise126_g1457 = temp_output_73_0_g1445;
				float SlopeCorrectionOffset120_g1457 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1457 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1457 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1457).x - 0.0 ) * ( SlopeCorrectionOffset120_g1457 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1457 ) ) * temp_output_12_0_g1457 );
				float3 appendResult28_g1458 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 rotatedValue35_g1457 = RotateAroundAxis( -appendResult28_g1458, ( input.positionOS.xyz + LocalVertexOffset89_g1457 ), RotationAxis30_g1457, RotationAngle29_g1457 );
				float3 lerpResult52_g1457 = lerp( LocalVertexOffset89_g1457 , ( rotatedValue35_g1457 - input.positionOS.xyz ) , NaNPrevention21_g1457);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1457 = lerpResult52_g1457;
				#else
				float3 staticSwitch123_g1457 = LocalVertexOffset89_g1457;
				#endif
				float3 appendResult28_g1472 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 Scale_Pivot15_g1469 = -appendResult28_g1472;
				float3 temp_output_5_0_g1469 = ( ( staticSwitch123_g1457 + input.positionOS.xyz ) - Scale_Pivot15_g1469 );
				float ScaleVartMin40_g1469 = _ScaleVarMin;
				float ScaleVarMax41_g1469 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1469 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1469 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1471 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1469, 1 ) ).xyz;
				float2 appendResult10_g1471 = (float2(objToWorld11_g1471.x , objToWorld11_g1471.z));
				float2 Scale_WorldSpaceUVs30_g1469 = appendResult10_g1471;
				float Scale_VarNoiseTiling23_g1469 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1469 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1469 * Scale_VarNoiseTiling23_g1469 ), 0, 0.0) );
				float smoothstepResult56_g1469 = smoothstep( ScaleNoiseSharpnessMin59_g1469 , ScaleNoiseSharpnessMax60_g1469 , (Scale_WorldSpaceNoise32_g1469).r);
				float lerpResult44_g1469 = lerp( ScaleVartMin40_g1469 , ScaleVarMax41_g1469 , smoothstepResult56_g1469);
				float ScaleVar47_g1469 = lerpResult44_g1469;
				float clampResult63_g1469 = clamp( ( ScaleVar47_g1469 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1469 = ( temp_output_5_0_g1469 * clampResult63_g1469 );
				#else
				float3 staticSwitch72_g1469 = temp_output_5_0_g1469;
				#endif
				float ScaleOffset19_g1469 = _ScaleOffset;
				float clampResult64_g1469 = clamp( ( ScaleOffset19_g1469 + 1.0 ) , 0.0 , 7.0 );
				
				float2 TerrainPosition56_g1474 = ( Nicrom_TerrainPosition + float2( 1,1 ) );
				float2 TerrainPosition4_g1478 = TerrainPosition56_g1474;
				float TerrainSize55_g1474 = Nicrom_TerrainSize;
				float TerrainSize2_g1478 = TerrainSize55_g1474;
				float3 appendResult28_g1475 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 LocalPivot_Color15_g1474 = -appendResult28_g1475;
				float3 objToWorld11_g1477 = mul( GetObjectToWorldMatrix(), float4( LocalPivot_Color15_g1474, 1 ) ).xyz;
				float2 appendResult10_g1477 = (float2(objToWorld11_g1477.x , objToWorld11_g1477.z));
				float4 vertexToFrag19_g1478 = tex2Dlod( Nicrom_TerrainColorMap, float4( ( ( ( 1.0 - TerrainPosition4_g1478 ) / TerrainSize2_g1478 ) + ( ( TerrainSize2_g1478 / ( TerrainSize2_g1478 * TerrainSize2_g1478 ) ) * appendResult10_g1477 ) ), 0, 0.0) );
				output.ase_texcoord8 = vertexToFrag19_g1478;
				float vertexToFrag230_g1474 = input.positionOS.xyz.y;
				output.ase_texcoord9.x = vertexToFrag230_g1474;
				#ifdef _SCALEVARIATION_ON
				float staticSwitch73_g1469 = smoothstepResult56_g1469;
				#else
				float staticSwitch73_g1469 = 0.0;
				#endif
				float vertexToFrag71_g1469 = staticSwitch73_g1469;
				output.ase_texcoord9.y = vertexToFrag71_g1469;
				
				float3 customSurfaceDepth3_g1479 = input.positionOS.xyz;
				float customEye3_g1479 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1479)).z;
				output.ase_texcoord9.z = customEye3_g1479;
				
				output.ase_texcoord7.xy = input.texcoord.xy;
				output.ase_texcoord7.zw = input.texcoord1.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord9.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1469 * clampResult64_g1469 ) + Scale_Pivot15_g1469 ) - input.positionOS.xyz );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif
				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( input.normalOS, input.tangentOS );

				OUTPUT_LIGHTMAP_UV(input.texcoord1, unity_LightmapST, output.lightmapUVOrVertexSH.xy);
				#if defined(DYNAMICLIGHTMAP_ON)
					output.dynamicLightmapUV.xy = input.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif
				OUTPUT_SH4(vertexInput.positionWS, normalInput.normalWS.xyz, GetWorldSpaceNormalizeViewDir(vertexInput.positionWS), output.lightmapUVOrVertexSH.xyz, output.probeOcclusion);

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					output.lightmapUVOrVertexSH.zw = input.texcoord.xy;
					output.lightmapUVOrVertexSH.xy = input.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				#if defined(ASE_FOG) || defined(_ADDITIONAL_LIGHTS_VERTEX)
					output.fogFactorAndVertexLight = 0;
					#if defined(ASE_FOG) && !defined(_FOG_FRAGMENT)
						output.fogFactorAndVertexLight.x = ComputeFogFactor(vertexInput.positionCS.z);
					#endif
					#ifdef _ADDITIONAL_LIGHTS_VERTEX
						half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );
						output.fogFactorAndVertexLight.yzw = vertexLight;
					#endif
				#endif

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				output.normalWS = normalInput.normalWS;
				output.tangentWS = float4( normalInput.tangentWS, ( input.tangentOS.w > 0.0 ? 1.0 : -1.0 ) * GetOddNegativeScale() );
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					float4 texcoord1 : TEXCOORD1;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					float4 texcoord2 : TEXCOORD2;
				#endif
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.texcoord = input.texcoord;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					output.texcoord1 = input.texcoord1;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					output.texcoord2 = input.texcoord2;
				#endif
				output.ase_color = input.ase_color;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					output.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					output.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				#endif
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag ( PackedVaryings input
						#if defined( ASE_DEPTH_WRITE_ON )
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					float4 shadowCoord = TransformWorldToShadowCoord( input.positionWS );
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				// @diogo: mikktspace compliant
				float renormFactor = 1.0 / max( FLT_MIN, length( input.normalWS ) );

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( PositionWS );
				float3 ViewDirWS = GetWorldSpaceNormalizeViewDir( PositionWS );
				float4 ShadowCoord = shadowCoord;
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );
				float3 TangentWS = input.tangentWS.xyz * renormFactor;
				float3 BitangentWS = cross( input.normalWS, input.tangentWS.xyz ) * input.tangentWS.w * renormFactor;
				float3 NormalWS = input.normalWS * renormFactor;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (input.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					NormalWS = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					TangentWS = -cross(GetObjectToWorldMatrix()._13_23_33, NormalWS);
					BitangentWS = cross(NormalWS, -TangentWS);
				#endif

				float Debug_Target203_g1474 = _Debug;
				float3 FlowerColor1B66_g1474 = _FlowerColor1B;
				float3 FlowerColor1A65_g1474 = _FlowerColor1A;
				float2 uv_ColorMask1 = input.ase_texcoord7.xy * _ColorMask1_ST.xy + _ColorMask1_ST.zw;
				float4 tex2DNode31_g1474 = tex2D( _ColorMask1, uv_ColorMask1 );
				float ColorMask1_R37_g1474 = tex2DNode31_g1474.r;
				float3 lerpResult87_g1474 = lerp( FlowerColor1B66_g1474 , FlowerColor1A65_g1474 , ColorMask1_R37_g1474);
				float3 FlowerColor1_F197_g1474 = lerpResult87_g1474;
				float3 FlowerColor2B68_g1474 = _FlowerColor2B;
				float3 FlowerColor2A67_g1474 = _FlowerColor2A;
				float3 lerpResult88_g1474 = lerp( FlowerColor2B68_g1474 , FlowerColor2A67_g1474 , ColorMask1_R37_g1474);
				float3 FlowerColor2_F198_g1474 = lerpResult88_g1474;
				float CM2_GVToggle213_g1474 = _ColorMask2GV;
				float lerpResult219_g1474 = lerp( _ColorMask2SharpMin , Nicrom_Flower_CM2_SharpMin , CM2_GVToggle213_g1474);
				float ColorMask2SharpMin98_g1474 = lerpResult219_g1474;
				float lerpResult221_g1474 = lerp( _ColorMask2SharpMax , Nicrom_Flower_CM2_SharpMax , CM2_GVToggle213_g1474);
				float ColorMask2SharpMax92_g1474 = lerpResult221_g1474;
				float3 appendResult28_g1475 = (float3(input.ase_texcoord7.zw.x , 0.0 , input.ase_texcoord7.zw.y));
				float3 LocalPivot_Color15_g1474 = -appendResult28_g1475;
				float3 objToWorld11_g1476 = mul( GetObjectToWorldMatrix(), float4( LocalPivot_Color15_g1474, 1 ) ).xyz;
				float2 appendResult10_g1476 = (float2(objToWorld11_g1476.x , objToWorld11_g1476.z));
				float lerpResult215_g1474 = lerp( _ColorMask2Tiling , Nicrom_Flower_CM2_Tilling , CM2_GVToggle213_g1474);
				float ColorMask2Tiling21_g1474 = lerpResult215_g1474;
				float2 WorldSpaceUVs187_g1474 = ( appendResult10_g1476 * ColorMask2Tiling21_g1474 );
				float4 tex2DNode43_g1474 = tex2D( _ColorMask2, WorldSpaceUVs187_g1474 );
				float ColorMask2Noise78_g1474 = tex2DNode43_g1474.r;
				float smoothstepResult119_g1474 = smoothstep( ColorMask2SharpMin98_g1474 , ColorMask2SharpMax92_g1474 , ColorMask2Noise78_g1474);
				float ColorMask2Opacity122_g1474 = _ColorMask2Opacity;
				float lerpResult126_g1474 = lerp( 0.0 , smoothstepResult119_g1474 , ColorMask2Opacity122_g1474);
				float ColorMask2_F184_g1474 = lerpResult126_g1474;
				float3 lerpResult130_g1474 = lerp( FlowerColor1_F197_g1474 , FlowerColor2_F198_g1474 , ColorMask2_F184_g1474);
				#if defined( _FLOWERCOLORS_TWO )
				float3 staticSwitch196_g1474 = FlowerColor1_F197_g1474;
				#elif defined( _FLOWERCOLORS_FOUR )
				float3 staticSwitch196_g1474 = lerpResult130_g1474;
				#else
				float3 staticSwitch196_g1474 = FlowerColor1_F197_g1474;
				#endif
				float3 FlowerColor134_g1474 = staticSwitch196_g1474;
				float3 StemColorBottom93_g1474 = _StemColorBottom;
				float4 vertexToFrag19_g1478 = input.ase_texcoord8;
				float4 TerrainColor86_g1474 = vertexToFrag19_g1478;
				float TerrainBlendBottom97_g1474 = _BWTBottom;
				float IsTerrainAlbedoAssigned181_g1474 = step( 8.0 , Nicrom_TerrainColorMap_TexelSize.z );
				float lerpResult176_g1474 = lerp( 0.0 , TerrainBlendBottom97_g1474 , IsTerrainAlbedoAssigned181_g1474);
				float TerrainBlendBottom_F179_g1474 = lerpResult176_g1474;
				float4 lerpResult114_g1474 = lerp( float4( StemColorBottom93_g1474 , 0.0 ) , TerrainColor86_g1474 , TerrainBlendBottom_F179_g1474);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch124_g1474 = lerpResult114_g1474;
				#else
				float4 staticSwitch124_g1474 = float4( StemColorBottom93_g1474 , 0.0 );
				#endif
				float3 StemColorTop91_g1474 = _StemColorTop;
				float TerrainBlendTop96_g1474 = _BWTTop;
				float lerpResult177_g1474 = lerp( 0.0 , TerrainBlendTop96_g1474 , IsTerrainAlbedoAssigned181_g1474);
				float TerrainBlendTop_F178_g1474 = lerpResult177_g1474;
				float4 lerpResult115_g1474 = lerp( float4( StemColorTop91_g1474 , 0.0 ) , TerrainColor86_g1474 , TerrainBlendTop_F178_g1474);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch123_g1474 = lerpResult115_g1474;
				#else
				float4 staticSwitch123_g1474 = float4( StemColorTop91_g1474 , 0.0 );
				#endif
				float StemColorMaskStart112_g1474 = _StemColorMaskStart;
				float StemColorMaskEnd113_g1474 = _StemColorMaskEnd;
				float vertexToFrag230_g1474 = input.ase_texcoord9.x;
				float VertexPos_Y231_g1474 = vertexToFrag230_g1474;
				float smoothstepResult125_g1474 = smoothstep( StemColorMaskStart112_g1474 , StemColorMaskEnd113_g1474 , VertexPos_Y231_g1474);
				float4 lerpResult129_g1474 = lerp( staticSwitch124_g1474 , staticSwitch123_g1474 , smoothstepResult125_g1474);
				float4 StemColor133_g1474 = lerpResult129_g1474;
				float ColorMask1_G183_g1474 = tex2DNode31_g1474.g;
				float4 lerpResult149_g1474 = lerp( float4( FlowerColor134_g1474 , 0.0 ) , StemColor133_g1474 , ColorMask1_G183_g1474);
				float FlowerStemToggle145_g1474 = _STEM;
				float4 lerpResult158_g1474 = lerp( float4( FlowerColor134_g1474 , 0.0 ) , lerpResult149_g1474 , FlowerStemToggle145_g1474);
				float2 uv_Albedo137_g1474 = input.ase_texcoord7.xy;
				float4 tex2DNode137_g1474 = tex2D( _Albedo, uv_Albedo137_g1474 );
				float4 AlbedoTex144_g1474 = tex2DNode137_g1474;
				float4 Albedo203_g1474 = ( lerpResult158_g1474 * AlbedoTex144_g1474 );
				float ColorMask1R203_g1474 = ColorMask1_R37_g1474;
				float ColorMask1G203_g1474 = ColorMask1_G183_g1474;
				#if defined( _FLOWERCOLORS_TWO )
				float staticSwitch208_g1474 = 0.0;
				#elif defined( _FLOWERCOLORS_FOUR )
				float staticSwitch208_g1474 = ColorMask2_F184_g1474;
				#else
				float staticSwitch208_g1474 = 0.0;
				#endif
				float ColorMask2203_g1474 = staticSwitch208_g1474;
				float vertexToFrag71_g1469 = input.ase_texcoord9.y;
				float ScaleVarNoise2237 = vertexToFrag71_g1469;
				float ScaleVarNoise203_g1474 = ScaleVarNoise2237;
				float4 localDebug203_g1474 = Debug203_g1474( Debug_Target203_g1474 , Albedo203_g1474 , ColorMask1R203_g1474 , ColorMask1G203_g1474 , ColorMask2203_g1474 , ScaleVarNoise203_g1474 );
				
				float temp_output_31_0_g1479 = tex2DNode137_g1474.a;
				float DF_Length_Local38_g1479 = _DistanceFadeLength;
				float DF_Length_Global45_g1479 = Nicrom_Flower_DF_Length;
				float DF_Start_Global43_g1479 = Nicrom_Flower_DF_Start;
				float lerpResult49_g1479 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1479 ));
				float DF_UseGV28_g1479 = lerpResult49_g1479;
				float lerpResult26_g1479 = lerp( DF_Length_Local38_g1479 , DF_Length_Global45_g1479 , DF_UseGV28_g1479);
				float DistanceFadeLength23_g1479 = lerpResult26_g1479;
				float DF_Start_Local36_g1479 = _DistanceFadeStart;
				float lerpResult20_g1479 = lerp( DF_Start_Local36_g1479 , DF_Start_Global43_g1479 , DF_UseGV28_g1479);
				float DistanceFadeStart27_g1479 = lerpResult20_g1479;
				float customEye3_g1479 = input.ase_texcoord9.z;
				float cameraDepthFade3_g1479 = (( customEye3_g1479 -_ProjectionParams.y - DistanceFadeStart27_g1479 ) / DistanceFadeLength23_g1479);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1479 = ( temp_output_31_0_g1479 * saturate( ( 1.0 - cameraDepthFade3_g1479 ) ) );
				#else
				float staticSwitch33_g1479 = temp_output_31_0_g1479;
				#endif
				

				float3 BaseColor = localDebug203_g1474.xyz;
				float3 Normal = float3(0, 0, 1);
				float3 Specular = 0.5;
				float Metallic = 0.0;
				float Smoothness = 0.0;
				float Occlusion = 1;
				float3 Emission = 0;
				float Alpha = staticSwitch33_g1479;
				float AlphaClipThreshold = _AlphaCutoff;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = ClipPos.z;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_CHANGES_WORLD_POS)
					ShadowCoord = TransformWorldToShadowCoord( PositionWS );
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = PositionWS;
				inputData.positionCS = float4( input.positionCS.xy, ClipPos.zw / ClipPos.w );
				inputData.normalizedScreenSpaceUV = ScreenPosNorm.xy;
				inputData.viewDirectionWS = ViewDirWS;
				inputData.shadowCoord = ShadowCoord;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(TangentWS, BitangentWS, NormalWS));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = NormalWS;
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = InitializeInputDataFog(float4(inputData.positionWS, 1.0), input.fogFactorAndVertexLight.x);
				#endif
				#ifdef _ADDITIONAL_LIGHTS_VERTEX
					inputData.vertexLighting = input.fogFactorAndVertexLight.yzw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = input.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(input.lightmapUVOrVertexSH.xy, input.dynamicLightmapUV.xy, SH, inputData.normalWS);
					inputData.shadowMask = SAMPLE_SHADOWMASK(input.lightmapUVOrVertexSH.xy);
				#elif !defined(LIGHTMAP_ON) && (defined(PROBE_VOLUMES_L1) || defined(PROBE_VOLUMES_L2))
					inputData.bakedGI = SAMPLE_GI( SH, GetAbsolutePositionWS(inputData.positionWS),
						inputData.normalWS,
						inputData.viewDirectionWS,
						input.positionCS.xy,
						input.probeOcclusion,
						inputData.shadowMask );
				#else
					inputData.bakedGI = SAMPLE_GI(input.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
					inputData.shadowMask = SAMPLE_SHADOWMASK(input.lightmapUVOrVertexSH.xy);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = input.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = input.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
					#if defined(USE_APV_PROBE_OCCLUSION)
						inputData.probeOcclusion = input.probeOcclusion;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(input.positionCS, surfaceData, inputData);
				#endif

				#ifdef ASE_LIGHTING_SIMPLE
					half4 color = UniversalFragmentBlinnPhong( inputData, surfaceData);
				#else
					half4 color = UniversalFragmentPBR( inputData, surfaceData);
				#endif

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += BaseColor * transmission;

					SUM_LIGHT_TRANSMISSION( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							[loop] for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS, inputData.shadowMask);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSMISSION( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS, inputData.shadowMask);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += BaseColor * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							[loop] for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS, inputData.shadowMask);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS, inputData.shadowMask);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( NormalWS,0 ) ).xyz * ( 1.0 - dot( NormalWS, ViewDirWS ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3(0,0,0), inputData.fogCoord);
					#else
						color.rgb = MixFog(color.rgb, inputData.fogCoord);
					#endif
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#pragma multi_compile_local _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_VERSION 19901
			#define ASE_SRP_VERSION 170003


			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _DISTANCEFADE_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 Nicrom_TerrainColorMap_TexelSize;
			float4 _ColorMask1_ST;
			float3 _FlowerColor1B;
			float3 _StemColorTop;
			float3 _FlowerColor1A;
			float3 _StemColorBottom;
			float3 _FlowerColor2B;
			float3 _FlowerColor2A;
			half _GVBendingScale;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ScaleVarMax;
			float _ColorMask2Tiling;
			float _ColorMask2Opacity;
			float _BWTBottom;
			float _BWTTop;
			float _StemColorMaskStart;
			float _StemColorMaskEnd;
			float _STEM;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _ScaleVarMin;
			float _SlopeCorrectionOffset;
			float _DM1Amplitude;
			float _GVTime;
			float _DM1Speed;
			float _DM1FoliageLength;
			float _DM2Amplitude;
			float _DM2Speed;
			float _DM2ObjectRadius;
			half _MMDirectionAngle;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _MotionNoiseTiling;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVAmplitudeScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionMagnitude;
			float _AlphaCutoff;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float Nicrom_DM_AmpScale_Flower;
			float Nicrom_DM_Time_Flower;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Flower;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Flower;
			float Nicrom_MM_SpeedScale_Flower;
			float Nicrom_MM_BendScale_Flowers;
			float Nicrom_MM_AmpScale_Flower;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;
			float Nicrom_Flower_DF_Length;
			float Nicrom_Flower_DF_Start;


			float3 _LightDirection;
			float3 _LightPosition;

			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			

			PackedVaryings VertexFunction( Attributes input )
			{
				PackedVaryings output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float temp_output_23_0_g1447 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g1447 = (float3(cos( temp_output_23_0_g1447 ) , 0.0 , sin( temp_output_23_0_g1447 )));
				float3 DB_RotationAxis87_g1445 = appendResult25_g1447;
				float GV_AmplitudeScale175_g1445 = _GVBendingScale;
				float lerpResult186_g1445 = lerp( 1.0 , Nicrom_DM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float DM_AmplitudeScale168_g1445 = lerpResult186_g1445;
				float DM1_Amplitude28_g1445 = _DM1Amplitude;
				float3 objToWorld80_g1455 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g1445 = _GVTime;
				float lerpResult187_g1445 = lerp( _TimeParameters.x , Nicrom_DM_Time_Flower , GV_Time174_g1445);
				float ApplicationIsPlaying241_g1445 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g1445 = lerp( _TimeParameters.x , lerpResult187_g1445 , ApplicationIsPlaying241_g1445);
				float DM_Time169_g1445 = lerpResult256_g1445;
				float Time90_g1455 = DM_Time169_g1445;
				float DM1_Speed29_g1445 = _DM1Speed;
				float Speed45_g1455 = DM1_Speed29_g1445;
				float temp_output_244_0_g1445 = Nicrom_DM_SpeedScale_Flower;
				float lerpResult261_g1445 = lerp( temp_output_244_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult262_g1445 = lerp( temp_output_244_0_g1445 , lerpResult261_g1445 , ApplicationIsPlaying241_g1445);
				float DM_SpeedScale265_g1445 = lerpResult262_g1445;
				float SpeedScale95_g1455 = DM_SpeedScale265_g1445;
				float DM_PhaseShift91_g1445 = input.ase_color.a;
				float PhaseShift48_g1455 = DM_PhaseShift91_g1445;
				float3 appendResult24_g1447 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g1445 = appendResult24_g1447;
				float3 PivotPosOnYAxis56_g1455 = DM_PivotPosOnYAxis88_g1445;
				float DM1_FoliageLength32_g1445 = _DM1FoliageLength;
				float3 rotatedValue29_g1455 = RotateAroundAxis( PivotPosOnYAxis56_g1455, input.positionOS.xyz, DB_RotationAxis87_g1445, radians( ( ( ( DM_AmplitudeScale168_g1445 * DM1_Amplitude28_g1445 ) * sin( ( ( ( objToWorld80_g1455.x + objToWorld80_g1455.z ) + ( ( Time90_g1455 * ( Speed45_g1455 * SpeedScale95_g1455 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g1455 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g1455 ) / DM1_FoliageLength32_g1445 ) ) ) );
				float DM1_MotionMask89_g1445 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g1445 = ( ( rotatedValue29_g1455 - input.positionOS.xyz ) * DM1_MotionMask89_g1445 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g1445 = DM1_VertexOffset231_g1445;
				#else
				float3 staticSwitch104_g1445 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g1445 = _DM2Amplitude;
				float Amplitude58_g1456 = DM2_Amplitude30_g1445;
				float3 appendResult28_g1444 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot159_g1445 = -appendResult28_g1444;
				float3 PivotPoint49_g1456 = LocalPivot159_g1445;
				float3 objToWorld53_g1456 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g1456, 1 ) ).xyz;
				float Time87_g1456 = DM_Time169_g1445;
				float SpeedScale93_g1456 = DM_SpeedScale265_g1445;
				float DM2_Speed31_g1445 = _DM2Speed;
				float Speed41_g1456 = DM2_Speed31_g1445;
				float PhaseShift54_g1456 = DM_PhaseShift91_g1445;
				float3 break52_g1456 = PivotPoint49_g1456;
				float3 appendResult20_g1456 = (float3(break52_g1456.x , input.positionOS.xyz.y , break52_g1456.z));
				float DM2_ObjectRadius33_g1445 = _DM2ObjectRadius;
				float ObjectRadius60_g1456 = DM2_ObjectRadius33_g1445;
				float3 rotatedValue33_g1456 = RotateAroundAxis( PivotPoint49_g1456, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g1445 * Amplitude58_g1456 ) * sin( ( ( ( objToWorld53_g1456.x + objToWorld53_g1456.z ) + ( ( Time87_g1456 * ( SpeedScale93_g1456 * Speed41_g1456 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g1456 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g1456 ) / ObjectRadius60_g1456 ) ) ) );
				float DM2_MotionMask90_g1445 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g1456 = DM2_MotionMask90_g1445;
				float3 DM2_VertexOffset232_g1445 = ( ( rotatedValue33_g1456 - input.positionOS.xyz ) * BendingMask62_g1456 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g1445 = DM2_VertexOffset232_g1445;
				#else
				float3 staticSwitch103_g1445 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g1445 = ( staticSwitch104_g1445 + staticSwitch103_g1445 );
				float lerpResult56_g1453 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g1445 = lerpResult56_g1453;
				float MM_DirShift59_g1445 = _MMDirectionShift;
				float MM_DirShiftOffset60_g1445 = _MMDirectionShiftOffset;
				float3 objToWorld11_g1450 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float2 appendResult10_g1450 = (float2(objToWorld11_g1450.x , objToWorld11_g1450.z));
				float MotionNoiseTiling20_g1445 = _MotionNoiseTiling;
				float4 temp_output_73_0_g1445 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g1450 * MotionNoiseTiling20_g1445 ), 0, 0.0) );
				float4 StaticWorldNoise78_g1445 = temp_output_73_0_g1445;
				float4 StaticWorldNoise55_g1449 = StaticWorldNoise78_g1445;
				float3 objToWorld50_g1449 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float lerpResult182_g1445 = lerp( _TimeParameters.x , Nicrom_MM_Time_Flower , GV_Time174_g1445);
				float lerpResult246_g1445 = lerp( _TimeParameters.x , lerpResult182_g1445 , ApplicationIsPlaying241_g1445);
				float MM_Time13_g1445 = lerpResult246_g1445;
				float Time76_g1449 = MM_Time13_g1445;
				float temp_output_243_0_g1445 = Nicrom_MM_SpeedScale_Flower;
				float lerpResult245_g1445 = lerp( temp_output_243_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult249_g1445 = lerp( temp_output_243_0_g1445 , lerpResult245_g1445 , ApplicationIsPlaying241_g1445);
				float MM_SpeedScale253_g1445 = lerpResult249_g1445;
				float SpeedScale_RA80_g1449 = MM_SpeedScale253_g1445;
				float MM_DirShiftSpeed56_g1445 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g1445 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1449 = radians( ( ( MM_DirAngle51_g1445 + ( ( MM_DirShift59_g1445 + ( MM_DirShiftOffset60_g1445 * (StaticWorldNoise55_g1449).x ) ) * sin( ( ( objToWorld50_g1449.x + objToWorld50_g1449.z ) + ( ( Time76_g1449 * ( SpeedScale_RA80_g1449 * MM_DirShiftSpeed56_g1445 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1449).z * MM_DirShiftNoiseScale57_g1445 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1449 = (float3(cos( temp_output_11_0_g1449 ) , 0.0 , sin( temp_output_11_0_g1449 )));
				float3 worldToObj35_g1449 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1449, 1 ) ).xyz;
				float3 worldToObj36_g1449 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1449 = normalize( (( worldToObj35_g1449 - worldToObj36_g1449 )).xyz );
				float3 MB_RotationAxis129_g1445 = normalizeResult34_g1449;
				float3 RotationAxis56_g1448 = MB_RotationAxis129_g1445;
				float4 StaticWorldNoise31_g1454 = StaticWorldNoise78_g1445;
				float MM_BendingOfset37_g1445 = _MMBendingOffset;
				float MM_Bending35_g1445 = _MMBending;
				float GV_BendingScale176_g1445 = _GVAmplitudeScale;
				float lerpResult188_g1445 = lerp( 1.0 , Nicrom_MM_BendScale_Flowers , GV_BendingScale176_g1445);
				float MM_BendingScale17_g1445 = lerpResult188_g1445;
				float MM_AmplitudeOffset52_g1445 = _MMAmplitudeOffset;
				float MM_Amplitude66_g1445 = _MMAmplitude;
				float lerpResult189_g1445 = lerp( 1.0 , Nicrom_MM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float MM_AmplitudeScale15_g1445 = lerpResult189_g1445;
				float3 objToWorld170_g1454 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1454 = MM_Time13_g1445;
				float MM_Speed53_g1445 = _MMSpeed;
				float Speed125_g1454 = MM_Speed53_g1445;
				float SpeedScale_RotAng201_g1454 = MM_SpeedScale253_g1445;
				float MM_SineWaveLength58_g1445 = _MMSineWaveLength;
				float WaveLength63_g1454 = MM_SineWaveLength58_g1445;
				float MM_PhaseShiftSource207_g1445 = _MMPhaseShiftSource;
				float lerpResult154_g1445 = lerp( input.ase_color.a , (StaticWorldNoise78_g1445).g , MM_PhaseShiftSource207_g1445);
				float MM_PhaseShiftScale39_g1445 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g1445 = ( lerpResult154_g1445 * MM_PhaseShiftScale39_g1445 );
				float PhaseShift127_g1454 = MB_PhaseShift79_g1445;
				float temp_output_20_0_g1454 = sin( ( ( ( objToWorld170_g1454.x + objToWorld170_g1454.z ) + ( ( Time167_g1454 * ( ( Speed125_g1454 * SpeedScale_RotAng201_g1454 ) * WaveLength63_g1454 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1454 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1454 ) ) );
				float MM_MaxHeight55_g1445 = _MMObjectHeight;
				float3 gammaToLinear56_g1454 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g1445 = _MMObjectHeightSource;
				float lerpResult57_g1454 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g1445 ) , (gammaToLinear56_g1454).x , MM_ObjectHeightSource54_g1445);
				float BendingMask189_g1454 = lerpResult57_g1454;
				float MB_RotationAngle130_g1445 = radians( ( ( ( ( ( (StaticWorldNoise31_g1454).y * MM_BendingOfset37_g1445 ) + MM_Bending35_g1445 ) * MM_BendingScale17_g1445 ) + ( ( ( ( (StaticWorldNoise31_g1454).x * MM_AmplitudeOffset52_g1445 ) + MM_Amplitude66_g1445 ) * MM_AmplitudeScale15_g1445 ) * temp_output_20_0_g1454 ) ) * BendingMask189_g1454 ) );
				float RotationAngle54_g1448 = MB_RotationAngle130_g1445;
				float3 LocalPivotPos60_g1448 = LocalPivot159_g1445;
				float3 break62_g1448 = LocalPivotPos60_g1448;
				float VertexPos_Y67_g1448 = input.positionOS.xyz.y;
				float3 appendResult45_g1448 = (float3(break62_g1448.x , VertexPos_Y67_g1448 , break62_g1448.z));
				float3 VertexPos66_g1448 = input.positionOS.xyz;
				float3 rotatedValue30_g1448 = RotateAroundAxis( appendResult45_g1448, VertexPos66_g1448, RotationAxis56_g1448, RotationAngle54_g1448 );
				float3 DetailMotionVO73_g1448 = DM_VertexOffset128_g1445;
				float3 rotatedValue34_g1448 = RotateAroundAxis( LocalPivotPos60_g1448, ( rotatedValue30_g1448 + DetailMotionVO73_g1448 ), RotationAxis56_g1448, RotationAngle54_g1448 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g1445 = ( ( rotatedValue34_g1448 - VertexPos66_g1448 ) * step( 0.01 , VertexPos_Y67_g1448 ) );
				#else
				float3 staticSwitch205_g1445 = DM_VertexOffset128_g1445;
				#endif
				float3 LocalVertexOffset89_g1457 = staticSwitch205_g1445;
				float3 appendResult15_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1457, 1 ) ).xyz;
				float3 objToWorld102_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1457 = ( objToWorld98_g1457 - objToWorld102_g1457 );
				float3 appendResult24_g1457 = (float3(-break20_g1457.z , 0.0 , break20_g1457.x));
				float3 appendResult3_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1457, 1 ) ).xyz;
				float3 objToWorld106_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1457 = ( objToWorld100_g1457 - objToWorld106_g1457 );
				float3 break108_g1457 = temp_output_107_0_g1457;
				float3 lerpResult84_g1457 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1457 , step( 0.001 , ( abs( break108_g1457.x ) + abs( break108_g1457.z ) ) ));
				float3 normalizeResult7_g1457 = ASESafeNormalize( lerpResult84_g1457 );
				float dotResult9_g1457 = dot( normalizeResult7_g1457 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1457 = acos( dotResult9_g1457 );
				float NaNPrevention21_g1457 = step( 0.01 , abs( ( temp_output_12_0_g1457 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1457 = lerp( float3( 1, 0, 0 ) , appendResult24_g1457 , NaNPrevention21_g1457);
				float3 worldToObj99_g1457 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1457, 1 ) ).xyz;
				float3 worldToObj105_g1457 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1457 = normalize( ( worldToObj99_g1457 - worldToObj105_g1457 ) );
				float3 RotationAxis30_g1457 = normalizeResult49_g1457;
				float4 WorldSpaceNoise126_g1457 = temp_output_73_0_g1445;
				float SlopeCorrectionOffset120_g1457 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1457 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1457 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1457).x - 0.0 ) * ( SlopeCorrectionOffset120_g1457 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1457 ) ) * temp_output_12_0_g1457 );
				float3 appendResult28_g1458 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 rotatedValue35_g1457 = RotateAroundAxis( -appendResult28_g1458, ( input.positionOS.xyz + LocalVertexOffset89_g1457 ), RotationAxis30_g1457, RotationAngle29_g1457 );
				float3 lerpResult52_g1457 = lerp( LocalVertexOffset89_g1457 , ( rotatedValue35_g1457 - input.positionOS.xyz ) , NaNPrevention21_g1457);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1457 = lerpResult52_g1457;
				#else
				float3 staticSwitch123_g1457 = LocalVertexOffset89_g1457;
				#endif
				float3 appendResult28_g1472 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g1469 = -appendResult28_g1472;
				float3 temp_output_5_0_g1469 = ( ( staticSwitch123_g1457 + input.positionOS.xyz ) - Scale_Pivot15_g1469 );
				float ScaleVartMin40_g1469 = _ScaleVarMin;
				float ScaleVarMax41_g1469 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1469 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1469 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1471 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1469, 1 ) ).xyz;
				float2 appendResult10_g1471 = (float2(objToWorld11_g1471.x , objToWorld11_g1471.z));
				float2 Scale_WorldSpaceUVs30_g1469 = appendResult10_g1471;
				float Scale_VarNoiseTiling23_g1469 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1469 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1469 * Scale_VarNoiseTiling23_g1469 ), 0, 0.0) );
				float smoothstepResult56_g1469 = smoothstep( ScaleNoiseSharpnessMin59_g1469 , ScaleNoiseSharpnessMax60_g1469 , (Scale_WorldSpaceNoise32_g1469).r);
				float lerpResult44_g1469 = lerp( ScaleVartMin40_g1469 , ScaleVarMax41_g1469 , smoothstepResult56_g1469);
				float ScaleVar47_g1469 = lerpResult44_g1469;
				float clampResult63_g1469 = clamp( ( ScaleVar47_g1469 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1469 = ( temp_output_5_0_g1469 * clampResult63_g1469 );
				#else
				float3 staticSwitch72_g1469 = temp_output_5_0_g1469;
				#endif
				float ScaleOffset19_g1469 = _ScaleOffset;
				float clampResult64_g1469 = clamp( ( ScaleOffset19_g1469 + 1.0 ) , 0.0 , 7.0 );
				
				float3 customSurfaceDepth3_g1479 = input.positionOS.xyz;
				float customEye3_g1479 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1479)).z;
				output.ase_texcoord1.z = customEye3_g1479;
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1469 * clampResult64_g1469 ) + Scale_Pivot15_g1469 ) - input.positionOS.xyz );
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				float3 positionWS = TransformObjectToWorld( input.positionOS.xyz );
				float3 normalWS = TransformObjectToWorldDir(input.normalOS);

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				//code for UNITY_REVERSED_Z is moved into Shadows.hlsl from 6000.0.22 and or higher
				positionCS = ApplyShadowClamping(positionCS);

				output.positionCS = positionCS;
				output.positionWS = positionWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.ase_texcoord2 = input.ase_texcoord2;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(	PackedVaryings input
						#if defined( ASE_DEPTH_WRITE_ON )
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord = TransformWorldToShadowCoord(input.positionWS);
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( input.positionWS );
				float4 ShadowCoord = shadowCoord;
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );

				float2 uv_Albedo137_g1474 = input.ase_texcoord1.xy;
				float4 tex2DNode137_g1474 = tex2D( _Albedo, uv_Albedo137_g1474 );
				float temp_output_31_0_g1479 = tex2DNode137_g1474.a;
				float DF_Length_Local38_g1479 = _DistanceFadeLength;
				float DF_Length_Global45_g1479 = Nicrom_Flower_DF_Length;
				float DF_Start_Global43_g1479 = Nicrom_Flower_DF_Start;
				float lerpResult49_g1479 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1479 ));
				float DF_UseGV28_g1479 = lerpResult49_g1479;
				float lerpResult26_g1479 = lerp( DF_Length_Local38_g1479 , DF_Length_Global45_g1479 , DF_UseGV28_g1479);
				float DistanceFadeLength23_g1479 = lerpResult26_g1479;
				float DF_Start_Local36_g1479 = _DistanceFadeStart;
				float lerpResult20_g1479 = lerp( DF_Start_Local36_g1479 , DF_Start_Global43_g1479 , DF_UseGV28_g1479);
				float DistanceFadeStart27_g1479 = lerpResult20_g1479;
				float customEye3_g1479 = input.ase_texcoord1.z;
				float cameraDepthFade3_g1479 = (( customEye3_g1479 -_ProjectionParams.y - DistanceFadeStart27_g1479 ) / DistanceFadeLength23_g1479);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1479 = ( temp_output_31_0_g1479 * saturate( ( 1.0 - cameraDepthFade3_g1479 ) ) );
				#else
				float staticSwitch33_g1479 = temp_output_31_0_g1479;
				#endif
				

				float Alpha = staticSwitch33_g1479;
				float AlphaClipThreshold = _AlphaCutoff;
				float AlphaClipThresholdShadow = 0.5;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask R
			AlphaToMask Off

			HLSLPROGRAM

			#pragma multi_compile_local _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_VERSION 19901
			#define ASE_SRP_VERSION 170003


			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _DISTANCEFADE_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 Nicrom_TerrainColorMap_TexelSize;
			float4 _ColorMask1_ST;
			float3 _FlowerColor1B;
			float3 _StemColorTop;
			float3 _FlowerColor1A;
			float3 _StemColorBottom;
			float3 _FlowerColor2B;
			float3 _FlowerColor2A;
			half _GVBendingScale;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ScaleVarMax;
			float _ColorMask2Tiling;
			float _ColorMask2Opacity;
			float _BWTBottom;
			float _BWTTop;
			float _StemColorMaskStart;
			float _StemColorMaskEnd;
			float _STEM;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _ScaleVarMin;
			float _SlopeCorrectionOffset;
			float _DM1Amplitude;
			float _GVTime;
			float _DM1Speed;
			float _DM1FoliageLength;
			float _DM2Amplitude;
			float _DM2Speed;
			float _DM2ObjectRadius;
			half _MMDirectionAngle;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _MotionNoiseTiling;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVAmplitudeScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionMagnitude;
			float _AlphaCutoff;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float Nicrom_DM_AmpScale_Flower;
			float Nicrom_DM_Time_Flower;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Flower;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Flower;
			float Nicrom_MM_SpeedScale_Flower;
			float Nicrom_MM_BendScale_Flowers;
			float Nicrom_MM_AmpScale_Flower;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;
			float Nicrom_Flower_DF_Length;
			float Nicrom_Flower_DF_Start;


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g1447 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g1447 = (float3(cos( temp_output_23_0_g1447 ) , 0.0 , sin( temp_output_23_0_g1447 )));
				float3 DB_RotationAxis87_g1445 = appendResult25_g1447;
				float GV_AmplitudeScale175_g1445 = _GVBendingScale;
				float lerpResult186_g1445 = lerp( 1.0 , Nicrom_DM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float DM_AmplitudeScale168_g1445 = lerpResult186_g1445;
				float DM1_Amplitude28_g1445 = _DM1Amplitude;
				float3 objToWorld80_g1455 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g1445 = _GVTime;
				float lerpResult187_g1445 = lerp( _TimeParameters.x , Nicrom_DM_Time_Flower , GV_Time174_g1445);
				float ApplicationIsPlaying241_g1445 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g1445 = lerp( _TimeParameters.x , lerpResult187_g1445 , ApplicationIsPlaying241_g1445);
				float DM_Time169_g1445 = lerpResult256_g1445;
				float Time90_g1455 = DM_Time169_g1445;
				float DM1_Speed29_g1445 = _DM1Speed;
				float Speed45_g1455 = DM1_Speed29_g1445;
				float temp_output_244_0_g1445 = Nicrom_DM_SpeedScale_Flower;
				float lerpResult261_g1445 = lerp( temp_output_244_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult262_g1445 = lerp( temp_output_244_0_g1445 , lerpResult261_g1445 , ApplicationIsPlaying241_g1445);
				float DM_SpeedScale265_g1445 = lerpResult262_g1445;
				float SpeedScale95_g1455 = DM_SpeedScale265_g1445;
				float DM_PhaseShift91_g1445 = input.ase_color.a;
				float PhaseShift48_g1455 = DM_PhaseShift91_g1445;
				float3 appendResult24_g1447 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g1445 = appendResult24_g1447;
				float3 PivotPosOnYAxis56_g1455 = DM_PivotPosOnYAxis88_g1445;
				float DM1_FoliageLength32_g1445 = _DM1FoliageLength;
				float3 rotatedValue29_g1455 = RotateAroundAxis( PivotPosOnYAxis56_g1455, input.positionOS.xyz, DB_RotationAxis87_g1445, radians( ( ( ( DM_AmplitudeScale168_g1445 * DM1_Amplitude28_g1445 ) * sin( ( ( ( objToWorld80_g1455.x + objToWorld80_g1455.z ) + ( ( Time90_g1455 * ( Speed45_g1455 * SpeedScale95_g1455 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g1455 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g1455 ) / DM1_FoliageLength32_g1445 ) ) ) );
				float DM1_MotionMask89_g1445 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g1445 = ( ( rotatedValue29_g1455 - input.positionOS.xyz ) * DM1_MotionMask89_g1445 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g1445 = DM1_VertexOffset231_g1445;
				#else
				float3 staticSwitch104_g1445 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g1445 = _DM2Amplitude;
				float Amplitude58_g1456 = DM2_Amplitude30_g1445;
				float3 appendResult28_g1444 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot159_g1445 = -appendResult28_g1444;
				float3 PivotPoint49_g1456 = LocalPivot159_g1445;
				float3 objToWorld53_g1456 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g1456, 1 ) ).xyz;
				float Time87_g1456 = DM_Time169_g1445;
				float SpeedScale93_g1456 = DM_SpeedScale265_g1445;
				float DM2_Speed31_g1445 = _DM2Speed;
				float Speed41_g1456 = DM2_Speed31_g1445;
				float PhaseShift54_g1456 = DM_PhaseShift91_g1445;
				float3 break52_g1456 = PivotPoint49_g1456;
				float3 appendResult20_g1456 = (float3(break52_g1456.x , input.positionOS.xyz.y , break52_g1456.z));
				float DM2_ObjectRadius33_g1445 = _DM2ObjectRadius;
				float ObjectRadius60_g1456 = DM2_ObjectRadius33_g1445;
				float3 rotatedValue33_g1456 = RotateAroundAxis( PivotPoint49_g1456, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g1445 * Amplitude58_g1456 ) * sin( ( ( ( objToWorld53_g1456.x + objToWorld53_g1456.z ) + ( ( Time87_g1456 * ( SpeedScale93_g1456 * Speed41_g1456 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g1456 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g1456 ) / ObjectRadius60_g1456 ) ) ) );
				float DM2_MotionMask90_g1445 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g1456 = DM2_MotionMask90_g1445;
				float3 DM2_VertexOffset232_g1445 = ( ( rotatedValue33_g1456 - input.positionOS.xyz ) * BendingMask62_g1456 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g1445 = DM2_VertexOffset232_g1445;
				#else
				float3 staticSwitch103_g1445 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g1445 = ( staticSwitch104_g1445 + staticSwitch103_g1445 );
				float lerpResult56_g1453 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g1445 = lerpResult56_g1453;
				float MM_DirShift59_g1445 = _MMDirectionShift;
				float MM_DirShiftOffset60_g1445 = _MMDirectionShiftOffset;
				float3 objToWorld11_g1450 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float2 appendResult10_g1450 = (float2(objToWorld11_g1450.x , objToWorld11_g1450.z));
				float MotionNoiseTiling20_g1445 = _MotionNoiseTiling;
				float4 temp_output_73_0_g1445 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g1450 * MotionNoiseTiling20_g1445 ), 0, 0.0) );
				float4 StaticWorldNoise78_g1445 = temp_output_73_0_g1445;
				float4 StaticWorldNoise55_g1449 = StaticWorldNoise78_g1445;
				float3 objToWorld50_g1449 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float lerpResult182_g1445 = lerp( _TimeParameters.x , Nicrom_MM_Time_Flower , GV_Time174_g1445);
				float lerpResult246_g1445 = lerp( _TimeParameters.x , lerpResult182_g1445 , ApplicationIsPlaying241_g1445);
				float MM_Time13_g1445 = lerpResult246_g1445;
				float Time76_g1449 = MM_Time13_g1445;
				float temp_output_243_0_g1445 = Nicrom_MM_SpeedScale_Flower;
				float lerpResult245_g1445 = lerp( temp_output_243_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult249_g1445 = lerp( temp_output_243_0_g1445 , lerpResult245_g1445 , ApplicationIsPlaying241_g1445);
				float MM_SpeedScale253_g1445 = lerpResult249_g1445;
				float SpeedScale_RA80_g1449 = MM_SpeedScale253_g1445;
				float MM_DirShiftSpeed56_g1445 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g1445 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1449 = radians( ( ( MM_DirAngle51_g1445 + ( ( MM_DirShift59_g1445 + ( MM_DirShiftOffset60_g1445 * (StaticWorldNoise55_g1449).x ) ) * sin( ( ( objToWorld50_g1449.x + objToWorld50_g1449.z ) + ( ( Time76_g1449 * ( SpeedScale_RA80_g1449 * MM_DirShiftSpeed56_g1445 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1449).z * MM_DirShiftNoiseScale57_g1445 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1449 = (float3(cos( temp_output_11_0_g1449 ) , 0.0 , sin( temp_output_11_0_g1449 )));
				float3 worldToObj35_g1449 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1449, 1 ) ).xyz;
				float3 worldToObj36_g1449 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1449 = normalize( (( worldToObj35_g1449 - worldToObj36_g1449 )).xyz );
				float3 MB_RotationAxis129_g1445 = normalizeResult34_g1449;
				float3 RotationAxis56_g1448 = MB_RotationAxis129_g1445;
				float4 StaticWorldNoise31_g1454 = StaticWorldNoise78_g1445;
				float MM_BendingOfset37_g1445 = _MMBendingOffset;
				float MM_Bending35_g1445 = _MMBending;
				float GV_BendingScale176_g1445 = _GVAmplitudeScale;
				float lerpResult188_g1445 = lerp( 1.0 , Nicrom_MM_BendScale_Flowers , GV_BendingScale176_g1445);
				float MM_BendingScale17_g1445 = lerpResult188_g1445;
				float MM_AmplitudeOffset52_g1445 = _MMAmplitudeOffset;
				float MM_Amplitude66_g1445 = _MMAmplitude;
				float lerpResult189_g1445 = lerp( 1.0 , Nicrom_MM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float MM_AmplitudeScale15_g1445 = lerpResult189_g1445;
				float3 objToWorld170_g1454 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1454 = MM_Time13_g1445;
				float MM_Speed53_g1445 = _MMSpeed;
				float Speed125_g1454 = MM_Speed53_g1445;
				float SpeedScale_RotAng201_g1454 = MM_SpeedScale253_g1445;
				float MM_SineWaveLength58_g1445 = _MMSineWaveLength;
				float WaveLength63_g1454 = MM_SineWaveLength58_g1445;
				float MM_PhaseShiftSource207_g1445 = _MMPhaseShiftSource;
				float lerpResult154_g1445 = lerp( input.ase_color.a , (StaticWorldNoise78_g1445).g , MM_PhaseShiftSource207_g1445);
				float MM_PhaseShiftScale39_g1445 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g1445 = ( lerpResult154_g1445 * MM_PhaseShiftScale39_g1445 );
				float PhaseShift127_g1454 = MB_PhaseShift79_g1445;
				float temp_output_20_0_g1454 = sin( ( ( ( objToWorld170_g1454.x + objToWorld170_g1454.z ) + ( ( Time167_g1454 * ( ( Speed125_g1454 * SpeedScale_RotAng201_g1454 ) * WaveLength63_g1454 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1454 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1454 ) ) );
				float MM_MaxHeight55_g1445 = _MMObjectHeight;
				float3 gammaToLinear56_g1454 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g1445 = _MMObjectHeightSource;
				float lerpResult57_g1454 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g1445 ) , (gammaToLinear56_g1454).x , MM_ObjectHeightSource54_g1445);
				float BendingMask189_g1454 = lerpResult57_g1454;
				float MB_RotationAngle130_g1445 = radians( ( ( ( ( ( (StaticWorldNoise31_g1454).y * MM_BendingOfset37_g1445 ) + MM_Bending35_g1445 ) * MM_BendingScale17_g1445 ) + ( ( ( ( (StaticWorldNoise31_g1454).x * MM_AmplitudeOffset52_g1445 ) + MM_Amplitude66_g1445 ) * MM_AmplitudeScale15_g1445 ) * temp_output_20_0_g1454 ) ) * BendingMask189_g1454 ) );
				float RotationAngle54_g1448 = MB_RotationAngle130_g1445;
				float3 LocalPivotPos60_g1448 = LocalPivot159_g1445;
				float3 break62_g1448 = LocalPivotPos60_g1448;
				float VertexPos_Y67_g1448 = input.positionOS.xyz.y;
				float3 appendResult45_g1448 = (float3(break62_g1448.x , VertexPos_Y67_g1448 , break62_g1448.z));
				float3 VertexPos66_g1448 = input.positionOS.xyz;
				float3 rotatedValue30_g1448 = RotateAroundAxis( appendResult45_g1448, VertexPos66_g1448, RotationAxis56_g1448, RotationAngle54_g1448 );
				float3 DetailMotionVO73_g1448 = DM_VertexOffset128_g1445;
				float3 rotatedValue34_g1448 = RotateAroundAxis( LocalPivotPos60_g1448, ( rotatedValue30_g1448 + DetailMotionVO73_g1448 ), RotationAxis56_g1448, RotationAngle54_g1448 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g1445 = ( ( rotatedValue34_g1448 - VertexPos66_g1448 ) * step( 0.01 , VertexPos_Y67_g1448 ) );
				#else
				float3 staticSwitch205_g1445 = DM_VertexOffset128_g1445;
				#endif
				float3 LocalVertexOffset89_g1457 = staticSwitch205_g1445;
				float3 appendResult15_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1457, 1 ) ).xyz;
				float3 objToWorld102_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1457 = ( objToWorld98_g1457 - objToWorld102_g1457 );
				float3 appendResult24_g1457 = (float3(-break20_g1457.z , 0.0 , break20_g1457.x));
				float3 appendResult3_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1457, 1 ) ).xyz;
				float3 objToWorld106_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1457 = ( objToWorld100_g1457 - objToWorld106_g1457 );
				float3 break108_g1457 = temp_output_107_0_g1457;
				float3 lerpResult84_g1457 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1457 , step( 0.001 , ( abs( break108_g1457.x ) + abs( break108_g1457.z ) ) ));
				float3 normalizeResult7_g1457 = ASESafeNormalize( lerpResult84_g1457 );
				float dotResult9_g1457 = dot( normalizeResult7_g1457 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1457 = acos( dotResult9_g1457 );
				float NaNPrevention21_g1457 = step( 0.01 , abs( ( temp_output_12_0_g1457 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1457 = lerp( float3( 1, 0, 0 ) , appendResult24_g1457 , NaNPrevention21_g1457);
				float3 worldToObj99_g1457 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1457, 1 ) ).xyz;
				float3 worldToObj105_g1457 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1457 = normalize( ( worldToObj99_g1457 - worldToObj105_g1457 ) );
				float3 RotationAxis30_g1457 = normalizeResult49_g1457;
				float4 WorldSpaceNoise126_g1457 = temp_output_73_0_g1445;
				float SlopeCorrectionOffset120_g1457 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1457 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1457 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1457).x - 0.0 ) * ( SlopeCorrectionOffset120_g1457 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1457 ) ) * temp_output_12_0_g1457 );
				float3 appendResult28_g1458 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 rotatedValue35_g1457 = RotateAroundAxis( -appendResult28_g1458, ( input.positionOS.xyz + LocalVertexOffset89_g1457 ), RotationAxis30_g1457, RotationAngle29_g1457 );
				float3 lerpResult52_g1457 = lerp( LocalVertexOffset89_g1457 , ( rotatedValue35_g1457 - input.positionOS.xyz ) , NaNPrevention21_g1457);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1457 = lerpResult52_g1457;
				#else
				float3 staticSwitch123_g1457 = LocalVertexOffset89_g1457;
				#endif
				float3 appendResult28_g1472 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g1469 = -appendResult28_g1472;
				float3 temp_output_5_0_g1469 = ( ( staticSwitch123_g1457 + input.positionOS.xyz ) - Scale_Pivot15_g1469 );
				float ScaleVartMin40_g1469 = _ScaleVarMin;
				float ScaleVarMax41_g1469 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1469 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1469 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1471 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1469, 1 ) ).xyz;
				float2 appendResult10_g1471 = (float2(objToWorld11_g1471.x , objToWorld11_g1471.z));
				float2 Scale_WorldSpaceUVs30_g1469 = appendResult10_g1471;
				float Scale_VarNoiseTiling23_g1469 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1469 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1469 * Scale_VarNoiseTiling23_g1469 ), 0, 0.0) );
				float smoothstepResult56_g1469 = smoothstep( ScaleNoiseSharpnessMin59_g1469 , ScaleNoiseSharpnessMax60_g1469 , (Scale_WorldSpaceNoise32_g1469).r);
				float lerpResult44_g1469 = lerp( ScaleVartMin40_g1469 , ScaleVarMax41_g1469 , smoothstepResult56_g1469);
				float ScaleVar47_g1469 = lerpResult44_g1469;
				float clampResult63_g1469 = clamp( ( ScaleVar47_g1469 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1469 = ( temp_output_5_0_g1469 * clampResult63_g1469 );
				#else
				float3 staticSwitch72_g1469 = temp_output_5_0_g1469;
				#endif
				float ScaleOffset19_g1469 = _ScaleOffset;
				float clampResult64_g1469 = clamp( ( ScaleOffset19_g1469 + 1.0 ) , 0.0 , 7.0 );
				
				float3 customSurfaceDepth3_g1479 = input.positionOS.xyz;
				float customEye3_g1479 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1479)).z;
				output.ase_texcoord1.z = customEye3_g1479;
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1469 * clampResult64_g1469 ) + Scale_Pivot15_g1469 ) - input.positionOS.xyz );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.ase_texcoord2 = input.ase_texcoord2;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(	PackedVaryings input
						#if defined( ASE_DEPTH_WRITE_ON )
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord = TransformWorldToShadowCoord(input.positionWS);
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( input.positionWS );
				float4 ShadowCoord = shadowCoord;
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );

				float2 uv_Albedo137_g1474 = input.ase_texcoord1.xy;
				float4 tex2DNode137_g1474 = tex2D( _Albedo, uv_Albedo137_g1474 );
				float temp_output_31_0_g1479 = tex2DNode137_g1474.a;
				float DF_Length_Local38_g1479 = _DistanceFadeLength;
				float DF_Length_Global45_g1479 = Nicrom_Flower_DF_Length;
				float DF_Start_Global43_g1479 = Nicrom_Flower_DF_Start;
				float lerpResult49_g1479 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1479 ));
				float DF_UseGV28_g1479 = lerpResult49_g1479;
				float lerpResult26_g1479 = lerp( DF_Length_Local38_g1479 , DF_Length_Global45_g1479 , DF_UseGV28_g1479);
				float DistanceFadeLength23_g1479 = lerpResult26_g1479;
				float DF_Start_Local36_g1479 = _DistanceFadeStart;
				float lerpResult20_g1479 = lerp( DF_Start_Local36_g1479 , DF_Start_Global43_g1479 , DF_UseGV28_g1479);
				float DistanceFadeStart27_g1479 = lerpResult20_g1479;
				float customEye3_g1479 = input.ase_texcoord1.z;
				float cameraDepthFade3_g1479 = (( customEye3_g1479 -_ProjectionParams.y - DistanceFadeStart27_g1479 ) / DistanceFadeLength23_g1479);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1479 = ( temp_output_31_0_g1479 * saturate( ( 1.0 - cameraDepthFade3_g1479 ) ) );
				#else
				float staticSwitch33_g1479 = temp_output_31_0_g1479;
				#endif
				

				float Alpha = staticSwitch33_g1479;
				float AlphaClipThreshold = _AlphaCutoff;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#pragma multi_compile_local _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_VERSION 19901
			#define ASE_SRP_VERSION 170003

			#pragma shader_feature EDITOR_VISUALIZATION

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _FLOWERCOLORS_TWO _FLOWERCOLORS_FOUR
			#pragma shader_feature_local _BLENDWITHTERRAIN_ON
			#pragma shader_feature_local _DISTANCEFADE_ON


			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD1;
					float4 LightCoord : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 Nicrom_TerrainColorMap_TexelSize;
			float4 _ColorMask1_ST;
			float3 _FlowerColor1B;
			float3 _StemColorTop;
			float3 _FlowerColor1A;
			float3 _StemColorBottom;
			float3 _FlowerColor2B;
			float3 _FlowerColor2A;
			half _GVBendingScale;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ScaleVarMax;
			float _ColorMask2Tiling;
			float _ColorMask2Opacity;
			float _BWTBottom;
			float _BWTTop;
			float _StemColorMaskStart;
			float _StemColorMaskEnd;
			float _STEM;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _ScaleVarMin;
			float _SlopeCorrectionOffset;
			float _DM1Amplitude;
			float _GVTime;
			float _DM1Speed;
			float _DM1FoliageLength;
			float _DM2Amplitude;
			float _DM2Speed;
			float _DM2ObjectRadius;
			half _MMDirectionAngle;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _MotionNoiseTiling;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVAmplitudeScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionMagnitude;
			float _AlphaCutoff;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float Nicrom_DM_AmpScale_Flower;
			float Nicrom_DM_Time_Flower;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Flower;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Flower;
			float Nicrom_MM_SpeedScale_Flower;
			float Nicrom_MM_BendScale_Flowers;
			float Nicrom_MM_AmpScale_Flower;
			sampler2D _ScaleVarNoise;
			sampler2D _ColorMask1;
			float Nicrom_Flower_CM2_SharpMin;
			float Nicrom_Flower_CM2_SharpMax;
			sampler2D _ColorMask2;
			float Nicrom_Flower_CM2_Tilling;
			sampler2D Nicrom_TerrainColorMap;
			float2 Nicrom_TerrainPosition;
			float Nicrom_TerrainSize;
			sampler2D _Albedo;
			float Nicrom_Flower_DF_Length;
			float Nicrom_Flower_DF_Start;


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float4 Debug203_g1474( float Debug_Target, float4 Albedo, float ColorMask1R, float ColorMask1G, float ColorMask2, float ScaleVarNoise )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1R;
				else if(Debug_Target ==2)
				    return ColorMask1G;
				else if(Debug_Target ==3)
				    return ColorMask2;
				else
				    return ScaleVarNoise;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g1447 = radians( ( 90.0 + ( input.texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g1447 = (float3(cos( temp_output_23_0_g1447 ) , 0.0 , sin( temp_output_23_0_g1447 )));
				float3 DB_RotationAxis87_g1445 = appendResult25_g1447;
				float GV_AmplitudeScale175_g1445 = _GVBendingScale;
				float lerpResult186_g1445 = lerp( 1.0 , Nicrom_DM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float DM_AmplitudeScale168_g1445 = lerpResult186_g1445;
				float DM1_Amplitude28_g1445 = _DM1Amplitude;
				float3 objToWorld80_g1455 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g1445 = _GVTime;
				float lerpResult187_g1445 = lerp( _TimeParameters.x , Nicrom_DM_Time_Flower , GV_Time174_g1445);
				float ApplicationIsPlaying241_g1445 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g1445 = lerp( _TimeParameters.x , lerpResult187_g1445 , ApplicationIsPlaying241_g1445);
				float DM_Time169_g1445 = lerpResult256_g1445;
				float Time90_g1455 = DM_Time169_g1445;
				float DM1_Speed29_g1445 = _DM1Speed;
				float Speed45_g1455 = DM1_Speed29_g1445;
				float temp_output_244_0_g1445 = Nicrom_DM_SpeedScale_Flower;
				float lerpResult261_g1445 = lerp( temp_output_244_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult262_g1445 = lerp( temp_output_244_0_g1445 , lerpResult261_g1445 , ApplicationIsPlaying241_g1445);
				float DM_SpeedScale265_g1445 = lerpResult262_g1445;
				float SpeedScale95_g1455 = DM_SpeedScale265_g1445;
				float DM_PhaseShift91_g1445 = input.ase_color.a;
				float PhaseShift48_g1455 = DM_PhaseShift91_g1445;
				float3 appendResult24_g1447 = (float3(0.0 , input.texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g1445 = appendResult24_g1447;
				float3 PivotPosOnYAxis56_g1455 = DM_PivotPosOnYAxis88_g1445;
				float DM1_FoliageLength32_g1445 = _DM1FoliageLength;
				float3 rotatedValue29_g1455 = RotateAroundAxis( PivotPosOnYAxis56_g1455, input.positionOS.xyz, DB_RotationAxis87_g1445, radians( ( ( ( DM_AmplitudeScale168_g1445 * DM1_Amplitude28_g1445 ) * sin( ( ( ( objToWorld80_g1455.x + objToWorld80_g1455.z ) + ( ( Time90_g1455 * ( Speed45_g1455 * SpeedScale95_g1455 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g1455 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g1455 ) / DM1_FoliageLength32_g1445 ) ) ) );
				float DM1_MotionMask89_g1445 = step( 1.5 , input.texcoord0.y );
				float3 DM1_VertexOffset231_g1445 = ( ( rotatedValue29_g1455 - input.positionOS.xyz ) * DM1_MotionMask89_g1445 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g1445 = DM1_VertexOffset231_g1445;
				#else
				float3 staticSwitch104_g1445 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g1445 = _DM2Amplitude;
				float Amplitude58_g1456 = DM2_Amplitude30_g1445;
				float3 appendResult28_g1444 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 LocalPivot159_g1445 = -appendResult28_g1444;
				float3 PivotPoint49_g1456 = LocalPivot159_g1445;
				float3 objToWorld53_g1456 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g1456, 1 ) ).xyz;
				float Time87_g1456 = DM_Time169_g1445;
				float SpeedScale93_g1456 = DM_SpeedScale265_g1445;
				float DM2_Speed31_g1445 = _DM2Speed;
				float Speed41_g1456 = DM2_Speed31_g1445;
				float PhaseShift54_g1456 = DM_PhaseShift91_g1445;
				float3 break52_g1456 = PivotPoint49_g1456;
				float3 appendResult20_g1456 = (float3(break52_g1456.x , input.positionOS.xyz.y , break52_g1456.z));
				float DM2_ObjectRadius33_g1445 = _DM2ObjectRadius;
				float ObjectRadius60_g1456 = DM2_ObjectRadius33_g1445;
				float3 rotatedValue33_g1456 = RotateAroundAxis( PivotPoint49_g1456, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g1445 * Amplitude58_g1456 ) * sin( ( ( ( objToWorld53_g1456.x + objToWorld53_g1456.z ) + ( ( Time87_g1456 * ( SpeedScale93_g1456 * Speed41_g1456 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g1456 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g1456 ) / ObjectRadius60_g1456 ) ) ) );
				float DM2_MotionMask90_g1445 = step( 1.5 , input.texcoord0.x );
				float BendingMask62_g1456 = DM2_MotionMask90_g1445;
				float3 DM2_VertexOffset232_g1445 = ( ( rotatedValue33_g1456 - input.positionOS.xyz ) * BendingMask62_g1456 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g1445 = DM2_VertexOffset232_g1445;
				#else
				float3 staticSwitch103_g1445 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g1445 = ( staticSwitch104_g1445 + staticSwitch103_g1445 );
				float lerpResult56_g1453 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g1445 = lerpResult56_g1453;
				float MM_DirShift59_g1445 = _MMDirectionShift;
				float MM_DirShiftOffset60_g1445 = _MMDirectionShiftOffset;
				float3 objToWorld11_g1450 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float2 appendResult10_g1450 = (float2(objToWorld11_g1450.x , objToWorld11_g1450.z));
				float MotionNoiseTiling20_g1445 = _MotionNoiseTiling;
				float4 temp_output_73_0_g1445 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g1450 * MotionNoiseTiling20_g1445 ), 0, 0.0) );
				float4 StaticWorldNoise78_g1445 = temp_output_73_0_g1445;
				float4 StaticWorldNoise55_g1449 = StaticWorldNoise78_g1445;
				float3 objToWorld50_g1449 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float lerpResult182_g1445 = lerp( _TimeParameters.x , Nicrom_MM_Time_Flower , GV_Time174_g1445);
				float lerpResult246_g1445 = lerp( _TimeParameters.x , lerpResult182_g1445 , ApplicationIsPlaying241_g1445);
				float MM_Time13_g1445 = lerpResult246_g1445;
				float Time76_g1449 = MM_Time13_g1445;
				float temp_output_243_0_g1445 = Nicrom_MM_SpeedScale_Flower;
				float lerpResult245_g1445 = lerp( temp_output_243_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult249_g1445 = lerp( temp_output_243_0_g1445 , lerpResult245_g1445 , ApplicationIsPlaying241_g1445);
				float MM_SpeedScale253_g1445 = lerpResult249_g1445;
				float SpeedScale_RA80_g1449 = MM_SpeedScale253_g1445;
				float MM_DirShiftSpeed56_g1445 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g1445 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1449 = radians( ( ( MM_DirAngle51_g1445 + ( ( MM_DirShift59_g1445 + ( MM_DirShiftOffset60_g1445 * (StaticWorldNoise55_g1449).x ) ) * sin( ( ( objToWorld50_g1449.x + objToWorld50_g1449.z ) + ( ( Time76_g1449 * ( SpeedScale_RA80_g1449 * MM_DirShiftSpeed56_g1445 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1449).z * MM_DirShiftNoiseScale57_g1445 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1449 = (float3(cos( temp_output_11_0_g1449 ) , 0.0 , sin( temp_output_11_0_g1449 )));
				float3 worldToObj35_g1449 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1449, 1 ) ).xyz;
				float3 worldToObj36_g1449 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1449 = normalize( (( worldToObj35_g1449 - worldToObj36_g1449 )).xyz );
				float3 MB_RotationAxis129_g1445 = normalizeResult34_g1449;
				float3 RotationAxis56_g1448 = MB_RotationAxis129_g1445;
				float4 StaticWorldNoise31_g1454 = StaticWorldNoise78_g1445;
				float MM_BendingOfset37_g1445 = _MMBendingOffset;
				float MM_Bending35_g1445 = _MMBending;
				float GV_BendingScale176_g1445 = _GVAmplitudeScale;
				float lerpResult188_g1445 = lerp( 1.0 , Nicrom_MM_BendScale_Flowers , GV_BendingScale176_g1445);
				float MM_BendingScale17_g1445 = lerpResult188_g1445;
				float MM_AmplitudeOffset52_g1445 = _MMAmplitudeOffset;
				float MM_Amplitude66_g1445 = _MMAmplitude;
				float lerpResult189_g1445 = lerp( 1.0 , Nicrom_MM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float MM_AmplitudeScale15_g1445 = lerpResult189_g1445;
				float3 objToWorld170_g1454 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1454 = MM_Time13_g1445;
				float MM_Speed53_g1445 = _MMSpeed;
				float Speed125_g1454 = MM_Speed53_g1445;
				float SpeedScale_RotAng201_g1454 = MM_SpeedScale253_g1445;
				float MM_SineWaveLength58_g1445 = _MMSineWaveLength;
				float WaveLength63_g1454 = MM_SineWaveLength58_g1445;
				float MM_PhaseShiftSource207_g1445 = _MMPhaseShiftSource;
				float lerpResult154_g1445 = lerp( input.ase_color.a , (StaticWorldNoise78_g1445).g , MM_PhaseShiftSource207_g1445);
				float MM_PhaseShiftScale39_g1445 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g1445 = ( lerpResult154_g1445 * MM_PhaseShiftScale39_g1445 );
				float PhaseShift127_g1454 = MB_PhaseShift79_g1445;
				float temp_output_20_0_g1454 = sin( ( ( ( objToWorld170_g1454.x + objToWorld170_g1454.z ) + ( ( Time167_g1454 * ( ( Speed125_g1454 * SpeedScale_RotAng201_g1454 ) * WaveLength63_g1454 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1454 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1454 ) ) );
				float MM_MaxHeight55_g1445 = _MMObjectHeight;
				float3 gammaToLinear56_g1454 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g1445 = _MMObjectHeightSource;
				float lerpResult57_g1454 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g1445 ) , (gammaToLinear56_g1454).x , MM_ObjectHeightSource54_g1445);
				float BendingMask189_g1454 = lerpResult57_g1454;
				float MB_RotationAngle130_g1445 = radians( ( ( ( ( ( (StaticWorldNoise31_g1454).y * MM_BendingOfset37_g1445 ) + MM_Bending35_g1445 ) * MM_BendingScale17_g1445 ) + ( ( ( ( (StaticWorldNoise31_g1454).x * MM_AmplitudeOffset52_g1445 ) + MM_Amplitude66_g1445 ) * MM_AmplitudeScale15_g1445 ) * temp_output_20_0_g1454 ) ) * BendingMask189_g1454 ) );
				float RotationAngle54_g1448 = MB_RotationAngle130_g1445;
				float3 LocalPivotPos60_g1448 = LocalPivot159_g1445;
				float3 break62_g1448 = LocalPivotPos60_g1448;
				float VertexPos_Y67_g1448 = input.positionOS.xyz.y;
				float3 appendResult45_g1448 = (float3(break62_g1448.x , VertexPos_Y67_g1448 , break62_g1448.z));
				float3 VertexPos66_g1448 = input.positionOS.xyz;
				float3 rotatedValue30_g1448 = RotateAroundAxis( appendResult45_g1448, VertexPos66_g1448, RotationAxis56_g1448, RotationAngle54_g1448 );
				float3 DetailMotionVO73_g1448 = DM_VertexOffset128_g1445;
				float3 rotatedValue34_g1448 = RotateAroundAxis( LocalPivotPos60_g1448, ( rotatedValue30_g1448 + DetailMotionVO73_g1448 ), RotationAxis56_g1448, RotationAngle54_g1448 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g1445 = ( ( rotatedValue34_g1448 - VertexPos66_g1448 ) * step( 0.01 , VertexPos_Y67_g1448 ) );
				#else
				float3 staticSwitch205_g1445 = DM_VertexOffset128_g1445;
				#endif
				float3 LocalVertexOffset89_g1457 = staticSwitch205_g1445;
				float3 appendResult15_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1457, 1 ) ).xyz;
				float3 objToWorld102_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1457 = ( objToWorld98_g1457 - objToWorld102_g1457 );
				float3 appendResult24_g1457 = (float3(-break20_g1457.z , 0.0 , break20_g1457.x));
				float3 appendResult3_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1457, 1 ) ).xyz;
				float3 objToWorld106_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1457 = ( objToWorld100_g1457 - objToWorld106_g1457 );
				float3 break108_g1457 = temp_output_107_0_g1457;
				float3 lerpResult84_g1457 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1457 , step( 0.001 , ( abs( break108_g1457.x ) + abs( break108_g1457.z ) ) ));
				float3 normalizeResult7_g1457 = ASESafeNormalize( lerpResult84_g1457 );
				float dotResult9_g1457 = dot( normalizeResult7_g1457 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1457 = acos( dotResult9_g1457 );
				float NaNPrevention21_g1457 = step( 0.01 , abs( ( temp_output_12_0_g1457 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1457 = lerp( float3( 1, 0, 0 ) , appendResult24_g1457 , NaNPrevention21_g1457);
				float3 worldToObj99_g1457 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1457, 1 ) ).xyz;
				float3 worldToObj105_g1457 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1457 = normalize( ( worldToObj99_g1457 - worldToObj105_g1457 ) );
				float3 RotationAxis30_g1457 = normalizeResult49_g1457;
				float4 WorldSpaceNoise126_g1457 = temp_output_73_0_g1445;
				float SlopeCorrectionOffset120_g1457 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1457 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1457 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1457).x - 0.0 ) * ( SlopeCorrectionOffset120_g1457 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1457 ) ) * temp_output_12_0_g1457 );
				float3 appendResult28_g1458 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 rotatedValue35_g1457 = RotateAroundAxis( -appendResult28_g1458, ( input.positionOS.xyz + LocalVertexOffset89_g1457 ), RotationAxis30_g1457, RotationAngle29_g1457 );
				float3 lerpResult52_g1457 = lerp( LocalVertexOffset89_g1457 , ( rotatedValue35_g1457 - input.positionOS.xyz ) , NaNPrevention21_g1457);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1457 = lerpResult52_g1457;
				#else
				float3 staticSwitch123_g1457 = LocalVertexOffset89_g1457;
				#endif
				float3 appendResult28_g1472 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 Scale_Pivot15_g1469 = -appendResult28_g1472;
				float3 temp_output_5_0_g1469 = ( ( staticSwitch123_g1457 + input.positionOS.xyz ) - Scale_Pivot15_g1469 );
				float ScaleVartMin40_g1469 = _ScaleVarMin;
				float ScaleVarMax41_g1469 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1469 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1469 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1471 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1469, 1 ) ).xyz;
				float2 appendResult10_g1471 = (float2(objToWorld11_g1471.x , objToWorld11_g1471.z));
				float2 Scale_WorldSpaceUVs30_g1469 = appendResult10_g1471;
				float Scale_VarNoiseTiling23_g1469 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1469 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1469 * Scale_VarNoiseTiling23_g1469 ), 0, 0.0) );
				float smoothstepResult56_g1469 = smoothstep( ScaleNoiseSharpnessMin59_g1469 , ScaleNoiseSharpnessMax60_g1469 , (Scale_WorldSpaceNoise32_g1469).r);
				float lerpResult44_g1469 = lerp( ScaleVartMin40_g1469 , ScaleVarMax41_g1469 , smoothstepResult56_g1469);
				float ScaleVar47_g1469 = lerpResult44_g1469;
				float clampResult63_g1469 = clamp( ( ScaleVar47_g1469 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1469 = ( temp_output_5_0_g1469 * clampResult63_g1469 );
				#else
				float3 staticSwitch72_g1469 = temp_output_5_0_g1469;
				#endif
				float ScaleOffset19_g1469 = _ScaleOffset;
				float clampResult64_g1469 = clamp( ( ScaleOffset19_g1469 + 1.0 ) , 0.0 , 7.0 );
				
				float2 TerrainPosition56_g1474 = ( Nicrom_TerrainPosition + float2( 1,1 ) );
				float2 TerrainPosition4_g1478 = TerrainPosition56_g1474;
				float TerrainSize55_g1474 = Nicrom_TerrainSize;
				float TerrainSize2_g1478 = TerrainSize55_g1474;
				float3 appendResult28_g1475 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 LocalPivot_Color15_g1474 = -appendResult28_g1475;
				float3 objToWorld11_g1477 = mul( GetObjectToWorldMatrix(), float4( LocalPivot_Color15_g1474, 1 ) ).xyz;
				float2 appendResult10_g1477 = (float2(objToWorld11_g1477.x , objToWorld11_g1477.z));
				float4 vertexToFrag19_g1478 = tex2Dlod( Nicrom_TerrainColorMap, float4( ( ( ( 1.0 - TerrainPosition4_g1478 ) / TerrainSize2_g1478 ) + ( ( TerrainSize2_g1478 / ( TerrainSize2_g1478 * TerrainSize2_g1478 ) ) * appendResult10_g1477 ) ), 0, 0.0) );
				output.ase_texcoord4 = vertexToFrag19_g1478;
				float vertexToFrag230_g1474 = input.positionOS.xyz.y;
				output.ase_texcoord5.x = vertexToFrag230_g1474;
				#ifdef _SCALEVARIATION_ON
				float staticSwitch73_g1469 = smoothstepResult56_g1469;
				#else
				float staticSwitch73_g1469 = 0.0;
				#endif
				float vertexToFrag71_g1469 = staticSwitch73_g1469;
				output.ase_texcoord5.y = vertexToFrag71_g1469;
				
				float3 customSurfaceDepth3_g1479 = input.positionOS.xyz;
				float customEye3_g1479 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1479)).z;
				output.ase_texcoord5.z = customEye3_g1479;
				
				output.ase_texcoord3.xy = input.texcoord0.xy;
				output.ase_texcoord3.zw = input.texcoord1.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1469 * clampResult64_g1469 ) + Scale_Pivot15_g1469 ) - input.positionOS.xyz );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(input.positionOS.xyz, input.texcoord0.xy, input.texcoord1.xy, input.texcoord2.xy, VizUV, LightCoord);
					output.VizUV = float4(VizUV, 0, 0);
					output.LightCoord = LightCoord;
				#endif

				output.positionCS = MetaVertexPosition( input.positionOS, input.texcoord1.xy, input.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );
				output.positionWS = TransformObjectToWorld( input.positionOS.xyz );
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.ase_color = input.ase_color;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord = TransformWorldToShadowCoord(input.positionWS);
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( input.positionWS );
				float4 ShadowCoord = shadowCoord;

				float Debug_Target203_g1474 = _Debug;
				float3 FlowerColor1B66_g1474 = _FlowerColor1B;
				float3 FlowerColor1A65_g1474 = _FlowerColor1A;
				float2 uv_ColorMask1 = input.ase_texcoord3.xy * _ColorMask1_ST.xy + _ColorMask1_ST.zw;
				float4 tex2DNode31_g1474 = tex2D( _ColorMask1, uv_ColorMask1 );
				float ColorMask1_R37_g1474 = tex2DNode31_g1474.r;
				float3 lerpResult87_g1474 = lerp( FlowerColor1B66_g1474 , FlowerColor1A65_g1474 , ColorMask1_R37_g1474);
				float3 FlowerColor1_F197_g1474 = lerpResult87_g1474;
				float3 FlowerColor2B68_g1474 = _FlowerColor2B;
				float3 FlowerColor2A67_g1474 = _FlowerColor2A;
				float3 lerpResult88_g1474 = lerp( FlowerColor2B68_g1474 , FlowerColor2A67_g1474 , ColorMask1_R37_g1474);
				float3 FlowerColor2_F198_g1474 = lerpResult88_g1474;
				float CM2_GVToggle213_g1474 = _ColorMask2GV;
				float lerpResult219_g1474 = lerp( _ColorMask2SharpMin , Nicrom_Flower_CM2_SharpMin , CM2_GVToggle213_g1474);
				float ColorMask2SharpMin98_g1474 = lerpResult219_g1474;
				float lerpResult221_g1474 = lerp( _ColorMask2SharpMax , Nicrom_Flower_CM2_SharpMax , CM2_GVToggle213_g1474);
				float ColorMask2SharpMax92_g1474 = lerpResult221_g1474;
				float3 appendResult28_g1475 = (float3(input.ase_texcoord3.zw.x , 0.0 , input.ase_texcoord3.zw.y));
				float3 LocalPivot_Color15_g1474 = -appendResult28_g1475;
				float3 objToWorld11_g1476 = mul( GetObjectToWorldMatrix(), float4( LocalPivot_Color15_g1474, 1 ) ).xyz;
				float2 appendResult10_g1476 = (float2(objToWorld11_g1476.x , objToWorld11_g1476.z));
				float lerpResult215_g1474 = lerp( _ColorMask2Tiling , Nicrom_Flower_CM2_Tilling , CM2_GVToggle213_g1474);
				float ColorMask2Tiling21_g1474 = lerpResult215_g1474;
				float2 WorldSpaceUVs187_g1474 = ( appendResult10_g1476 * ColorMask2Tiling21_g1474 );
				float4 tex2DNode43_g1474 = tex2D( _ColorMask2, WorldSpaceUVs187_g1474 );
				float ColorMask2Noise78_g1474 = tex2DNode43_g1474.r;
				float smoothstepResult119_g1474 = smoothstep( ColorMask2SharpMin98_g1474 , ColorMask2SharpMax92_g1474 , ColorMask2Noise78_g1474);
				float ColorMask2Opacity122_g1474 = _ColorMask2Opacity;
				float lerpResult126_g1474 = lerp( 0.0 , smoothstepResult119_g1474 , ColorMask2Opacity122_g1474);
				float ColorMask2_F184_g1474 = lerpResult126_g1474;
				float3 lerpResult130_g1474 = lerp( FlowerColor1_F197_g1474 , FlowerColor2_F198_g1474 , ColorMask2_F184_g1474);
				#if defined( _FLOWERCOLORS_TWO )
				float3 staticSwitch196_g1474 = FlowerColor1_F197_g1474;
				#elif defined( _FLOWERCOLORS_FOUR )
				float3 staticSwitch196_g1474 = lerpResult130_g1474;
				#else
				float3 staticSwitch196_g1474 = FlowerColor1_F197_g1474;
				#endif
				float3 FlowerColor134_g1474 = staticSwitch196_g1474;
				float3 StemColorBottom93_g1474 = _StemColorBottom;
				float4 vertexToFrag19_g1478 = input.ase_texcoord4;
				float4 TerrainColor86_g1474 = vertexToFrag19_g1478;
				float TerrainBlendBottom97_g1474 = _BWTBottom;
				float IsTerrainAlbedoAssigned181_g1474 = step( 8.0 , Nicrom_TerrainColorMap_TexelSize.z );
				float lerpResult176_g1474 = lerp( 0.0 , TerrainBlendBottom97_g1474 , IsTerrainAlbedoAssigned181_g1474);
				float TerrainBlendBottom_F179_g1474 = lerpResult176_g1474;
				float4 lerpResult114_g1474 = lerp( float4( StemColorBottom93_g1474 , 0.0 ) , TerrainColor86_g1474 , TerrainBlendBottom_F179_g1474);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch124_g1474 = lerpResult114_g1474;
				#else
				float4 staticSwitch124_g1474 = float4( StemColorBottom93_g1474 , 0.0 );
				#endif
				float3 StemColorTop91_g1474 = _StemColorTop;
				float TerrainBlendTop96_g1474 = _BWTTop;
				float lerpResult177_g1474 = lerp( 0.0 , TerrainBlendTop96_g1474 , IsTerrainAlbedoAssigned181_g1474);
				float TerrainBlendTop_F178_g1474 = lerpResult177_g1474;
				float4 lerpResult115_g1474 = lerp( float4( StemColorTop91_g1474 , 0.0 ) , TerrainColor86_g1474 , TerrainBlendTop_F178_g1474);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch123_g1474 = lerpResult115_g1474;
				#else
				float4 staticSwitch123_g1474 = float4( StemColorTop91_g1474 , 0.0 );
				#endif
				float StemColorMaskStart112_g1474 = _StemColorMaskStart;
				float StemColorMaskEnd113_g1474 = _StemColorMaskEnd;
				float vertexToFrag230_g1474 = input.ase_texcoord5.x;
				float VertexPos_Y231_g1474 = vertexToFrag230_g1474;
				float smoothstepResult125_g1474 = smoothstep( StemColorMaskStart112_g1474 , StemColorMaskEnd113_g1474 , VertexPos_Y231_g1474);
				float4 lerpResult129_g1474 = lerp( staticSwitch124_g1474 , staticSwitch123_g1474 , smoothstepResult125_g1474);
				float4 StemColor133_g1474 = lerpResult129_g1474;
				float ColorMask1_G183_g1474 = tex2DNode31_g1474.g;
				float4 lerpResult149_g1474 = lerp( float4( FlowerColor134_g1474 , 0.0 ) , StemColor133_g1474 , ColorMask1_G183_g1474);
				float FlowerStemToggle145_g1474 = _STEM;
				float4 lerpResult158_g1474 = lerp( float4( FlowerColor134_g1474 , 0.0 ) , lerpResult149_g1474 , FlowerStemToggle145_g1474);
				float2 uv_Albedo137_g1474 = input.ase_texcoord3.xy;
				float4 tex2DNode137_g1474 = tex2D( _Albedo, uv_Albedo137_g1474 );
				float4 AlbedoTex144_g1474 = tex2DNode137_g1474;
				float4 Albedo203_g1474 = ( lerpResult158_g1474 * AlbedoTex144_g1474 );
				float ColorMask1R203_g1474 = ColorMask1_R37_g1474;
				float ColorMask1G203_g1474 = ColorMask1_G183_g1474;
				#if defined( _FLOWERCOLORS_TWO )
				float staticSwitch208_g1474 = 0.0;
				#elif defined( _FLOWERCOLORS_FOUR )
				float staticSwitch208_g1474 = ColorMask2_F184_g1474;
				#else
				float staticSwitch208_g1474 = 0.0;
				#endif
				float ColorMask2203_g1474 = staticSwitch208_g1474;
				float vertexToFrag71_g1469 = input.ase_texcoord5.y;
				float ScaleVarNoise2237 = vertexToFrag71_g1469;
				float ScaleVarNoise203_g1474 = ScaleVarNoise2237;
				float4 localDebug203_g1474 = Debug203_g1474( Debug_Target203_g1474 , Albedo203_g1474 , ColorMask1R203_g1474 , ColorMask1G203_g1474 , ColorMask2203_g1474 , ScaleVarNoise203_g1474 );
				
				float temp_output_31_0_g1479 = tex2DNode137_g1474.a;
				float DF_Length_Local38_g1479 = _DistanceFadeLength;
				float DF_Length_Global45_g1479 = Nicrom_Flower_DF_Length;
				float DF_Start_Global43_g1479 = Nicrom_Flower_DF_Start;
				float lerpResult49_g1479 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1479 ));
				float DF_UseGV28_g1479 = lerpResult49_g1479;
				float lerpResult26_g1479 = lerp( DF_Length_Local38_g1479 , DF_Length_Global45_g1479 , DF_UseGV28_g1479);
				float DistanceFadeLength23_g1479 = lerpResult26_g1479;
				float DF_Start_Local36_g1479 = _DistanceFadeStart;
				float lerpResult20_g1479 = lerp( DF_Start_Local36_g1479 , DF_Start_Global43_g1479 , DF_UseGV28_g1479);
				float DistanceFadeStart27_g1479 = lerpResult20_g1479;
				float customEye3_g1479 = input.ase_texcoord5.z;
				float cameraDepthFade3_g1479 = (( customEye3_g1479 -_ProjectionParams.y - DistanceFadeStart27_g1479 ) / DistanceFadeLength23_g1479);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1479 = ( temp_output_31_0_g1479 * saturate( ( 1.0 - cameraDepthFade3_g1479 ) ) );
				#else
				float staticSwitch33_g1479 = temp_output_31_0_g1479;
				#endif
				

				float3 BaseColor = localDebug203_g1474.xyz;
				float3 Emission = 0;
				float Alpha = staticSwitch33_g1479;
				float AlphaClipThreshold = _AlphaCutoff;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = input.VizUV.xy;
					metaInput.LightCoord = input.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#pragma multi_compile_local _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_VERSION 19901
			#define ASE_SRP_VERSION 170003


			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _FLOWERCOLORS_TWO _FLOWERCOLORS_FOUR
			#pragma shader_feature_local _BLENDWITHTERRAIN_ON
			#pragma shader_feature_local _DISTANCEFADE_ON


			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 Nicrom_TerrainColorMap_TexelSize;
			float4 _ColorMask1_ST;
			float3 _FlowerColor1B;
			float3 _StemColorTop;
			float3 _FlowerColor1A;
			float3 _StemColorBottom;
			float3 _FlowerColor2B;
			float3 _FlowerColor2A;
			half _GVBendingScale;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ScaleVarMax;
			float _ColorMask2Tiling;
			float _ColorMask2Opacity;
			float _BWTBottom;
			float _BWTTop;
			float _StemColorMaskStart;
			float _StemColorMaskEnd;
			float _STEM;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _ScaleVarMin;
			float _SlopeCorrectionOffset;
			float _DM1Amplitude;
			float _GVTime;
			float _DM1Speed;
			float _DM1FoliageLength;
			float _DM2Amplitude;
			float _DM2Speed;
			float _DM2ObjectRadius;
			half _MMDirectionAngle;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _MotionNoiseTiling;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVAmplitudeScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionMagnitude;
			float _AlphaCutoff;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float Nicrom_DM_AmpScale_Flower;
			float Nicrom_DM_Time_Flower;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Flower;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Flower;
			float Nicrom_MM_SpeedScale_Flower;
			float Nicrom_MM_BendScale_Flowers;
			float Nicrom_MM_AmpScale_Flower;
			sampler2D _ScaleVarNoise;
			sampler2D _ColorMask1;
			float Nicrom_Flower_CM2_SharpMin;
			float Nicrom_Flower_CM2_SharpMax;
			sampler2D _ColorMask2;
			float Nicrom_Flower_CM2_Tilling;
			sampler2D Nicrom_TerrainColorMap;
			float2 Nicrom_TerrainPosition;
			float Nicrom_TerrainSize;
			sampler2D _Albedo;
			float Nicrom_Flower_DF_Length;
			float Nicrom_Flower_DF_Start;


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float4 Debug203_g1474( float Debug_Target, float4 Albedo, float ColorMask1R, float ColorMask1G, float ColorMask2, float ScaleVarNoise )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1R;
				else if(Debug_Target ==2)
				    return ColorMask1G;
				else if(Debug_Target ==3)
				    return ColorMask2;
				else
				    return ScaleVarNoise;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_TRANSFER_INSTANCE_ID( input, output );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float temp_output_23_0_g1447 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g1447 = (float3(cos( temp_output_23_0_g1447 ) , 0.0 , sin( temp_output_23_0_g1447 )));
				float3 DB_RotationAxis87_g1445 = appendResult25_g1447;
				float GV_AmplitudeScale175_g1445 = _GVBendingScale;
				float lerpResult186_g1445 = lerp( 1.0 , Nicrom_DM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float DM_AmplitudeScale168_g1445 = lerpResult186_g1445;
				float DM1_Amplitude28_g1445 = _DM1Amplitude;
				float3 objToWorld80_g1455 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g1445 = _GVTime;
				float lerpResult187_g1445 = lerp( _TimeParameters.x , Nicrom_DM_Time_Flower , GV_Time174_g1445);
				float ApplicationIsPlaying241_g1445 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g1445 = lerp( _TimeParameters.x , lerpResult187_g1445 , ApplicationIsPlaying241_g1445);
				float DM_Time169_g1445 = lerpResult256_g1445;
				float Time90_g1455 = DM_Time169_g1445;
				float DM1_Speed29_g1445 = _DM1Speed;
				float Speed45_g1455 = DM1_Speed29_g1445;
				float temp_output_244_0_g1445 = Nicrom_DM_SpeedScale_Flower;
				float lerpResult261_g1445 = lerp( temp_output_244_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult262_g1445 = lerp( temp_output_244_0_g1445 , lerpResult261_g1445 , ApplicationIsPlaying241_g1445);
				float DM_SpeedScale265_g1445 = lerpResult262_g1445;
				float SpeedScale95_g1455 = DM_SpeedScale265_g1445;
				float DM_PhaseShift91_g1445 = input.ase_color.a;
				float PhaseShift48_g1455 = DM_PhaseShift91_g1445;
				float3 appendResult24_g1447 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g1445 = appendResult24_g1447;
				float3 PivotPosOnYAxis56_g1455 = DM_PivotPosOnYAxis88_g1445;
				float DM1_FoliageLength32_g1445 = _DM1FoliageLength;
				float3 rotatedValue29_g1455 = RotateAroundAxis( PivotPosOnYAxis56_g1455, input.positionOS.xyz, DB_RotationAxis87_g1445, radians( ( ( ( DM_AmplitudeScale168_g1445 * DM1_Amplitude28_g1445 ) * sin( ( ( ( objToWorld80_g1455.x + objToWorld80_g1455.z ) + ( ( Time90_g1455 * ( Speed45_g1455 * SpeedScale95_g1455 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g1455 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g1455 ) / DM1_FoliageLength32_g1445 ) ) ) );
				float DM1_MotionMask89_g1445 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g1445 = ( ( rotatedValue29_g1455 - input.positionOS.xyz ) * DM1_MotionMask89_g1445 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g1445 = DM1_VertexOffset231_g1445;
				#else
				float3 staticSwitch104_g1445 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g1445 = _DM2Amplitude;
				float Amplitude58_g1456 = DM2_Amplitude30_g1445;
				float3 appendResult28_g1444 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot159_g1445 = -appendResult28_g1444;
				float3 PivotPoint49_g1456 = LocalPivot159_g1445;
				float3 objToWorld53_g1456 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g1456, 1 ) ).xyz;
				float Time87_g1456 = DM_Time169_g1445;
				float SpeedScale93_g1456 = DM_SpeedScale265_g1445;
				float DM2_Speed31_g1445 = _DM2Speed;
				float Speed41_g1456 = DM2_Speed31_g1445;
				float PhaseShift54_g1456 = DM_PhaseShift91_g1445;
				float3 break52_g1456 = PivotPoint49_g1456;
				float3 appendResult20_g1456 = (float3(break52_g1456.x , input.positionOS.xyz.y , break52_g1456.z));
				float DM2_ObjectRadius33_g1445 = _DM2ObjectRadius;
				float ObjectRadius60_g1456 = DM2_ObjectRadius33_g1445;
				float3 rotatedValue33_g1456 = RotateAroundAxis( PivotPoint49_g1456, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g1445 * Amplitude58_g1456 ) * sin( ( ( ( objToWorld53_g1456.x + objToWorld53_g1456.z ) + ( ( Time87_g1456 * ( SpeedScale93_g1456 * Speed41_g1456 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g1456 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g1456 ) / ObjectRadius60_g1456 ) ) ) );
				float DM2_MotionMask90_g1445 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g1456 = DM2_MotionMask90_g1445;
				float3 DM2_VertexOffset232_g1445 = ( ( rotatedValue33_g1456 - input.positionOS.xyz ) * BendingMask62_g1456 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g1445 = DM2_VertexOffset232_g1445;
				#else
				float3 staticSwitch103_g1445 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g1445 = ( staticSwitch104_g1445 + staticSwitch103_g1445 );
				float lerpResult56_g1453 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g1445 = lerpResult56_g1453;
				float MM_DirShift59_g1445 = _MMDirectionShift;
				float MM_DirShiftOffset60_g1445 = _MMDirectionShiftOffset;
				float3 objToWorld11_g1450 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float2 appendResult10_g1450 = (float2(objToWorld11_g1450.x , objToWorld11_g1450.z));
				float MotionNoiseTiling20_g1445 = _MotionNoiseTiling;
				float4 temp_output_73_0_g1445 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g1450 * MotionNoiseTiling20_g1445 ), 0, 0.0) );
				float4 StaticWorldNoise78_g1445 = temp_output_73_0_g1445;
				float4 StaticWorldNoise55_g1449 = StaticWorldNoise78_g1445;
				float3 objToWorld50_g1449 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float lerpResult182_g1445 = lerp( _TimeParameters.x , Nicrom_MM_Time_Flower , GV_Time174_g1445);
				float lerpResult246_g1445 = lerp( _TimeParameters.x , lerpResult182_g1445 , ApplicationIsPlaying241_g1445);
				float MM_Time13_g1445 = lerpResult246_g1445;
				float Time76_g1449 = MM_Time13_g1445;
				float temp_output_243_0_g1445 = Nicrom_MM_SpeedScale_Flower;
				float lerpResult245_g1445 = lerp( temp_output_243_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult249_g1445 = lerp( temp_output_243_0_g1445 , lerpResult245_g1445 , ApplicationIsPlaying241_g1445);
				float MM_SpeedScale253_g1445 = lerpResult249_g1445;
				float SpeedScale_RA80_g1449 = MM_SpeedScale253_g1445;
				float MM_DirShiftSpeed56_g1445 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g1445 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1449 = radians( ( ( MM_DirAngle51_g1445 + ( ( MM_DirShift59_g1445 + ( MM_DirShiftOffset60_g1445 * (StaticWorldNoise55_g1449).x ) ) * sin( ( ( objToWorld50_g1449.x + objToWorld50_g1449.z ) + ( ( Time76_g1449 * ( SpeedScale_RA80_g1449 * MM_DirShiftSpeed56_g1445 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1449).z * MM_DirShiftNoiseScale57_g1445 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1449 = (float3(cos( temp_output_11_0_g1449 ) , 0.0 , sin( temp_output_11_0_g1449 )));
				float3 worldToObj35_g1449 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1449, 1 ) ).xyz;
				float3 worldToObj36_g1449 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1449 = normalize( (( worldToObj35_g1449 - worldToObj36_g1449 )).xyz );
				float3 MB_RotationAxis129_g1445 = normalizeResult34_g1449;
				float3 RotationAxis56_g1448 = MB_RotationAxis129_g1445;
				float4 StaticWorldNoise31_g1454 = StaticWorldNoise78_g1445;
				float MM_BendingOfset37_g1445 = _MMBendingOffset;
				float MM_Bending35_g1445 = _MMBending;
				float GV_BendingScale176_g1445 = _GVAmplitudeScale;
				float lerpResult188_g1445 = lerp( 1.0 , Nicrom_MM_BendScale_Flowers , GV_BendingScale176_g1445);
				float MM_BendingScale17_g1445 = lerpResult188_g1445;
				float MM_AmplitudeOffset52_g1445 = _MMAmplitudeOffset;
				float MM_Amplitude66_g1445 = _MMAmplitude;
				float lerpResult189_g1445 = lerp( 1.0 , Nicrom_MM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float MM_AmplitudeScale15_g1445 = lerpResult189_g1445;
				float3 objToWorld170_g1454 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1454 = MM_Time13_g1445;
				float MM_Speed53_g1445 = _MMSpeed;
				float Speed125_g1454 = MM_Speed53_g1445;
				float SpeedScale_RotAng201_g1454 = MM_SpeedScale253_g1445;
				float MM_SineWaveLength58_g1445 = _MMSineWaveLength;
				float WaveLength63_g1454 = MM_SineWaveLength58_g1445;
				float MM_PhaseShiftSource207_g1445 = _MMPhaseShiftSource;
				float lerpResult154_g1445 = lerp( input.ase_color.a , (StaticWorldNoise78_g1445).g , MM_PhaseShiftSource207_g1445);
				float MM_PhaseShiftScale39_g1445 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g1445 = ( lerpResult154_g1445 * MM_PhaseShiftScale39_g1445 );
				float PhaseShift127_g1454 = MB_PhaseShift79_g1445;
				float temp_output_20_0_g1454 = sin( ( ( ( objToWorld170_g1454.x + objToWorld170_g1454.z ) + ( ( Time167_g1454 * ( ( Speed125_g1454 * SpeedScale_RotAng201_g1454 ) * WaveLength63_g1454 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1454 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1454 ) ) );
				float MM_MaxHeight55_g1445 = _MMObjectHeight;
				float3 gammaToLinear56_g1454 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g1445 = _MMObjectHeightSource;
				float lerpResult57_g1454 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g1445 ) , (gammaToLinear56_g1454).x , MM_ObjectHeightSource54_g1445);
				float BendingMask189_g1454 = lerpResult57_g1454;
				float MB_RotationAngle130_g1445 = radians( ( ( ( ( ( (StaticWorldNoise31_g1454).y * MM_BendingOfset37_g1445 ) + MM_Bending35_g1445 ) * MM_BendingScale17_g1445 ) + ( ( ( ( (StaticWorldNoise31_g1454).x * MM_AmplitudeOffset52_g1445 ) + MM_Amplitude66_g1445 ) * MM_AmplitudeScale15_g1445 ) * temp_output_20_0_g1454 ) ) * BendingMask189_g1454 ) );
				float RotationAngle54_g1448 = MB_RotationAngle130_g1445;
				float3 LocalPivotPos60_g1448 = LocalPivot159_g1445;
				float3 break62_g1448 = LocalPivotPos60_g1448;
				float VertexPos_Y67_g1448 = input.positionOS.xyz.y;
				float3 appendResult45_g1448 = (float3(break62_g1448.x , VertexPos_Y67_g1448 , break62_g1448.z));
				float3 VertexPos66_g1448 = input.positionOS.xyz;
				float3 rotatedValue30_g1448 = RotateAroundAxis( appendResult45_g1448, VertexPos66_g1448, RotationAxis56_g1448, RotationAngle54_g1448 );
				float3 DetailMotionVO73_g1448 = DM_VertexOffset128_g1445;
				float3 rotatedValue34_g1448 = RotateAroundAxis( LocalPivotPos60_g1448, ( rotatedValue30_g1448 + DetailMotionVO73_g1448 ), RotationAxis56_g1448, RotationAngle54_g1448 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g1445 = ( ( rotatedValue34_g1448 - VertexPos66_g1448 ) * step( 0.01 , VertexPos_Y67_g1448 ) );
				#else
				float3 staticSwitch205_g1445 = DM_VertexOffset128_g1445;
				#endif
				float3 LocalVertexOffset89_g1457 = staticSwitch205_g1445;
				float3 appendResult15_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1457, 1 ) ).xyz;
				float3 objToWorld102_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1457 = ( objToWorld98_g1457 - objToWorld102_g1457 );
				float3 appendResult24_g1457 = (float3(-break20_g1457.z , 0.0 , break20_g1457.x));
				float3 appendResult3_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1457, 1 ) ).xyz;
				float3 objToWorld106_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1457 = ( objToWorld100_g1457 - objToWorld106_g1457 );
				float3 break108_g1457 = temp_output_107_0_g1457;
				float3 lerpResult84_g1457 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1457 , step( 0.001 , ( abs( break108_g1457.x ) + abs( break108_g1457.z ) ) ));
				float3 normalizeResult7_g1457 = ASESafeNormalize( lerpResult84_g1457 );
				float dotResult9_g1457 = dot( normalizeResult7_g1457 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1457 = acos( dotResult9_g1457 );
				float NaNPrevention21_g1457 = step( 0.01 , abs( ( temp_output_12_0_g1457 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1457 = lerp( float3( 1, 0, 0 ) , appendResult24_g1457 , NaNPrevention21_g1457);
				float3 worldToObj99_g1457 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1457, 1 ) ).xyz;
				float3 worldToObj105_g1457 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1457 = normalize( ( worldToObj99_g1457 - worldToObj105_g1457 ) );
				float3 RotationAxis30_g1457 = normalizeResult49_g1457;
				float4 WorldSpaceNoise126_g1457 = temp_output_73_0_g1445;
				float SlopeCorrectionOffset120_g1457 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1457 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1457 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1457).x - 0.0 ) * ( SlopeCorrectionOffset120_g1457 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1457 ) ) * temp_output_12_0_g1457 );
				float3 appendResult28_g1458 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 rotatedValue35_g1457 = RotateAroundAxis( -appendResult28_g1458, ( input.positionOS.xyz + LocalVertexOffset89_g1457 ), RotationAxis30_g1457, RotationAngle29_g1457 );
				float3 lerpResult52_g1457 = lerp( LocalVertexOffset89_g1457 , ( rotatedValue35_g1457 - input.positionOS.xyz ) , NaNPrevention21_g1457);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1457 = lerpResult52_g1457;
				#else
				float3 staticSwitch123_g1457 = LocalVertexOffset89_g1457;
				#endif
				float3 appendResult28_g1472 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g1469 = -appendResult28_g1472;
				float3 temp_output_5_0_g1469 = ( ( staticSwitch123_g1457 + input.positionOS.xyz ) - Scale_Pivot15_g1469 );
				float ScaleVartMin40_g1469 = _ScaleVarMin;
				float ScaleVarMax41_g1469 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1469 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1469 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1471 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1469, 1 ) ).xyz;
				float2 appendResult10_g1471 = (float2(objToWorld11_g1471.x , objToWorld11_g1471.z));
				float2 Scale_WorldSpaceUVs30_g1469 = appendResult10_g1471;
				float Scale_VarNoiseTiling23_g1469 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1469 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1469 * Scale_VarNoiseTiling23_g1469 ), 0, 0.0) );
				float smoothstepResult56_g1469 = smoothstep( ScaleNoiseSharpnessMin59_g1469 , ScaleNoiseSharpnessMax60_g1469 , (Scale_WorldSpaceNoise32_g1469).r);
				float lerpResult44_g1469 = lerp( ScaleVartMin40_g1469 , ScaleVarMax41_g1469 , smoothstepResult56_g1469);
				float ScaleVar47_g1469 = lerpResult44_g1469;
				float clampResult63_g1469 = clamp( ( ScaleVar47_g1469 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1469 = ( temp_output_5_0_g1469 * clampResult63_g1469 );
				#else
				float3 staticSwitch72_g1469 = temp_output_5_0_g1469;
				#endif
				float ScaleOffset19_g1469 = _ScaleOffset;
				float clampResult64_g1469 = clamp( ( ScaleOffset19_g1469 + 1.0 ) , 0.0 , 7.0 );
				
				float2 TerrainPosition56_g1474 = ( Nicrom_TerrainPosition + float2( 1,1 ) );
				float2 TerrainPosition4_g1478 = TerrainPosition56_g1474;
				float TerrainSize55_g1474 = Nicrom_TerrainSize;
				float TerrainSize2_g1478 = TerrainSize55_g1474;
				float3 appendResult28_g1475 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot_Color15_g1474 = -appendResult28_g1475;
				float3 objToWorld11_g1477 = mul( GetObjectToWorldMatrix(), float4( LocalPivot_Color15_g1474, 1 ) ).xyz;
				float2 appendResult10_g1477 = (float2(objToWorld11_g1477.x , objToWorld11_g1477.z));
				float4 vertexToFrag19_g1478 = tex2Dlod( Nicrom_TerrainColorMap, float4( ( ( ( 1.0 - TerrainPosition4_g1478 ) / TerrainSize2_g1478 ) + ( ( TerrainSize2_g1478 / ( TerrainSize2_g1478 * TerrainSize2_g1478 ) ) * appendResult10_g1477 ) ), 0, 0.0) );
				output.ase_texcoord2 = vertexToFrag19_g1478;
				float vertexToFrag230_g1474 = input.positionOS.xyz.y;
				output.ase_texcoord3.x = vertexToFrag230_g1474;
				#ifdef _SCALEVARIATION_ON
				float staticSwitch73_g1469 = smoothstepResult56_g1469;
				#else
				float staticSwitch73_g1469 = 0.0;
				#endif
				float vertexToFrag71_g1469 = staticSwitch73_g1469;
				output.ase_texcoord3.y = vertexToFrag71_g1469;
				
				float3 customSurfaceDepth3_g1479 = input.positionOS.xyz;
				float customEye3_g1479 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1479)).z;
				output.ase_texcoord3.z = customEye3_g1479;
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				output.ase_texcoord1.zw = input.ase_texcoord1.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1469 * clampResult64_g1469 ) + Scale_Pivot15_g1469 ) - input.positionOS.xyz );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.ase_texcoord2 = input.ase_texcoord2;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord = TransformWorldToShadowCoord(input.positionWS);
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( input.positionWS );
				float4 ShadowCoord = shadowCoord;

				float Debug_Target203_g1474 = _Debug;
				float3 FlowerColor1B66_g1474 = _FlowerColor1B;
				float3 FlowerColor1A65_g1474 = _FlowerColor1A;
				float2 uv_ColorMask1 = input.ase_texcoord1.xy * _ColorMask1_ST.xy + _ColorMask1_ST.zw;
				float4 tex2DNode31_g1474 = tex2D( _ColorMask1, uv_ColorMask1 );
				float ColorMask1_R37_g1474 = tex2DNode31_g1474.r;
				float3 lerpResult87_g1474 = lerp( FlowerColor1B66_g1474 , FlowerColor1A65_g1474 , ColorMask1_R37_g1474);
				float3 FlowerColor1_F197_g1474 = lerpResult87_g1474;
				float3 FlowerColor2B68_g1474 = _FlowerColor2B;
				float3 FlowerColor2A67_g1474 = _FlowerColor2A;
				float3 lerpResult88_g1474 = lerp( FlowerColor2B68_g1474 , FlowerColor2A67_g1474 , ColorMask1_R37_g1474);
				float3 FlowerColor2_F198_g1474 = lerpResult88_g1474;
				float CM2_GVToggle213_g1474 = _ColorMask2GV;
				float lerpResult219_g1474 = lerp( _ColorMask2SharpMin , Nicrom_Flower_CM2_SharpMin , CM2_GVToggle213_g1474);
				float ColorMask2SharpMin98_g1474 = lerpResult219_g1474;
				float lerpResult221_g1474 = lerp( _ColorMask2SharpMax , Nicrom_Flower_CM2_SharpMax , CM2_GVToggle213_g1474);
				float ColorMask2SharpMax92_g1474 = lerpResult221_g1474;
				float3 appendResult28_g1475 = (float3(input.ase_texcoord1.zw.x , 0.0 , input.ase_texcoord1.zw.y));
				float3 LocalPivot_Color15_g1474 = -appendResult28_g1475;
				float3 objToWorld11_g1476 = mul( GetObjectToWorldMatrix(), float4( LocalPivot_Color15_g1474, 1 ) ).xyz;
				float2 appendResult10_g1476 = (float2(objToWorld11_g1476.x , objToWorld11_g1476.z));
				float lerpResult215_g1474 = lerp( _ColorMask2Tiling , Nicrom_Flower_CM2_Tilling , CM2_GVToggle213_g1474);
				float ColorMask2Tiling21_g1474 = lerpResult215_g1474;
				float2 WorldSpaceUVs187_g1474 = ( appendResult10_g1476 * ColorMask2Tiling21_g1474 );
				float4 tex2DNode43_g1474 = tex2D( _ColorMask2, WorldSpaceUVs187_g1474 );
				float ColorMask2Noise78_g1474 = tex2DNode43_g1474.r;
				float smoothstepResult119_g1474 = smoothstep( ColorMask2SharpMin98_g1474 , ColorMask2SharpMax92_g1474 , ColorMask2Noise78_g1474);
				float ColorMask2Opacity122_g1474 = _ColorMask2Opacity;
				float lerpResult126_g1474 = lerp( 0.0 , smoothstepResult119_g1474 , ColorMask2Opacity122_g1474);
				float ColorMask2_F184_g1474 = lerpResult126_g1474;
				float3 lerpResult130_g1474 = lerp( FlowerColor1_F197_g1474 , FlowerColor2_F198_g1474 , ColorMask2_F184_g1474);
				#if defined( _FLOWERCOLORS_TWO )
				float3 staticSwitch196_g1474 = FlowerColor1_F197_g1474;
				#elif defined( _FLOWERCOLORS_FOUR )
				float3 staticSwitch196_g1474 = lerpResult130_g1474;
				#else
				float3 staticSwitch196_g1474 = FlowerColor1_F197_g1474;
				#endif
				float3 FlowerColor134_g1474 = staticSwitch196_g1474;
				float3 StemColorBottom93_g1474 = _StemColorBottom;
				float4 vertexToFrag19_g1478 = input.ase_texcoord2;
				float4 TerrainColor86_g1474 = vertexToFrag19_g1478;
				float TerrainBlendBottom97_g1474 = _BWTBottom;
				float IsTerrainAlbedoAssigned181_g1474 = step( 8.0 , Nicrom_TerrainColorMap_TexelSize.z );
				float lerpResult176_g1474 = lerp( 0.0 , TerrainBlendBottom97_g1474 , IsTerrainAlbedoAssigned181_g1474);
				float TerrainBlendBottom_F179_g1474 = lerpResult176_g1474;
				float4 lerpResult114_g1474 = lerp( float4( StemColorBottom93_g1474 , 0.0 ) , TerrainColor86_g1474 , TerrainBlendBottom_F179_g1474);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch124_g1474 = lerpResult114_g1474;
				#else
				float4 staticSwitch124_g1474 = float4( StemColorBottom93_g1474 , 0.0 );
				#endif
				float3 StemColorTop91_g1474 = _StemColorTop;
				float TerrainBlendTop96_g1474 = _BWTTop;
				float lerpResult177_g1474 = lerp( 0.0 , TerrainBlendTop96_g1474 , IsTerrainAlbedoAssigned181_g1474);
				float TerrainBlendTop_F178_g1474 = lerpResult177_g1474;
				float4 lerpResult115_g1474 = lerp( float4( StemColorTop91_g1474 , 0.0 ) , TerrainColor86_g1474 , TerrainBlendTop_F178_g1474);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch123_g1474 = lerpResult115_g1474;
				#else
				float4 staticSwitch123_g1474 = float4( StemColorTop91_g1474 , 0.0 );
				#endif
				float StemColorMaskStart112_g1474 = _StemColorMaskStart;
				float StemColorMaskEnd113_g1474 = _StemColorMaskEnd;
				float vertexToFrag230_g1474 = input.ase_texcoord3.x;
				float VertexPos_Y231_g1474 = vertexToFrag230_g1474;
				float smoothstepResult125_g1474 = smoothstep( StemColorMaskStart112_g1474 , StemColorMaskEnd113_g1474 , VertexPos_Y231_g1474);
				float4 lerpResult129_g1474 = lerp( staticSwitch124_g1474 , staticSwitch123_g1474 , smoothstepResult125_g1474);
				float4 StemColor133_g1474 = lerpResult129_g1474;
				float ColorMask1_G183_g1474 = tex2DNode31_g1474.g;
				float4 lerpResult149_g1474 = lerp( float4( FlowerColor134_g1474 , 0.0 ) , StemColor133_g1474 , ColorMask1_G183_g1474);
				float FlowerStemToggle145_g1474 = _STEM;
				float4 lerpResult158_g1474 = lerp( float4( FlowerColor134_g1474 , 0.0 ) , lerpResult149_g1474 , FlowerStemToggle145_g1474);
				float2 uv_Albedo137_g1474 = input.ase_texcoord1.xy;
				float4 tex2DNode137_g1474 = tex2D( _Albedo, uv_Albedo137_g1474 );
				float4 AlbedoTex144_g1474 = tex2DNode137_g1474;
				float4 Albedo203_g1474 = ( lerpResult158_g1474 * AlbedoTex144_g1474 );
				float ColorMask1R203_g1474 = ColorMask1_R37_g1474;
				float ColorMask1G203_g1474 = ColorMask1_G183_g1474;
				#if defined( _FLOWERCOLORS_TWO )
				float staticSwitch208_g1474 = 0.0;
				#elif defined( _FLOWERCOLORS_FOUR )
				float staticSwitch208_g1474 = ColorMask2_F184_g1474;
				#else
				float staticSwitch208_g1474 = 0.0;
				#endif
				float ColorMask2203_g1474 = staticSwitch208_g1474;
				float vertexToFrag71_g1469 = input.ase_texcoord3.y;
				float ScaleVarNoise2237 = vertexToFrag71_g1469;
				float ScaleVarNoise203_g1474 = ScaleVarNoise2237;
				float4 localDebug203_g1474 = Debug203_g1474( Debug_Target203_g1474 , Albedo203_g1474 , ColorMask1R203_g1474 , ColorMask1G203_g1474 , ColorMask2203_g1474 , ScaleVarNoise203_g1474 );
				
				float temp_output_31_0_g1479 = tex2DNode137_g1474.a;
				float DF_Length_Local38_g1479 = _DistanceFadeLength;
				float DF_Length_Global45_g1479 = Nicrom_Flower_DF_Length;
				float DF_Start_Global43_g1479 = Nicrom_Flower_DF_Start;
				float lerpResult49_g1479 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1479 ));
				float DF_UseGV28_g1479 = lerpResult49_g1479;
				float lerpResult26_g1479 = lerp( DF_Length_Local38_g1479 , DF_Length_Global45_g1479 , DF_UseGV28_g1479);
				float DistanceFadeLength23_g1479 = lerpResult26_g1479;
				float DF_Start_Local36_g1479 = _DistanceFadeStart;
				float lerpResult20_g1479 = lerp( DF_Start_Local36_g1479 , DF_Start_Global43_g1479 , DF_UseGV28_g1479);
				float DistanceFadeStart27_g1479 = lerpResult20_g1479;
				float customEye3_g1479 = input.ase_texcoord3.z;
				float cameraDepthFade3_g1479 = (( customEye3_g1479 -_ProjectionParams.y - DistanceFadeStart27_g1479 ) / DistanceFadeLength23_g1479);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1479 = ( temp_output_31_0_g1479 * saturate( ( 1.0 - cameraDepthFade3_g1479 ) ) );
				#else
				float staticSwitch33_g1479 = temp_output_31_0_g1479;
				#endif
				

				float3 BaseColor = localDebug203_g1474.xyz;
				float Alpha = staticSwitch33_g1479;
				float AlphaClipThreshold = _AlphaCutoff;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#pragma multi_compile_local _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_VERSION 19901
			#define ASE_SRP_VERSION 170003


			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY
			//#define SHADERPASS SHADERPASS_DEPTHNORMALS

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _DISTANCEFADE_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				half4 tangentWS : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 Nicrom_TerrainColorMap_TexelSize;
			float4 _ColorMask1_ST;
			float3 _FlowerColor1B;
			float3 _StemColorTop;
			float3 _FlowerColor1A;
			float3 _StemColorBottom;
			float3 _FlowerColor2B;
			float3 _FlowerColor2A;
			half _GVBendingScale;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ScaleVarMax;
			float _ColorMask2Tiling;
			float _ColorMask2Opacity;
			float _BWTBottom;
			float _BWTTop;
			float _StemColorMaskStart;
			float _StemColorMaskEnd;
			float _STEM;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _ScaleVarMin;
			float _SlopeCorrectionOffset;
			float _DM1Amplitude;
			float _GVTime;
			float _DM1Speed;
			float _DM1FoliageLength;
			float _DM2Amplitude;
			float _DM2Speed;
			float _DM2ObjectRadius;
			half _MMDirectionAngle;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _MotionNoiseTiling;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVAmplitudeScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionMagnitude;
			float _AlphaCutoff;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float Nicrom_DM_AmpScale_Flower;
			float Nicrom_DM_Time_Flower;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Flower;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Flower;
			float Nicrom_MM_SpeedScale_Flower;
			float Nicrom_MM_BendScale_Flowers;
			float Nicrom_MM_AmpScale_Flower;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;
			float Nicrom_Flower_DF_Length;
			float Nicrom_Flower_DF_Start;


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g1447 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g1447 = (float3(cos( temp_output_23_0_g1447 ) , 0.0 , sin( temp_output_23_0_g1447 )));
				float3 DB_RotationAxis87_g1445 = appendResult25_g1447;
				float GV_AmplitudeScale175_g1445 = _GVBendingScale;
				float lerpResult186_g1445 = lerp( 1.0 , Nicrom_DM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float DM_AmplitudeScale168_g1445 = lerpResult186_g1445;
				float DM1_Amplitude28_g1445 = _DM1Amplitude;
				float3 objToWorld80_g1455 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g1445 = _GVTime;
				float lerpResult187_g1445 = lerp( _TimeParameters.x , Nicrom_DM_Time_Flower , GV_Time174_g1445);
				float ApplicationIsPlaying241_g1445 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g1445 = lerp( _TimeParameters.x , lerpResult187_g1445 , ApplicationIsPlaying241_g1445);
				float DM_Time169_g1445 = lerpResult256_g1445;
				float Time90_g1455 = DM_Time169_g1445;
				float DM1_Speed29_g1445 = _DM1Speed;
				float Speed45_g1455 = DM1_Speed29_g1445;
				float temp_output_244_0_g1445 = Nicrom_DM_SpeedScale_Flower;
				float lerpResult261_g1445 = lerp( temp_output_244_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult262_g1445 = lerp( temp_output_244_0_g1445 , lerpResult261_g1445 , ApplicationIsPlaying241_g1445);
				float DM_SpeedScale265_g1445 = lerpResult262_g1445;
				float SpeedScale95_g1455 = DM_SpeedScale265_g1445;
				float DM_PhaseShift91_g1445 = input.ase_color.a;
				float PhaseShift48_g1455 = DM_PhaseShift91_g1445;
				float3 appendResult24_g1447 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g1445 = appendResult24_g1447;
				float3 PivotPosOnYAxis56_g1455 = DM_PivotPosOnYAxis88_g1445;
				float DM1_FoliageLength32_g1445 = _DM1FoliageLength;
				float3 rotatedValue29_g1455 = RotateAroundAxis( PivotPosOnYAxis56_g1455, input.positionOS.xyz, DB_RotationAxis87_g1445, radians( ( ( ( DM_AmplitudeScale168_g1445 * DM1_Amplitude28_g1445 ) * sin( ( ( ( objToWorld80_g1455.x + objToWorld80_g1455.z ) + ( ( Time90_g1455 * ( Speed45_g1455 * SpeedScale95_g1455 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g1455 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g1455 ) / DM1_FoliageLength32_g1445 ) ) ) );
				float DM1_MotionMask89_g1445 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g1445 = ( ( rotatedValue29_g1455 - input.positionOS.xyz ) * DM1_MotionMask89_g1445 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g1445 = DM1_VertexOffset231_g1445;
				#else
				float3 staticSwitch104_g1445 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g1445 = _DM2Amplitude;
				float Amplitude58_g1456 = DM2_Amplitude30_g1445;
				float3 appendResult28_g1444 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot159_g1445 = -appendResult28_g1444;
				float3 PivotPoint49_g1456 = LocalPivot159_g1445;
				float3 objToWorld53_g1456 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g1456, 1 ) ).xyz;
				float Time87_g1456 = DM_Time169_g1445;
				float SpeedScale93_g1456 = DM_SpeedScale265_g1445;
				float DM2_Speed31_g1445 = _DM2Speed;
				float Speed41_g1456 = DM2_Speed31_g1445;
				float PhaseShift54_g1456 = DM_PhaseShift91_g1445;
				float3 break52_g1456 = PivotPoint49_g1456;
				float3 appendResult20_g1456 = (float3(break52_g1456.x , input.positionOS.xyz.y , break52_g1456.z));
				float DM2_ObjectRadius33_g1445 = _DM2ObjectRadius;
				float ObjectRadius60_g1456 = DM2_ObjectRadius33_g1445;
				float3 rotatedValue33_g1456 = RotateAroundAxis( PivotPoint49_g1456, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g1445 * Amplitude58_g1456 ) * sin( ( ( ( objToWorld53_g1456.x + objToWorld53_g1456.z ) + ( ( Time87_g1456 * ( SpeedScale93_g1456 * Speed41_g1456 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g1456 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g1456 ) / ObjectRadius60_g1456 ) ) ) );
				float DM2_MotionMask90_g1445 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g1456 = DM2_MotionMask90_g1445;
				float3 DM2_VertexOffset232_g1445 = ( ( rotatedValue33_g1456 - input.positionOS.xyz ) * BendingMask62_g1456 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g1445 = DM2_VertexOffset232_g1445;
				#else
				float3 staticSwitch103_g1445 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g1445 = ( staticSwitch104_g1445 + staticSwitch103_g1445 );
				float lerpResult56_g1453 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g1445 = lerpResult56_g1453;
				float MM_DirShift59_g1445 = _MMDirectionShift;
				float MM_DirShiftOffset60_g1445 = _MMDirectionShiftOffset;
				float3 objToWorld11_g1450 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float2 appendResult10_g1450 = (float2(objToWorld11_g1450.x , objToWorld11_g1450.z));
				float MotionNoiseTiling20_g1445 = _MotionNoiseTiling;
				float4 temp_output_73_0_g1445 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g1450 * MotionNoiseTiling20_g1445 ), 0, 0.0) );
				float4 StaticWorldNoise78_g1445 = temp_output_73_0_g1445;
				float4 StaticWorldNoise55_g1449 = StaticWorldNoise78_g1445;
				float3 objToWorld50_g1449 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float lerpResult182_g1445 = lerp( _TimeParameters.x , Nicrom_MM_Time_Flower , GV_Time174_g1445);
				float lerpResult246_g1445 = lerp( _TimeParameters.x , lerpResult182_g1445 , ApplicationIsPlaying241_g1445);
				float MM_Time13_g1445 = lerpResult246_g1445;
				float Time76_g1449 = MM_Time13_g1445;
				float temp_output_243_0_g1445 = Nicrom_MM_SpeedScale_Flower;
				float lerpResult245_g1445 = lerp( temp_output_243_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult249_g1445 = lerp( temp_output_243_0_g1445 , lerpResult245_g1445 , ApplicationIsPlaying241_g1445);
				float MM_SpeedScale253_g1445 = lerpResult249_g1445;
				float SpeedScale_RA80_g1449 = MM_SpeedScale253_g1445;
				float MM_DirShiftSpeed56_g1445 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g1445 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1449 = radians( ( ( MM_DirAngle51_g1445 + ( ( MM_DirShift59_g1445 + ( MM_DirShiftOffset60_g1445 * (StaticWorldNoise55_g1449).x ) ) * sin( ( ( objToWorld50_g1449.x + objToWorld50_g1449.z ) + ( ( Time76_g1449 * ( SpeedScale_RA80_g1449 * MM_DirShiftSpeed56_g1445 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1449).z * MM_DirShiftNoiseScale57_g1445 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1449 = (float3(cos( temp_output_11_0_g1449 ) , 0.0 , sin( temp_output_11_0_g1449 )));
				float3 worldToObj35_g1449 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1449, 1 ) ).xyz;
				float3 worldToObj36_g1449 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1449 = normalize( (( worldToObj35_g1449 - worldToObj36_g1449 )).xyz );
				float3 MB_RotationAxis129_g1445 = normalizeResult34_g1449;
				float3 RotationAxis56_g1448 = MB_RotationAxis129_g1445;
				float4 StaticWorldNoise31_g1454 = StaticWorldNoise78_g1445;
				float MM_BendingOfset37_g1445 = _MMBendingOffset;
				float MM_Bending35_g1445 = _MMBending;
				float GV_BendingScale176_g1445 = _GVAmplitudeScale;
				float lerpResult188_g1445 = lerp( 1.0 , Nicrom_MM_BendScale_Flowers , GV_BendingScale176_g1445);
				float MM_BendingScale17_g1445 = lerpResult188_g1445;
				float MM_AmplitudeOffset52_g1445 = _MMAmplitudeOffset;
				float MM_Amplitude66_g1445 = _MMAmplitude;
				float lerpResult189_g1445 = lerp( 1.0 , Nicrom_MM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float MM_AmplitudeScale15_g1445 = lerpResult189_g1445;
				float3 objToWorld170_g1454 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1454 = MM_Time13_g1445;
				float MM_Speed53_g1445 = _MMSpeed;
				float Speed125_g1454 = MM_Speed53_g1445;
				float SpeedScale_RotAng201_g1454 = MM_SpeedScale253_g1445;
				float MM_SineWaveLength58_g1445 = _MMSineWaveLength;
				float WaveLength63_g1454 = MM_SineWaveLength58_g1445;
				float MM_PhaseShiftSource207_g1445 = _MMPhaseShiftSource;
				float lerpResult154_g1445 = lerp( input.ase_color.a , (StaticWorldNoise78_g1445).g , MM_PhaseShiftSource207_g1445);
				float MM_PhaseShiftScale39_g1445 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g1445 = ( lerpResult154_g1445 * MM_PhaseShiftScale39_g1445 );
				float PhaseShift127_g1454 = MB_PhaseShift79_g1445;
				float temp_output_20_0_g1454 = sin( ( ( ( objToWorld170_g1454.x + objToWorld170_g1454.z ) + ( ( Time167_g1454 * ( ( Speed125_g1454 * SpeedScale_RotAng201_g1454 ) * WaveLength63_g1454 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1454 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1454 ) ) );
				float MM_MaxHeight55_g1445 = _MMObjectHeight;
				float3 gammaToLinear56_g1454 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g1445 = _MMObjectHeightSource;
				float lerpResult57_g1454 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g1445 ) , (gammaToLinear56_g1454).x , MM_ObjectHeightSource54_g1445);
				float BendingMask189_g1454 = lerpResult57_g1454;
				float MB_RotationAngle130_g1445 = radians( ( ( ( ( ( (StaticWorldNoise31_g1454).y * MM_BendingOfset37_g1445 ) + MM_Bending35_g1445 ) * MM_BendingScale17_g1445 ) + ( ( ( ( (StaticWorldNoise31_g1454).x * MM_AmplitudeOffset52_g1445 ) + MM_Amplitude66_g1445 ) * MM_AmplitudeScale15_g1445 ) * temp_output_20_0_g1454 ) ) * BendingMask189_g1454 ) );
				float RotationAngle54_g1448 = MB_RotationAngle130_g1445;
				float3 LocalPivotPos60_g1448 = LocalPivot159_g1445;
				float3 break62_g1448 = LocalPivotPos60_g1448;
				float VertexPos_Y67_g1448 = input.positionOS.xyz.y;
				float3 appendResult45_g1448 = (float3(break62_g1448.x , VertexPos_Y67_g1448 , break62_g1448.z));
				float3 VertexPos66_g1448 = input.positionOS.xyz;
				float3 rotatedValue30_g1448 = RotateAroundAxis( appendResult45_g1448, VertexPos66_g1448, RotationAxis56_g1448, RotationAngle54_g1448 );
				float3 DetailMotionVO73_g1448 = DM_VertexOffset128_g1445;
				float3 rotatedValue34_g1448 = RotateAroundAxis( LocalPivotPos60_g1448, ( rotatedValue30_g1448 + DetailMotionVO73_g1448 ), RotationAxis56_g1448, RotationAngle54_g1448 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g1445 = ( ( rotatedValue34_g1448 - VertexPos66_g1448 ) * step( 0.01 , VertexPos_Y67_g1448 ) );
				#else
				float3 staticSwitch205_g1445 = DM_VertexOffset128_g1445;
				#endif
				float3 LocalVertexOffset89_g1457 = staticSwitch205_g1445;
				float3 appendResult15_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1457, 1 ) ).xyz;
				float3 objToWorld102_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1457 = ( objToWorld98_g1457 - objToWorld102_g1457 );
				float3 appendResult24_g1457 = (float3(-break20_g1457.z , 0.0 , break20_g1457.x));
				float3 appendResult3_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1457, 1 ) ).xyz;
				float3 objToWorld106_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1457 = ( objToWorld100_g1457 - objToWorld106_g1457 );
				float3 break108_g1457 = temp_output_107_0_g1457;
				float3 lerpResult84_g1457 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1457 , step( 0.001 , ( abs( break108_g1457.x ) + abs( break108_g1457.z ) ) ));
				float3 normalizeResult7_g1457 = ASESafeNormalize( lerpResult84_g1457 );
				float dotResult9_g1457 = dot( normalizeResult7_g1457 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1457 = acos( dotResult9_g1457 );
				float NaNPrevention21_g1457 = step( 0.01 , abs( ( temp_output_12_0_g1457 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1457 = lerp( float3( 1, 0, 0 ) , appendResult24_g1457 , NaNPrevention21_g1457);
				float3 worldToObj99_g1457 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1457, 1 ) ).xyz;
				float3 worldToObj105_g1457 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1457 = normalize( ( worldToObj99_g1457 - worldToObj105_g1457 ) );
				float3 RotationAxis30_g1457 = normalizeResult49_g1457;
				float4 WorldSpaceNoise126_g1457 = temp_output_73_0_g1445;
				float SlopeCorrectionOffset120_g1457 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1457 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1457 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1457).x - 0.0 ) * ( SlopeCorrectionOffset120_g1457 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1457 ) ) * temp_output_12_0_g1457 );
				float3 appendResult28_g1458 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 rotatedValue35_g1457 = RotateAroundAxis( -appendResult28_g1458, ( input.positionOS.xyz + LocalVertexOffset89_g1457 ), RotationAxis30_g1457, RotationAngle29_g1457 );
				float3 lerpResult52_g1457 = lerp( LocalVertexOffset89_g1457 , ( rotatedValue35_g1457 - input.positionOS.xyz ) , NaNPrevention21_g1457);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1457 = lerpResult52_g1457;
				#else
				float3 staticSwitch123_g1457 = LocalVertexOffset89_g1457;
				#endif
				float3 appendResult28_g1472 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g1469 = -appendResult28_g1472;
				float3 temp_output_5_0_g1469 = ( ( staticSwitch123_g1457 + input.positionOS.xyz ) - Scale_Pivot15_g1469 );
				float ScaleVartMin40_g1469 = _ScaleVarMin;
				float ScaleVarMax41_g1469 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1469 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1469 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1471 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1469, 1 ) ).xyz;
				float2 appendResult10_g1471 = (float2(objToWorld11_g1471.x , objToWorld11_g1471.z));
				float2 Scale_WorldSpaceUVs30_g1469 = appendResult10_g1471;
				float Scale_VarNoiseTiling23_g1469 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1469 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1469 * Scale_VarNoiseTiling23_g1469 ), 0, 0.0) );
				float smoothstepResult56_g1469 = smoothstep( ScaleNoiseSharpnessMin59_g1469 , ScaleNoiseSharpnessMax60_g1469 , (Scale_WorldSpaceNoise32_g1469).r);
				float lerpResult44_g1469 = lerp( ScaleVartMin40_g1469 , ScaleVarMax41_g1469 , smoothstepResult56_g1469);
				float ScaleVar47_g1469 = lerpResult44_g1469;
				float clampResult63_g1469 = clamp( ( ScaleVar47_g1469 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1469 = ( temp_output_5_0_g1469 * clampResult63_g1469 );
				#else
				float3 staticSwitch72_g1469 = temp_output_5_0_g1469;
				#endif
				float ScaleOffset19_g1469 = _ScaleOffset;
				float clampResult64_g1469 = clamp( ( ScaleOffset19_g1469 + 1.0 ) , 0.0 , 7.0 );
				
				float3 customSurfaceDepth3_g1479 = input.positionOS.xyz;
				float customEye3_g1479 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1479)).z;
				output.ase_texcoord3.z = customEye3_g1479;
				
				output.ase_texcoord3.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1469 * clampResult64_g1469 ) + Scale_Pivot15_g1469 ) - input.positionOS.xyz );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( input.normalOS, input.tangentOS );

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				output.normalWS = normalInput.normalWS;
				output.tangentWS = float4( normalInput.tangentWS, ( input.tangentOS.w > 0.0 ? 1.0 : -1.0 ) * GetOddNegativeScale() );
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.ase_texcoord2 = input.ase_texcoord2;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			void frag(	PackedVaryings input
						, out half4 outNormalWS : SV_Target0
						#if defined( ASE_DEPTH_WRITE_ON )
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 )
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord = TransformWorldToShadowCoord(input.positionWS);
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				// @diogo: mikktspace compliant
				float renormFactor = 1.0 / max( FLT_MIN, length( input.normalWS ) );

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( input.positionWS );
				float4 ShadowCoord = shadowCoord;
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );
				float3 TangentWS = input.tangentWS.xyz * renormFactor;
				float3 BitangentWS = cross( input.normalWS, input.tangentWS.xyz ) * input.tangentWS.w * renormFactor;
				float3 NormalWS = input.normalWS * renormFactor;

				float2 uv_Albedo137_g1474 = input.ase_texcoord3.xy;
				float4 tex2DNode137_g1474 = tex2D( _Albedo, uv_Albedo137_g1474 );
				float temp_output_31_0_g1479 = tex2DNode137_g1474.a;
				float DF_Length_Local38_g1479 = _DistanceFadeLength;
				float DF_Length_Global45_g1479 = Nicrom_Flower_DF_Length;
				float DF_Start_Global43_g1479 = Nicrom_Flower_DF_Start;
				float lerpResult49_g1479 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1479 ));
				float DF_UseGV28_g1479 = lerpResult49_g1479;
				float lerpResult26_g1479 = lerp( DF_Length_Local38_g1479 , DF_Length_Global45_g1479 , DF_UseGV28_g1479);
				float DistanceFadeLength23_g1479 = lerpResult26_g1479;
				float DF_Start_Local36_g1479 = _DistanceFadeStart;
				float lerpResult20_g1479 = lerp( DF_Start_Local36_g1479 , DF_Start_Global43_g1479 , DF_UseGV28_g1479);
				float DistanceFadeStart27_g1479 = lerpResult20_g1479;
				float customEye3_g1479 = input.ase_texcoord3.z;
				float cameraDepthFade3_g1479 = (( customEye3_g1479 -_ProjectionParams.y - DistanceFadeStart27_g1479 ) / DistanceFadeLength23_g1479);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1479 = ( temp_output_31_0_g1479 * saturate( ( 1.0 - cameraDepthFade3_g1479 ) ) );
				#else
				float staticSwitch33_g1479 = temp_output_31_0_g1479;
				#endif
				

				float3 Normal = float3(0, 0, 1);
				float Alpha = staticSwitch33_g1479;
				float AlphaClipThreshold = _AlphaCutoff;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(NormalWS);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(TangentWS, BitangentWS, NormalWS));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = NormalWS;
					#endif
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4(EncodeMeshRenderingLayer(renderingLayers), 0, 0, 0);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			#pragma multi_compile_local _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_VERSION 19901
			#define ASE_SRP_VERSION 170003


			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ USE_LEGACY_LIGHTMAPS
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_GBUFFER

			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ProbeVolumeVariants.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _FLOWERCOLORS_TWO _FLOWERCOLORS_FOUR
			#pragma shader_feature_local _BLENDWITHTERRAIN_ON
			#pragma shader_feature_local _DISTANCEFADE_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					float4 texcoord1 : TEXCOORD1;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					float4 texcoord2 : TEXCOORD2;
				#endif
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				half3 normalWS : TEXCOORD1;
				half4 tangentWS : TEXCOORD2;
				float4 lightmapUVOrVertexSH : TEXCOORD3;
				#if defined(ASE_FOG) || defined(_ADDITIONAL_LIGHTS_VERTEX)
					half4 fogFactorAndVertexLight : TEXCOORD4;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD5;
				#endif
				#if defined(USE_APV_PROBE_OCCLUSION)
					float4 probeOcclusion : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 Nicrom_TerrainColorMap_TexelSize;
			float4 _ColorMask1_ST;
			float3 _FlowerColor1B;
			float3 _StemColorTop;
			float3 _FlowerColor1A;
			float3 _StemColorBottom;
			float3 _FlowerColor2B;
			float3 _FlowerColor2A;
			half _GVBendingScale;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ScaleVarMax;
			float _ColorMask2Tiling;
			float _ColorMask2Opacity;
			float _BWTBottom;
			float _BWTTop;
			float _StemColorMaskStart;
			float _StemColorMaskEnd;
			float _STEM;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _ScaleVarMin;
			float _SlopeCorrectionOffset;
			float _DM1Amplitude;
			float _GVTime;
			float _DM1Speed;
			float _DM1FoliageLength;
			float _DM2Amplitude;
			float _DM2Speed;
			float _DM2ObjectRadius;
			half _MMDirectionAngle;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _MotionNoiseTiling;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVAmplitudeScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionMagnitude;
			float _AlphaCutoff;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float Nicrom_DM_AmpScale_Flower;
			float Nicrom_DM_Time_Flower;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Flower;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Flower;
			float Nicrom_MM_SpeedScale_Flower;
			float Nicrom_MM_BendScale_Flowers;
			float Nicrom_MM_AmpScale_Flower;
			sampler2D _ScaleVarNoise;
			sampler2D _ColorMask1;
			float Nicrom_Flower_CM2_SharpMin;
			float Nicrom_Flower_CM2_SharpMax;
			sampler2D _ColorMask2;
			float Nicrom_Flower_CM2_Tilling;
			sampler2D Nicrom_TerrainColorMap;
			float2 Nicrom_TerrainPosition;
			float Nicrom_TerrainSize;
			sampler2D _Albedo;
			float Nicrom_Flower_DF_Length;
			float Nicrom_Flower_DF_Start;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			
			float4 Debug203_g1474( float Debug_Target, float4 Albedo, float ColorMask1R, float ColorMask1G, float ColorMask2, float ScaleVarNoise )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1R;
				else if(Debug_Target ==2)
				    return ColorMask1G;
				else if(Debug_Target ==3)
				    return ColorMask2;
				else
				    return ScaleVarNoise;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g1447 = radians( ( 90.0 + ( input.texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g1447 = (float3(cos( temp_output_23_0_g1447 ) , 0.0 , sin( temp_output_23_0_g1447 )));
				float3 DB_RotationAxis87_g1445 = appendResult25_g1447;
				float GV_AmplitudeScale175_g1445 = _GVBendingScale;
				float lerpResult186_g1445 = lerp( 1.0 , Nicrom_DM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float DM_AmplitudeScale168_g1445 = lerpResult186_g1445;
				float DM1_Amplitude28_g1445 = _DM1Amplitude;
				float3 objToWorld80_g1455 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g1445 = _GVTime;
				float lerpResult187_g1445 = lerp( _TimeParameters.x , Nicrom_DM_Time_Flower , GV_Time174_g1445);
				float ApplicationIsPlaying241_g1445 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g1445 = lerp( _TimeParameters.x , lerpResult187_g1445 , ApplicationIsPlaying241_g1445);
				float DM_Time169_g1445 = lerpResult256_g1445;
				float Time90_g1455 = DM_Time169_g1445;
				float DM1_Speed29_g1445 = _DM1Speed;
				float Speed45_g1455 = DM1_Speed29_g1445;
				float temp_output_244_0_g1445 = Nicrom_DM_SpeedScale_Flower;
				float lerpResult261_g1445 = lerp( temp_output_244_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult262_g1445 = lerp( temp_output_244_0_g1445 , lerpResult261_g1445 , ApplicationIsPlaying241_g1445);
				float DM_SpeedScale265_g1445 = lerpResult262_g1445;
				float SpeedScale95_g1455 = DM_SpeedScale265_g1445;
				float DM_PhaseShift91_g1445 = input.ase_color.a;
				float PhaseShift48_g1455 = DM_PhaseShift91_g1445;
				float3 appendResult24_g1447 = (float3(0.0 , input.texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g1445 = appendResult24_g1447;
				float3 PivotPosOnYAxis56_g1455 = DM_PivotPosOnYAxis88_g1445;
				float DM1_FoliageLength32_g1445 = _DM1FoliageLength;
				float3 rotatedValue29_g1455 = RotateAroundAxis( PivotPosOnYAxis56_g1455, input.positionOS.xyz, DB_RotationAxis87_g1445, radians( ( ( ( DM_AmplitudeScale168_g1445 * DM1_Amplitude28_g1445 ) * sin( ( ( ( objToWorld80_g1455.x + objToWorld80_g1455.z ) + ( ( Time90_g1455 * ( Speed45_g1455 * SpeedScale95_g1455 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g1455 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g1455 ) / DM1_FoliageLength32_g1445 ) ) ) );
				float DM1_MotionMask89_g1445 = step( 1.5 , input.texcoord.y );
				float3 DM1_VertexOffset231_g1445 = ( ( rotatedValue29_g1455 - input.positionOS.xyz ) * DM1_MotionMask89_g1445 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g1445 = DM1_VertexOffset231_g1445;
				#else
				float3 staticSwitch104_g1445 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g1445 = _DM2Amplitude;
				float Amplitude58_g1456 = DM2_Amplitude30_g1445;
				float3 appendResult28_g1444 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 LocalPivot159_g1445 = -appendResult28_g1444;
				float3 PivotPoint49_g1456 = LocalPivot159_g1445;
				float3 objToWorld53_g1456 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g1456, 1 ) ).xyz;
				float Time87_g1456 = DM_Time169_g1445;
				float SpeedScale93_g1456 = DM_SpeedScale265_g1445;
				float DM2_Speed31_g1445 = _DM2Speed;
				float Speed41_g1456 = DM2_Speed31_g1445;
				float PhaseShift54_g1456 = DM_PhaseShift91_g1445;
				float3 break52_g1456 = PivotPoint49_g1456;
				float3 appendResult20_g1456 = (float3(break52_g1456.x , input.positionOS.xyz.y , break52_g1456.z));
				float DM2_ObjectRadius33_g1445 = _DM2ObjectRadius;
				float ObjectRadius60_g1456 = DM2_ObjectRadius33_g1445;
				float3 rotatedValue33_g1456 = RotateAroundAxis( PivotPoint49_g1456, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g1445 * Amplitude58_g1456 ) * sin( ( ( ( objToWorld53_g1456.x + objToWorld53_g1456.z ) + ( ( Time87_g1456 * ( SpeedScale93_g1456 * Speed41_g1456 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g1456 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g1456 ) / ObjectRadius60_g1456 ) ) ) );
				float DM2_MotionMask90_g1445 = step( 1.5 , input.texcoord.x );
				float BendingMask62_g1456 = DM2_MotionMask90_g1445;
				float3 DM2_VertexOffset232_g1445 = ( ( rotatedValue33_g1456 - input.positionOS.xyz ) * BendingMask62_g1456 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g1445 = DM2_VertexOffset232_g1445;
				#else
				float3 staticSwitch103_g1445 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g1445 = ( staticSwitch104_g1445 + staticSwitch103_g1445 );
				float lerpResult56_g1453 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g1445 = lerpResult56_g1453;
				float MM_DirShift59_g1445 = _MMDirectionShift;
				float MM_DirShiftOffset60_g1445 = _MMDirectionShiftOffset;
				float3 objToWorld11_g1450 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float2 appendResult10_g1450 = (float2(objToWorld11_g1450.x , objToWorld11_g1450.z));
				float MotionNoiseTiling20_g1445 = _MotionNoiseTiling;
				float4 temp_output_73_0_g1445 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g1450 * MotionNoiseTiling20_g1445 ), 0, 0.0) );
				float4 StaticWorldNoise78_g1445 = temp_output_73_0_g1445;
				float4 StaticWorldNoise55_g1449 = StaticWorldNoise78_g1445;
				float3 objToWorld50_g1449 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float lerpResult182_g1445 = lerp( _TimeParameters.x , Nicrom_MM_Time_Flower , GV_Time174_g1445);
				float lerpResult246_g1445 = lerp( _TimeParameters.x , lerpResult182_g1445 , ApplicationIsPlaying241_g1445);
				float MM_Time13_g1445 = lerpResult246_g1445;
				float Time76_g1449 = MM_Time13_g1445;
				float temp_output_243_0_g1445 = Nicrom_MM_SpeedScale_Flower;
				float lerpResult245_g1445 = lerp( temp_output_243_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult249_g1445 = lerp( temp_output_243_0_g1445 , lerpResult245_g1445 , ApplicationIsPlaying241_g1445);
				float MM_SpeedScale253_g1445 = lerpResult249_g1445;
				float SpeedScale_RA80_g1449 = MM_SpeedScale253_g1445;
				float MM_DirShiftSpeed56_g1445 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g1445 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1449 = radians( ( ( MM_DirAngle51_g1445 + ( ( MM_DirShift59_g1445 + ( MM_DirShiftOffset60_g1445 * (StaticWorldNoise55_g1449).x ) ) * sin( ( ( objToWorld50_g1449.x + objToWorld50_g1449.z ) + ( ( Time76_g1449 * ( SpeedScale_RA80_g1449 * MM_DirShiftSpeed56_g1445 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1449).z * MM_DirShiftNoiseScale57_g1445 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1449 = (float3(cos( temp_output_11_0_g1449 ) , 0.0 , sin( temp_output_11_0_g1449 )));
				float3 worldToObj35_g1449 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1449, 1 ) ).xyz;
				float3 worldToObj36_g1449 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1449 = normalize( (( worldToObj35_g1449 - worldToObj36_g1449 )).xyz );
				float3 MB_RotationAxis129_g1445 = normalizeResult34_g1449;
				float3 RotationAxis56_g1448 = MB_RotationAxis129_g1445;
				float4 StaticWorldNoise31_g1454 = StaticWorldNoise78_g1445;
				float MM_BendingOfset37_g1445 = _MMBendingOffset;
				float MM_Bending35_g1445 = _MMBending;
				float GV_BendingScale176_g1445 = _GVAmplitudeScale;
				float lerpResult188_g1445 = lerp( 1.0 , Nicrom_MM_BendScale_Flowers , GV_BendingScale176_g1445);
				float MM_BendingScale17_g1445 = lerpResult188_g1445;
				float MM_AmplitudeOffset52_g1445 = _MMAmplitudeOffset;
				float MM_Amplitude66_g1445 = _MMAmplitude;
				float lerpResult189_g1445 = lerp( 1.0 , Nicrom_MM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float MM_AmplitudeScale15_g1445 = lerpResult189_g1445;
				float3 objToWorld170_g1454 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1454 = MM_Time13_g1445;
				float MM_Speed53_g1445 = _MMSpeed;
				float Speed125_g1454 = MM_Speed53_g1445;
				float SpeedScale_RotAng201_g1454 = MM_SpeedScale253_g1445;
				float MM_SineWaveLength58_g1445 = _MMSineWaveLength;
				float WaveLength63_g1454 = MM_SineWaveLength58_g1445;
				float MM_PhaseShiftSource207_g1445 = _MMPhaseShiftSource;
				float lerpResult154_g1445 = lerp( input.ase_color.a , (StaticWorldNoise78_g1445).g , MM_PhaseShiftSource207_g1445);
				float MM_PhaseShiftScale39_g1445 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g1445 = ( lerpResult154_g1445 * MM_PhaseShiftScale39_g1445 );
				float PhaseShift127_g1454 = MB_PhaseShift79_g1445;
				float temp_output_20_0_g1454 = sin( ( ( ( objToWorld170_g1454.x + objToWorld170_g1454.z ) + ( ( Time167_g1454 * ( ( Speed125_g1454 * SpeedScale_RotAng201_g1454 ) * WaveLength63_g1454 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1454 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1454 ) ) );
				float MM_MaxHeight55_g1445 = _MMObjectHeight;
				float3 gammaToLinear56_g1454 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g1445 = _MMObjectHeightSource;
				float lerpResult57_g1454 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g1445 ) , (gammaToLinear56_g1454).x , MM_ObjectHeightSource54_g1445);
				float BendingMask189_g1454 = lerpResult57_g1454;
				float MB_RotationAngle130_g1445 = radians( ( ( ( ( ( (StaticWorldNoise31_g1454).y * MM_BendingOfset37_g1445 ) + MM_Bending35_g1445 ) * MM_BendingScale17_g1445 ) + ( ( ( ( (StaticWorldNoise31_g1454).x * MM_AmplitudeOffset52_g1445 ) + MM_Amplitude66_g1445 ) * MM_AmplitudeScale15_g1445 ) * temp_output_20_0_g1454 ) ) * BendingMask189_g1454 ) );
				float RotationAngle54_g1448 = MB_RotationAngle130_g1445;
				float3 LocalPivotPos60_g1448 = LocalPivot159_g1445;
				float3 break62_g1448 = LocalPivotPos60_g1448;
				float VertexPos_Y67_g1448 = input.positionOS.xyz.y;
				float3 appendResult45_g1448 = (float3(break62_g1448.x , VertexPos_Y67_g1448 , break62_g1448.z));
				float3 VertexPos66_g1448 = input.positionOS.xyz;
				float3 rotatedValue30_g1448 = RotateAroundAxis( appendResult45_g1448, VertexPos66_g1448, RotationAxis56_g1448, RotationAngle54_g1448 );
				float3 DetailMotionVO73_g1448 = DM_VertexOffset128_g1445;
				float3 rotatedValue34_g1448 = RotateAroundAxis( LocalPivotPos60_g1448, ( rotatedValue30_g1448 + DetailMotionVO73_g1448 ), RotationAxis56_g1448, RotationAngle54_g1448 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g1445 = ( ( rotatedValue34_g1448 - VertexPos66_g1448 ) * step( 0.01 , VertexPos_Y67_g1448 ) );
				#else
				float3 staticSwitch205_g1445 = DM_VertexOffset128_g1445;
				#endif
				float3 LocalVertexOffset89_g1457 = staticSwitch205_g1445;
				float3 appendResult15_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1457, 1 ) ).xyz;
				float3 objToWorld102_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1457 = ( objToWorld98_g1457 - objToWorld102_g1457 );
				float3 appendResult24_g1457 = (float3(-break20_g1457.z , 0.0 , break20_g1457.x));
				float3 appendResult3_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1457, 1 ) ).xyz;
				float3 objToWorld106_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1457 = ( objToWorld100_g1457 - objToWorld106_g1457 );
				float3 break108_g1457 = temp_output_107_0_g1457;
				float3 lerpResult84_g1457 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1457 , step( 0.001 , ( abs( break108_g1457.x ) + abs( break108_g1457.z ) ) ));
				float3 normalizeResult7_g1457 = ASESafeNormalize( lerpResult84_g1457 );
				float dotResult9_g1457 = dot( normalizeResult7_g1457 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1457 = acos( dotResult9_g1457 );
				float NaNPrevention21_g1457 = step( 0.01 , abs( ( temp_output_12_0_g1457 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1457 = lerp( float3( 1, 0, 0 ) , appendResult24_g1457 , NaNPrevention21_g1457);
				float3 worldToObj99_g1457 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1457, 1 ) ).xyz;
				float3 worldToObj105_g1457 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1457 = normalize( ( worldToObj99_g1457 - worldToObj105_g1457 ) );
				float3 RotationAxis30_g1457 = normalizeResult49_g1457;
				float4 WorldSpaceNoise126_g1457 = temp_output_73_0_g1445;
				float SlopeCorrectionOffset120_g1457 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1457 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1457 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1457).x - 0.0 ) * ( SlopeCorrectionOffset120_g1457 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1457 ) ) * temp_output_12_0_g1457 );
				float3 appendResult28_g1458 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 rotatedValue35_g1457 = RotateAroundAxis( -appendResult28_g1458, ( input.positionOS.xyz + LocalVertexOffset89_g1457 ), RotationAxis30_g1457, RotationAngle29_g1457 );
				float3 lerpResult52_g1457 = lerp( LocalVertexOffset89_g1457 , ( rotatedValue35_g1457 - input.positionOS.xyz ) , NaNPrevention21_g1457);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1457 = lerpResult52_g1457;
				#else
				float3 staticSwitch123_g1457 = LocalVertexOffset89_g1457;
				#endif
				float3 appendResult28_g1472 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 Scale_Pivot15_g1469 = -appendResult28_g1472;
				float3 temp_output_5_0_g1469 = ( ( staticSwitch123_g1457 + input.positionOS.xyz ) - Scale_Pivot15_g1469 );
				float ScaleVartMin40_g1469 = _ScaleVarMin;
				float ScaleVarMax41_g1469 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1469 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1469 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1471 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1469, 1 ) ).xyz;
				float2 appendResult10_g1471 = (float2(objToWorld11_g1471.x , objToWorld11_g1471.z));
				float2 Scale_WorldSpaceUVs30_g1469 = appendResult10_g1471;
				float Scale_VarNoiseTiling23_g1469 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1469 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1469 * Scale_VarNoiseTiling23_g1469 ), 0, 0.0) );
				float smoothstepResult56_g1469 = smoothstep( ScaleNoiseSharpnessMin59_g1469 , ScaleNoiseSharpnessMax60_g1469 , (Scale_WorldSpaceNoise32_g1469).r);
				float lerpResult44_g1469 = lerp( ScaleVartMin40_g1469 , ScaleVarMax41_g1469 , smoothstepResult56_g1469);
				float ScaleVar47_g1469 = lerpResult44_g1469;
				float clampResult63_g1469 = clamp( ( ScaleVar47_g1469 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1469 = ( temp_output_5_0_g1469 * clampResult63_g1469 );
				#else
				float3 staticSwitch72_g1469 = temp_output_5_0_g1469;
				#endif
				float ScaleOffset19_g1469 = _ScaleOffset;
				float clampResult64_g1469 = clamp( ( ScaleOffset19_g1469 + 1.0 ) , 0.0 , 7.0 );
				
				float2 TerrainPosition56_g1474 = ( Nicrom_TerrainPosition + float2( 1,1 ) );
				float2 TerrainPosition4_g1478 = TerrainPosition56_g1474;
				float TerrainSize55_g1474 = Nicrom_TerrainSize;
				float TerrainSize2_g1478 = TerrainSize55_g1474;
				float3 appendResult28_g1475 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 LocalPivot_Color15_g1474 = -appendResult28_g1475;
				float3 objToWorld11_g1477 = mul( GetObjectToWorldMatrix(), float4( LocalPivot_Color15_g1474, 1 ) ).xyz;
				float2 appendResult10_g1477 = (float2(objToWorld11_g1477.x , objToWorld11_g1477.z));
				float4 vertexToFrag19_g1478 = tex2Dlod( Nicrom_TerrainColorMap, float4( ( ( ( 1.0 - TerrainPosition4_g1478 ) / TerrainSize2_g1478 ) + ( ( TerrainSize2_g1478 / ( TerrainSize2_g1478 * TerrainSize2_g1478 ) ) * appendResult10_g1477 ) ), 0, 0.0) );
				output.ase_texcoord8 = vertexToFrag19_g1478;
				float vertexToFrag230_g1474 = input.positionOS.xyz.y;
				output.ase_texcoord9.x = vertexToFrag230_g1474;
				#ifdef _SCALEVARIATION_ON
				float staticSwitch73_g1469 = smoothstepResult56_g1469;
				#else
				float staticSwitch73_g1469 = 0.0;
				#endif
				float vertexToFrag71_g1469 = staticSwitch73_g1469;
				output.ase_texcoord9.y = vertexToFrag71_g1469;
				
				float3 customSurfaceDepth3_g1479 = input.positionOS.xyz;
				float customEye3_g1479 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1479)).z;
				output.ase_texcoord9.z = customEye3_g1479;
				
				output.ase_texcoord7.xy = input.texcoord.xy;
				output.ase_texcoord7.zw = input.texcoord1.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord9.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1469 * clampResult64_g1469 ) + Scale_Pivot15_g1469 ) - input.positionOS.xyz );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( input.normalOS, input.tangentOS );

				OUTPUT_LIGHTMAP_UV(input.texcoord1, unity_LightmapST, output.lightmapUVOrVertexSH.xy);
				#if defined(DYNAMICLIGHTMAP_ON)
					output.dynamicLightmapUV.xy = input.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif
				OUTPUT_SH4(vertexInput.positionWS, normalInput.normalWS.xyz, GetWorldSpaceNormalizeViewDir(vertexInput.positionWS), output.lightmapUVOrVertexSH.xyz, output.probeOcclusion);

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					output.lightmapUVOrVertexSH.zw = input.texcoord.xy;
					output.lightmapUVOrVertexSH.xy = input.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				#if defined(ASE_FOG) || defined(_ADDITIONAL_LIGHTS_VERTEX)
					output.fogFactorAndVertexLight = 0;
					#if defined(ASE_FOG) && !defined(_FOG_FRAGMENT)
						// @diogo: no fog applied in GBuffer
					#endif
					#ifdef _ADDITIONAL_LIGHTS_VERTEX
						half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );
						output.fogFactorAndVertexLight.yzw = vertexLight;
					#endif
				#endif

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				output.normalWS = normalInput.normalWS;
				output.tangentWS = float4( normalInput.tangentWS, ( input.tangentOS.w > 0.0 ? 1.0 : -1.0 ) * GetOddNegativeScale() );
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					float4 texcoord1 : TEXCOORD1;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					float4 texcoord2 : TEXCOORD2;
				#endif
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.texcoord = input.texcoord;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					output.texcoord1 = input.texcoord1;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					output.texcoord2 = input.texcoord2;
				#endif
				output.ase_color = input.ase_color;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				#if defined(LIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES1)
					output.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON) || defined(ASE_NEEDS_TEXTURE_COORDINATES2)
					output.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				#endif
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			FragmentOutput frag ( PackedVaryings input
								#if defined( ASE_DEPTH_WRITE_ON )
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								 )
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					float4 shadowCoord = TransformWorldToShadowCoord( input.positionWS );
				#else
					float4 shadowCoord = float4(0, 0, 0, 0);
				#endif

				// @diogo: mikktspace compliant
				float renormFactor = 1.0 / max( FLT_MIN, length( input.normalWS ) );

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( PositionWS );
				float3 ViewDirWS = GetWorldSpaceNormalizeViewDir( PositionWS );
				float4 ShadowCoord = shadowCoord;
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;
				float4 ScreenPos = ComputeScreenPos( ClipPos );
				float3 TangentWS = input.tangentWS.xyz * renormFactor;
				float3 BitangentWS = cross( input.normalWS, input.tangentWS.xyz ) * input.tangentWS.w * renormFactor;
				float3 NormalWS = input.normalWS * renormFactor;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (input.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					NormalWS = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					TangentWS = -cross(GetObjectToWorldMatrix()._13_23_33, NormalWS);
					BitangentWS = cross(NormalWS, -TangentWS);
				#endif

				float Debug_Target203_g1474 = _Debug;
				float3 FlowerColor1B66_g1474 = _FlowerColor1B;
				float3 FlowerColor1A65_g1474 = _FlowerColor1A;
				float2 uv_ColorMask1 = input.ase_texcoord7.xy * _ColorMask1_ST.xy + _ColorMask1_ST.zw;
				float4 tex2DNode31_g1474 = tex2D( _ColorMask1, uv_ColorMask1 );
				float ColorMask1_R37_g1474 = tex2DNode31_g1474.r;
				float3 lerpResult87_g1474 = lerp( FlowerColor1B66_g1474 , FlowerColor1A65_g1474 , ColorMask1_R37_g1474);
				float3 FlowerColor1_F197_g1474 = lerpResult87_g1474;
				float3 FlowerColor2B68_g1474 = _FlowerColor2B;
				float3 FlowerColor2A67_g1474 = _FlowerColor2A;
				float3 lerpResult88_g1474 = lerp( FlowerColor2B68_g1474 , FlowerColor2A67_g1474 , ColorMask1_R37_g1474);
				float3 FlowerColor2_F198_g1474 = lerpResult88_g1474;
				float CM2_GVToggle213_g1474 = _ColorMask2GV;
				float lerpResult219_g1474 = lerp( _ColorMask2SharpMin , Nicrom_Flower_CM2_SharpMin , CM2_GVToggle213_g1474);
				float ColorMask2SharpMin98_g1474 = lerpResult219_g1474;
				float lerpResult221_g1474 = lerp( _ColorMask2SharpMax , Nicrom_Flower_CM2_SharpMax , CM2_GVToggle213_g1474);
				float ColorMask2SharpMax92_g1474 = lerpResult221_g1474;
				float3 appendResult28_g1475 = (float3(input.ase_texcoord7.zw.x , 0.0 , input.ase_texcoord7.zw.y));
				float3 LocalPivot_Color15_g1474 = -appendResult28_g1475;
				float3 objToWorld11_g1476 = mul( GetObjectToWorldMatrix(), float4( LocalPivot_Color15_g1474, 1 ) ).xyz;
				float2 appendResult10_g1476 = (float2(objToWorld11_g1476.x , objToWorld11_g1476.z));
				float lerpResult215_g1474 = lerp( _ColorMask2Tiling , Nicrom_Flower_CM2_Tilling , CM2_GVToggle213_g1474);
				float ColorMask2Tiling21_g1474 = lerpResult215_g1474;
				float2 WorldSpaceUVs187_g1474 = ( appendResult10_g1476 * ColorMask2Tiling21_g1474 );
				float4 tex2DNode43_g1474 = tex2D( _ColorMask2, WorldSpaceUVs187_g1474 );
				float ColorMask2Noise78_g1474 = tex2DNode43_g1474.r;
				float smoothstepResult119_g1474 = smoothstep( ColorMask2SharpMin98_g1474 , ColorMask2SharpMax92_g1474 , ColorMask2Noise78_g1474);
				float ColorMask2Opacity122_g1474 = _ColorMask2Opacity;
				float lerpResult126_g1474 = lerp( 0.0 , smoothstepResult119_g1474 , ColorMask2Opacity122_g1474);
				float ColorMask2_F184_g1474 = lerpResult126_g1474;
				float3 lerpResult130_g1474 = lerp( FlowerColor1_F197_g1474 , FlowerColor2_F198_g1474 , ColorMask2_F184_g1474);
				#if defined( _FLOWERCOLORS_TWO )
				float3 staticSwitch196_g1474 = FlowerColor1_F197_g1474;
				#elif defined( _FLOWERCOLORS_FOUR )
				float3 staticSwitch196_g1474 = lerpResult130_g1474;
				#else
				float3 staticSwitch196_g1474 = FlowerColor1_F197_g1474;
				#endif
				float3 FlowerColor134_g1474 = staticSwitch196_g1474;
				float3 StemColorBottom93_g1474 = _StemColorBottom;
				float4 vertexToFrag19_g1478 = input.ase_texcoord8;
				float4 TerrainColor86_g1474 = vertexToFrag19_g1478;
				float TerrainBlendBottom97_g1474 = _BWTBottom;
				float IsTerrainAlbedoAssigned181_g1474 = step( 8.0 , Nicrom_TerrainColorMap_TexelSize.z );
				float lerpResult176_g1474 = lerp( 0.0 , TerrainBlendBottom97_g1474 , IsTerrainAlbedoAssigned181_g1474);
				float TerrainBlendBottom_F179_g1474 = lerpResult176_g1474;
				float4 lerpResult114_g1474 = lerp( float4( StemColorBottom93_g1474 , 0.0 ) , TerrainColor86_g1474 , TerrainBlendBottom_F179_g1474);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch124_g1474 = lerpResult114_g1474;
				#else
				float4 staticSwitch124_g1474 = float4( StemColorBottom93_g1474 , 0.0 );
				#endif
				float3 StemColorTop91_g1474 = _StemColorTop;
				float TerrainBlendTop96_g1474 = _BWTTop;
				float lerpResult177_g1474 = lerp( 0.0 , TerrainBlendTop96_g1474 , IsTerrainAlbedoAssigned181_g1474);
				float TerrainBlendTop_F178_g1474 = lerpResult177_g1474;
				float4 lerpResult115_g1474 = lerp( float4( StemColorTop91_g1474 , 0.0 ) , TerrainColor86_g1474 , TerrainBlendTop_F178_g1474);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch123_g1474 = lerpResult115_g1474;
				#else
				float4 staticSwitch123_g1474 = float4( StemColorTop91_g1474 , 0.0 );
				#endif
				float StemColorMaskStart112_g1474 = _StemColorMaskStart;
				float StemColorMaskEnd113_g1474 = _StemColorMaskEnd;
				float vertexToFrag230_g1474 = input.ase_texcoord9.x;
				float VertexPos_Y231_g1474 = vertexToFrag230_g1474;
				float smoothstepResult125_g1474 = smoothstep( StemColorMaskStart112_g1474 , StemColorMaskEnd113_g1474 , VertexPos_Y231_g1474);
				float4 lerpResult129_g1474 = lerp( staticSwitch124_g1474 , staticSwitch123_g1474 , smoothstepResult125_g1474);
				float4 StemColor133_g1474 = lerpResult129_g1474;
				float ColorMask1_G183_g1474 = tex2DNode31_g1474.g;
				float4 lerpResult149_g1474 = lerp( float4( FlowerColor134_g1474 , 0.0 ) , StemColor133_g1474 , ColorMask1_G183_g1474);
				float FlowerStemToggle145_g1474 = _STEM;
				float4 lerpResult158_g1474 = lerp( float4( FlowerColor134_g1474 , 0.0 ) , lerpResult149_g1474 , FlowerStemToggle145_g1474);
				float2 uv_Albedo137_g1474 = input.ase_texcoord7.xy;
				float4 tex2DNode137_g1474 = tex2D( _Albedo, uv_Albedo137_g1474 );
				float4 AlbedoTex144_g1474 = tex2DNode137_g1474;
				float4 Albedo203_g1474 = ( lerpResult158_g1474 * AlbedoTex144_g1474 );
				float ColorMask1R203_g1474 = ColorMask1_R37_g1474;
				float ColorMask1G203_g1474 = ColorMask1_G183_g1474;
				#if defined( _FLOWERCOLORS_TWO )
				float staticSwitch208_g1474 = 0.0;
				#elif defined( _FLOWERCOLORS_FOUR )
				float staticSwitch208_g1474 = ColorMask2_F184_g1474;
				#else
				float staticSwitch208_g1474 = 0.0;
				#endif
				float ColorMask2203_g1474 = staticSwitch208_g1474;
				float vertexToFrag71_g1469 = input.ase_texcoord9.y;
				float ScaleVarNoise2237 = vertexToFrag71_g1469;
				float ScaleVarNoise203_g1474 = ScaleVarNoise2237;
				float4 localDebug203_g1474 = Debug203_g1474( Debug_Target203_g1474 , Albedo203_g1474 , ColorMask1R203_g1474 , ColorMask1G203_g1474 , ColorMask2203_g1474 , ScaleVarNoise203_g1474 );
				
				float temp_output_31_0_g1479 = tex2DNode137_g1474.a;
				float DF_Length_Local38_g1479 = _DistanceFadeLength;
				float DF_Length_Global45_g1479 = Nicrom_Flower_DF_Length;
				float DF_Start_Global43_g1479 = Nicrom_Flower_DF_Start;
				float lerpResult49_g1479 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1479 ));
				float DF_UseGV28_g1479 = lerpResult49_g1479;
				float lerpResult26_g1479 = lerp( DF_Length_Local38_g1479 , DF_Length_Global45_g1479 , DF_UseGV28_g1479);
				float DistanceFadeLength23_g1479 = lerpResult26_g1479;
				float DF_Start_Local36_g1479 = _DistanceFadeStart;
				float lerpResult20_g1479 = lerp( DF_Start_Local36_g1479 , DF_Start_Global43_g1479 , DF_UseGV28_g1479);
				float DistanceFadeStart27_g1479 = lerpResult20_g1479;
				float customEye3_g1479 = input.ase_texcoord9.z;
				float cameraDepthFade3_g1479 = (( customEye3_g1479 -_ProjectionParams.y - DistanceFadeStart27_g1479 ) / DistanceFadeLength23_g1479);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1479 = ( temp_output_31_0_g1479 * saturate( ( 1.0 - cameraDepthFade3_g1479 ) ) );
				#else
				float staticSwitch33_g1479 = temp_output_31_0_g1479;
				#endif
				

				float3 BaseColor = localDebug203_g1474.xyz;
				float3 Normal = float3(0, 0, 1);
				float3 Specular = 0.5;
				float Metallic = 0.0;
				float Smoothness = 0.0;
				float Occlusion = 1;
				float3 Emission = 0;
				float Alpha = staticSwitch33_g1479;
				float AlphaClipThreshold = _AlphaCutoff;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = ClipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS) && defined(ASE_CHANGES_WORLD_POS)
					ShadowCoord = TransformWorldToShadowCoord( PositionWS );
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = PositionWS;
				inputData.positionCS = float4( input.positionCS.xy, ClipPos.zw / ClipPos.w );
				inputData.normalizedScreenSpaceUV = ScreenPosNorm.xy;
				inputData.shadowCoord = ShadowCoord;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( TangentWS, BitangentWS, NormalWS ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = NormalWS;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( ViewDirWS );

				#ifdef ASE_FOG
					// @diogo: no fog applied in GBuffer
				#endif
				#ifdef _ADDITIONAL_LIGHTS_VERTEX
					inputData.vertexLighting = input.fogFactorAndVertexLight.yzw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = input.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(input.lightmapUVOrVertexSH.xy, input.dynamicLightmapUV.xy, SH, inputData.normalWS);
					inputData.shadowMask = SAMPLE_SHADOWMASK(input.lightmapUVOrVertexSH.xy);
				#elif !defined(LIGHTMAP_ON) && (defined(PROBE_VOLUMES_L1) || defined(PROBE_VOLUMES_L2))
					inputData.bakedGI = SAMPLE_GI(SH,
						GetAbsolutePositionWS(inputData.positionWS),
						inputData.normalWS,
						inputData.viewDirectionWS,
						input.positionCS.xy,
						input.probeOcclusion,
						inputData.shadowMask);
				#else
					inputData.bakedGI = SAMPLE_GI(input.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
					inputData.shadowMask = SAMPLE_SHADOWMASK(input.lightmapUVOrVertexSH.xy);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = input.dynamicLightmapUV.xy;
						#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = input.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
					#if defined(USE_APV_PROBE_OCCLUSION)
						inputData.probeOcclusion = input.probeOcclusion;
					#endif
				#endif

				#ifdef _DBUFFER
					ApplyDecal(input.positionCS,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			#pragma multi_compile_local _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_VERSION 19901
			#define ASE_SRP_VERSION 170003


			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _DISTANCEFADE_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 Nicrom_TerrainColorMap_TexelSize;
			float4 _ColorMask1_ST;
			float3 _FlowerColor1B;
			float3 _StemColorTop;
			float3 _FlowerColor1A;
			float3 _StemColorBottom;
			float3 _FlowerColor2B;
			float3 _FlowerColor2A;
			half _GVBendingScale;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ScaleVarMax;
			float _ColorMask2Tiling;
			float _ColorMask2Opacity;
			float _BWTBottom;
			float _BWTTop;
			float _StemColorMaskStart;
			float _StemColorMaskEnd;
			float _STEM;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _ScaleVarMin;
			float _SlopeCorrectionOffset;
			float _DM1Amplitude;
			float _GVTime;
			float _DM1Speed;
			float _DM1FoliageLength;
			float _DM2Amplitude;
			float _DM2Speed;
			float _DM2ObjectRadius;
			half _MMDirectionAngle;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _MotionNoiseTiling;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVAmplitudeScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionMagnitude;
			float _AlphaCutoff;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float Nicrom_DM_AmpScale_Flower;
			float Nicrom_DM_Time_Flower;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Flower;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Flower;
			float Nicrom_MM_SpeedScale_Flower;
			float Nicrom_MM_BendScale_Flowers;
			float Nicrom_MM_AmpScale_Flower;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;
			float Nicrom_Flower_DF_Length;
			float Nicrom_Flower_DF_Start;


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction(Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g1447 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g1447 = (float3(cos( temp_output_23_0_g1447 ) , 0.0 , sin( temp_output_23_0_g1447 )));
				float3 DB_RotationAxis87_g1445 = appendResult25_g1447;
				float GV_AmplitudeScale175_g1445 = _GVBendingScale;
				float lerpResult186_g1445 = lerp( 1.0 , Nicrom_DM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float DM_AmplitudeScale168_g1445 = lerpResult186_g1445;
				float DM1_Amplitude28_g1445 = _DM1Amplitude;
				float3 objToWorld80_g1455 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g1445 = _GVTime;
				float lerpResult187_g1445 = lerp( _TimeParameters.x , Nicrom_DM_Time_Flower , GV_Time174_g1445);
				float ApplicationIsPlaying241_g1445 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g1445 = lerp( _TimeParameters.x , lerpResult187_g1445 , ApplicationIsPlaying241_g1445);
				float DM_Time169_g1445 = lerpResult256_g1445;
				float Time90_g1455 = DM_Time169_g1445;
				float DM1_Speed29_g1445 = _DM1Speed;
				float Speed45_g1455 = DM1_Speed29_g1445;
				float temp_output_244_0_g1445 = Nicrom_DM_SpeedScale_Flower;
				float lerpResult261_g1445 = lerp( temp_output_244_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult262_g1445 = lerp( temp_output_244_0_g1445 , lerpResult261_g1445 , ApplicationIsPlaying241_g1445);
				float DM_SpeedScale265_g1445 = lerpResult262_g1445;
				float SpeedScale95_g1455 = DM_SpeedScale265_g1445;
				float DM_PhaseShift91_g1445 = input.ase_color.a;
				float PhaseShift48_g1455 = DM_PhaseShift91_g1445;
				float3 appendResult24_g1447 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g1445 = appendResult24_g1447;
				float3 PivotPosOnYAxis56_g1455 = DM_PivotPosOnYAxis88_g1445;
				float DM1_FoliageLength32_g1445 = _DM1FoliageLength;
				float3 rotatedValue29_g1455 = RotateAroundAxis( PivotPosOnYAxis56_g1455, input.positionOS.xyz, DB_RotationAxis87_g1445, radians( ( ( ( DM_AmplitudeScale168_g1445 * DM1_Amplitude28_g1445 ) * sin( ( ( ( objToWorld80_g1455.x + objToWorld80_g1455.z ) + ( ( Time90_g1455 * ( Speed45_g1455 * SpeedScale95_g1455 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g1455 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g1455 ) / DM1_FoliageLength32_g1445 ) ) ) );
				float DM1_MotionMask89_g1445 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g1445 = ( ( rotatedValue29_g1455 - input.positionOS.xyz ) * DM1_MotionMask89_g1445 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g1445 = DM1_VertexOffset231_g1445;
				#else
				float3 staticSwitch104_g1445 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g1445 = _DM2Amplitude;
				float Amplitude58_g1456 = DM2_Amplitude30_g1445;
				float3 appendResult28_g1444 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot159_g1445 = -appendResult28_g1444;
				float3 PivotPoint49_g1456 = LocalPivot159_g1445;
				float3 objToWorld53_g1456 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g1456, 1 ) ).xyz;
				float Time87_g1456 = DM_Time169_g1445;
				float SpeedScale93_g1456 = DM_SpeedScale265_g1445;
				float DM2_Speed31_g1445 = _DM2Speed;
				float Speed41_g1456 = DM2_Speed31_g1445;
				float PhaseShift54_g1456 = DM_PhaseShift91_g1445;
				float3 break52_g1456 = PivotPoint49_g1456;
				float3 appendResult20_g1456 = (float3(break52_g1456.x , input.positionOS.xyz.y , break52_g1456.z));
				float DM2_ObjectRadius33_g1445 = _DM2ObjectRadius;
				float ObjectRadius60_g1456 = DM2_ObjectRadius33_g1445;
				float3 rotatedValue33_g1456 = RotateAroundAxis( PivotPoint49_g1456, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g1445 * Amplitude58_g1456 ) * sin( ( ( ( objToWorld53_g1456.x + objToWorld53_g1456.z ) + ( ( Time87_g1456 * ( SpeedScale93_g1456 * Speed41_g1456 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g1456 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g1456 ) / ObjectRadius60_g1456 ) ) ) );
				float DM2_MotionMask90_g1445 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g1456 = DM2_MotionMask90_g1445;
				float3 DM2_VertexOffset232_g1445 = ( ( rotatedValue33_g1456 - input.positionOS.xyz ) * BendingMask62_g1456 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g1445 = DM2_VertexOffset232_g1445;
				#else
				float3 staticSwitch103_g1445 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g1445 = ( staticSwitch104_g1445 + staticSwitch103_g1445 );
				float lerpResult56_g1453 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g1445 = lerpResult56_g1453;
				float MM_DirShift59_g1445 = _MMDirectionShift;
				float MM_DirShiftOffset60_g1445 = _MMDirectionShiftOffset;
				float3 objToWorld11_g1450 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float2 appendResult10_g1450 = (float2(objToWorld11_g1450.x , objToWorld11_g1450.z));
				float MotionNoiseTiling20_g1445 = _MotionNoiseTiling;
				float4 temp_output_73_0_g1445 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g1450 * MotionNoiseTiling20_g1445 ), 0, 0.0) );
				float4 StaticWorldNoise78_g1445 = temp_output_73_0_g1445;
				float4 StaticWorldNoise55_g1449 = StaticWorldNoise78_g1445;
				float3 objToWorld50_g1449 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float lerpResult182_g1445 = lerp( _TimeParameters.x , Nicrom_MM_Time_Flower , GV_Time174_g1445);
				float lerpResult246_g1445 = lerp( _TimeParameters.x , lerpResult182_g1445 , ApplicationIsPlaying241_g1445);
				float MM_Time13_g1445 = lerpResult246_g1445;
				float Time76_g1449 = MM_Time13_g1445;
				float temp_output_243_0_g1445 = Nicrom_MM_SpeedScale_Flower;
				float lerpResult245_g1445 = lerp( temp_output_243_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult249_g1445 = lerp( temp_output_243_0_g1445 , lerpResult245_g1445 , ApplicationIsPlaying241_g1445);
				float MM_SpeedScale253_g1445 = lerpResult249_g1445;
				float SpeedScale_RA80_g1449 = MM_SpeedScale253_g1445;
				float MM_DirShiftSpeed56_g1445 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g1445 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1449 = radians( ( ( MM_DirAngle51_g1445 + ( ( MM_DirShift59_g1445 + ( MM_DirShiftOffset60_g1445 * (StaticWorldNoise55_g1449).x ) ) * sin( ( ( objToWorld50_g1449.x + objToWorld50_g1449.z ) + ( ( Time76_g1449 * ( SpeedScale_RA80_g1449 * MM_DirShiftSpeed56_g1445 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1449).z * MM_DirShiftNoiseScale57_g1445 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1449 = (float3(cos( temp_output_11_0_g1449 ) , 0.0 , sin( temp_output_11_0_g1449 )));
				float3 worldToObj35_g1449 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1449, 1 ) ).xyz;
				float3 worldToObj36_g1449 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1449 = normalize( (( worldToObj35_g1449 - worldToObj36_g1449 )).xyz );
				float3 MB_RotationAxis129_g1445 = normalizeResult34_g1449;
				float3 RotationAxis56_g1448 = MB_RotationAxis129_g1445;
				float4 StaticWorldNoise31_g1454 = StaticWorldNoise78_g1445;
				float MM_BendingOfset37_g1445 = _MMBendingOffset;
				float MM_Bending35_g1445 = _MMBending;
				float GV_BendingScale176_g1445 = _GVAmplitudeScale;
				float lerpResult188_g1445 = lerp( 1.0 , Nicrom_MM_BendScale_Flowers , GV_BendingScale176_g1445);
				float MM_BendingScale17_g1445 = lerpResult188_g1445;
				float MM_AmplitudeOffset52_g1445 = _MMAmplitudeOffset;
				float MM_Amplitude66_g1445 = _MMAmplitude;
				float lerpResult189_g1445 = lerp( 1.0 , Nicrom_MM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float MM_AmplitudeScale15_g1445 = lerpResult189_g1445;
				float3 objToWorld170_g1454 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1454 = MM_Time13_g1445;
				float MM_Speed53_g1445 = _MMSpeed;
				float Speed125_g1454 = MM_Speed53_g1445;
				float SpeedScale_RotAng201_g1454 = MM_SpeedScale253_g1445;
				float MM_SineWaveLength58_g1445 = _MMSineWaveLength;
				float WaveLength63_g1454 = MM_SineWaveLength58_g1445;
				float MM_PhaseShiftSource207_g1445 = _MMPhaseShiftSource;
				float lerpResult154_g1445 = lerp( input.ase_color.a , (StaticWorldNoise78_g1445).g , MM_PhaseShiftSource207_g1445);
				float MM_PhaseShiftScale39_g1445 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g1445 = ( lerpResult154_g1445 * MM_PhaseShiftScale39_g1445 );
				float PhaseShift127_g1454 = MB_PhaseShift79_g1445;
				float temp_output_20_0_g1454 = sin( ( ( ( objToWorld170_g1454.x + objToWorld170_g1454.z ) + ( ( Time167_g1454 * ( ( Speed125_g1454 * SpeedScale_RotAng201_g1454 ) * WaveLength63_g1454 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1454 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1454 ) ) );
				float MM_MaxHeight55_g1445 = _MMObjectHeight;
				float3 gammaToLinear56_g1454 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g1445 = _MMObjectHeightSource;
				float lerpResult57_g1454 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g1445 ) , (gammaToLinear56_g1454).x , MM_ObjectHeightSource54_g1445);
				float BendingMask189_g1454 = lerpResult57_g1454;
				float MB_RotationAngle130_g1445 = radians( ( ( ( ( ( (StaticWorldNoise31_g1454).y * MM_BendingOfset37_g1445 ) + MM_Bending35_g1445 ) * MM_BendingScale17_g1445 ) + ( ( ( ( (StaticWorldNoise31_g1454).x * MM_AmplitudeOffset52_g1445 ) + MM_Amplitude66_g1445 ) * MM_AmplitudeScale15_g1445 ) * temp_output_20_0_g1454 ) ) * BendingMask189_g1454 ) );
				float RotationAngle54_g1448 = MB_RotationAngle130_g1445;
				float3 LocalPivotPos60_g1448 = LocalPivot159_g1445;
				float3 break62_g1448 = LocalPivotPos60_g1448;
				float VertexPos_Y67_g1448 = input.positionOS.xyz.y;
				float3 appendResult45_g1448 = (float3(break62_g1448.x , VertexPos_Y67_g1448 , break62_g1448.z));
				float3 VertexPos66_g1448 = input.positionOS.xyz;
				float3 rotatedValue30_g1448 = RotateAroundAxis( appendResult45_g1448, VertexPos66_g1448, RotationAxis56_g1448, RotationAngle54_g1448 );
				float3 DetailMotionVO73_g1448 = DM_VertexOffset128_g1445;
				float3 rotatedValue34_g1448 = RotateAroundAxis( LocalPivotPos60_g1448, ( rotatedValue30_g1448 + DetailMotionVO73_g1448 ), RotationAxis56_g1448, RotationAngle54_g1448 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g1445 = ( ( rotatedValue34_g1448 - VertexPos66_g1448 ) * step( 0.01 , VertexPos_Y67_g1448 ) );
				#else
				float3 staticSwitch205_g1445 = DM_VertexOffset128_g1445;
				#endif
				float3 LocalVertexOffset89_g1457 = staticSwitch205_g1445;
				float3 appendResult15_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1457, 1 ) ).xyz;
				float3 objToWorld102_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1457 = ( objToWorld98_g1457 - objToWorld102_g1457 );
				float3 appendResult24_g1457 = (float3(-break20_g1457.z , 0.0 , break20_g1457.x));
				float3 appendResult3_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1457, 1 ) ).xyz;
				float3 objToWorld106_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1457 = ( objToWorld100_g1457 - objToWorld106_g1457 );
				float3 break108_g1457 = temp_output_107_0_g1457;
				float3 lerpResult84_g1457 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1457 , step( 0.001 , ( abs( break108_g1457.x ) + abs( break108_g1457.z ) ) ));
				float3 normalizeResult7_g1457 = ASESafeNormalize( lerpResult84_g1457 );
				float dotResult9_g1457 = dot( normalizeResult7_g1457 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1457 = acos( dotResult9_g1457 );
				float NaNPrevention21_g1457 = step( 0.01 , abs( ( temp_output_12_0_g1457 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1457 = lerp( float3( 1, 0, 0 ) , appendResult24_g1457 , NaNPrevention21_g1457);
				float3 worldToObj99_g1457 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1457, 1 ) ).xyz;
				float3 worldToObj105_g1457 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1457 = normalize( ( worldToObj99_g1457 - worldToObj105_g1457 ) );
				float3 RotationAxis30_g1457 = normalizeResult49_g1457;
				float4 WorldSpaceNoise126_g1457 = temp_output_73_0_g1445;
				float SlopeCorrectionOffset120_g1457 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1457 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1457 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1457).x - 0.0 ) * ( SlopeCorrectionOffset120_g1457 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1457 ) ) * temp_output_12_0_g1457 );
				float3 appendResult28_g1458 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 rotatedValue35_g1457 = RotateAroundAxis( -appendResult28_g1458, ( input.positionOS.xyz + LocalVertexOffset89_g1457 ), RotationAxis30_g1457, RotationAngle29_g1457 );
				float3 lerpResult52_g1457 = lerp( LocalVertexOffset89_g1457 , ( rotatedValue35_g1457 - input.positionOS.xyz ) , NaNPrevention21_g1457);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1457 = lerpResult52_g1457;
				#else
				float3 staticSwitch123_g1457 = LocalVertexOffset89_g1457;
				#endif
				float3 appendResult28_g1472 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g1469 = -appendResult28_g1472;
				float3 temp_output_5_0_g1469 = ( ( staticSwitch123_g1457 + input.positionOS.xyz ) - Scale_Pivot15_g1469 );
				float ScaleVartMin40_g1469 = _ScaleVarMin;
				float ScaleVarMax41_g1469 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1469 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1469 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1471 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1469, 1 ) ).xyz;
				float2 appendResult10_g1471 = (float2(objToWorld11_g1471.x , objToWorld11_g1471.z));
				float2 Scale_WorldSpaceUVs30_g1469 = appendResult10_g1471;
				float Scale_VarNoiseTiling23_g1469 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1469 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1469 * Scale_VarNoiseTiling23_g1469 ), 0, 0.0) );
				float smoothstepResult56_g1469 = smoothstep( ScaleNoiseSharpnessMin59_g1469 , ScaleNoiseSharpnessMax60_g1469 , (Scale_WorldSpaceNoise32_g1469).r);
				float lerpResult44_g1469 = lerp( ScaleVartMin40_g1469 , ScaleVarMax41_g1469 , smoothstepResult56_g1469);
				float ScaleVar47_g1469 = lerpResult44_g1469;
				float clampResult63_g1469 = clamp( ( ScaleVar47_g1469 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1469 = ( temp_output_5_0_g1469 * clampResult63_g1469 );
				#else
				float3 staticSwitch72_g1469 = temp_output_5_0_g1469;
				#endif
				float ScaleOffset19_g1469 = _ScaleOffset;
				float clampResult64_g1469 = clamp( ( ScaleOffset19_g1469 + 1.0 ) , 0.0 , 7.0 );
				
				float3 customSurfaceDepth3_g1479 = input.positionOS.xyz;
				float customEye3_g1479 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1479)).z;
				output.ase_texcoord1.z = customEye3_g1479;
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1469 * clampResult64_g1469 ) + Scale_Pivot15_g1469 ) - input.positionOS.xyz );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.ase_texcoord2 = input.ase_texcoord2;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag( PackedVaryings input
				#if defined( ASE_DEPTH_WRITE_ON )
				,out float outputDepth : ASE_SV_DEPTH
				#endif
				 ) : SV_Target
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( PositionWS );
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;

				float2 uv_Albedo137_g1474 = input.ase_texcoord1.xy;
				float4 tex2DNode137_g1474 = tex2D( _Albedo, uv_Albedo137_g1474 );
				float temp_output_31_0_g1479 = tex2DNode137_g1474.a;
				float DF_Length_Local38_g1479 = _DistanceFadeLength;
				float DF_Length_Global45_g1479 = Nicrom_Flower_DF_Length;
				float DF_Start_Global43_g1479 = Nicrom_Flower_DF_Start;
				float lerpResult49_g1479 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1479 ));
				float DF_UseGV28_g1479 = lerpResult49_g1479;
				float lerpResult26_g1479 = lerp( DF_Length_Local38_g1479 , DF_Length_Global45_g1479 , DF_UseGV28_g1479);
				float DistanceFadeLength23_g1479 = lerpResult26_g1479;
				float DF_Start_Local36_g1479 = _DistanceFadeStart;
				float lerpResult20_g1479 = lerp( DF_Start_Local36_g1479 , DF_Start_Global43_g1479 , DF_UseGV28_g1479);
				float DistanceFadeStart27_g1479 = lerpResult20_g1479;
				float customEye3_g1479 = input.ase_texcoord1.z;
				float cameraDepthFade3_g1479 = (( customEye3_g1479 -_ProjectionParams.y - DistanceFadeStart27_g1479 ) / DistanceFadeLength23_g1479);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1479 = ( temp_output_31_0_g1479 * saturate( ( 1.0 - cameraDepthFade3_g1479 ) ) );
				#else
				float staticSwitch33_g1479 = temp_output_31_0_g1479;
				#endif
				

				surfaceDescription.Alpha = staticSwitch33_g1479;
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				return half4( _ObjectId, _PassValue, 1.0, 1.0 );
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			#pragma multi_compile_local _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_VERSION 19901
			#define ASE_SRP_VERSION 170003


			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _DISTANCEFADE_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 Nicrom_TerrainColorMap_TexelSize;
			float4 _ColorMask1_ST;
			float3 _FlowerColor1B;
			float3 _StemColorTop;
			float3 _FlowerColor1A;
			float3 _StemColorBottom;
			float3 _FlowerColor2B;
			float3 _FlowerColor2A;
			half _GVBendingScale;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ScaleVarMax;
			float _ColorMask2Tiling;
			float _ColorMask2Opacity;
			float _BWTBottom;
			float _BWTTop;
			float _StemColorMaskStart;
			float _StemColorMaskEnd;
			float _STEM;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _ScaleVarMin;
			float _SlopeCorrectionOffset;
			float _DM1Amplitude;
			float _GVTime;
			float _DM1Speed;
			float _DM1FoliageLength;
			float _DM2Amplitude;
			float _DM2Speed;
			float _DM2ObjectRadius;
			half _MMDirectionAngle;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _MotionNoiseTiling;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVAmplitudeScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionMagnitude;
			float _AlphaCutoff;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float Nicrom_DM_AmpScale_Flower;
			float Nicrom_DM_Time_Flower;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Flower;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Flower;
			float Nicrom_MM_SpeedScale_Flower;
			float Nicrom_MM_BendScale_Flowers;
			float Nicrom_MM_AmpScale_Flower;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;
			float Nicrom_Flower_DF_Length;
			float Nicrom_Flower_DF_Start;


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g1447 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g1447 = (float3(cos( temp_output_23_0_g1447 ) , 0.0 , sin( temp_output_23_0_g1447 )));
				float3 DB_RotationAxis87_g1445 = appendResult25_g1447;
				float GV_AmplitudeScale175_g1445 = _GVBendingScale;
				float lerpResult186_g1445 = lerp( 1.0 , Nicrom_DM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float DM_AmplitudeScale168_g1445 = lerpResult186_g1445;
				float DM1_Amplitude28_g1445 = _DM1Amplitude;
				float3 objToWorld80_g1455 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g1445 = _GVTime;
				float lerpResult187_g1445 = lerp( _TimeParameters.x , Nicrom_DM_Time_Flower , GV_Time174_g1445);
				float ApplicationIsPlaying241_g1445 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g1445 = lerp( _TimeParameters.x , lerpResult187_g1445 , ApplicationIsPlaying241_g1445);
				float DM_Time169_g1445 = lerpResult256_g1445;
				float Time90_g1455 = DM_Time169_g1445;
				float DM1_Speed29_g1445 = _DM1Speed;
				float Speed45_g1455 = DM1_Speed29_g1445;
				float temp_output_244_0_g1445 = Nicrom_DM_SpeedScale_Flower;
				float lerpResult261_g1445 = lerp( temp_output_244_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult262_g1445 = lerp( temp_output_244_0_g1445 , lerpResult261_g1445 , ApplicationIsPlaying241_g1445);
				float DM_SpeedScale265_g1445 = lerpResult262_g1445;
				float SpeedScale95_g1455 = DM_SpeedScale265_g1445;
				float DM_PhaseShift91_g1445 = input.ase_color.a;
				float PhaseShift48_g1455 = DM_PhaseShift91_g1445;
				float3 appendResult24_g1447 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g1445 = appendResult24_g1447;
				float3 PivotPosOnYAxis56_g1455 = DM_PivotPosOnYAxis88_g1445;
				float DM1_FoliageLength32_g1445 = _DM1FoliageLength;
				float3 rotatedValue29_g1455 = RotateAroundAxis( PivotPosOnYAxis56_g1455, input.positionOS.xyz, DB_RotationAxis87_g1445, radians( ( ( ( DM_AmplitudeScale168_g1445 * DM1_Amplitude28_g1445 ) * sin( ( ( ( objToWorld80_g1455.x + objToWorld80_g1455.z ) + ( ( Time90_g1455 * ( Speed45_g1455 * SpeedScale95_g1455 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g1455 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g1455 ) / DM1_FoliageLength32_g1445 ) ) ) );
				float DM1_MotionMask89_g1445 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g1445 = ( ( rotatedValue29_g1455 - input.positionOS.xyz ) * DM1_MotionMask89_g1445 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g1445 = DM1_VertexOffset231_g1445;
				#else
				float3 staticSwitch104_g1445 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g1445 = _DM2Amplitude;
				float Amplitude58_g1456 = DM2_Amplitude30_g1445;
				float3 appendResult28_g1444 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot159_g1445 = -appendResult28_g1444;
				float3 PivotPoint49_g1456 = LocalPivot159_g1445;
				float3 objToWorld53_g1456 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g1456, 1 ) ).xyz;
				float Time87_g1456 = DM_Time169_g1445;
				float SpeedScale93_g1456 = DM_SpeedScale265_g1445;
				float DM2_Speed31_g1445 = _DM2Speed;
				float Speed41_g1456 = DM2_Speed31_g1445;
				float PhaseShift54_g1456 = DM_PhaseShift91_g1445;
				float3 break52_g1456 = PivotPoint49_g1456;
				float3 appendResult20_g1456 = (float3(break52_g1456.x , input.positionOS.xyz.y , break52_g1456.z));
				float DM2_ObjectRadius33_g1445 = _DM2ObjectRadius;
				float ObjectRadius60_g1456 = DM2_ObjectRadius33_g1445;
				float3 rotatedValue33_g1456 = RotateAroundAxis( PivotPoint49_g1456, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g1445 * Amplitude58_g1456 ) * sin( ( ( ( objToWorld53_g1456.x + objToWorld53_g1456.z ) + ( ( Time87_g1456 * ( SpeedScale93_g1456 * Speed41_g1456 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g1456 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g1456 ) / ObjectRadius60_g1456 ) ) ) );
				float DM2_MotionMask90_g1445 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g1456 = DM2_MotionMask90_g1445;
				float3 DM2_VertexOffset232_g1445 = ( ( rotatedValue33_g1456 - input.positionOS.xyz ) * BendingMask62_g1456 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g1445 = DM2_VertexOffset232_g1445;
				#else
				float3 staticSwitch103_g1445 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g1445 = ( staticSwitch104_g1445 + staticSwitch103_g1445 );
				float lerpResult56_g1453 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g1445 = lerpResult56_g1453;
				float MM_DirShift59_g1445 = _MMDirectionShift;
				float MM_DirShiftOffset60_g1445 = _MMDirectionShiftOffset;
				float3 objToWorld11_g1450 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float2 appendResult10_g1450 = (float2(objToWorld11_g1450.x , objToWorld11_g1450.z));
				float MotionNoiseTiling20_g1445 = _MotionNoiseTiling;
				float4 temp_output_73_0_g1445 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g1450 * MotionNoiseTiling20_g1445 ), 0, 0.0) );
				float4 StaticWorldNoise78_g1445 = temp_output_73_0_g1445;
				float4 StaticWorldNoise55_g1449 = StaticWorldNoise78_g1445;
				float3 objToWorld50_g1449 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float lerpResult182_g1445 = lerp( _TimeParameters.x , Nicrom_MM_Time_Flower , GV_Time174_g1445);
				float lerpResult246_g1445 = lerp( _TimeParameters.x , lerpResult182_g1445 , ApplicationIsPlaying241_g1445);
				float MM_Time13_g1445 = lerpResult246_g1445;
				float Time76_g1449 = MM_Time13_g1445;
				float temp_output_243_0_g1445 = Nicrom_MM_SpeedScale_Flower;
				float lerpResult245_g1445 = lerp( temp_output_243_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult249_g1445 = lerp( temp_output_243_0_g1445 , lerpResult245_g1445 , ApplicationIsPlaying241_g1445);
				float MM_SpeedScale253_g1445 = lerpResult249_g1445;
				float SpeedScale_RA80_g1449 = MM_SpeedScale253_g1445;
				float MM_DirShiftSpeed56_g1445 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g1445 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1449 = radians( ( ( MM_DirAngle51_g1445 + ( ( MM_DirShift59_g1445 + ( MM_DirShiftOffset60_g1445 * (StaticWorldNoise55_g1449).x ) ) * sin( ( ( objToWorld50_g1449.x + objToWorld50_g1449.z ) + ( ( Time76_g1449 * ( SpeedScale_RA80_g1449 * MM_DirShiftSpeed56_g1445 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1449).z * MM_DirShiftNoiseScale57_g1445 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1449 = (float3(cos( temp_output_11_0_g1449 ) , 0.0 , sin( temp_output_11_0_g1449 )));
				float3 worldToObj35_g1449 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1449, 1 ) ).xyz;
				float3 worldToObj36_g1449 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1449 = normalize( (( worldToObj35_g1449 - worldToObj36_g1449 )).xyz );
				float3 MB_RotationAxis129_g1445 = normalizeResult34_g1449;
				float3 RotationAxis56_g1448 = MB_RotationAxis129_g1445;
				float4 StaticWorldNoise31_g1454 = StaticWorldNoise78_g1445;
				float MM_BendingOfset37_g1445 = _MMBendingOffset;
				float MM_Bending35_g1445 = _MMBending;
				float GV_BendingScale176_g1445 = _GVAmplitudeScale;
				float lerpResult188_g1445 = lerp( 1.0 , Nicrom_MM_BendScale_Flowers , GV_BendingScale176_g1445);
				float MM_BendingScale17_g1445 = lerpResult188_g1445;
				float MM_AmplitudeOffset52_g1445 = _MMAmplitudeOffset;
				float MM_Amplitude66_g1445 = _MMAmplitude;
				float lerpResult189_g1445 = lerp( 1.0 , Nicrom_MM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float MM_AmplitudeScale15_g1445 = lerpResult189_g1445;
				float3 objToWorld170_g1454 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1454 = MM_Time13_g1445;
				float MM_Speed53_g1445 = _MMSpeed;
				float Speed125_g1454 = MM_Speed53_g1445;
				float SpeedScale_RotAng201_g1454 = MM_SpeedScale253_g1445;
				float MM_SineWaveLength58_g1445 = _MMSineWaveLength;
				float WaveLength63_g1454 = MM_SineWaveLength58_g1445;
				float MM_PhaseShiftSource207_g1445 = _MMPhaseShiftSource;
				float lerpResult154_g1445 = lerp( input.ase_color.a , (StaticWorldNoise78_g1445).g , MM_PhaseShiftSource207_g1445);
				float MM_PhaseShiftScale39_g1445 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g1445 = ( lerpResult154_g1445 * MM_PhaseShiftScale39_g1445 );
				float PhaseShift127_g1454 = MB_PhaseShift79_g1445;
				float temp_output_20_0_g1454 = sin( ( ( ( objToWorld170_g1454.x + objToWorld170_g1454.z ) + ( ( Time167_g1454 * ( ( Speed125_g1454 * SpeedScale_RotAng201_g1454 ) * WaveLength63_g1454 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1454 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1454 ) ) );
				float MM_MaxHeight55_g1445 = _MMObjectHeight;
				float3 gammaToLinear56_g1454 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g1445 = _MMObjectHeightSource;
				float lerpResult57_g1454 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g1445 ) , (gammaToLinear56_g1454).x , MM_ObjectHeightSource54_g1445);
				float BendingMask189_g1454 = lerpResult57_g1454;
				float MB_RotationAngle130_g1445 = radians( ( ( ( ( ( (StaticWorldNoise31_g1454).y * MM_BendingOfset37_g1445 ) + MM_Bending35_g1445 ) * MM_BendingScale17_g1445 ) + ( ( ( ( (StaticWorldNoise31_g1454).x * MM_AmplitudeOffset52_g1445 ) + MM_Amplitude66_g1445 ) * MM_AmplitudeScale15_g1445 ) * temp_output_20_0_g1454 ) ) * BendingMask189_g1454 ) );
				float RotationAngle54_g1448 = MB_RotationAngle130_g1445;
				float3 LocalPivotPos60_g1448 = LocalPivot159_g1445;
				float3 break62_g1448 = LocalPivotPos60_g1448;
				float VertexPos_Y67_g1448 = input.positionOS.xyz.y;
				float3 appendResult45_g1448 = (float3(break62_g1448.x , VertexPos_Y67_g1448 , break62_g1448.z));
				float3 VertexPos66_g1448 = input.positionOS.xyz;
				float3 rotatedValue30_g1448 = RotateAroundAxis( appendResult45_g1448, VertexPos66_g1448, RotationAxis56_g1448, RotationAngle54_g1448 );
				float3 DetailMotionVO73_g1448 = DM_VertexOffset128_g1445;
				float3 rotatedValue34_g1448 = RotateAroundAxis( LocalPivotPos60_g1448, ( rotatedValue30_g1448 + DetailMotionVO73_g1448 ), RotationAxis56_g1448, RotationAngle54_g1448 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g1445 = ( ( rotatedValue34_g1448 - VertexPos66_g1448 ) * step( 0.01 , VertexPos_Y67_g1448 ) );
				#else
				float3 staticSwitch205_g1445 = DM_VertexOffset128_g1445;
				#endif
				float3 LocalVertexOffset89_g1457 = staticSwitch205_g1445;
				float3 appendResult15_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1457, 1 ) ).xyz;
				float3 objToWorld102_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1457 = ( objToWorld98_g1457 - objToWorld102_g1457 );
				float3 appendResult24_g1457 = (float3(-break20_g1457.z , 0.0 , break20_g1457.x));
				float3 appendResult3_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1457, 1 ) ).xyz;
				float3 objToWorld106_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1457 = ( objToWorld100_g1457 - objToWorld106_g1457 );
				float3 break108_g1457 = temp_output_107_0_g1457;
				float3 lerpResult84_g1457 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1457 , step( 0.001 , ( abs( break108_g1457.x ) + abs( break108_g1457.z ) ) ));
				float3 normalizeResult7_g1457 = ASESafeNormalize( lerpResult84_g1457 );
				float dotResult9_g1457 = dot( normalizeResult7_g1457 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1457 = acos( dotResult9_g1457 );
				float NaNPrevention21_g1457 = step( 0.01 , abs( ( temp_output_12_0_g1457 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1457 = lerp( float3( 1, 0, 0 ) , appendResult24_g1457 , NaNPrevention21_g1457);
				float3 worldToObj99_g1457 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1457, 1 ) ).xyz;
				float3 worldToObj105_g1457 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1457 = normalize( ( worldToObj99_g1457 - worldToObj105_g1457 ) );
				float3 RotationAxis30_g1457 = normalizeResult49_g1457;
				float4 WorldSpaceNoise126_g1457 = temp_output_73_0_g1445;
				float SlopeCorrectionOffset120_g1457 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1457 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1457 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1457).x - 0.0 ) * ( SlopeCorrectionOffset120_g1457 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1457 ) ) * temp_output_12_0_g1457 );
				float3 appendResult28_g1458 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 rotatedValue35_g1457 = RotateAroundAxis( -appendResult28_g1458, ( input.positionOS.xyz + LocalVertexOffset89_g1457 ), RotationAxis30_g1457, RotationAngle29_g1457 );
				float3 lerpResult52_g1457 = lerp( LocalVertexOffset89_g1457 , ( rotatedValue35_g1457 - input.positionOS.xyz ) , NaNPrevention21_g1457);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1457 = lerpResult52_g1457;
				#else
				float3 staticSwitch123_g1457 = LocalVertexOffset89_g1457;
				#endif
				float3 appendResult28_g1472 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g1469 = -appendResult28_g1472;
				float3 temp_output_5_0_g1469 = ( ( staticSwitch123_g1457 + input.positionOS.xyz ) - Scale_Pivot15_g1469 );
				float ScaleVartMin40_g1469 = _ScaleVarMin;
				float ScaleVarMax41_g1469 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1469 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1469 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1471 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1469, 1 ) ).xyz;
				float2 appendResult10_g1471 = (float2(objToWorld11_g1471.x , objToWorld11_g1471.z));
				float2 Scale_WorldSpaceUVs30_g1469 = appendResult10_g1471;
				float Scale_VarNoiseTiling23_g1469 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1469 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1469 * Scale_VarNoiseTiling23_g1469 ), 0, 0.0) );
				float smoothstepResult56_g1469 = smoothstep( ScaleNoiseSharpnessMin59_g1469 , ScaleNoiseSharpnessMax60_g1469 , (Scale_WorldSpaceNoise32_g1469).r);
				float lerpResult44_g1469 = lerp( ScaleVartMin40_g1469 , ScaleVarMax41_g1469 , smoothstepResult56_g1469);
				float ScaleVar47_g1469 = lerpResult44_g1469;
				float clampResult63_g1469 = clamp( ( ScaleVar47_g1469 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1469 = ( temp_output_5_0_g1469 * clampResult63_g1469 );
				#else
				float3 staticSwitch72_g1469 = temp_output_5_0_g1469;
				#endif
				float ScaleOffset19_g1469 = _ScaleOffset;
				float clampResult64_g1469 = clamp( ( ScaleOffset19_g1469 + 1.0 ) , 0.0 , 7.0 );
				
				float3 customSurfaceDepth3_g1479 = input.positionOS.xyz;
				float customEye3_g1479 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1479)).z;
				output.ase_texcoord1.z = customEye3_g1479;
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1469 * clampResult64_g1469 ) + Scale_Pivot15_g1469 ) - input.positionOS.xyz );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				output.positionCS = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.ase_texcoord2 = input.ase_texcoord2;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_texcoord1 = input.ase_texcoord1;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.ase_texcoord2 = patch[0].ase_texcoord2 * bary.x + patch[1].ase_texcoord2 * bary.y + patch[2].ase_texcoord2 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag( PackedVaryings input
				#if defined( ASE_DEPTH_WRITE_ON )
				,out float outputDepth : ASE_SV_DEPTH
				#endif
				 ) : SV_Target
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( PositionWS );
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;

				float2 uv_Albedo137_g1474 = input.ase_texcoord1.xy;
				float4 tex2DNode137_g1474 = tex2D( _Albedo, uv_Albedo137_g1474 );
				float temp_output_31_0_g1479 = tex2DNode137_g1474.a;
				float DF_Length_Local38_g1479 = _DistanceFadeLength;
				float DF_Length_Global45_g1479 = Nicrom_Flower_DF_Length;
				float DF_Start_Global43_g1479 = Nicrom_Flower_DF_Start;
				float lerpResult49_g1479 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1479 ));
				float DF_UseGV28_g1479 = lerpResult49_g1479;
				float lerpResult26_g1479 = lerp( DF_Length_Local38_g1479 , DF_Length_Global45_g1479 , DF_UseGV28_g1479);
				float DistanceFadeLength23_g1479 = lerpResult26_g1479;
				float DF_Start_Local36_g1479 = _DistanceFadeStart;
				float lerpResult20_g1479 = lerp( DF_Start_Local36_g1479 , DF_Start_Global43_g1479 , DF_UseGV28_g1479);
				float DistanceFadeStart27_g1479 = lerpResult20_g1479;
				float customEye3_g1479 = input.ase_texcoord1.z;
				float cameraDepthFade3_g1479 = (( customEye3_g1479 -_ProjectionParams.y - DistanceFadeStart27_g1479 ) / DistanceFadeLength23_g1479);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1479 = ( temp_output_31_0_g1479 * saturate( ( 1.0 - cameraDepthFade3_g1479 ) ) );
				#else
				float staticSwitch33_g1479 = temp_output_31_0_g1479;
				#endif
				

				surfaceDescription.Alpha = staticSwitch33_g1479;
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				return _SelectionID;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "MotionVectors"
			Tags { "LightMode"="MotionVectors" }

			ColorMask RG

			HLSLPROGRAM

			#pragma multi_compile_local _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_VERSION 19901
			#define ASE_SRP_VERSION 170003


			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

            #define SHADERPASS SHADERPASS_MOTION_VECTORS

            #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
		    #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
            #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DebugMipmapStreamingMacros.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
		    #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
				#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
			#endif

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MotionVectorsCommon.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#define ASE_NEEDS_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES2
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES0
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _DISTANCEFADE_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 positionOld : TEXCOORD4;
				#if _ADD_PRECOMPUTED_VELOCITY
					float3 alembicMotionVector : TEXCOORD5;
				#endif
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 positionCSNoJitter : TEXCOORD0;
				float4 previousPositionCSNoJitter : TEXCOORD1;
				float3 positionWS : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 Nicrom_TerrainColorMap_TexelSize;
			float4 _ColorMask1_ST;
			float3 _FlowerColor1B;
			float3 _StemColorTop;
			float3 _FlowerColor1A;
			float3 _StemColorBottom;
			float3 _FlowerColor2B;
			float3 _FlowerColor2A;
			half _GVBendingScale;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ScaleVarMax;
			float _ColorMask2Tiling;
			float _ColorMask2Opacity;
			float _BWTBottom;
			float _BWTTop;
			float _StemColorMaskStart;
			float _StemColorMaskEnd;
			float _STEM;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _ScaleVarMin;
			float _SlopeCorrectionOffset;
			float _DM1Amplitude;
			float _GVTime;
			float _DM1Speed;
			float _DM1FoliageLength;
			float _DM2Amplitude;
			float _DM2Speed;
			float _DM2ObjectRadius;
			half _MMDirectionAngle;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _MotionNoiseTiling;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVAmplitudeScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionMagnitude;
			float _AlphaCutoff;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			float Nicrom_DM_AmpScale_Flower;
			float Nicrom_DM_Time_Flower;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Flower;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Flower;
			float Nicrom_MM_SpeedScale_Flower;
			float Nicrom_MM_BendScale_Flowers;
			float Nicrom_MM_AmpScale_Flower;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;
			float Nicrom_Flower_DF_Length;
			float Nicrom_Flower_DF_Start;


			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float3 ASESafeNormalize(float3 inVec)
			{
				float dp3 = max(1.175494351e-38, dot(inVec, inVec));
				return inVec* rsqrt(dp3);
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g1447 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g1447 = (float3(cos( temp_output_23_0_g1447 ) , 0.0 , sin( temp_output_23_0_g1447 )));
				float3 DB_RotationAxis87_g1445 = appendResult25_g1447;
				float GV_AmplitudeScale175_g1445 = _GVBendingScale;
				float lerpResult186_g1445 = lerp( 1.0 , Nicrom_DM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float DM_AmplitudeScale168_g1445 = lerpResult186_g1445;
				float DM1_Amplitude28_g1445 = _DM1Amplitude;
				float3 objToWorld80_g1455 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g1445 = _GVTime;
				float lerpResult187_g1445 = lerp( _TimeParameters.x , Nicrom_DM_Time_Flower , GV_Time174_g1445);
				float ApplicationIsPlaying241_g1445 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g1445 = lerp( _TimeParameters.x , lerpResult187_g1445 , ApplicationIsPlaying241_g1445);
				float DM_Time169_g1445 = lerpResult256_g1445;
				float Time90_g1455 = DM_Time169_g1445;
				float DM1_Speed29_g1445 = _DM1Speed;
				float Speed45_g1455 = DM1_Speed29_g1445;
				float temp_output_244_0_g1445 = Nicrom_DM_SpeedScale_Flower;
				float lerpResult261_g1445 = lerp( temp_output_244_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult262_g1445 = lerp( temp_output_244_0_g1445 , lerpResult261_g1445 , ApplicationIsPlaying241_g1445);
				float DM_SpeedScale265_g1445 = lerpResult262_g1445;
				float SpeedScale95_g1455 = DM_SpeedScale265_g1445;
				float DM_PhaseShift91_g1445 = input.ase_color.a;
				float PhaseShift48_g1455 = DM_PhaseShift91_g1445;
				float3 appendResult24_g1447 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g1445 = appendResult24_g1447;
				float3 PivotPosOnYAxis56_g1455 = DM_PivotPosOnYAxis88_g1445;
				float DM1_FoliageLength32_g1445 = _DM1FoliageLength;
				float3 rotatedValue29_g1455 = RotateAroundAxis( PivotPosOnYAxis56_g1455, input.positionOS.xyz, DB_RotationAxis87_g1445, radians( ( ( ( DM_AmplitudeScale168_g1445 * DM1_Amplitude28_g1445 ) * sin( ( ( ( objToWorld80_g1455.x + objToWorld80_g1455.z ) + ( ( Time90_g1455 * ( Speed45_g1455 * SpeedScale95_g1455 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g1455 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g1455 ) / DM1_FoliageLength32_g1445 ) ) ) );
				float DM1_MotionMask89_g1445 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g1445 = ( ( rotatedValue29_g1455 - input.positionOS.xyz ) * DM1_MotionMask89_g1445 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g1445 = DM1_VertexOffset231_g1445;
				#else
				float3 staticSwitch104_g1445 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g1445 = _DM2Amplitude;
				float Amplitude58_g1456 = DM2_Amplitude30_g1445;
				float3 appendResult28_g1444 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot159_g1445 = -appendResult28_g1444;
				float3 PivotPoint49_g1456 = LocalPivot159_g1445;
				float3 objToWorld53_g1456 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g1456, 1 ) ).xyz;
				float Time87_g1456 = DM_Time169_g1445;
				float SpeedScale93_g1456 = DM_SpeedScale265_g1445;
				float DM2_Speed31_g1445 = _DM2Speed;
				float Speed41_g1456 = DM2_Speed31_g1445;
				float PhaseShift54_g1456 = DM_PhaseShift91_g1445;
				float3 break52_g1456 = PivotPoint49_g1456;
				float3 appendResult20_g1456 = (float3(break52_g1456.x , input.positionOS.xyz.y , break52_g1456.z));
				float DM2_ObjectRadius33_g1445 = _DM2ObjectRadius;
				float ObjectRadius60_g1456 = DM2_ObjectRadius33_g1445;
				float3 rotatedValue33_g1456 = RotateAroundAxis( PivotPoint49_g1456, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g1445 * Amplitude58_g1456 ) * sin( ( ( ( objToWorld53_g1456.x + objToWorld53_g1456.z ) + ( ( Time87_g1456 * ( SpeedScale93_g1456 * Speed41_g1456 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g1456 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g1456 ) / ObjectRadius60_g1456 ) ) ) );
				float DM2_MotionMask90_g1445 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g1456 = DM2_MotionMask90_g1445;
				float3 DM2_VertexOffset232_g1445 = ( ( rotatedValue33_g1456 - input.positionOS.xyz ) * BendingMask62_g1456 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g1445 = DM2_VertexOffset232_g1445;
				#else
				float3 staticSwitch103_g1445 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g1445 = ( staticSwitch104_g1445 + staticSwitch103_g1445 );
				float lerpResult56_g1453 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g1445 = lerpResult56_g1453;
				float MM_DirShift59_g1445 = _MMDirectionShift;
				float MM_DirShiftOffset60_g1445 = _MMDirectionShiftOffset;
				float3 objToWorld11_g1450 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float2 appendResult10_g1450 = (float2(objToWorld11_g1450.x , objToWorld11_g1450.z));
				float MotionNoiseTiling20_g1445 = _MotionNoiseTiling;
				float4 temp_output_73_0_g1445 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g1450 * MotionNoiseTiling20_g1445 ), 0, 0.0) );
				float4 StaticWorldNoise78_g1445 = temp_output_73_0_g1445;
				float4 StaticWorldNoise55_g1449 = StaticWorldNoise78_g1445;
				float3 objToWorld50_g1449 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g1445, 1 ) ).xyz;
				float lerpResult182_g1445 = lerp( _TimeParameters.x , Nicrom_MM_Time_Flower , GV_Time174_g1445);
				float lerpResult246_g1445 = lerp( _TimeParameters.x , lerpResult182_g1445 , ApplicationIsPlaying241_g1445);
				float MM_Time13_g1445 = lerpResult246_g1445;
				float Time76_g1449 = MM_Time13_g1445;
				float temp_output_243_0_g1445 = Nicrom_MM_SpeedScale_Flower;
				float lerpResult245_g1445 = lerp( temp_output_243_0_g1445 , 1.0 , GV_Time174_g1445);
				float lerpResult249_g1445 = lerp( temp_output_243_0_g1445 , lerpResult245_g1445 , ApplicationIsPlaying241_g1445);
				float MM_SpeedScale253_g1445 = lerpResult249_g1445;
				float SpeedScale_RA80_g1449 = MM_SpeedScale253_g1445;
				float MM_DirShiftSpeed56_g1445 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g1445 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1449 = radians( ( ( MM_DirAngle51_g1445 + ( ( MM_DirShift59_g1445 + ( MM_DirShiftOffset60_g1445 * (StaticWorldNoise55_g1449).x ) ) * sin( ( ( objToWorld50_g1449.x + objToWorld50_g1449.z ) + ( ( Time76_g1449 * ( SpeedScale_RA80_g1449 * MM_DirShiftSpeed56_g1445 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1449).z * MM_DirShiftNoiseScale57_g1445 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1449 = (float3(cos( temp_output_11_0_g1449 ) , 0.0 , sin( temp_output_11_0_g1449 )));
				float3 worldToObj35_g1449 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1449, 1 ) ).xyz;
				float3 worldToObj36_g1449 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1449 = normalize( (( worldToObj35_g1449 - worldToObj36_g1449 )).xyz );
				float3 MB_RotationAxis129_g1445 = normalizeResult34_g1449;
				float3 RotationAxis56_g1448 = MB_RotationAxis129_g1445;
				float4 StaticWorldNoise31_g1454 = StaticWorldNoise78_g1445;
				float MM_BendingOfset37_g1445 = _MMBendingOffset;
				float MM_Bending35_g1445 = _MMBending;
				float GV_BendingScale176_g1445 = _GVAmplitudeScale;
				float lerpResult188_g1445 = lerp( 1.0 , Nicrom_MM_BendScale_Flowers , GV_BendingScale176_g1445);
				float MM_BendingScale17_g1445 = lerpResult188_g1445;
				float MM_AmplitudeOffset52_g1445 = _MMAmplitudeOffset;
				float MM_Amplitude66_g1445 = _MMAmplitude;
				float lerpResult189_g1445 = lerp( 1.0 , Nicrom_MM_AmpScale_Flower , GV_AmplitudeScale175_g1445);
				float MM_AmplitudeScale15_g1445 = lerpResult189_g1445;
				float3 objToWorld170_g1454 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1454 = MM_Time13_g1445;
				float MM_Speed53_g1445 = _MMSpeed;
				float Speed125_g1454 = MM_Speed53_g1445;
				float SpeedScale_RotAng201_g1454 = MM_SpeedScale253_g1445;
				float MM_SineWaveLength58_g1445 = _MMSineWaveLength;
				float WaveLength63_g1454 = MM_SineWaveLength58_g1445;
				float MM_PhaseShiftSource207_g1445 = _MMPhaseShiftSource;
				float lerpResult154_g1445 = lerp( input.ase_color.a , (StaticWorldNoise78_g1445).g , MM_PhaseShiftSource207_g1445);
				float MM_PhaseShiftScale39_g1445 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g1445 = ( lerpResult154_g1445 * MM_PhaseShiftScale39_g1445 );
				float PhaseShift127_g1454 = MB_PhaseShift79_g1445;
				float temp_output_20_0_g1454 = sin( ( ( ( objToWorld170_g1454.x + objToWorld170_g1454.z ) + ( ( Time167_g1454 * ( ( Speed125_g1454 * SpeedScale_RotAng201_g1454 ) * WaveLength63_g1454 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1454 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1454 ) ) );
				float MM_MaxHeight55_g1445 = _MMObjectHeight;
				float3 gammaToLinear56_g1454 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g1445 = _MMObjectHeightSource;
				float lerpResult57_g1454 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g1445 ) , (gammaToLinear56_g1454).x , MM_ObjectHeightSource54_g1445);
				float BendingMask189_g1454 = lerpResult57_g1454;
				float MB_RotationAngle130_g1445 = radians( ( ( ( ( ( (StaticWorldNoise31_g1454).y * MM_BendingOfset37_g1445 ) + MM_Bending35_g1445 ) * MM_BendingScale17_g1445 ) + ( ( ( ( (StaticWorldNoise31_g1454).x * MM_AmplitudeOffset52_g1445 ) + MM_Amplitude66_g1445 ) * MM_AmplitudeScale15_g1445 ) * temp_output_20_0_g1454 ) ) * BendingMask189_g1454 ) );
				float RotationAngle54_g1448 = MB_RotationAngle130_g1445;
				float3 LocalPivotPos60_g1448 = LocalPivot159_g1445;
				float3 break62_g1448 = LocalPivotPos60_g1448;
				float VertexPos_Y67_g1448 = input.positionOS.xyz.y;
				float3 appendResult45_g1448 = (float3(break62_g1448.x , VertexPos_Y67_g1448 , break62_g1448.z));
				float3 VertexPos66_g1448 = input.positionOS.xyz;
				float3 rotatedValue30_g1448 = RotateAroundAxis( appendResult45_g1448, VertexPos66_g1448, RotationAxis56_g1448, RotationAngle54_g1448 );
				float3 DetailMotionVO73_g1448 = DM_VertexOffset128_g1445;
				float3 rotatedValue34_g1448 = RotateAroundAxis( LocalPivotPos60_g1448, ( rotatedValue30_g1448 + DetailMotionVO73_g1448 ), RotationAxis56_g1448, RotationAngle54_g1448 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g1445 = ( ( rotatedValue34_g1448 - VertexPos66_g1448 ) * step( 0.01 , VertexPos_Y67_g1448 ) );
				#else
				float3 staticSwitch205_g1445 = DM_VertexOffset128_g1445;
				#endif
				float3 LocalVertexOffset89_g1457 = staticSwitch205_g1445;
				float3 appendResult15_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1457, 1 ) ).xyz;
				float3 objToWorld102_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1457 = ( objToWorld98_g1457 - objToWorld102_g1457 );
				float3 appendResult24_g1457 = (float3(-break20_g1457.z , 0.0 , break20_g1457.x));
				float3 appendResult3_g1457 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1457 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1457, 1 ) ).xyz;
				float3 objToWorld106_g1457 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1457 = ( objToWorld100_g1457 - objToWorld106_g1457 );
				float3 break108_g1457 = temp_output_107_0_g1457;
				float3 lerpResult84_g1457 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1457 , step( 0.001 , ( abs( break108_g1457.x ) + abs( break108_g1457.z ) ) ));
				float3 normalizeResult7_g1457 = ASESafeNormalize( lerpResult84_g1457 );
				float dotResult9_g1457 = dot( normalizeResult7_g1457 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1457 = acos( dotResult9_g1457 );
				float NaNPrevention21_g1457 = step( 0.01 , abs( ( temp_output_12_0_g1457 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1457 = lerp( float3( 1, 0, 0 ) , appendResult24_g1457 , NaNPrevention21_g1457);
				float3 worldToObj99_g1457 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1457, 1 ) ).xyz;
				float3 worldToObj105_g1457 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1457 = normalize( ( worldToObj99_g1457 - worldToObj105_g1457 ) );
				float3 RotationAxis30_g1457 = normalizeResult49_g1457;
				float4 WorldSpaceNoise126_g1457 = temp_output_73_0_g1445;
				float SlopeCorrectionOffset120_g1457 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1457 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1457 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1457).x - 0.0 ) * ( SlopeCorrectionOffset120_g1457 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1457 ) ) * temp_output_12_0_g1457 );
				float3 appendResult28_g1458 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 rotatedValue35_g1457 = RotateAroundAxis( -appendResult28_g1458, ( input.positionOS.xyz + LocalVertexOffset89_g1457 ), RotationAxis30_g1457, RotationAngle29_g1457 );
				float3 lerpResult52_g1457 = lerp( LocalVertexOffset89_g1457 , ( rotatedValue35_g1457 - input.positionOS.xyz ) , NaNPrevention21_g1457);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1457 = lerpResult52_g1457;
				#else
				float3 staticSwitch123_g1457 = LocalVertexOffset89_g1457;
				#endif
				float3 appendResult28_g1472 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g1469 = -appendResult28_g1472;
				float3 temp_output_5_0_g1469 = ( ( staticSwitch123_g1457 + input.positionOS.xyz ) - Scale_Pivot15_g1469 );
				float ScaleVartMin40_g1469 = _ScaleVarMin;
				float ScaleVarMax41_g1469 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1469 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1469 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1471 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1469, 1 ) ).xyz;
				float2 appendResult10_g1471 = (float2(objToWorld11_g1471.x , objToWorld11_g1471.z));
				float2 Scale_WorldSpaceUVs30_g1469 = appendResult10_g1471;
				float Scale_VarNoiseTiling23_g1469 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1469 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1469 * Scale_VarNoiseTiling23_g1469 ), 0, 0.0) );
				float smoothstepResult56_g1469 = smoothstep( ScaleNoiseSharpnessMin59_g1469 , ScaleNoiseSharpnessMax60_g1469 , (Scale_WorldSpaceNoise32_g1469).r);
				float lerpResult44_g1469 = lerp( ScaleVartMin40_g1469 , ScaleVarMax41_g1469 , smoothstepResult56_g1469);
				float ScaleVar47_g1469 = lerpResult44_g1469;
				float clampResult63_g1469 = clamp( ( ScaleVar47_g1469 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1469 = ( temp_output_5_0_g1469 * clampResult63_g1469 );
				#else
				float3 staticSwitch72_g1469 = temp_output_5_0_g1469;
				#endif
				float ScaleOffset19_g1469 = _ScaleOffset;
				float clampResult64_g1469 = clamp( ( ScaleOffset19_g1469 + 1.0 ) , 0.0 , 7.0 );
				
				float3 customSurfaceDepth3_g1479 = input.positionOS.xyz;
				float customEye3_g1479 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1479)).z;
				output.ase_texcoord3.z = customEye3_g1479;
				
				output.ase_texcoord3.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1469 * clampResult64_g1469 ) + Scale_Pivot15_g1469 ) - input.positionOS.xyz );

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				#if defined(APLICATION_SPACE_WARP_MOTION)
					output.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, input.positionOS));
					output.positionCS = output.positionCSNoJitter;
				#else
					output.positionCS = vertexInput.positionCS;
					output.positionCSNoJitter = mul(_NonJitteredViewProjMatrix, mul(UNITY_MATRIX_M, input.positionOS));
				#endif

				float4 prevPos = ( unity_MotionVectorsParams.x == 1 ) ? float4( input.positionOld, 1 ) : input.positionOS;

				#if _ADD_PRECOMPUTED_VELOCITY
					prevPos = prevPos - float4(input.alembicMotionVector, 0);
				#endif

				output.previousPositionCSNoJitter = mul( _PrevViewProjMatrix, mul( UNITY_PREV_MATRIX_M, prevPos ) );

				output.positionWS = vertexInput.positionWS;

				// removed in ObjectMotionVectors.hlsl found in unity 6000.0.23 and higher
				//ApplyMotionVectorZBias( output.positionCS );
				return output;
			}

			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}

			half4 frag(	PackedVaryings input
				#if defined( ASE_DEPTH_WRITE_ON )
				,out float outputDepth : ASE_SV_DEPTH
				#endif
				 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				float3 PositionWS = input.positionWS;
				float3 PositionRWS = GetCameraRelativePositionWS( PositionWS );
				float4 ScreenPosNorm = float4( GetNormalizedScreenSpaceUV( input.positionCS ), input.positionCS.zw );
				float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, input.positionCS.z ) * input.positionCS.w;

				float2 uv_Albedo137_g1474 = input.ase_texcoord3.xy;
				float4 tex2DNode137_g1474 = tex2D( _Albedo, uv_Albedo137_g1474 );
				float temp_output_31_0_g1479 = tex2DNode137_g1474.a;
				float DF_Length_Local38_g1479 = _DistanceFadeLength;
				float DF_Length_Global45_g1479 = Nicrom_Flower_DF_Length;
				float DF_Start_Global43_g1479 = Nicrom_Flower_DF_Start;
				float lerpResult49_g1479 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1479 ));
				float DF_UseGV28_g1479 = lerpResult49_g1479;
				float lerpResult26_g1479 = lerp( DF_Length_Local38_g1479 , DF_Length_Global45_g1479 , DF_UseGV28_g1479);
				float DistanceFadeLength23_g1479 = lerpResult26_g1479;
				float DF_Start_Local36_g1479 = _DistanceFadeStart;
				float lerpResult20_g1479 = lerp( DF_Start_Local36_g1479 , DF_Start_Global43_g1479 , DF_UseGV28_g1479);
				float DistanceFadeStart27_g1479 = lerpResult20_g1479;
				float customEye3_g1479 = input.ase_texcoord3.z;
				float cameraDepthFade3_g1479 = (( customEye3_g1479 -_ProjectionParams.y - DistanceFadeStart27_g1479 ) / DistanceFadeLength23_g1479);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1479 = ( temp_output_31_0_g1479 * saturate( ( 1.0 - cameraDepthFade3_g1479 ) ) );
				#else
				float staticSwitch33_g1479 = temp_output_31_0_g1479;
				#endif
				

				float Alpha = staticSwitch33_g1479;
				float AlphaClipThreshold = _AlphaCutoff;

				#if defined( ASE_DEPTH_WRITE_ON )
					float DeviceDepth = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(ASE_CHANGES_WORLD_POS)
					float3 positionOS = mul( GetWorldToObjectMatrix(),  float4( PositionWS, 1.0 ) ).xyz;
					float3 previousPositionWS = mul( GetPrevObjectToWorldMatrix(),  float4( positionOS, 1.0 ) ).xyz;
					input.positionCSNoJitter = mul( _NonJitteredViewProjMatrix, float4( PositionWS, 1.0 ) );
					input.previousPositionCSNoJitter = mul( _PrevViewProjMatrix, float4( previousPositionWS, 1.0 ) );
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined( ASE_DEPTH_WRITE_ON )
					outputDepth = DeviceDepth;
				#endif

				#if defined(APLICATION_SPACE_WARP_MOTION)
					return float4( CalcAswNdcMotionVectorFromCsPositions( input.positionCSNoJitter, input.previousPositionCSNoJitter ), 1 );
				#else
					return float4( CalcNdcMotionVectorFromCsPositions( input.positionCSNoJitter, input.previousPositionCSNoJitter ), 0, 0 );
				#endif
			}
			ENDHLSL
		}

	
	}
	
	CustomEditor "Nicrom.CMI_Flower"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}

/*ASEBEGIN
Version=19901
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2292;2560,2928;Inherit;False;Nicrom - Flower - Motion - GP;-1;;1394;0947e61a284d6ce44bc8a21d32d9ac74;0;0;7;FLOAT;10;FLOAT;17;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;19;FLOAT;9
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2298;2528,3152;Inherit;False;Nicrom - Pivot From UV1 - Local;-1;;1444;df723c9d5f0b2944f9c2a494e9780ebb;0;0;1;FLOAT3;33
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2295;2880,2928;Inherit;False;Nicrom - Motion;30;;1445;ba60642b1d9af614f93c28cb2553ff1c;0;8;179;FLOAT;0;False;243;FLOAT;1;False;178;FLOAT;0;False;180;FLOAT;0;False;184;FLOAT;0;False;244;FLOAT;1;False;185;FLOAT;0;False;238;FLOAT3;0,0,0;False;2;FLOAT3;0;COLOR;215
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2296;3296,2928;Inherit;False;Nicrom - Slope Correction;64;;1457;af072765142b7b4418aadc0762673233;0;2;87;FLOAT3;0,0,0;False;93;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2299;3616,2928;Inherit;False;Nicrom - Scale;68;;1469;8d53ba1ace8e1014986c3779ab835fd1;0;1;13;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT;70
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2237;3968,2944;Inherit;False;ScaleVarNoise;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2238;3072,2560;Inherit;False;2237;ScaleVarNoise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2251;3328,2704;Inherit;False;Nicrom - Flower - DF - GP;-1;;1473;3a564424836b8a54ba36421e5ea0ba33;0;0;2;FLOAT;0;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2290;3296,2560;Inherit;False;Nicrom - Flower - Main;1;;1474;ba91e28e4f998ef49a560b850e8e9087;0;1;211;FLOAT;0;False;2;FLOAT4;0;FLOAT;164
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1330;-19002.03,10716.32;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1328;-19355.95,10790.4;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2228;3616,2704;Inherit;False;Nicrom - Distance Fade;25;;1479;05e2fd54e656b694286271db4b0312fc;0;3;31;FLOAT;0;False;34;FLOAT;0;False;35;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2300;3712,2624;Inherit;False;Constant;_Float3;Float 3;9;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2191;3584,2832;Inherit;False;Property;_AlphaCutoff;Alpha Cutoff;0;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2301;3968,2560;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;6;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2302;3968,2560;Float;False;True;-1;3;Nicrom.CMI_Flower;0;12;Nicrom/ASE/Vegetation/Flower;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;48;Lighting Model;0;0;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;0;638871548667447753;Alpha Clipping;1;0;  Use Shadow Threshold;0;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;Receive Shadows;1;0;Receive SSAO;1;0;Specular Highlights;1;0;Environment Reflections;1;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;  XR Motion Vectors;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;12;False;True;True;True;True;True;True;True;True;True;True;False;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2303;3968,2560;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2304;3968,2560;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2305;3968,2560;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2306;3968,2560;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2307;3968,2560;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2308;3968,2560;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2309;3968,2560;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2310;3968,2560;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2311;3968,2560;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;MotionVectors;0;10;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2312;3968,2560;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;XRMotionVectors;0;11;XRMotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;True;1;False;;255;False;;1;False;;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;1;LightMode=XRMotionVectors;False;False;0;;0;0;Standard;0;False;0
WireConnection;2295;179;2292;10
WireConnection;2295;243;2292;17
WireConnection;2295;178;2292;6
WireConnection;2295;180;2292;7
WireConnection;2295;184;2292;8
WireConnection;2295;244;2292;19
WireConnection;2295;185;2292;9
WireConnection;2295;238;2298;33
WireConnection;2296;87;2295;0
WireConnection;2296;93;2295;215
WireConnection;2299;13;2296;0
WireConnection;2237;0;2299;70
WireConnection;2290;211;2238;0
WireConnection;2228;31;2290;164
WireConnection;2228;34;2251;0
WireConnection;2228;35;2251;3
WireConnection;2302;0;2290;0
WireConnection;2302;3;2300;0
WireConnection;2302;4;2300;0
WireConnection;2302;6;2228;0
WireConnection;2302;7;2191;0
WireConnection;2302;8;2299;0
ASEEND*/
//CHKSM=1E9028B02648D5EBC3C9E20CB21F805ABFC22F56