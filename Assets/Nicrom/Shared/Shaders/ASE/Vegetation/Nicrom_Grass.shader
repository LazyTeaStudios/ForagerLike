// Made with Amplify Shader Editor v1.9.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Nicrom/ASE/Vegetation/Grass"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		_AlphaCutoff( "Alpha Cutoff", Range( 0, 1 ) ) = 0.5
		[KeywordEnum( Two,Three,Four )] _Colors( "Colors", Float ) = 1
		_Color1A( "Color 1A", Color ) = ( 0.5254902, 0.6588235, 0.1960784 )
		_Color1B( "Color 1B", Color ) = ( 0.4352941, 0.6039216, 0.01960784 )
		_Color2A( "Color 2A", Color ) = ( 0.5254902, 0.6588235, 0.1960784 )
		_Color2B( "Color 2B", Color ) = ( 0.4352941, 0.6039216, 0.01960784 )
		[KeywordEnum( A,B )] _ColorBlendingMode( "Color Blending Mode", Float ) = 0
		[Enum(None,0,Color Mask 1,1,Color Mask 2,2,Color Mask 3,3,Motion Wave,4,Scale Var Noise,5)] _Debug( "Debug", Float ) = 0
		[SingleLineTexture][Space] _Albedo( "Albedo", 2D ) = "white" {}
		_Metallic( "Metallic", Range( 0, 1 ) ) = 0
		[SingleLineTexture] _ColorMask1( "Color Mask 1", 2D ) = "white" {}
		_Smoothness( "Smoothness", Range( 0, 1 ) ) = 0
		[SingleLineTexture] _ColorMask2( "Color Mask 2", 2D ) = "white" {}
		[KeywordEnum( Texture,Vertex )] _ColorMask1Source( "Color Mask 1 Source", Float ) = 0
		_ColorMask1Start( "Color Mask 1 Start", Range( 0, 2 ) ) = 0.3
		_ColorMask3Start( "Color Mask 3 Start", Range( 0, 2 ) ) = 0.3
		_ColorMask1End( "Color Mask 1 End", Range( 0, 2 ) ) = 1
		_ColorMask3End( "Color Mask 3 End", Range( 0, 2 ) ) = 1
		_ColorMask2Tiling( "Color Mask 2 Tiling", Range( 0.0001, 4 ) ) = 0.0001
		_ColorMask2Speed( "Color Mask 2 Speed", Range( 0, 3 ) ) = 1
		_ColorMask2SharpnessMin( "Color Mask 2 Sharpness Min", Range( 0, 1 ) ) = 0.2
		_ColorMask2SharpnessMax( "Color Mask 2 Sharpness Max", Range( 0, 1 ) ) = 0.45
		[Toggle( _BLENDWITHTERRAIN_ON )] _BlendWithTerrain( "Blend With Terrain", Float ) = 0
		_BWTTop( "BWT Top", Range( 0, 1 ) ) = 0
		_BWTBottom( "BWT Bottom", Range( 0, 1 ) ) = 1
		[Toggle] _BWTMask( "BWT Mask", Float ) = 0
		_BWTMaskStart( "BWT Mask Start", Range( 0, 2 ) ) = 1
		_BWTMaskEnd( "BWT Mask End", Range( 0, 2 ) ) = 1
		_ColorMask2Opacity( "Color Mask 2 Opacity", Range( 0, 1 ) ) = 1
		[Toggle] _ColorMask2GV( "Color Mask 2 GV", Float ) = 0
		[Space][Toggle( _DISTANCEFADE_ON )] _DistanceFade( "Distance Fade", Float ) = 1
		[Toggle] _DistanceFadeUseGV( "DistanceFade Use GV", Float ) = 0
		_DistanceFadeStart( "Distance Fade Start", Range( 0, 2000 ) ) = 50
		_DistanceFadeLength( "Distance Fade Length", Range( 0, 20000 ) ) = 50
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
		[KeywordEnum( Simple,Accurate )] _MMBendingMethod( "MM Bending Method", Float ) = 0
		[SingleLineTexture][Space] _MotionNoise( "Motion Noise", 2D ) = "white" {}
		_StaticNoiseTiling( "Static Noise Tiling", Range( 0.0001, 1 ) ) = 1
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
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#pragma shader_feature_local_fragment _BLENDWITHTERRAIN_ON
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local _MMBENDINGMETHOD_SIMPLE _MMBENDINGMETHOD_ACCURATE
			#pragma shader_feature_local _COLORS_TWO _COLORS_THREE _COLORS_FOUR
			#pragma shader_feature_local _COLORMASK1SOURCE_TEXTURE _COLORMASK1SOURCE_VERTEX
			#pragma shader_feature_local _COLORBLENDINGMODE_A _COLORBLENDINGMODE_B
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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 Nicrom_TerrainColorMap_TexelSize;
			float4 _ColorMask1_ST;
			float4 _Albedo_ST;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color1B;
			float3 _Color2A;
			half _MMDirectionAngle;
			float _BWTTop;
			float _BWTMaskStart;
			float _BWTMaskEnd;
			float _BWTMask;
			float _BWTBottom;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask2SharpnessMin;
			float _ColorMask2SharpnessMax;
			float _ColorMask2Tiling;
			float _ColorMask2Speed;
			float _ColorMask2Opacity;
			float _ColorMask3Start;
			float _ColorMask3End;
			float _Metallic;
			float _Smoothness;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _Debug;
			float _ScaleVarNoiseTiling;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _StaticNoiseTiling;
			float _GVTime;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVBendingScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionOffset;
			float _SlopeCorrectionMagnitude;
			float _ScaleVarMin;
			float _ScaleVarMax;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleOffset;
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

			float Nicrom_Grass_DF_Start;
			float Nicrom_Grass_DF_Length;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Grass;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_Grass;
			float Nicrom_MM_BendScale_Grass;
			float Nicrom_MM_AmpScale_Grass;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;
			sampler2D Nicrom_TerrainColorMap;
			float2 Nicrom_TerrainPosition;
			float Nicrom_TerrainSize;
			sampler2D _ColorMask1;
			float Nicrom_Grass_CM2_SharpMin;
			float Nicrom_Grass_CM2_SharpMax;
			sampler2D _ColorMask2;
			float Nicrom_Grass_CM2_Tilling;
			float2 Nicrom_Grass_CM2_UVOffset;
			float Nicrom_Grass_CM2_Speed;


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
			
			float4 Debug308_g1448( float Debug_Target, float4 Albedo, float ColorMask1, float ColorMask2, float ColorMask3, float MotionWave, float ScaleVarNoise )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1;
				else if(Debug_Target ==2)
				    return ColorMask2;
				else if(Debug_Target ==3)
				    return ColorMask3;
				else if(Debug_Target ==4)
				    return MotionWave;
				else
				    return ScaleVarNoise;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float lerpResult56_g1436 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle35_g1434 = lerpResult56_g1436;
				float MM_DirectionShift68_g1434 = _MMDirectionShift;
				float MM_DirectionShiftOffset69_g1434 = _MMDirectionShiftOffset;
				float3 appendResult28_g1441 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 MM_LocalPivot3_g1434 = -appendResult28_g1441;
				float3 objToWorld11_g1438 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float2 appendResult10_g1438 = (float2(objToWorld11_g1438.x , objToWorld11_g1438.z));
				float2 WorldSpaceUVs9_g1434 = appendResult10_g1438;
				float StaticNoiseTiling11_g1434 = _StaticNoiseTiling;
				float4 temp_output_16_0_g1434 = tex2Dlod( _MotionNoise, float4( ( WorldSpaceUVs9_g1434 * StaticNoiseTiling11_g1434 ), 0, 0.0) );
				float4 WorldSpaceStaticNoise23_g1434 = temp_output_16_0_g1434;
				float4 StaticWorldNoise55_g1439 = WorldSpaceStaticNoise23_g1434;
				float3 objToWorld50_g1439 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float GVTime160_g1434 = _GVTime;
				float lerpResult146_g1434 = lerp( _TimeParameters.x , Nicrom_MM_Time_Grass , GVTime160_g1434);
				float ApplicationIsPlaying227_g1434 = Nicrom_ApplicationIsPlaying;
				float lerpResult221_g1434 = lerp( _TimeParameters.x , lerpResult146_g1434 , ApplicationIsPlaying227_g1434);
				float MM_Time140_g1434 = lerpResult221_g1434;
				float Time76_g1439 = MM_Time140_g1434;
				float temp_output_205_0_g1434 = Nicrom_MM_SpeedScale_Grass;
				float lerpResult208_g1434 = lerp( temp_output_205_0_g1434 , 1.0 , GVTime160_g1434);
				float lerpResult210_g1434 = lerp( temp_output_205_0_g1434 , lerpResult208_g1434 , ApplicationIsPlaying227_g1434);
				float MM_SpeedScale206_g1434 = lerpResult210_g1434;
				float SpeedScale_RA80_g1439 = MM_SpeedScale206_g1434;
				float MM_DirectionShiftSpeed70_g1434 = _MMDirectionShiftSpeed;
				float MM_DirectionShiftNoiseScale71_g1434 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1439 = radians( ( ( MM_DirectionAngle35_g1434 + ( ( MM_DirectionShift68_g1434 + ( MM_DirectionShiftOffset69_g1434 * (StaticWorldNoise55_g1439).x ) ) * sin( ( ( objToWorld50_g1439.x + objToWorld50_g1439.z ) + ( ( Time76_g1439 * ( SpeedScale_RA80_g1439 * MM_DirectionShiftSpeed70_g1434 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1439).z * MM_DirectionShiftNoiseScale71_g1434 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1439 = (float3(cos( temp_output_11_0_g1439 ) , 0.0 , sin( temp_output_11_0_g1439 )));
				float3 worldToObj35_g1439 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1439, 1 ) ).xyz;
				float3 worldToObj36_g1439 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1439 = normalize( (( worldToObj35_g1439 - worldToObj36_g1439 )).xyz );
				float3 MM_RotationAxis101_g1434 = normalizeResult34_g1439;
				float4 StaticWorldNoise31_g1440 = WorldSpaceStaticNoise23_g1434;
				float MM_BendingOfset73_g1434 = _MMBendingOffset;
				float MM_Bending67_g1434 = _MMBending;
				float GVBendingScale164_g1434 = _GVBendingScale;
				float lerpResult155_g1434 = lerp( 1.0 , Nicrom_MM_BendScale_Grass , GVBendingScale164_g1434);
				float MM_BendingScale141_g1434 = lerpResult155_g1434;
				float MM_AmplitudeOffset62_g1434 = _MMAmplitudeOffset;
				float MM_Amplitude61_g1434 = _MMAmplitude;
				float GVAmplitudeScale162_g1434 = _GVAmplitudeScale;
				float lerpResult152_g1434 = lerp( 1.0 , Nicrom_MM_AmpScale_Grass , GVAmplitudeScale162_g1434);
				float MM_AmplitudeScale139_g1434 = lerpResult152_g1434;
				float3 objToWorld170_g1440 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1440 = MM_Time140_g1434;
				float MM_Speed63_g1434 = _MMSpeed;
				float Speed125_g1440 = MM_Speed63_g1434;
				float SpeedScale_RotAng201_g1440 = MM_SpeedScale206_g1434;
				float MM_SineWaveLength64_g1434 = _MMSineWaveLength;
				float WaveLength63_g1440 = MM_SineWaveLength64_g1434;
				float MM_PhaseShiftSource26_g1434 = _MMPhaseShiftSource;
				float lerpResult38_g1434 = lerp( input.ase_color.a , (WorldSpaceStaticNoise23_g1434).g , MM_PhaseShiftSource26_g1434);
				float MM_PhaseShiftScale34_g1434 = _MMPhaseShiftScale;
				float MM_PhaseShift60_g1434 = ( lerpResult38_g1434 * MM_PhaseShiftScale34_g1434 );
				float PhaseShift127_g1440 = MM_PhaseShift60_g1434;
				float temp_output_20_0_g1440 = sin( ( ( ( objToWorld170_g1440.x + objToWorld170_g1440.z ) + ( ( Time167_g1440 * ( ( Speed125_g1440 * SpeedScale_RotAng201_g1440 ) * WaveLength63_g1440 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1440 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1440 ) ) );
				float MM_ObjectHeight66_g1434 = _MMObjectHeight;
				float3 gammaToLinear56_g1440 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource65_g1434 = _MMObjectHeightSource;
				float lerpResult57_g1440 = lerp( ( input.positionOS.xyz.y / MM_ObjectHeight66_g1434 ) , (gammaToLinear56_g1440).x , MM_ObjectHeightSource65_g1434);
				float BendingMask189_g1440 = lerpResult57_g1440;
				float MM_RotationAngle102_g1434 = radians( ( ( ( ( ( (StaticWorldNoise31_g1440).y * MM_BendingOfset73_g1434 ) + MM_Bending67_g1434 ) * MM_BendingScale141_g1434 ) + ( ( ( ( (StaticWorldNoise31_g1440).x * MM_AmplitudeOffset62_g1434 ) + MM_Amplitude61_g1434 ) * MM_AmplitudeScale139_g1434 ) * temp_output_20_0_g1440 ) ) * BendingMask189_g1440 ) );
				float3 appendResult103_g1434 = (float3(input.positionOS.xyz.x , 0.0 , input.positionOS.xyz.z));
				float3 VertexPosition179_g1434 = input.positionOS.xyz;
				float3 rotatedValue108_g1434 = RotateAroundAxis( appendResult103_g1434, VertexPosition179_g1434, MM_RotationAxis101_g1434, MM_RotationAngle102_g1434 );
				float3 RotationAxis56_g1435 = MM_RotationAxis101_g1434;
				float RotationAngle54_g1435 = MM_RotationAngle102_g1434;
				float3 LocalPivotPos60_g1435 = MM_LocalPivot3_g1434;
				float3 break62_g1435 = LocalPivotPos60_g1435;
				float VertexPos_Y67_g1435 = input.positionOS.xyz.y;
				float3 appendResult45_g1435 = (float3(break62_g1435.x , VertexPos_Y67_g1435 , break62_g1435.z));
				float3 VertexPos66_g1435 = input.positionOS.xyz;
				float3 rotatedValue30_g1435 = RotateAroundAxis( appendResult45_g1435, VertexPos66_g1435, RotationAxis56_g1435, RotationAngle54_g1435 );
				float3 DetailMotionVO73_g1435 = float3( 0,0,0 );
				float3 rotatedValue34_g1435 = RotateAroundAxis( LocalPivotPos60_g1435, ( rotatedValue30_g1435 + DetailMotionVO73_g1435 ), RotationAxis56_g1435, RotationAngle54_g1435 );
				#if defined( _MMBENDINGMETHOD_SIMPLE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#elif defined( _MMBENDINGMETHOD_ACCURATE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue34_g1435 - VertexPos66_g1435 ) * step( 0.01 , VertexPos_Y67_g1435 ) );
				#else
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#endif
				float3 LocalVertexOffset89_g1442 = staticSwitch186_g1434;
				float3 appendResult15_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1442, 1 ) ).xyz;
				float3 objToWorld102_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1442 = ( objToWorld98_g1442 - objToWorld102_g1442 );
				float3 appendResult24_g1442 = (float3(-break20_g1442.z , 0.0 , break20_g1442.x));
				float3 appendResult3_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1442, 1 ) ).xyz;
				float3 objToWorld106_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1442 = ( objToWorld100_g1442 - objToWorld106_g1442 );
				float3 break108_g1442 = temp_output_107_0_g1442;
				float3 lerpResult84_g1442 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1442 , step( 0.001 , ( abs( break108_g1442.x ) + abs( break108_g1442.z ) ) ));
				float3 normalizeResult7_g1442 = ASESafeNormalize( lerpResult84_g1442 );
				float dotResult9_g1442 = dot( normalizeResult7_g1442 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1442 = acos( dotResult9_g1442 );
				float NaNPrevention21_g1442 = step( 0.01 , abs( ( temp_output_12_0_g1442 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1442 = lerp( float3( 1, 0, 0 ) , appendResult24_g1442 , NaNPrevention21_g1442);
				float3 worldToObj99_g1442 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1442, 1 ) ).xyz;
				float3 worldToObj105_g1442 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1442 = normalize( ( worldToObj99_g1442 - worldToObj105_g1442 ) );
				float3 RotationAxis30_g1442 = normalizeResult49_g1442;
				float4 WorldSpaceNoise126_g1442 = temp_output_16_0_g1434;
				float SlopeCorrectionOffset120_g1442 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1442 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1442 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1442).x - 0.0 ) * ( SlopeCorrectionOffset120_g1442 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1442 ) ) * temp_output_12_0_g1442 );
				float3 appendResult28_g1443 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 rotatedValue35_g1442 = RotateAroundAxis( -appendResult28_g1443, ( input.positionOS.xyz + LocalVertexOffset89_g1442 ), RotationAxis30_g1442, RotationAngle29_g1442 );
				float3 lerpResult52_g1442 = lerp( LocalVertexOffset89_g1442 , ( rotatedValue35_g1442 - input.positionOS.xyz ) , NaNPrevention21_g1442);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1442 = lerpResult52_g1442;
				#else
				float3 staticSwitch123_g1442 = LocalVertexOffset89_g1442;
				#endif
				float3 appendResult28_g1447 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 Scale_Pivot15_g1444 = -appendResult28_g1447;
				float3 temp_output_5_0_g1444 = ( ( staticSwitch123_g1442 + input.positionOS.xyz ) - Scale_Pivot15_g1444 );
				float ScaleVartMin40_g1444 = _ScaleVarMin;
				float ScaleVarMax41_g1444 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1444 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1444 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1446 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1444, 1 ) ).xyz;
				float2 appendResult10_g1446 = (float2(objToWorld11_g1446.x , objToWorld11_g1446.z));
				float2 Scale_WorldSpaceUVs30_g1444 = appendResult10_g1446;
				float Scale_VarNoiseTiling23_g1444 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1444 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1444 * Scale_VarNoiseTiling23_g1444 ), 0, 0.0) );
				float smoothstepResult56_g1444 = smoothstep( ScaleNoiseSharpnessMin59_g1444 , ScaleNoiseSharpnessMax60_g1444 , (Scale_WorldSpaceNoise32_g1444).r);
				float lerpResult44_g1444 = lerp( ScaleVartMin40_g1444 , ScaleVarMax41_g1444 , smoothstepResult56_g1444);
				float ScaleVar47_g1444 = lerpResult44_g1444;
				float clampResult63_g1444 = clamp( ( ScaleVar47_g1444 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1444 = ( temp_output_5_0_g1444 * clampResult63_g1444 );
				#else
				float3 staticSwitch72_g1444 = temp_output_5_0_g1444;
				#endif
				float ScaleOffset19_g1444 = _ScaleOffset;
				float clampResult64_g1444 = clamp( ( ScaleOffset19_g1444 + 1.0 ) , 0.0 , 7.0 );
				
				float2 TerrainPosition29_g1448 = ( Nicrom_TerrainPosition + float2( 1,1 ) );
				float2 TerrainPosition4_g1450 = TerrainPosition29_g1448;
				float TerrainSize28_g1448 = Nicrom_TerrainSize;
				float TerrainSize2_g1450 = TerrainSize28_g1448;
				float3 appendResult28_g1449 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 temp_output_3_33_g1448 = -appendResult28_g1449;
				float3 LocalPivot6_g1448 = temp_output_3_33_g1448;
				float3 objToWorld11_g1453 = mul( GetObjectToWorldMatrix(), float4( LocalPivot6_g1448, 1 ) ).xyz;
				float2 appendResult10_g1453 = (float2(objToWorld11_g1453.x , objToWorld11_g1453.z));
				float4 vertexToFrag19_g1450 = tex2Dlod( Nicrom_TerrainColorMap, float4( ( ( ( 1.0 - TerrainPosition4_g1450 ) / TerrainSize2_g1450 ) + ( ( TerrainSize2_g1450 / ( TerrainSize2_g1450 * TerrainSize2_g1450 ) ) * appendResult10_g1453 ) ), 0, 0.0) );
				output.ase_texcoord8 = vertexToFrag19_g1450;
				float vertexToFrag421_g1448 = input.positionOS.xyz.y;
				output.ase_texcoord7.z = vertexToFrag421_g1448;
				#ifdef _SCALEVARIATION_ON
				float staticSwitch73_g1444 = smoothstepResult56_g1444;
				#else
				float staticSwitch73_g1444 = 0.0;
				#endif
				float vertexToFrag71_g1444 = staticSwitch73_g1444;
				output.ase_texcoord7.w = vertexToFrag71_g1444;
				
				float3 customSurfaceDepth3_g1455 = input.positionOS.xyz;
				float customEye3_g1455 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1455)).z;
				output.ase_texcoord9.z = customEye3_g1455;
				
				output.ase_texcoord7.xy = input.texcoord.xy;
				output.ase_texcoord9.xy = input.texcoord1.xy;
				output.ase_color = input.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord9.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1444 * clampResult64_g1444 ) + Scale_Pivot15_g1444 ) - input.positionOS.xyz );

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

				float Debug_Target308_g1448 = _Debug;
				float2 uv_Albedo = input.ase_texcoord7.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode111_g1448 = tex2D( _Albedo, uv_Albedo );
				float4 FoliageTexture123_g1448 = tex2DNode111_g1448;
				float3 Color1A78_g1448 = _Color1A;
				float4 vertexToFrag19_g1450 = input.ase_texcoord8;
				float4 TerrainColor76_g1448 = vertexToFrag19_g1450;
				float BWT_Top44_g1448 = _BWTTop;
				float IsTerrainAlbedoAssigned36_g1448 = step( 8.0 , Nicrom_TerrainColorMap_TexelSize.z );
				float lerpResult62_g1448 = lerp( 0.0 , BWT_Top44_g1448 , IsTerrainAlbedoAssigned36_g1448);
				float BWT_MaskStart434_g1448 = _BWTMaskStart;
				float BWT_MaskEnd435_g1448 = _BWTMaskEnd;
				float vertexToFrag421_g1448 = input.ase_texcoord7.z;
				float VertexPos_Y430_g1448 = vertexToFrag421_g1448;
				float smoothstepResult273_g1448 = smoothstep( BWT_MaskStart434_g1448 , BWT_MaskEnd435_g1448 , VertexPos_Y430_g1448);
				float BWT_MaskToggle461_g1448 = _BWTMask;
				float lerpResult462_g1448 = lerp( 1.0 , ( 1.0 - smoothstepResult273_g1448 ) , BWT_MaskToggle461_g1448);
				float BWT_Mask277_g1448 = lerpResult462_g1448;
				float lerpResult278_g1448 = lerp( 0.0 , lerpResult62_g1448 , BWT_Mask277_g1448);
				float BWT_Top_F74_g1448 = lerpResult278_g1448;
				float4 lerpResult104_g1448 = lerp( float4( Color1A78_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Top_F74_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch114_g1448 = lerpResult104_g1448;
				#else
				float4 staticSwitch114_g1448 = float4( Color1A78_g1448 , 0.0 );
				#endif
				float4 Color1A_Top_BWT167_g1448 = staticSwitch114_g1448;
				float3 Color1B81_g1448 = _Color1B;
				float BWT_Bottom45_g1448 = _BWTBottom;
				float lerpResult61_g1448 = lerp( 0.0 , BWT_Bottom45_g1448 , IsTerrainAlbedoAssigned36_g1448);
				float lerpResult281_g1448 = lerp( 0.0 , lerpResult61_g1448 , BWT_Mask277_g1448);
				float BWT_Bottom_F75_g1448 = lerpResult281_g1448;
				float4 lerpResult105_g1448 = lerp( float4( Color1B81_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Bottom_F75_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch115_g1448 = lerpResult105_g1448;
				#else
				float4 staticSwitch115_g1448 = float4( Color1B81_g1448 , 0.0 );
				#endif
				float4 Color1B_Bot_BWT169_g1448 = staticSwitch115_g1448;
				float2 uv_ColorMask1 = input.ase_texcoord7.xy * _ColorMask1_ST.xy + _ColorMask1_ST.zw;
				float ColorMask1_Tex66_g1448 = ( 1.0 - tex2D( _ColorMask1, uv_ColorMask1 ).r );
				float ColorMask1_End43_g1448 = _ColorMask1End;
				float ColorMask1_Start42_g1448 = _ColorMask1Start;
				float smoothstepResult427_g1448 = smoothstep( ColorMask1_End43_g1448 , ColorMask1_Start42_g1448 , VertexPos_Y430_g1448);
				#if defined( _COLORMASK1SOURCE_TEXTURE )
				float staticSwitch377_g1448 = ColorMask1_Tex66_g1448;
				#elif defined( _COLORMASK1SOURCE_VERTEX )
				float staticSwitch377_g1448 = smoothstepResult427_g1448;
				#else
				float staticSwitch377_g1448 = ColorMask1_Tex66_g1448;
				#endif
				float ColorMask1101_g1448 = staticSwitch377_g1448;
				float4 lerpResult226_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask1101_g1448);
				float4 Colors2306_g1448 = lerpResult226_g1448;
				float3 Color2A82_g1448 = _Color2A;
				float4 lerpResult106_g1448 = lerp( float4( Color2A82_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Top_F74_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch117_g1448 = lerpResult106_g1448;
				#else
				float4 staticSwitch117_g1448 = float4( Color2A82_g1448 , 0.0 );
				#endif
				float4 Color2A_Top_BWT171_g1448 = staticSwitch117_g1448;
				float CM2_GVToggle400_g1448 = _ColorMask2GV;
				float lerpResult409_g1448 = lerp( _ColorMask2SharpnessMin , Nicrom_Grass_CM2_SharpMin , CM2_GVToggle400_g1448);
				float ColorMask2_SharpMin88_g1448 = lerpResult409_g1448;
				float lerpResult412_g1448 = lerp( _ColorMask2SharpnessMax , Nicrom_Grass_CM2_SharpMax , CM2_GVToggle400_g1448);
				float ColorMask2_SharpMax87_g1448 = lerpResult412_g1448;
				float3 appendResult28_g1449 = (float3(input.ase_texcoord9.xy.x , 0.0 , input.ase_texcoord9.xy.y));
				float3 temp_output_3_33_g1448 = -appendResult28_g1449;
				float3 objToWorld11_g1451 = mul( GetObjectToWorldMatrix(), float4( temp_output_3_33_g1448, 1 ) ).xyz;
				float2 appendResult10_g1451 = (float2(objToWorld11_g1451.x , objToWorld11_g1451.z));
				float2 ColorMask2_WSUVs23_g1448 = appendResult10_g1451;
				float lerpResult402_g1448 = lerp( _ColorMask2Tiling , Nicrom_Grass_CM2_Tilling , CM2_GVToggle400_g1448);
				float ColorMask2_Tiling24_g1448 = lerpResult402_g1448;
				float2 CM2_UVOffset_GV159_g1448 = Nicrom_Grass_CM2_UVOffset;
				float lerpResult406_g1448 = lerp( _ColorMask2Speed , Nicrom_Grass_CM2_Speed , CM2_GVToggle400_g1448);
				float ColorMask2_Speed151_g1448 = lerpResult406_g1448;
				float ColorMask2_Noise85_g1448 = (tex2D( _ColorMask2, ( ( ColorMask2_WSUVs23_g1448 * ColorMask2_Tiling24_g1448 ) + ( CM2_UVOffset_GV159_g1448 * ColorMask2_Speed151_g1448 * 0.1 ) ) )).r;
				float smoothstepResult120_g1448 = smoothstep( ColorMask2_SharpMin88_g1448 , ColorMask2_SharpMax87_g1448 , ColorMask2_Noise85_g1448);
				float ColorMask2_Opacity415_g1448 = _ColorMask2Opacity;
				float ColorMask2_F196_g1448 = ( smoothstepResult120_g1448 * ColorMask2_Opacity415_g1448 );
				float4 lerpResult341_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color2A_Top_BWT171_g1448 , ColorMask2_F196_g1448);
				float4 lerpResult344_g1448 = lerp( lerpResult341_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask1101_g1448);
				float4 Colors3_BMA348_g1448 = lerpResult344_g1448;
				float ColorMask3_Start438_g1448 = _ColorMask3Start;
				float ColorMask3_End439_g1448 = _ColorMask3End;
				float smoothstepResult442_g1448 = smoothstep( ColorMask3_Start438_g1448 , ColorMask3_End439_g1448 , VertexPos_Y430_g1448);
				#if defined( _COLORBLENDINGMODE_A )
				float staticSwitch449_g1448 = 0.0;
				#elif defined( _COLORBLENDINGMODE_B )
				float staticSwitch449_g1448 = ( 1.0 - smoothstepResult442_g1448 );
				#else
				float staticSwitch449_g1448 = 0.0;
				#endif
				float ColorMask3446_g1448 = staticSwitch449_g1448;
				float4 lerpResult352_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask3446_g1448);
				float4 lerpResult353_g1448 = lerp( lerpResult352_g1448 , float4( Color2A82_g1448 , 0.0 ) , ( 1.0 - ColorMask1_Tex66_g1448 ));
				float4 Colors3_BMB357_g1448 = lerpResult353_g1448;
				#if defined( _COLORBLENDINGMODE_A )
				float4 staticSwitch366_g1448 = Colors3_BMA348_g1448;
				#elif defined( _COLORBLENDINGMODE_B )
				float4 staticSwitch366_g1448 = Colors3_BMB357_g1448;
				#else
				float4 staticSwitch366_g1448 = Colors3_BMA348_g1448;
				#endif
				float4 Colors3362_g1448 = staticSwitch366_g1448;
				float3 Color2B83_g1448 = _Color2B;
				float4 lerpResult269_g1448 = lerp( float4( Color2B83_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Bottom_F75_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch270_g1448 = lerpResult269_g1448;
				#else
				float4 staticSwitch270_g1448 = float4( Color2B83_g1448 , 0.0 );
				#endif
				float4 Color2B_Bot_BWT271_g1448 = staticSwitch270_g1448;
				float4 lerpResult227_g1448 = lerp( Color2A_Top_BWT171_g1448 , Color2B_Bot_BWT271_g1448 , ColorMask1101_g1448);
				float4 lerpResult225_g1448 = lerp( Colors2306_g1448 , lerpResult227_g1448 , ColorMask2_F196_g1448);
				float4 Colors4_BMA256_g1448 = lerpResult225_g1448;
				float4 lerpResult242_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask3446_g1448);
				float3 lerpResult249_g1448 = lerp( Color2A82_g1448 , Color2B83_g1448 , ColorMask2_F196_g1448);
				float4 lerpResult246_g1448 = lerp( lerpResult242_g1448 , float4( lerpResult249_g1448 , 0.0 ) , ( 1.0 - ColorMask1_Tex66_g1448 ));
				float4 Colors4_BMB257_g1448 = lerpResult246_g1448;
				#if defined( _COLORBLENDINGMODE_A )
				float4 staticSwitch373_g1448 = Colors4_BMA256_g1448;
				#elif defined( _COLORBLENDINGMODE_B )
				float4 staticSwitch373_g1448 = Colors4_BMB257_g1448;
				#else
				float4 staticSwitch373_g1448 = Colors4_BMA256_g1448;
				#endif
				float4 Colors4363_g1448 = staticSwitch373_g1448;
				#if defined( _COLORS_TWO )
				float4 staticSwitch303_g1448 = Colors2306_g1448;
				#elif defined( _COLORS_THREE )
				float4 staticSwitch303_g1448 = Colors3362_g1448;
				#elif defined( _COLORS_FOUR )
				float4 staticSwitch303_g1448 = Colors4363_g1448;
				#else
				float4 staticSwitch303_g1448 = Colors3362_g1448;
				#endif
				float4 Albedo453_g1448 = ( FoliageTexture123_g1448 * staticSwitch303_g1448 );
				float4 Albedo308_g1448 = Albedo453_g1448;
				#if defined( _COLORBLENDINGMODE_A )
				float staticSwitch456_g1448 = ( 1.0 - ColorMask1101_g1448 );
				#elif defined( _COLORBLENDINGMODE_B )
				float staticSwitch456_g1448 = ( 1.0 - ColorMask1_Tex66_g1448 );
				#else
				float staticSwitch456_g1448 = ( 1.0 - ColorMask1101_g1448 );
				#endif
				float ColorMask1308_g1448 = staticSwitch456_g1448;
				#if defined( _COLORS_TWO )
				float staticSwitch381_g1448 = 0.0;
				#elif defined( _COLORS_THREE )
				float staticSwitch381_g1448 = ColorMask2_F196_g1448;
				#elif defined( _COLORS_FOUR )
				float staticSwitch381_g1448 = ColorMask2_F196_g1448;
				#else
				float staticSwitch381_g1448 = ColorMask2_F196_g1448;
				#endif
				float ColorMask2308_g1448 = staticSwitch381_g1448;
				#if defined( _COLORS_TWO )
				float staticSwitch452_g1448 = 0.0;
				#elif defined( _COLORS_THREE )
				float staticSwitch452_g1448 = ColorMask3446_g1448;
				#elif defined( _COLORS_FOUR )
				float staticSwitch452_g1448 = ColorMask3446_g1448;
				#else
				float staticSwitch452_g1448 = ColorMask3446_g1448;
				#endif
				float ColorMask3308_g1448 = staticSwitch452_g1448;
				float3 objToWorld170_g1440 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GVTime160_g1434 = _GVTime;
				float lerpResult146_g1434 = lerp( _TimeParameters.x , Nicrom_MM_Time_Grass , GVTime160_g1434);
				float ApplicationIsPlaying227_g1434 = Nicrom_ApplicationIsPlaying;
				float lerpResult221_g1434 = lerp( _TimeParameters.x , lerpResult146_g1434 , ApplicationIsPlaying227_g1434);
				float MM_Time140_g1434 = lerpResult221_g1434;
				float Time167_g1440 = MM_Time140_g1434;
				float MM_Speed63_g1434 = _MMSpeed;
				float Speed125_g1440 = MM_Speed63_g1434;
				float temp_output_205_0_g1434 = Nicrom_MM_SpeedScale_Grass;
				float lerpResult208_g1434 = lerp( temp_output_205_0_g1434 , 1.0 , GVTime160_g1434);
				float lerpResult210_g1434 = lerp( temp_output_205_0_g1434 , lerpResult208_g1434 , ApplicationIsPlaying227_g1434);
				float MM_SpeedScale206_g1434 = lerpResult210_g1434;
				float SpeedScale_RotAng201_g1440 = MM_SpeedScale206_g1434;
				float MM_SineWaveLength64_g1434 = _MMSineWaveLength;
				float WaveLength63_g1440 = MM_SineWaveLength64_g1434;
				float3 appendResult28_g1441 = (float3(input.ase_texcoord9.xy.x , 0.0 , input.ase_texcoord9.xy.y));
				float3 MM_LocalPivot3_g1434 = -appendResult28_g1441;
				float3 objToWorld11_g1438 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float2 appendResult10_g1438 = (float2(objToWorld11_g1438.x , objToWorld11_g1438.z));
				float2 WorldSpaceUVs9_g1434 = appendResult10_g1438;
				float StaticNoiseTiling11_g1434 = _StaticNoiseTiling;
				float4 temp_output_16_0_g1434 = tex2D( _MotionNoise, ( WorldSpaceUVs9_g1434 * StaticNoiseTiling11_g1434 ) );
				float4 WorldSpaceStaticNoise23_g1434 = temp_output_16_0_g1434;
				float MM_PhaseShiftSource26_g1434 = _MMPhaseShiftSource;
				float lerpResult38_g1434 = lerp( input.ase_color.a , (WorldSpaceStaticNoise23_g1434).g , MM_PhaseShiftSource26_g1434);
				float MM_PhaseShiftScale34_g1434 = _MMPhaseShiftScale;
				float MM_PhaseShift60_g1434 = ( lerpResult38_g1434 * MM_PhaseShiftScale34_g1434 );
				float PhaseShift127_g1440 = MM_PhaseShift60_g1434;
				float temp_output_20_0_g1440 = sin( ( ( ( objToWorld170_g1440.x + objToWorld170_g1440.z ) + ( ( Time167_g1440 * ( ( Speed125_g1440 * SpeedScale_RotAng201_g1440 ) * WaveLength63_g1440 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1440 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1440 ) ) );
				float MotionSineWave5 =  (0.0 + ( temp_output_20_0_g1440 - -1.0 ) * ( 1.0 - 0.0 ) / ( 1.0 - -1.0 ) );
				float MotionWave308_g1448 = MotionSineWave5;
				float vertexToFrag71_g1444 = input.ase_texcoord7.w;
				float ScaleVarNoise6 = vertexToFrag71_g1444;
				float ScaleVarNoise308_g1448 = ScaleVarNoise6;
				float4 localDebug308_g1448 = Debug308_g1448( Debug_Target308_g1448 , Albedo308_g1448 , ColorMask1308_g1448 , ColorMask2308_g1448 , ColorMask3308_g1448 , MotionWave308_g1448 , ScaleVarNoise308_g1448 );
				
				float temp_output_31_0_g1455 = tex2DNode111_g1448.a;
				float DF_Length_Local38_g1455 = _DistanceFadeLength;
				float DF_Length_Global45_g1455 = Nicrom_Grass_DF_Length;
				float DF_Start_Global43_g1455 = Nicrom_Grass_DF_Start;
				float lerpResult49_g1455 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1455 ));
				float DF_UseGV28_g1455 = lerpResult49_g1455;
				float lerpResult26_g1455 = lerp( DF_Length_Local38_g1455 , DF_Length_Global45_g1455 , DF_UseGV28_g1455);
				float DistanceFadeLength23_g1455 = lerpResult26_g1455;
				float DF_Start_Local36_g1455 = _DistanceFadeStart;
				float lerpResult20_g1455 = lerp( DF_Start_Local36_g1455 , DF_Start_Global43_g1455 , DF_UseGV28_g1455);
				float DistanceFadeStart27_g1455 = lerpResult20_g1455;
				float customEye3_g1455 = input.ase_texcoord9.z;
				float cameraDepthFade3_g1455 = (( customEye3_g1455 -_ProjectionParams.y - DistanceFadeStart27_g1455 ) / DistanceFadeLength23_g1455);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1455 = ( temp_output_31_0_g1455 * saturate( ( 1.0 - cameraDepthFade3_g1455 ) ) );
				#else
				float staticSwitch33_g1455 = temp_output_31_0_g1455;
				#endif
				

				float3 BaseColor = localDebug308_g1448.xyz;
				float3 Normal = float3(0, 0, 1);
				float3 Specular = 0.5;
				float Metallic = _Metallic;
				float Smoothness = _Smoothness;
				float Occlusion = 1;
				float3 Emission = 0;
				float Alpha = staticSwitch33_g1455;
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
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#pragma shader_feature_local_fragment _BLENDWITHTERRAIN_ON
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local _MMBENDINGMETHOD_SIMPLE _MMBENDINGMETHOD_ACCURATE
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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
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
			float4 _Albedo_ST;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color1B;
			float3 _Color2A;
			half _MMDirectionAngle;
			float _BWTTop;
			float _BWTMaskStart;
			float _BWTMaskEnd;
			float _BWTMask;
			float _BWTBottom;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask2SharpnessMin;
			float _ColorMask2SharpnessMax;
			float _ColorMask2Tiling;
			float _ColorMask2Speed;
			float _ColorMask2Opacity;
			float _ColorMask3Start;
			float _ColorMask3End;
			float _Metallic;
			float _Smoothness;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _Debug;
			float _ScaleVarNoiseTiling;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _StaticNoiseTiling;
			float _GVTime;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVBendingScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionOffset;
			float _SlopeCorrectionMagnitude;
			float _ScaleVarMin;
			float _ScaleVarMax;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleOffset;
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

			float Nicrom_Grass_DF_Start;
			float Nicrom_Grass_DF_Length;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Grass;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_Grass;
			float Nicrom_MM_BendScale_Grass;
			float Nicrom_MM_AmpScale_Grass;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;


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

				float lerpResult56_g1436 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle35_g1434 = lerpResult56_g1436;
				float MM_DirectionShift68_g1434 = _MMDirectionShift;
				float MM_DirectionShiftOffset69_g1434 = _MMDirectionShiftOffset;
				float3 appendResult28_g1441 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 MM_LocalPivot3_g1434 = -appendResult28_g1441;
				float3 objToWorld11_g1438 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float2 appendResult10_g1438 = (float2(objToWorld11_g1438.x , objToWorld11_g1438.z));
				float2 WorldSpaceUVs9_g1434 = appendResult10_g1438;
				float StaticNoiseTiling11_g1434 = _StaticNoiseTiling;
				float4 temp_output_16_0_g1434 = tex2Dlod( _MotionNoise, float4( ( WorldSpaceUVs9_g1434 * StaticNoiseTiling11_g1434 ), 0, 0.0) );
				float4 WorldSpaceStaticNoise23_g1434 = temp_output_16_0_g1434;
				float4 StaticWorldNoise55_g1439 = WorldSpaceStaticNoise23_g1434;
				float3 objToWorld50_g1439 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float GVTime160_g1434 = _GVTime;
				float lerpResult146_g1434 = lerp( _TimeParameters.x , Nicrom_MM_Time_Grass , GVTime160_g1434);
				float ApplicationIsPlaying227_g1434 = Nicrom_ApplicationIsPlaying;
				float lerpResult221_g1434 = lerp( _TimeParameters.x , lerpResult146_g1434 , ApplicationIsPlaying227_g1434);
				float MM_Time140_g1434 = lerpResult221_g1434;
				float Time76_g1439 = MM_Time140_g1434;
				float temp_output_205_0_g1434 = Nicrom_MM_SpeedScale_Grass;
				float lerpResult208_g1434 = lerp( temp_output_205_0_g1434 , 1.0 , GVTime160_g1434);
				float lerpResult210_g1434 = lerp( temp_output_205_0_g1434 , lerpResult208_g1434 , ApplicationIsPlaying227_g1434);
				float MM_SpeedScale206_g1434 = lerpResult210_g1434;
				float SpeedScale_RA80_g1439 = MM_SpeedScale206_g1434;
				float MM_DirectionShiftSpeed70_g1434 = _MMDirectionShiftSpeed;
				float MM_DirectionShiftNoiseScale71_g1434 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1439 = radians( ( ( MM_DirectionAngle35_g1434 + ( ( MM_DirectionShift68_g1434 + ( MM_DirectionShiftOffset69_g1434 * (StaticWorldNoise55_g1439).x ) ) * sin( ( ( objToWorld50_g1439.x + objToWorld50_g1439.z ) + ( ( Time76_g1439 * ( SpeedScale_RA80_g1439 * MM_DirectionShiftSpeed70_g1434 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1439).z * MM_DirectionShiftNoiseScale71_g1434 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1439 = (float3(cos( temp_output_11_0_g1439 ) , 0.0 , sin( temp_output_11_0_g1439 )));
				float3 worldToObj35_g1439 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1439, 1 ) ).xyz;
				float3 worldToObj36_g1439 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1439 = normalize( (( worldToObj35_g1439 - worldToObj36_g1439 )).xyz );
				float3 MM_RotationAxis101_g1434 = normalizeResult34_g1439;
				float4 StaticWorldNoise31_g1440 = WorldSpaceStaticNoise23_g1434;
				float MM_BendingOfset73_g1434 = _MMBendingOffset;
				float MM_Bending67_g1434 = _MMBending;
				float GVBendingScale164_g1434 = _GVBendingScale;
				float lerpResult155_g1434 = lerp( 1.0 , Nicrom_MM_BendScale_Grass , GVBendingScale164_g1434);
				float MM_BendingScale141_g1434 = lerpResult155_g1434;
				float MM_AmplitudeOffset62_g1434 = _MMAmplitudeOffset;
				float MM_Amplitude61_g1434 = _MMAmplitude;
				float GVAmplitudeScale162_g1434 = _GVAmplitudeScale;
				float lerpResult152_g1434 = lerp( 1.0 , Nicrom_MM_AmpScale_Grass , GVAmplitudeScale162_g1434);
				float MM_AmplitudeScale139_g1434 = lerpResult152_g1434;
				float3 objToWorld170_g1440 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1440 = MM_Time140_g1434;
				float MM_Speed63_g1434 = _MMSpeed;
				float Speed125_g1440 = MM_Speed63_g1434;
				float SpeedScale_RotAng201_g1440 = MM_SpeedScale206_g1434;
				float MM_SineWaveLength64_g1434 = _MMSineWaveLength;
				float WaveLength63_g1440 = MM_SineWaveLength64_g1434;
				float MM_PhaseShiftSource26_g1434 = _MMPhaseShiftSource;
				float lerpResult38_g1434 = lerp( input.ase_color.a , (WorldSpaceStaticNoise23_g1434).g , MM_PhaseShiftSource26_g1434);
				float MM_PhaseShiftScale34_g1434 = _MMPhaseShiftScale;
				float MM_PhaseShift60_g1434 = ( lerpResult38_g1434 * MM_PhaseShiftScale34_g1434 );
				float PhaseShift127_g1440 = MM_PhaseShift60_g1434;
				float temp_output_20_0_g1440 = sin( ( ( ( objToWorld170_g1440.x + objToWorld170_g1440.z ) + ( ( Time167_g1440 * ( ( Speed125_g1440 * SpeedScale_RotAng201_g1440 ) * WaveLength63_g1440 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1440 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1440 ) ) );
				float MM_ObjectHeight66_g1434 = _MMObjectHeight;
				float3 gammaToLinear56_g1440 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource65_g1434 = _MMObjectHeightSource;
				float lerpResult57_g1440 = lerp( ( input.positionOS.xyz.y / MM_ObjectHeight66_g1434 ) , (gammaToLinear56_g1440).x , MM_ObjectHeightSource65_g1434);
				float BendingMask189_g1440 = lerpResult57_g1440;
				float MM_RotationAngle102_g1434 = radians( ( ( ( ( ( (StaticWorldNoise31_g1440).y * MM_BendingOfset73_g1434 ) + MM_Bending67_g1434 ) * MM_BendingScale141_g1434 ) + ( ( ( ( (StaticWorldNoise31_g1440).x * MM_AmplitudeOffset62_g1434 ) + MM_Amplitude61_g1434 ) * MM_AmplitudeScale139_g1434 ) * temp_output_20_0_g1440 ) ) * BendingMask189_g1440 ) );
				float3 appendResult103_g1434 = (float3(input.positionOS.xyz.x , 0.0 , input.positionOS.xyz.z));
				float3 VertexPosition179_g1434 = input.positionOS.xyz;
				float3 rotatedValue108_g1434 = RotateAroundAxis( appendResult103_g1434, VertexPosition179_g1434, MM_RotationAxis101_g1434, MM_RotationAngle102_g1434 );
				float3 RotationAxis56_g1435 = MM_RotationAxis101_g1434;
				float RotationAngle54_g1435 = MM_RotationAngle102_g1434;
				float3 LocalPivotPos60_g1435 = MM_LocalPivot3_g1434;
				float3 break62_g1435 = LocalPivotPos60_g1435;
				float VertexPos_Y67_g1435 = input.positionOS.xyz.y;
				float3 appendResult45_g1435 = (float3(break62_g1435.x , VertexPos_Y67_g1435 , break62_g1435.z));
				float3 VertexPos66_g1435 = input.positionOS.xyz;
				float3 rotatedValue30_g1435 = RotateAroundAxis( appendResult45_g1435, VertexPos66_g1435, RotationAxis56_g1435, RotationAngle54_g1435 );
				float3 DetailMotionVO73_g1435 = float3( 0,0,0 );
				float3 rotatedValue34_g1435 = RotateAroundAxis( LocalPivotPos60_g1435, ( rotatedValue30_g1435 + DetailMotionVO73_g1435 ), RotationAxis56_g1435, RotationAngle54_g1435 );
				#if defined( _MMBENDINGMETHOD_SIMPLE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#elif defined( _MMBENDINGMETHOD_ACCURATE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue34_g1435 - VertexPos66_g1435 ) * step( 0.01 , VertexPos_Y67_g1435 ) );
				#else
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#endif
				float3 LocalVertexOffset89_g1442 = staticSwitch186_g1434;
				float3 appendResult15_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1442, 1 ) ).xyz;
				float3 objToWorld102_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1442 = ( objToWorld98_g1442 - objToWorld102_g1442 );
				float3 appendResult24_g1442 = (float3(-break20_g1442.z , 0.0 , break20_g1442.x));
				float3 appendResult3_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1442, 1 ) ).xyz;
				float3 objToWorld106_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1442 = ( objToWorld100_g1442 - objToWorld106_g1442 );
				float3 break108_g1442 = temp_output_107_0_g1442;
				float3 lerpResult84_g1442 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1442 , step( 0.001 , ( abs( break108_g1442.x ) + abs( break108_g1442.z ) ) ));
				float3 normalizeResult7_g1442 = ASESafeNormalize( lerpResult84_g1442 );
				float dotResult9_g1442 = dot( normalizeResult7_g1442 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1442 = acos( dotResult9_g1442 );
				float NaNPrevention21_g1442 = step( 0.01 , abs( ( temp_output_12_0_g1442 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1442 = lerp( float3( 1, 0, 0 ) , appendResult24_g1442 , NaNPrevention21_g1442);
				float3 worldToObj99_g1442 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1442, 1 ) ).xyz;
				float3 worldToObj105_g1442 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1442 = normalize( ( worldToObj99_g1442 - worldToObj105_g1442 ) );
				float3 RotationAxis30_g1442 = normalizeResult49_g1442;
				float4 WorldSpaceNoise126_g1442 = temp_output_16_0_g1434;
				float SlopeCorrectionOffset120_g1442 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1442 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1442 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1442).x - 0.0 ) * ( SlopeCorrectionOffset120_g1442 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1442 ) ) * temp_output_12_0_g1442 );
				float3 appendResult28_g1443 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 rotatedValue35_g1442 = RotateAroundAxis( -appendResult28_g1443, ( input.positionOS.xyz + LocalVertexOffset89_g1442 ), RotationAxis30_g1442, RotationAngle29_g1442 );
				float3 lerpResult52_g1442 = lerp( LocalVertexOffset89_g1442 , ( rotatedValue35_g1442 - input.positionOS.xyz ) , NaNPrevention21_g1442);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1442 = lerpResult52_g1442;
				#else
				float3 staticSwitch123_g1442 = LocalVertexOffset89_g1442;
				#endif
				float3 appendResult28_g1447 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g1444 = -appendResult28_g1447;
				float3 temp_output_5_0_g1444 = ( ( staticSwitch123_g1442 + input.positionOS.xyz ) - Scale_Pivot15_g1444 );
				float ScaleVartMin40_g1444 = _ScaleVarMin;
				float ScaleVarMax41_g1444 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1444 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1444 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1446 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1444, 1 ) ).xyz;
				float2 appendResult10_g1446 = (float2(objToWorld11_g1446.x , objToWorld11_g1446.z));
				float2 Scale_WorldSpaceUVs30_g1444 = appendResult10_g1446;
				float Scale_VarNoiseTiling23_g1444 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1444 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1444 * Scale_VarNoiseTiling23_g1444 ), 0, 0.0) );
				float smoothstepResult56_g1444 = smoothstep( ScaleNoiseSharpnessMin59_g1444 , ScaleNoiseSharpnessMax60_g1444 , (Scale_WorldSpaceNoise32_g1444).r);
				float lerpResult44_g1444 = lerp( ScaleVartMin40_g1444 , ScaleVarMax41_g1444 , smoothstepResult56_g1444);
				float ScaleVar47_g1444 = lerpResult44_g1444;
				float clampResult63_g1444 = clamp( ( ScaleVar47_g1444 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1444 = ( temp_output_5_0_g1444 * clampResult63_g1444 );
				#else
				float3 staticSwitch72_g1444 = temp_output_5_0_g1444;
				#endif
				float ScaleOffset19_g1444 = _ScaleOffset;
				float clampResult64_g1444 = clamp( ( ScaleOffset19_g1444 + 1.0 ) , 0.0 , 7.0 );
				
				float3 customSurfaceDepth3_g1455 = input.positionOS.xyz;
				float customEye3_g1455 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1455)).z;
				output.ase_texcoord1.z = customEye3_g1455;
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1444 * clampResult64_g1444 ) + Scale_Pivot15_g1444 ) - input.positionOS.xyz );
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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

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
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
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
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
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

				float2 uv_Albedo = input.ase_texcoord1.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode111_g1448 = tex2D( _Albedo, uv_Albedo );
				float temp_output_31_0_g1455 = tex2DNode111_g1448.a;
				float DF_Length_Local38_g1455 = _DistanceFadeLength;
				float DF_Length_Global45_g1455 = Nicrom_Grass_DF_Length;
				float DF_Start_Global43_g1455 = Nicrom_Grass_DF_Start;
				float lerpResult49_g1455 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1455 ));
				float DF_UseGV28_g1455 = lerpResult49_g1455;
				float lerpResult26_g1455 = lerp( DF_Length_Local38_g1455 , DF_Length_Global45_g1455 , DF_UseGV28_g1455);
				float DistanceFadeLength23_g1455 = lerpResult26_g1455;
				float DF_Start_Local36_g1455 = _DistanceFadeStart;
				float lerpResult20_g1455 = lerp( DF_Start_Local36_g1455 , DF_Start_Global43_g1455 , DF_UseGV28_g1455);
				float DistanceFadeStart27_g1455 = lerpResult20_g1455;
				float customEye3_g1455 = input.ase_texcoord1.z;
				float cameraDepthFade3_g1455 = (( customEye3_g1455 -_ProjectionParams.y - DistanceFadeStart27_g1455 ) / DistanceFadeLength23_g1455);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1455 = ( temp_output_31_0_g1455 * saturate( ( 1.0 - cameraDepthFade3_g1455 ) ) );
				#else
				float staticSwitch33_g1455 = temp_output_31_0_g1455;
				#endif
				

				float Alpha = staticSwitch33_g1455;
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
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#pragma shader_feature_local_fragment _BLENDWITHTERRAIN_ON
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local _MMBENDINGMETHOD_SIMPLE _MMBENDINGMETHOD_ACCURATE
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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
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
			float4 _Albedo_ST;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color1B;
			float3 _Color2A;
			half _MMDirectionAngle;
			float _BWTTop;
			float _BWTMaskStart;
			float _BWTMaskEnd;
			float _BWTMask;
			float _BWTBottom;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask2SharpnessMin;
			float _ColorMask2SharpnessMax;
			float _ColorMask2Tiling;
			float _ColorMask2Speed;
			float _ColorMask2Opacity;
			float _ColorMask3Start;
			float _ColorMask3End;
			float _Metallic;
			float _Smoothness;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _Debug;
			float _ScaleVarNoiseTiling;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _StaticNoiseTiling;
			float _GVTime;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVBendingScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionOffset;
			float _SlopeCorrectionMagnitude;
			float _ScaleVarMin;
			float _ScaleVarMax;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleOffset;
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

			float Nicrom_Grass_DF_Start;
			float Nicrom_Grass_DF_Length;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Grass;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_Grass;
			float Nicrom_MM_BendScale_Grass;
			float Nicrom_MM_AmpScale_Grass;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;


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

				float lerpResult56_g1436 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle35_g1434 = lerpResult56_g1436;
				float MM_DirectionShift68_g1434 = _MMDirectionShift;
				float MM_DirectionShiftOffset69_g1434 = _MMDirectionShiftOffset;
				float3 appendResult28_g1441 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 MM_LocalPivot3_g1434 = -appendResult28_g1441;
				float3 objToWorld11_g1438 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float2 appendResult10_g1438 = (float2(objToWorld11_g1438.x , objToWorld11_g1438.z));
				float2 WorldSpaceUVs9_g1434 = appendResult10_g1438;
				float StaticNoiseTiling11_g1434 = _StaticNoiseTiling;
				float4 temp_output_16_0_g1434 = tex2Dlod( _MotionNoise, float4( ( WorldSpaceUVs9_g1434 * StaticNoiseTiling11_g1434 ), 0, 0.0) );
				float4 WorldSpaceStaticNoise23_g1434 = temp_output_16_0_g1434;
				float4 StaticWorldNoise55_g1439 = WorldSpaceStaticNoise23_g1434;
				float3 objToWorld50_g1439 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float GVTime160_g1434 = _GVTime;
				float lerpResult146_g1434 = lerp( _TimeParameters.x , Nicrom_MM_Time_Grass , GVTime160_g1434);
				float ApplicationIsPlaying227_g1434 = Nicrom_ApplicationIsPlaying;
				float lerpResult221_g1434 = lerp( _TimeParameters.x , lerpResult146_g1434 , ApplicationIsPlaying227_g1434);
				float MM_Time140_g1434 = lerpResult221_g1434;
				float Time76_g1439 = MM_Time140_g1434;
				float temp_output_205_0_g1434 = Nicrom_MM_SpeedScale_Grass;
				float lerpResult208_g1434 = lerp( temp_output_205_0_g1434 , 1.0 , GVTime160_g1434);
				float lerpResult210_g1434 = lerp( temp_output_205_0_g1434 , lerpResult208_g1434 , ApplicationIsPlaying227_g1434);
				float MM_SpeedScale206_g1434 = lerpResult210_g1434;
				float SpeedScale_RA80_g1439 = MM_SpeedScale206_g1434;
				float MM_DirectionShiftSpeed70_g1434 = _MMDirectionShiftSpeed;
				float MM_DirectionShiftNoiseScale71_g1434 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1439 = radians( ( ( MM_DirectionAngle35_g1434 + ( ( MM_DirectionShift68_g1434 + ( MM_DirectionShiftOffset69_g1434 * (StaticWorldNoise55_g1439).x ) ) * sin( ( ( objToWorld50_g1439.x + objToWorld50_g1439.z ) + ( ( Time76_g1439 * ( SpeedScale_RA80_g1439 * MM_DirectionShiftSpeed70_g1434 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1439).z * MM_DirectionShiftNoiseScale71_g1434 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1439 = (float3(cos( temp_output_11_0_g1439 ) , 0.0 , sin( temp_output_11_0_g1439 )));
				float3 worldToObj35_g1439 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1439, 1 ) ).xyz;
				float3 worldToObj36_g1439 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1439 = normalize( (( worldToObj35_g1439 - worldToObj36_g1439 )).xyz );
				float3 MM_RotationAxis101_g1434 = normalizeResult34_g1439;
				float4 StaticWorldNoise31_g1440 = WorldSpaceStaticNoise23_g1434;
				float MM_BendingOfset73_g1434 = _MMBendingOffset;
				float MM_Bending67_g1434 = _MMBending;
				float GVBendingScale164_g1434 = _GVBendingScale;
				float lerpResult155_g1434 = lerp( 1.0 , Nicrom_MM_BendScale_Grass , GVBendingScale164_g1434);
				float MM_BendingScale141_g1434 = lerpResult155_g1434;
				float MM_AmplitudeOffset62_g1434 = _MMAmplitudeOffset;
				float MM_Amplitude61_g1434 = _MMAmplitude;
				float GVAmplitudeScale162_g1434 = _GVAmplitudeScale;
				float lerpResult152_g1434 = lerp( 1.0 , Nicrom_MM_AmpScale_Grass , GVAmplitudeScale162_g1434);
				float MM_AmplitudeScale139_g1434 = lerpResult152_g1434;
				float3 objToWorld170_g1440 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1440 = MM_Time140_g1434;
				float MM_Speed63_g1434 = _MMSpeed;
				float Speed125_g1440 = MM_Speed63_g1434;
				float SpeedScale_RotAng201_g1440 = MM_SpeedScale206_g1434;
				float MM_SineWaveLength64_g1434 = _MMSineWaveLength;
				float WaveLength63_g1440 = MM_SineWaveLength64_g1434;
				float MM_PhaseShiftSource26_g1434 = _MMPhaseShiftSource;
				float lerpResult38_g1434 = lerp( input.ase_color.a , (WorldSpaceStaticNoise23_g1434).g , MM_PhaseShiftSource26_g1434);
				float MM_PhaseShiftScale34_g1434 = _MMPhaseShiftScale;
				float MM_PhaseShift60_g1434 = ( lerpResult38_g1434 * MM_PhaseShiftScale34_g1434 );
				float PhaseShift127_g1440 = MM_PhaseShift60_g1434;
				float temp_output_20_0_g1440 = sin( ( ( ( objToWorld170_g1440.x + objToWorld170_g1440.z ) + ( ( Time167_g1440 * ( ( Speed125_g1440 * SpeedScale_RotAng201_g1440 ) * WaveLength63_g1440 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1440 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1440 ) ) );
				float MM_ObjectHeight66_g1434 = _MMObjectHeight;
				float3 gammaToLinear56_g1440 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource65_g1434 = _MMObjectHeightSource;
				float lerpResult57_g1440 = lerp( ( input.positionOS.xyz.y / MM_ObjectHeight66_g1434 ) , (gammaToLinear56_g1440).x , MM_ObjectHeightSource65_g1434);
				float BendingMask189_g1440 = lerpResult57_g1440;
				float MM_RotationAngle102_g1434 = radians( ( ( ( ( ( (StaticWorldNoise31_g1440).y * MM_BendingOfset73_g1434 ) + MM_Bending67_g1434 ) * MM_BendingScale141_g1434 ) + ( ( ( ( (StaticWorldNoise31_g1440).x * MM_AmplitudeOffset62_g1434 ) + MM_Amplitude61_g1434 ) * MM_AmplitudeScale139_g1434 ) * temp_output_20_0_g1440 ) ) * BendingMask189_g1440 ) );
				float3 appendResult103_g1434 = (float3(input.positionOS.xyz.x , 0.0 , input.positionOS.xyz.z));
				float3 VertexPosition179_g1434 = input.positionOS.xyz;
				float3 rotatedValue108_g1434 = RotateAroundAxis( appendResult103_g1434, VertexPosition179_g1434, MM_RotationAxis101_g1434, MM_RotationAngle102_g1434 );
				float3 RotationAxis56_g1435 = MM_RotationAxis101_g1434;
				float RotationAngle54_g1435 = MM_RotationAngle102_g1434;
				float3 LocalPivotPos60_g1435 = MM_LocalPivot3_g1434;
				float3 break62_g1435 = LocalPivotPos60_g1435;
				float VertexPos_Y67_g1435 = input.positionOS.xyz.y;
				float3 appendResult45_g1435 = (float3(break62_g1435.x , VertexPos_Y67_g1435 , break62_g1435.z));
				float3 VertexPos66_g1435 = input.positionOS.xyz;
				float3 rotatedValue30_g1435 = RotateAroundAxis( appendResult45_g1435, VertexPos66_g1435, RotationAxis56_g1435, RotationAngle54_g1435 );
				float3 DetailMotionVO73_g1435 = float3( 0,0,0 );
				float3 rotatedValue34_g1435 = RotateAroundAxis( LocalPivotPos60_g1435, ( rotatedValue30_g1435 + DetailMotionVO73_g1435 ), RotationAxis56_g1435, RotationAngle54_g1435 );
				#if defined( _MMBENDINGMETHOD_SIMPLE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#elif defined( _MMBENDINGMETHOD_ACCURATE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue34_g1435 - VertexPos66_g1435 ) * step( 0.01 , VertexPos_Y67_g1435 ) );
				#else
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#endif
				float3 LocalVertexOffset89_g1442 = staticSwitch186_g1434;
				float3 appendResult15_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1442, 1 ) ).xyz;
				float3 objToWorld102_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1442 = ( objToWorld98_g1442 - objToWorld102_g1442 );
				float3 appendResult24_g1442 = (float3(-break20_g1442.z , 0.0 , break20_g1442.x));
				float3 appendResult3_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1442, 1 ) ).xyz;
				float3 objToWorld106_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1442 = ( objToWorld100_g1442 - objToWorld106_g1442 );
				float3 break108_g1442 = temp_output_107_0_g1442;
				float3 lerpResult84_g1442 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1442 , step( 0.001 , ( abs( break108_g1442.x ) + abs( break108_g1442.z ) ) ));
				float3 normalizeResult7_g1442 = ASESafeNormalize( lerpResult84_g1442 );
				float dotResult9_g1442 = dot( normalizeResult7_g1442 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1442 = acos( dotResult9_g1442 );
				float NaNPrevention21_g1442 = step( 0.01 , abs( ( temp_output_12_0_g1442 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1442 = lerp( float3( 1, 0, 0 ) , appendResult24_g1442 , NaNPrevention21_g1442);
				float3 worldToObj99_g1442 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1442, 1 ) ).xyz;
				float3 worldToObj105_g1442 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1442 = normalize( ( worldToObj99_g1442 - worldToObj105_g1442 ) );
				float3 RotationAxis30_g1442 = normalizeResult49_g1442;
				float4 WorldSpaceNoise126_g1442 = temp_output_16_0_g1434;
				float SlopeCorrectionOffset120_g1442 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1442 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1442 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1442).x - 0.0 ) * ( SlopeCorrectionOffset120_g1442 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1442 ) ) * temp_output_12_0_g1442 );
				float3 appendResult28_g1443 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 rotatedValue35_g1442 = RotateAroundAxis( -appendResult28_g1443, ( input.positionOS.xyz + LocalVertexOffset89_g1442 ), RotationAxis30_g1442, RotationAngle29_g1442 );
				float3 lerpResult52_g1442 = lerp( LocalVertexOffset89_g1442 , ( rotatedValue35_g1442 - input.positionOS.xyz ) , NaNPrevention21_g1442);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1442 = lerpResult52_g1442;
				#else
				float3 staticSwitch123_g1442 = LocalVertexOffset89_g1442;
				#endif
				float3 appendResult28_g1447 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g1444 = -appendResult28_g1447;
				float3 temp_output_5_0_g1444 = ( ( staticSwitch123_g1442 + input.positionOS.xyz ) - Scale_Pivot15_g1444 );
				float ScaleVartMin40_g1444 = _ScaleVarMin;
				float ScaleVarMax41_g1444 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1444 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1444 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1446 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1444, 1 ) ).xyz;
				float2 appendResult10_g1446 = (float2(objToWorld11_g1446.x , objToWorld11_g1446.z));
				float2 Scale_WorldSpaceUVs30_g1444 = appendResult10_g1446;
				float Scale_VarNoiseTiling23_g1444 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1444 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1444 * Scale_VarNoiseTiling23_g1444 ), 0, 0.0) );
				float smoothstepResult56_g1444 = smoothstep( ScaleNoiseSharpnessMin59_g1444 , ScaleNoiseSharpnessMax60_g1444 , (Scale_WorldSpaceNoise32_g1444).r);
				float lerpResult44_g1444 = lerp( ScaleVartMin40_g1444 , ScaleVarMax41_g1444 , smoothstepResult56_g1444);
				float ScaleVar47_g1444 = lerpResult44_g1444;
				float clampResult63_g1444 = clamp( ( ScaleVar47_g1444 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1444 = ( temp_output_5_0_g1444 * clampResult63_g1444 );
				#else
				float3 staticSwitch72_g1444 = temp_output_5_0_g1444;
				#endif
				float ScaleOffset19_g1444 = _ScaleOffset;
				float clampResult64_g1444 = clamp( ( ScaleOffset19_g1444 + 1.0 ) , 0.0 , 7.0 );
				
				float3 customSurfaceDepth3_g1455 = input.positionOS.xyz;
				float customEye3_g1455 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1455)).z;
				output.ase_texcoord1.z = customEye3_g1455;
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1444 * clampResult64_g1444 ) + Scale_Pivot15_g1444 ) - input.positionOS.xyz );

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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

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
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
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
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
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

				float2 uv_Albedo = input.ase_texcoord1.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode111_g1448 = tex2D( _Albedo, uv_Albedo );
				float temp_output_31_0_g1455 = tex2DNode111_g1448.a;
				float DF_Length_Local38_g1455 = _DistanceFadeLength;
				float DF_Length_Global45_g1455 = Nicrom_Grass_DF_Length;
				float DF_Start_Global43_g1455 = Nicrom_Grass_DF_Start;
				float lerpResult49_g1455 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1455 ));
				float DF_UseGV28_g1455 = lerpResult49_g1455;
				float lerpResult26_g1455 = lerp( DF_Length_Local38_g1455 , DF_Length_Global45_g1455 , DF_UseGV28_g1455);
				float DistanceFadeLength23_g1455 = lerpResult26_g1455;
				float DF_Start_Local36_g1455 = _DistanceFadeStart;
				float lerpResult20_g1455 = lerp( DF_Start_Local36_g1455 , DF_Start_Global43_g1455 , DF_UseGV28_g1455);
				float DistanceFadeStart27_g1455 = lerpResult20_g1455;
				float customEye3_g1455 = input.ase_texcoord1.z;
				float cameraDepthFade3_g1455 = (( customEye3_g1455 -_ProjectionParams.y - DistanceFadeStart27_g1455 ) / DistanceFadeLength23_g1455);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1455 = ( temp_output_31_0_g1455 * saturate( ( 1.0 - cameraDepthFade3_g1455 ) ) );
				#else
				float staticSwitch33_g1455 = temp_output_31_0_g1455;
				#endif
				

				float Alpha = staticSwitch33_g1455;
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
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#pragma shader_feature_local_fragment _BLENDWITHTERRAIN_ON
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local _MMBENDINGMETHOD_SIMPLE _MMBENDINGMETHOD_ACCURATE
			#pragma shader_feature_local _COLORS_TWO _COLORS_THREE _COLORS_FOUR
			#pragma shader_feature_local _COLORMASK1SOURCE_TEXTURE _COLORMASK1SOURCE_VERTEX
			#pragma shader_feature_local _COLORBLENDINGMODE_A _COLORBLENDINGMODE_B
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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 Nicrom_TerrainColorMap_TexelSize;
			float4 _ColorMask1_ST;
			float4 _Albedo_ST;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color1B;
			float3 _Color2A;
			half _MMDirectionAngle;
			float _BWTTop;
			float _BWTMaskStart;
			float _BWTMaskEnd;
			float _BWTMask;
			float _BWTBottom;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask2SharpnessMin;
			float _ColorMask2SharpnessMax;
			float _ColorMask2Tiling;
			float _ColorMask2Speed;
			float _ColorMask2Opacity;
			float _ColorMask3Start;
			float _ColorMask3End;
			float _Metallic;
			float _Smoothness;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _Debug;
			float _ScaleVarNoiseTiling;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _StaticNoiseTiling;
			float _GVTime;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVBendingScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionOffset;
			float _SlopeCorrectionMagnitude;
			float _ScaleVarMin;
			float _ScaleVarMax;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleOffset;
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

			float Nicrom_Grass_DF_Start;
			float Nicrom_Grass_DF_Length;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Grass;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_Grass;
			float Nicrom_MM_BendScale_Grass;
			float Nicrom_MM_AmpScale_Grass;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;
			sampler2D Nicrom_TerrainColorMap;
			float2 Nicrom_TerrainPosition;
			float Nicrom_TerrainSize;
			sampler2D _ColorMask1;
			float Nicrom_Grass_CM2_SharpMin;
			float Nicrom_Grass_CM2_SharpMax;
			sampler2D _ColorMask2;
			float Nicrom_Grass_CM2_Tilling;
			float2 Nicrom_Grass_CM2_UVOffset;
			float Nicrom_Grass_CM2_Speed;


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
			
			float4 Debug308_g1448( float Debug_Target, float4 Albedo, float ColorMask1, float ColorMask2, float ColorMask3, float MotionWave, float ScaleVarNoise )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1;
				else if(Debug_Target ==2)
				    return ColorMask2;
				else if(Debug_Target ==3)
				    return ColorMask3;
				else if(Debug_Target ==4)
				    return MotionWave;
				else
				    return ScaleVarNoise;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float lerpResult56_g1436 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle35_g1434 = lerpResult56_g1436;
				float MM_DirectionShift68_g1434 = _MMDirectionShift;
				float MM_DirectionShiftOffset69_g1434 = _MMDirectionShiftOffset;
				float3 appendResult28_g1441 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 MM_LocalPivot3_g1434 = -appendResult28_g1441;
				float3 objToWorld11_g1438 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float2 appendResult10_g1438 = (float2(objToWorld11_g1438.x , objToWorld11_g1438.z));
				float2 WorldSpaceUVs9_g1434 = appendResult10_g1438;
				float StaticNoiseTiling11_g1434 = _StaticNoiseTiling;
				float4 temp_output_16_0_g1434 = tex2Dlod( _MotionNoise, float4( ( WorldSpaceUVs9_g1434 * StaticNoiseTiling11_g1434 ), 0, 0.0) );
				float4 WorldSpaceStaticNoise23_g1434 = temp_output_16_0_g1434;
				float4 StaticWorldNoise55_g1439 = WorldSpaceStaticNoise23_g1434;
				float3 objToWorld50_g1439 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float GVTime160_g1434 = _GVTime;
				float lerpResult146_g1434 = lerp( _TimeParameters.x , Nicrom_MM_Time_Grass , GVTime160_g1434);
				float ApplicationIsPlaying227_g1434 = Nicrom_ApplicationIsPlaying;
				float lerpResult221_g1434 = lerp( _TimeParameters.x , lerpResult146_g1434 , ApplicationIsPlaying227_g1434);
				float MM_Time140_g1434 = lerpResult221_g1434;
				float Time76_g1439 = MM_Time140_g1434;
				float temp_output_205_0_g1434 = Nicrom_MM_SpeedScale_Grass;
				float lerpResult208_g1434 = lerp( temp_output_205_0_g1434 , 1.0 , GVTime160_g1434);
				float lerpResult210_g1434 = lerp( temp_output_205_0_g1434 , lerpResult208_g1434 , ApplicationIsPlaying227_g1434);
				float MM_SpeedScale206_g1434 = lerpResult210_g1434;
				float SpeedScale_RA80_g1439 = MM_SpeedScale206_g1434;
				float MM_DirectionShiftSpeed70_g1434 = _MMDirectionShiftSpeed;
				float MM_DirectionShiftNoiseScale71_g1434 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1439 = radians( ( ( MM_DirectionAngle35_g1434 + ( ( MM_DirectionShift68_g1434 + ( MM_DirectionShiftOffset69_g1434 * (StaticWorldNoise55_g1439).x ) ) * sin( ( ( objToWorld50_g1439.x + objToWorld50_g1439.z ) + ( ( Time76_g1439 * ( SpeedScale_RA80_g1439 * MM_DirectionShiftSpeed70_g1434 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1439).z * MM_DirectionShiftNoiseScale71_g1434 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1439 = (float3(cos( temp_output_11_0_g1439 ) , 0.0 , sin( temp_output_11_0_g1439 )));
				float3 worldToObj35_g1439 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1439, 1 ) ).xyz;
				float3 worldToObj36_g1439 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1439 = normalize( (( worldToObj35_g1439 - worldToObj36_g1439 )).xyz );
				float3 MM_RotationAxis101_g1434 = normalizeResult34_g1439;
				float4 StaticWorldNoise31_g1440 = WorldSpaceStaticNoise23_g1434;
				float MM_BendingOfset73_g1434 = _MMBendingOffset;
				float MM_Bending67_g1434 = _MMBending;
				float GVBendingScale164_g1434 = _GVBendingScale;
				float lerpResult155_g1434 = lerp( 1.0 , Nicrom_MM_BendScale_Grass , GVBendingScale164_g1434);
				float MM_BendingScale141_g1434 = lerpResult155_g1434;
				float MM_AmplitudeOffset62_g1434 = _MMAmplitudeOffset;
				float MM_Amplitude61_g1434 = _MMAmplitude;
				float GVAmplitudeScale162_g1434 = _GVAmplitudeScale;
				float lerpResult152_g1434 = lerp( 1.0 , Nicrom_MM_AmpScale_Grass , GVAmplitudeScale162_g1434);
				float MM_AmplitudeScale139_g1434 = lerpResult152_g1434;
				float3 objToWorld170_g1440 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1440 = MM_Time140_g1434;
				float MM_Speed63_g1434 = _MMSpeed;
				float Speed125_g1440 = MM_Speed63_g1434;
				float SpeedScale_RotAng201_g1440 = MM_SpeedScale206_g1434;
				float MM_SineWaveLength64_g1434 = _MMSineWaveLength;
				float WaveLength63_g1440 = MM_SineWaveLength64_g1434;
				float MM_PhaseShiftSource26_g1434 = _MMPhaseShiftSource;
				float lerpResult38_g1434 = lerp( input.ase_color.a , (WorldSpaceStaticNoise23_g1434).g , MM_PhaseShiftSource26_g1434);
				float MM_PhaseShiftScale34_g1434 = _MMPhaseShiftScale;
				float MM_PhaseShift60_g1434 = ( lerpResult38_g1434 * MM_PhaseShiftScale34_g1434 );
				float PhaseShift127_g1440 = MM_PhaseShift60_g1434;
				float temp_output_20_0_g1440 = sin( ( ( ( objToWorld170_g1440.x + objToWorld170_g1440.z ) + ( ( Time167_g1440 * ( ( Speed125_g1440 * SpeedScale_RotAng201_g1440 ) * WaveLength63_g1440 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1440 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1440 ) ) );
				float MM_ObjectHeight66_g1434 = _MMObjectHeight;
				float3 gammaToLinear56_g1440 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource65_g1434 = _MMObjectHeightSource;
				float lerpResult57_g1440 = lerp( ( input.positionOS.xyz.y / MM_ObjectHeight66_g1434 ) , (gammaToLinear56_g1440).x , MM_ObjectHeightSource65_g1434);
				float BendingMask189_g1440 = lerpResult57_g1440;
				float MM_RotationAngle102_g1434 = radians( ( ( ( ( ( (StaticWorldNoise31_g1440).y * MM_BendingOfset73_g1434 ) + MM_Bending67_g1434 ) * MM_BendingScale141_g1434 ) + ( ( ( ( (StaticWorldNoise31_g1440).x * MM_AmplitudeOffset62_g1434 ) + MM_Amplitude61_g1434 ) * MM_AmplitudeScale139_g1434 ) * temp_output_20_0_g1440 ) ) * BendingMask189_g1440 ) );
				float3 appendResult103_g1434 = (float3(input.positionOS.xyz.x , 0.0 , input.positionOS.xyz.z));
				float3 VertexPosition179_g1434 = input.positionOS.xyz;
				float3 rotatedValue108_g1434 = RotateAroundAxis( appendResult103_g1434, VertexPosition179_g1434, MM_RotationAxis101_g1434, MM_RotationAngle102_g1434 );
				float3 RotationAxis56_g1435 = MM_RotationAxis101_g1434;
				float RotationAngle54_g1435 = MM_RotationAngle102_g1434;
				float3 LocalPivotPos60_g1435 = MM_LocalPivot3_g1434;
				float3 break62_g1435 = LocalPivotPos60_g1435;
				float VertexPos_Y67_g1435 = input.positionOS.xyz.y;
				float3 appendResult45_g1435 = (float3(break62_g1435.x , VertexPos_Y67_g1435 , break62_g1435.z));
				float3 VertexPos66_g1435 = input.positionOS.xyz;
				float3 rotatedValue30_g1435 = RotateAroundAxis( appendResult45_g1435, VertexPos66_g1435, RotationAxis56_g1435, RotationAngle54_g1435 );
				float3 DetailMotionVO73_g1435 = float3( 0,0,0 );
				float3 rotatedValue34_g1435 = RotateAroundAxis( LocalPivotPos60_g1435, ( rotatedValue30_g1435 + DetailMotionVO73_g1435 ), RotationAxis56_g1435, RotationAngle54_g1435 );
				#if defined( _MMBENDINGMETHOD_SIMPLE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#elif defined( _MMBENDINGMETHOD_ACCURATE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue34_g1435 - VertexPos66_g1435 ) * step( 0.01 , VertexPos_Y67_g1435 ) );
				#else
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#endif
				float3 LocalVertexOffset89_g1442 = staticSwitch186_g1434;
				float3 appendResult15_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1442, 1 ) ).xyz;
				float3 objToWorld102_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1442 = ( objToWorld98_g1442 - objToWorld102_g1442 );
				float3 appendResult24_g1442 = (float3(-break20_g1442.z , 0.0 , break20_g1442.x));
				float3 appendResult3_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1442, 1 ) ).xyz;
				float3 objToWorld106_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1442 = ( objToWorld100_g1442 - objToWorld106_g1442 );
				float3 break108_g1442 = temp_output_107_0_g1442;
				float3 lerpResult84_g1442 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1442 , step( 0.001 , ( abs( break108_g1442.x ) + abs( break108_g1442.z ) ) ));
				float3 normalizeResult7_g1442 = ASESafeNormalize( lerpResult84_g1442 );
				float dotResult9_g1442 = dot( normalizeResult7_g1442 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1442 = acos( dotResult9_g1442 );
				float NaNPrevention21_g1442 = step( 0.01 , abs( ( temp_output_12_0_g1442 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1442 = lerp( float3( 1, 0, 0 ) , appendResult24_g1442 , NaNPrevention21_g1442);
				float3 worldToObj99_g1442 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1442, 1 ) ).xyz;
				float3 worldToObj105_g1442 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1442 = normalize( ( worldToObj99_g1442 - worldToObj105_g1442 ) );
				float3 RotationAxis30_g1442 = normalizeResult49_g1442;
				float4 WorldSpaceNoise126_g1442 = temp_output_16_0_g1434;
				float SlopeCorrectionOffset120_g1442 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1442 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1442 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1442).x - 0.0 ) * ( SlopeCorrectionOffset120_g1442 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1442 ) ) * temp_output_12_0_g1442 );
				float3 appendResult28_g1443 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 rotatedValue35_g1442 = RotateAroundAxis( -appendResult28_g1443, ( input.positionOS.xyz + LocalVertexOffset89_g1442 ), RotationAxis30_g1442, RotationAngle29_g1442 );
				float3 lerpResult52_g1442 = lerp( LocalVertexOffset89_g1442 , ( rotatedValue35_g1442 - input.positionOS.xyz ) , NaNPrevention21_g1442);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1442 = lerpResult52_g1442;
				#else
				float3 staticSwitch123_g1442 = LocalVertexOffset89_g1442;
				#endif
				float3 appendResult28_g1447 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 Scale_Pivot15_g1444 = -appendResult28_g1447;
				float3 temp_output_5_0_g1444 = ( ( staticSwitch123_g1442 + input.positionOS.xyz ) - Scale_Pivot15_g1444 );
				float ScaleVartMin40_g1444 = _ScaleVarMin;
				float ScaleVarMax41_g1444 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1444 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1444 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1446 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1444, 1 ) ).xyz;
				float2 appendResult10_g1446 = (float2(objToWorld11_g1446.x , objToWorld11_g1446.z));
				float2 Scale_WorldSpaceUVs30_g1444 = appendResult10_g1446;
				float Scale_VarNoiseTiling23_g1444 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1444 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1444 * Scale_VarNoiseTiling23_g1444 ), 0, 0.0) );
				float smoothstepResult56_g1444 = smoothstep( ScaleNoiseSharpnessMin59_g1444 , ScaleNoiseSharpnessMax60_g1444 , (Scale_WorldSpaceNoise32_g1444).r);
				float lerpResult44_g1444 = lerp( ScaleVartMin40_g1444 , ScaleVarMax41_g1444 , smoothstepResult56_g1444);
				float ScaleVar47_g1444 = lerpResult44_g1444;
				float clampResult63_g1444 = clamp( ( ScaleVar47_g1444 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1444 = ( temp_output_5_0_g1444 * clampResult63_g1444 );
				#else
				float3 staticSwitch72_g1444 = temp_output_5_0_g1444;
				#endif
				float ScaleOffset19_g1444 = _ScaleOffset;
				float clampResult64_g1444 = clamp( ( ScaleOffset19_g1444 + 1.0 ) , 0.0 , 7.0 );
				
				float2 TerrainPosition29_g1448 = ( Nicrom_TerrainPosition + float2( 1,1 ) );
				float2 TerrainPosition4_g1450 = TerrainPosition29_g1448;
				float TerrainSize28_g1448 = Nicrom_TerrainSize;
				float TerrainSize2_g1450 = TerrainSize28_g1448;
				float3 appendResult28_g1449 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 temp_output_3_33_g1448 = -appendResult28_g1449;
				float3 LocalPivot6_g1448 = temp_output_3_33_g1448;
				float3 objToWorld11_g1453 = mul( GetObjectToWorldMatrix(), float4( LocalPivot6_g1448, 1 ) ).xyz;
				float2 appendResult10_g1453 = (float2(objToWorld11_g1453.x , objToWorld11_g1453.z));
				float4 vertexToFrag19_g1450 = tex2Dlod( Nicrom_TerrainColorMap, float4( ( ( ( 1.0 - TerrainPosition4_g1450 ) / TerrainSize2_g1450 ) + ( ( TerrainSize2_g1450 / ( TerrainSize2_g1450 * TerrainSize2_g1450 ) ) * appendResult10_g1453 ) ), 0, 0.0) );
				output.ase_texcoord4 = vertexToFrag19_g1450;
				float vertexToFrag421_g1448 = input.positionOS.xyz.y;
				output.ase_texcoord3.z = vertexToFrag421_g1448;
				#ifdef _SCALEVARIATION_ON
				float staticSwitch73_g1444 = smoothstepResult56_g1444;
				#else
				float staticSwitch73_g1444 = 0.0;
				#endif
				float vertexToFrag71_g1444 = staticSwitch73_g1444;
				output.ase_texcoord3.w = vertexToFrag71_g1444;
				
				float3 customSurfaceDepth3_g1455 = input.positionOS.xyz;
				float customEye3_g1455 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1455)).z;
				output.ase_texcoord5.z = customEye3_g1455;
				
				output.ase_texcoord3.xy = input.texcoord0.xy;
				output.ase_texcoord5.xy = input.texcoord1.xy;
				output.ase_color = input.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1444 * clampResult64_g1444 ) + Scale_Pivot15_g1444 ) - input.positionOS.xyz );

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

				float Debug_Target308_g1448 = _Debug;
				float2 uv_Albedo = input.ase_texcoord3.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode111_g1448 = tex2D( _Albedo, uv_Albedo );
				float4 FoliageTexture123_g1448 = tex2DNode111_g1448;
				float3 Color1A78_g1448 = _Color1A;
				float4 vertexToFrag19_g1450 = input.ase_texcoord4;
				float4 TerrainColor76_g1448 = vertexToFrag19_g1450;
				float BWT_Top44_g1448 = _BWTTop;
				float IsTerrainAlbedoAssigned36_g1448 = step( 8.0 , Nicrom_TerrainColorMap_TexelSize.z );
				float lerpResult62_g1448 = lerp( 0.0 , BWT_Top44_g1448 , IsTerrainAlbedoAssigned36_g1448);
				float BWT_MaskStart434_g1448 = _BWTMaskStart;
				float BWT_MaskEnd435_g1448 = _BWTMaskEnd;
				float vertexToFrag421_g1448 = input.ase_texcoord3.z;
				float VertexPos_Y430_g1448 = vertexToFrag421_g1448;
				float smoothstepResult273_g1448 = smoothstep( BWT_MaskStart434_g1448 , BWT_MaskEnd435_g1448 , VertexPos_Y430_g1448);
				float BWT_MaskToggle461_g1448 = _BWTMask;
				float lerpResult462_g1448 = lerp( 1.0 , ( 1.0 - smoothstepResult273_g1448 ) , BWT_MaskToggle461_g1448);
				float BWT_Mask277_g1448 = lerpResult462_g1448;
				float lerpResult278_g1448 = lerp( 0.0 , lerpResult62_g1448 , BWT_Mask277_g1448);
				float BWT_Top_F74_g1448 = lerpResult278_g1448;
				float4 lerpResult104_g1448 = lerp( float4( Color1A78_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Top_F74_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch114_g1448 = lerpResult104_g1448;
				#else
				float4 staticSwitch114_g1448 = float4( Color1A78_g1448 , 0.0 );
				#endif
				float4 Color1A_Top_BWT167_g1448 = staticSwitch114_g1448;
				float3 Color1B81_g1448 = _Color1B;
				float BWT_Bottom45_g1448 = _BWTBottom;
				float lerpResult61_g1448 = lerp( 0.0 , BWT_Bottom45_g1448 , IsTerrainAlbedoAssigned36_g1448);
				float lerpResult281_g1448 = lerp( 0.0 , lerpResult61_g1448 , BWT_Mask277_g1448);
				float BWT_Bottom_F75_g1448 = lerpResult281_g1448;
				float4 lerpResult105_g1448 = lerp( float4( Color1B81_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Bottom_F75_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch115_g1448 = lerpResult105_g1448;
				#else
				float4 staticSwitch115_g1448 = float4( Color1B81_g1448 , 0.0 );
				#endif
				float4 Color1B_Bot_BWT169_g1448 = staticSwitch115_g1448;
				float2 uv_ColorMask1 = input.ase_texcoord3.xy * _ColorMask1_ST.xy + _ColorMask1_ST.zw;
				float ColorMask1_Tex66_g1448 = ( 1.0 - tex2D( _ColorMask1, uv_ColorMask1 ).r );
				float ColorMask1_End43_g1448 = _ColorMask1End;
				float ColorMask1_Start42_g1448 = _ColorMask1Start;
				float smoothstepResult427_g1448 = smoothstep( ColorMask1_End43_g1448 , ColorMask1_Start42_g1448 , VertexPos_Y430_g1448);
				#if defined( _COLORMASK1SOURCE_TEXTURE )
				float staticSwitch377_g1448 = ColorMask1_Tex66_g1448;
				#elif defined( _COLORMASK1SOURCE_VERTEX )
				float staticSwitch377_g1448 = smoothstepResult427_g1448;
				#else
				float staticSwitch377_g1448 = ColorMask1_Tex66_g1448;
				#endif
				float ColorMask1101_g1448 = staticSwitch377_g1448;
				float4 lerpResult226_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask1101_g1448);
				float4 Colors2306_g1448 = lerpResult226_g1448;
				float3 Color2A82_g1448 = _Color2A;
				float4 lerpResult106_g1448 = lerp( float4( Color2A82_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Top_F74_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch117_g1448 = lerpResult106_g1448;
				#else
				float4 staticSwitch117_g1448 = float4( Color2A82_g1448 , 0.0 );
				#endif
				float4 Color2A_Top_BWT171_g1448 = staticSwitch117_g1448;
				float CM2_GVToggle400_g1448 = _ColorMask2GV;
				float lerpResult409_g1448 = lerp( _ColorMask2SharpnessMin , Nicrom_Grass_CM2_SharpMin , CM2_GVToggle400_g1448);
				float ColorMask2_SharpMin88_g1448 = lerpResult409_g1448;
				float lerpResult412_g1448 = lerp( _ColorMask2SharpnessMax , Nicrom_Grass_CM2_SharpMax , CM2_GVToggle400_g1448);
				float ColorMask2_SharpMax87_g1448 = lerpResult412_g1448;
				float3 appendResult28_g1449 = (float3(input.ase_texcoord5.xy.x , 0.0 , input.ase_texcoord5.xy.y));
				float3 temp_output_3_33_g1448 = -appendResult28_g1449;
				float3 objToWorld11_g1451 = mul( GetObjectToWorldMatrix(), float4( temp_output_3_33_g1448, 1 ) ).xyz;
				float2 appendResult10_g1451 = (float2(objToWorld11_g1451.x , objToWorld11_g1451.z));
				float2 ColorMask2_WSUVs23_g1448 = appendResult10_g1451;
				float lerpResult402_g1448 = lerp( _ColorMask2Tiling , Nicrom_Grass_CM2_Tilling , CM2_GVToggle400_g1448);
				float ColorMask2_Tiling24_g1448 = lerpResult402_g1448;
				float2 CM2_UVOffset_GV159_g1448 = Nicrom_Grass_CM2_UVOffset;
				float lerpResult406_g1448 = lerp( _ColorMask2Speed , Nicrom_Grass_CM2_Speed , CM2_GVToggle400_g1448);
				float ColorMask2_Speed151_g1448 = lerpResult406_g1448;
				float ColorMask2_Noise85_g1448 = (tex2D( _ColorMask2, ( ( ColorMask2_WSUVs23_g1448 * ColorMask2_Tiling24_g1448 ) + ( CM2_UVOffset_GV159_g1448 * ColorMask2_Speed151_g1448 * 0.1 ) ) )).r;
				float smoothstepResult120_g1448 = smoothstep( ColorMask2_SharpMin88_g1448 , ColorMask2_SharpMax87_g1448 , ColorMask2_Noise85_g1448);
				float ColorMask2_Opacity415_g1448 = _ColorMask2Opacity;
				float ColorMask2_F196_g1448 = ( smoothstepResult120_g1448 * ColorMask2_Opacity415_g1448 );
				float4 lerpResult341_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color2A_Top_BWT171_g1448 , ColorMask2_F196_g1448);
				float4 lerpResult344_g1448 = lerp( lerpResult341_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask1101_g1448);
				float4 Colors3_BMA348_g1448 = lerpResult344_g1448;
				float ColorMask3_Start438_g1448 = _ColorMask3Start;
				float ColorMask3_End439_g1448 = _ColorMask3End;
				float smoothstepResult442_g1448 = smoothstep( ColorMask3_Start438_g1448 , ColorMask3_End439_g1448 , VertexPos_Y430_g1448);
				#if defined( _COLORBLENDINGMODE_A )
				float staticSwitch449_g1448 = 0.0;
				#elif defined( _COLORBLENDINGMODE_B )
				float staticSwitch449_g1448 = ( 1.0 - smoothstepResult442_g1448 );
				#else
				float staticSwitch449_g1448 = 0.0;
				#endif
				float ColorMask3446_g1448 = staticSwitch449_g1448;
				float4 lerpResult352_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask3446_g1448);
				float4 lerpResult353_g1448 = lerp( lerpResult352_g1448 , float4( Color2A82_g1448 , 0.0 ) , ( 1.0 - ColorMask1_Tex66_g1448 ));
				float4 Colors3_BMB357_g1448 = lerpResult353_g1448;
				#if defined( _COLORBLENDINGMODE_A )
				float4 staticSwitch366_g1448 = Colors3_BMA348_g1448;
				#elif defined( _COLORBLENDINGMODE_B )
				float4 staticSwitch366_g1448 = Colors3_BMB357_g1448;
				#else
				float4 staticSwitch366_g1448 = Colors3_BMA348_g1448;
				#endif
				float4 Colors3362_g1448 = staticSwitch366_g1448;
				float3 Color2B83_g1448 = _Color2B;
				float4 lerpResult269_g1448 = lerp( float4( Color2B83_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Bottom_F75_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch270_g1448 = lerpResult269_g1448;
				#else
				float4 staticSwitch270_g1448 = float4( Color2B83_g1448 , 0.0 );
				#endif
				float4 Color2B_Bot_BWT271_g1448 = staticSwitch270_g1448;
				float4 lerpResult227_g1448 = lerp( Color2A_Top_BWT171_g1448 , Color2B_Bot_BWT271_g1448 , ColorMask1101_g1448);
				float4 lerpResult225_g1448 = lerp( Colors2306_g1448 , lerpResult227_g1448 , ColorMask2_F196_g1448);
				float4 Colors4_BMA256_g1448 = lerpResult225_g1448;
				float4 lerpResult242_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask3446_g1448);
				float3 lerpResult249_g1448 = lerp( Color2A82_g1448 , Color2B83_g1448 , ColorMask2_F196_g1448);
				float4 lerpResult246_g1448 = lerp( lerpResult242_g1448 , float4( lerpResult249_g1448 , 0.0 ) , ( 1.0 - ColorMask1_Tex66_g1448 ));
				float4 Colors4_BMB257_g1448 = lerpResult246_g1448;
				#if defined( _COLORBLENDINGMODE_A )
				float4 staticSwitch373_g1448 = Colors4_BMA256_g1448;
				#elif defined( _COLORBLENDINGMODE_B )
				float4 staticSwitch373_g1448 = Colors4_BMB257_g1448;
				#else
				float4 staticSwitch373_g1448 = Colors4_BMA256_g1448;
				#endif
				float4 Colors4363_g1448 = staticSwitch373_g1448;
				#if defined( _COLORS_TWO )
				float4 staticSwitch303_g1448 = Colors2306_g1448;
				#elif defined( _COLORS_THREE )
				float4 staticSwitch303_g1448 = Colors3362_g1448;
				#elif defined( _COLORS_FOUR )
				float4 staticSwitch303_g1448 = Colors4363_g1448;
				#else
				float4 staticSwitch303_g1448 = Colors3362_g1448;
				#endif
				float4 Albedo453_g1448 = ( FoliageTexture123_g1448 * staticSwitch303_g1448 );
				float4 Albedo308_g1448 = Albedo453_g1448;
				#if defined( _COLORBLENDINGMODE_A )
				float staticSwitch456_g1448 = ( 1.0 - ColorMask1101_g1448 );
				#elif defined( _COLORBLENDINGMODE_B )
				float staticSwitch456_g1448 = ( 1.0 - ColorMask1_Tex66_g1448 );
				#else
				float staticSwitch456_g1448 = ( 1.0 - ColorMask1101_g1448 );
				#endif
				float ColorMask1308_g1448 = staticSwitch456_g1448;
				#if defined( _COLORS_TWO )
				float staticSwitch381_g1448 = 0.0;
				#elif defined( _COLORS_THREE )
				float staticSwitch381_g1448 = ColorMask2_F196_g1448;
				#elif defined( _COLORS_FOUR )
				float staticSwitch381_g1448 = ColorMask2_F196_g1448;
				#else
				float staticSwitch381_g1448 = ColorMask2_F196_g1448;
				#endif
				float ColorMask2308_g1448 = staticSwitch381_g1448;
				#if defined( _COLORS_TWO )
				float staticSwitch452_g1448 = 0.0;
				#elif defined( _COLORS_THREE )
				float staticSwitch452_g1448 = ColorMask3446_g1448;
				#elif defined( _COLORS_FOUR )
				float staticSwitch452_g1448 = ColorMask3446_g1448;
				#else
				float staticSwitch452_g1448 = ColorMask3446_g1448;
				#endif
				float ColorMask3308_g1448 = staticSwitch452_g1448;
				float3 objToWorld170_g1440 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GVTime160_g1434 = _GVTime;
				float lerpResult146_g1434 = lerp( _TimeParameters.x , Nicrom_MM_Time_Grass , GVTime160_g1434);
				float ApplicationIsPlaying227_g1434 = Nicrom_ApplicationIsPlaying;
				float lerpResult221_g1434 = lerp( _TimeParameters.x , lerpResult146_g1434 , ApplicationIsPlaying227_g1434);
				float MM_Time140_g1434 = lerpResult221_g1434;
				float Time167_g1440 = MM_Time140_g1434;
				float MM_Speed63_g1434 = _MMSpeed;
				float Speed125_g1440 = MM_Speed63_g1434;
				float temp_output_205_0_g1434 = Nicrom_MM_SpeedScale_Grass;
				float lerpResult208_g1434 = lerp( temp_output_205_0_g1434 , 1.0 , GVTime160_g1434);
				float lerpResult210_g1434 = lerp( temp_output_205_0_g1434 , lerpResult208_g1434 , ApplicationIsPlaying227_g1434);
				float MM_SpeedScale206_g1434 = lerpResult210_g1434;
				float SpeedScale_RotAng201_g1440 = MM_SpeedScale206_g1434;
				float MM_SineWaveLength64_g1434 = _MMSineWaveLength;
				float WaveLength63_g1440 = MM_SineWaveLength64_g1434;
				float3 appendResult28_g1441 = (float3(input.ase_texcoord5.xy.x , 0.0 , input.ase_texcoord5.xy.y));
				float3 MM_LocalPivot3_g1434 = -appendResult28_g1441;
				float3 objToWorld11_g1438 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float2 appendResult10_g1438 = (float2(objToWorld11_g1438.x , objToWorld11_g1438.z));
				float2 WorldSpaceUVs9_g1434 = appendResult10_g1438;
				float StaticNoiseTiling11_g1434 = _StaticNoiseTiling;
				float4 temp_output_16_0_g1434 = tex2D( _MotionNoise, ( WorldSpaceUVs9_g1434 * StaticNoiseTiling11_g1434 ) );
				float4 WorldSpaceStaticNoise23_g1434 = temp_output_16_0_g1434;
				float MM_PhaseShiftSource26_g1434 = _MMPhaseShiftSource;
				float lerpResult38_g1434 = lerp( input.ase_color.a , (WorldSpaceStaticNoise23_g1434).g , MM_PhaseShiftSource26_g1434);
				float MM_PhaseShiftScale34_g1434 = _MMPhaseShiftScale;
				float MM_PhaseShift60_g1434 = ( lerpResult38_g1434 * MM_PhaseShiftScale34_g1434 );
				float PhaseShift127_g1440 = MM_PhaseShift60_g1434;
				float temp_output_20_0_g1440 = sin( ( ( ( objToWorld170_g1440.x + objToWorld170_g1440.z ) + ( ( Time167_g1440 * ( ( Speed125_g1440 * SpeedScale_RotAng201_g1440 ) * WaveLength63_g1440 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1440 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1440 ) ) );
				float MotionSineWave5 =  (0.0 + ( temp_output_20_0_g1440 - -1.0 ) * ( 1.0 - 0.0 ) / ( 1.0 - -1.0 ) );
				float MotionWave308_g1448 = MotionSineWave5;
				float vertexToFrag71_g1444 = input.ase_texcoord3.w;
				float ScaleVarNoise6 = vertexToFrag71_g1444;
				float ScaleVarNoise308_g1448 = ScaleVarNoise6;
				float4 localDebug308_g1448 = Debug308_g1448( Debug_Target308_g1448 , Albedo308_g1448 , ColorMask1308_g1448 , ColorMask2308_g1448 , ColorMask3308_g1448 , MotionWave308_g1448 , ScaleVarNoise308_g1448 );
				
				float temp_output_31_0_g1455 = tex2DNode111_g1448.a;
				float DF_Length_Local38_g1455 = _DistanceFadeLength;
				float DF_Length_Global45_g1455 = Nicrom_Grass_DF_Length;
				float DF_Start_Global43_g1455 = Nicrom_Grass_DF_Start;
				float lerpResult49_g1455 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1455 ));
				float DF_UseGV28_g1455 = lerpResult49_g1455;
				float lerpResult26_g1455 = lerp( DF_Length_Local38_g1455 , DF_Length_Global45_g1455 , DF_UseGV28_g1455);
				float DistanceFadeLength23_g1455 = lerpResult26_g1455;
				float DF_Start_Local36_g1455 = _DistanceFadeStart;
				float lerpResult20_g1455 = lerp( DF_Start_Local36_g1455 , DF_Start_Global43_g1455 , DF_UseGV28_g1455);
				float DistanceFadeStart27_g1455 = lerpResult20_g1455;
				float customEye3_g1455 = input.ase_texcoord5.z;
				float cameraDepthFade3_g1455 = (( customEye3_g1455 -_ProjectionParams.y - DistanceFadeStart27_g1455 ) / DistanceFadeLength23_g1455);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1455 = ( temp_output_31_0_g1455 * saturate( ( 1.0 - cameraDepthFade3_g1455 ) ) );
				#else
				float staticSwitch33_g1455 = temp_output_31_0_g1455;
				#endif
				

				float3 BaseColor = localDebug308_g1448.xyz;
				float3 Emission = 0;
				float Alpha = staticSwitch33_g1455;
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
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#pragma shader_feature_local_fragment _BLENDWITHTERRAIN_ON
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local _MMBENDINGMETHOD_SIMPLE _MMBENDINGMETHOD_ACCURATE
			#pragma shader_feature_local _COLORS_TWO _COLORS_THREE _COLORS_FOUR
			#pragma shader_feature_local _COLORMASK1SOURCE_TEXTURE _COLORMASK1SOURCE_VERTEX
			#pragma shader_feature_local _COLORBLENDINGMODE_A _COLORBLENDINGMODE_B
			#pragma shader_feature_local _DISTANCEFADE_ON


			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 Nicrom_TerrainColorMap_TexelSize;
			float4 _ColorMask1_ST;
			float4 _Albedo_ST;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color1B;
			float3 _Color2A;
			half _MMDirectionAngle;
			float _BWTTop;
			float _BWTMaskStart;
			float _BWTMaskEnd;
			float _BWTMask;
			float _BWTBottom;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask2SharpnessMin;
			float _ColorMask2SharpnessMax;
			float _ColorMask2Tiling;
			float _ColorMask2Speed;
			float _ColorMask2Opacity;
			float _ColorMask3Start;
			float _ColorMask3End;
			float _Metallic;
			float _Smoothness;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _Debug;
			float _ScaleVarNoiseTiling;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _StaticNoiseTiling;
			float _GVTime;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVBendingScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionOffset;
			float _SlopeCorrectionMagnitude;
			float _ScaleVarMin;
			float _ScaleVarMax;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleOffset;
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

			float Nicrom_Grass_DF_Start;
			float Nicrom_Grass_DF_Length;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Grass;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_Grass;
			float Nicrom_MM_BendScale_Grass;
			float Nicrom_MM_AmpScale_Grass;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;
			sampler2D Nicrom_TerrainColorMap;
			float2 Nicrom_TerrainPosition;
			float Nicrom_TerrainSize;
			sampler2D _ColorMask1;
			float Nicrom_Grass_CM2_SharpMin;
			float Nicrom_Grass_CM2_SharpMax;
			sampler2D _ColorMask2;
			float Nicrom_Grass_CM2_Tilling;
			float2 Nicrom_Grass_CM2_UVOffset;
			float Nicrom_Grass_CM2_Speed;


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
			
			float4 Debug308_g1448( float Debug_Target, float4 Albedo, float ColorMask1, float ColorMask2, float ColorMask3, float MotionWave, float ScaleVarNoise )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1;
				else if(Debug_Target ==2)
				    return ColorMask2;
				else if(Debug_Target ==3)
				    return ColorMask3;
				else if(Debug_Target ==4)
				    return MotionWave;
				else
				    return ScaleVarNoise;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_TRANSFER_INSTANCE_ID( input, output );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float lerpResult56_g1436 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle35_g1434 = lerpResult56_g1436;
				float MM_DirectionShift68_g1434 = _MMDirectionShift;
				float MM_DirectionShiftOffset69_g1434 = _MMDirectionShiftOffset;
				float3 appendResult28_g1441 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 MM_LocalPivot3_g1434 = -appendResult28_g1441;
				float3 objToWorld11_g1438 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float2 appendResult10_g1438 = (float2(objToWorld11_g1438.x , objToWorld11_g1438.z));
				float2 WorldSpaceUVs9_g1434 = appendResult10_g1438;
				float StaticNoiseTiling11_g1434 = _StaticNoiseTiling;
				float4 temp_output_16_0_g1434 = tex2Dlod( _MotionNoise, float4( ( WorldSpaceUVs9_g1434 * StaticNoiseTiling11_g1434 ), 0, 0.0) );
				float4 WorldSpaceStaticNoise23_g1434 = temp_output_16_0_g1434;
				float4 StaticWorldNoise55_g1439 = WorldSpaceStaticNoise23_g1434;
				float3 objToWorld50_g1439 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float GVTime160_g1434 = _GVTime;
				float lerpResult146_g1434 = lerp( _TimeParameters.x , Nicrom_MM_Time_Grass , GVTime160_g1434);
				float ApplicationIsPlaying227_g1434 = Nicrom_ApplicationIsPlaying;
				float lerpResult221_g1434 = lerp( _TimeParameters.x , lerpResult146_g1434 , ApplicationIsPlaying227_g1434);
				float MM_Time140_g1434 = lerpResult221_g1434;
				float Time76_g1439 = MM_Time140_g1434;
				float temp_output_205_0_g1434 = Nicrom_MM_SpeedScale_Grass;
				float lerpResult208_g1434 = lerp( temp_output_205_0_g1434 , 1.0 , GVTime160_g1434);
				float lerpResult210_g1434 = lerp( temp_output_205_0_g1434 , lerpResult208_g1434 , ApplicationIsPlaying227_g1434);
				float MM_SpeedScale206_g1434 = lerpResult210_g1434;
				float SpeedScale_RA80_g1439 = MM_SpeedScale206_g1434;
				float MM_DirectionShiftSpeed70_g1434 = _MMDirectionShiftSpeed;
				float MM_DirectionShiftNoiseScale71_g1434 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1439 = radians( ( ( MM_DirectionAngle35_g1434 + ( ( MM_DirectionShift68_g1434 + ( MM_DirectionShiftOffset69_g1434 * (StaticWorldNoise55_g1439).x ) ) * sin( ( ( objToWorld50_g1439.x + objToWorld50_g1439.z ) + ( ( Time76_g1439 * ( SpeedScale_RA80_g1439 * MM_DirectionShiftSpeed70_g1434 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1439).z * MM_DirectionShiftNoiseScale71_g1434 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1439 = (float3(cos( temp_output_11_0_g1439 ) , 0.0 , sin( temp_output_11_0_g1439 )));
				float3 worldToObj35_g1439 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1439, 1 ) ).xyz;
				float3 worldToObj36_g1439 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1439 = normalize( (( worldToObj35_g1439 - worldToObj36_g1439 )).xyz );
				float3 MM_RotationAxis101_g1434 = normalizeResult34_g1439;
				float4 StaticWorldNoise31_g1440 = WorldSpaceStaticNoise23_g1434;
				float MM_BendingOfset73_g1434 = _MMBendingOffset;
				float MM_Bending67_g1434 = _MMBending;
				float GVBendingScale164_g1434 = _GVBendingScale;
				float lerpResult155_g1434 = lerp( 1.0 , Nicrom_MM_BendScale_Grass , GVBendingScale164_g1434);
				float MM_BendingScale141_g1434 = lerpResult155_g1434;
				float MM_AmplitudeOffset62_g1434 = _MMAmplitudeOffset;
				float MM_Amplitude61_g1434 = _MMAmplitude;
				float GVAmplitudeScale162_g1434 = _GVAmplitudeScale;
				float lerpResult152_g1434 = lerp( 1.0 , Nicrom_MM_AmpScale_Grass , GVAmplitudeScale162_g1434);
				float MM_AmplitudeScale139_g1434 = lerpResult152_g1434;
				float3 objToWorld170_g1440 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1440 = MM_Time140_g1434;
				float MM_Speed63_g1434 = _MMSpeed;
				float Speed125_g1440 = MM_Speed63_g1434;
				float SpeedScale_RotAng201_g1440 = MM_SpeedScale206_g1434;
				float MM_SineWaveLength64_g1434 = _MMSineWaveLength;
				float WaveLength63_g1440 = MM_SineWaveLength64_g1434;
				float MM_PhaseShiftSource26_g1434 = _MMPhaseShiftSource;
				float lerpResult38_g1434 = lerp( input.ase_color.a , (WorldSpaceStaticNoise23_g1434).g , MM_PhaseShiftSource26_g1434);
				float MM_PhaseShiftScale34_g1434 = _MMPhaseShiftScale;
				float MM_PhaseShift60_g1434 = ( lerpResult38_g1434 * MM_PhaseShiftScale34_g1434 );
				float PhaseShift127_g1440 = MM_PhaseShift60_g1434;
				float temp_output_20_0_g1440 = sin( ( ( ( objToWorld170_g1440.x + objToWorld170_g1440.z ) + ( ( Time167_g1440 * ( ( Speed125_g1440 * SpeedScale_RotAng201_g1440 ) * WaveLength63_g1440 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1440 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1440 ) ) );
				float MM_ObjectHeight66_g1434 = _MMObjectHeight;
				float3 gammaToLinear56_g1440 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource65_g1434 = _MMObjectHeightSource;
				float lerpResult57_g1440 = lerp( ( input.positionOS.xyz.y / MM_ObjectHeight66_g1434 ) , (gammaToLinear56_g1440).x , MM_ObjectHeightSource65_g1434);
				float BendingMask189_g1440 = lerpResult57_g1440;
				float MM_RotationAngle102_g1434 = radians( ( ( ( ( ( (StaticWorldNoise31_g1440).y * MM_BendingOfset73_g1434 ) + MM_Bending67_g1434 ) * MM_BendingScale141_g1434 ) + ( ( ( ( (StaticWorldNoise31_g1440).x * MM_AmplitudeOffset62_g1434 ) + MM_Amplitude61_g1434 ) * MM_AmplitudeScale139_g1434 ) * temp_output_20_0_g1440 ) ) * BendingMask189_g1440 ) );
				float3 appendResult103_g1434 = (float3(input.positionOS.xyz.x , 0.0 , input.positionOS.xyz.z));
				float3 VertexPosition179_g1434 = input.positionOS.xyz;
				float3 rotatedValue108_g1434 = RotateAroundAxis( appendResult103_g1434, VertexPosition179_g1434, MM_RotationAxis101_g1434, MM_RotationAngle102_g1434 );
				float3 RotationAxis56_g1435 = MM_RotationAxis101_g1434;
				float RotationAngle54_g1435 = MM_RotationAngle102_g1434;
				float3 LocalPivotPos60_g1435 = MM_LocalPivot3_g1434;
				float3 break62_g1435 = LocalPivotPos60_g1435;
				float VertexPos_Y67_g1435 = input.positionOS.xyz.y;
				float3 appendResult45_g1435 = (float3(break62_g1435.x , VertexPos_Y67_g1435 , break62_g1435.z));
				float3 VertexPos66_g1435 = input.positionOS.xyz;
				float3 rotatedValue30_g1435 = RotateAroundAxis( appendResult45_g1435, VertexPos66_g1435, RotationAxis56_g1435, RotationAngle54_g1435 );
				float3 DetailMotionVO73_g1435 = float3( 0,0,0 );
				float3 rotatedValue34_g1435 = RotateAroundAxis( LocalPivotPos60_g1435, ( rotatedValue30_g1435 + DetailMotionVO73_g1435 ), RotationAxis56_g1435, RotationAngle54_g1435 );
				#if defined( _MMBENDINGMETHOD_SIMPLE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#elif defined( _MMBENDINGMETHOD_ACCURATE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue34_g1435 - VertexPos66_g1435 ) * step( 0.01 , VertexPos_Y67_g1435 ) );
				#else
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#endif
				float3 LocalVertexOffset89_g1442 = staticSwitch186_g1434;
				float3 appendResult15_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1442, 1 ) ).xyz;
				float3 objToWorld102_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1442 = ( objToWorld98_g1442 - objToWorld102_g1442 );
				float3 appendResult24_g1442 = (float3(-break20_g1442.z , 0.0 , break20_g1442.x));
				float3 appendResult3_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1442, 1 ) ).xyz;
				float3 objToWorld106_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1442 = ( objToWorld100_g1442 - objToWorld106_g1442 );
				float3 break108_g1442 = temp_output_107_0_g1442;
				float3 lerpResult84_g1442 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1442 , step( 0.001 , ( abs( break108_g1442.x ) + abs( break108_g1442.z ) ) ));
				float3 normalizeResult7_g1442 = ASESafeNormalize( lerpResult84_g1442 );
				float dotResult9_g1442 = dot( normalizeResult7_g1442 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1442 = acos( dotResult9_g1442 );
				float NaNPrevention21_g1442 = step( 0.01 , abs( ( temp_output_12_0_g1442 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1442 = lerp( float3( 1, 0, 0 ) , appendResult24_g1442 , NaNPrevention21_g1442);
				float3 worldToObj99_g1442 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1442, 1 ) ).xyz;
				float3 worldToObj105_g1442 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1442 = normalize( ( worldToObj99_g1442 - worldToObj105_g1442 ) );
				float3 RotationAxis30_g1442 = normalizeResult49_g1442;
				float4 WorldSpaceNoise126_g1442 = temp_output_16_0_g1434;
				float SlopeCorrectionOffset120_g1442 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1442 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1442 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1442).x - 0.0 ) * ( SlopeCorrectionOffset120_g1442 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1442 ) ) * temp_output_12_0_g1442 );
				float3 appendResult28_g1443 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 rotatedValue35_g1442 = RotateAroundAxis( -appendResult28_g1443, ( input.positionOS.xyz + LocalVertexOffset89_g1442 ), RotationAxis30_g1442, RotationAngle29_g1442 );
				float3 lerpResult52_g1442 = lerp( LocalVertexOffset89_g1442 , ( rotatedValue35_g1442 - input.positionOS.xyz ) , NaNPrevention21_g1442);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1442 = lerpResult52_g1442;
				#else
				float3 staticSwitch123_g1442 = LocalVertexOffset89_g1442;
				#endif
				float3 appendResult28_g1447 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g1444 = -appendResult28_g1447;
				float3 temp_output_5_0_g1444 = ( ( staticSwitch123_g1442 + input.positionOS.xyz ) - Scale_Pivot15_g1444 );
				float ScaleVartMin40_g1444 = _ScaleVarMin;
				float ScaleVarMax41_g1444 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1444 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1444 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1446 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1444, 1 ) ).xyz;
				float2 appendResult10_g1446 = (float2(objToWorld11_g1446.x , objToWorld11_g1446.z));
				float2 Scale_WorldSpaceUVs30_g1444 = appendResult10_g1446;
				float Scale_VarNoiseTiling23_g1444 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1444 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1444 * Scale_VarNoiseTiling23_g1444 ), 0, 0.0) );
				float smoothstepResult56_g1444 = smoothstep( ScaleNoiseSharpnessMin59_g1444 , ScaleNoiseSharpnessMax60_g1444 , (Scale_WorldSpaceNoise32_g1444).r);
				float lerpResult44_g1444 = lerp( ScaleVartMin40_g1444 , ScaleVarMax41_g1444 , smoothstepResult56_g1444);
				float ScaleVar47_g1444 = lerpResult44_g1444;
				float clampResult63_g1444 = clamp( ( ScaleVar47_g1444 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1444 = ( temp_output_5_0_g1444 * clampResult63_g1444 );
				#else
				float3 staticSwitch72_g1444 = temp_output_5_0_g1444;
				#endif
				float ScaleOffset19_g1444 = _ScaleOffset;
				float clampResult64_g1444 = clamp( ( ScaleOffset19_g1444 + 1.0 ) , 0.0 , 7.0 );
				
				float2 TerrainPosition29_g1448 = ( Nicrom_TerrainPosition + float2( 1,1 ) );
				float2 TerrainPosition4_g1450 = TerrainPosition29_g1448;
				float TerrainSize28_g1448 = Nicrom_TerrainSize;
				float TerrainSize2_g1450 = TerrainSize28_g1448;
				float3 appendResult28_g1449 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 temp_output_3_33_g1448 = -appendResult28_g1449;
				float3 LocalPivot6_g1448 = temp_output_3_33_g1448;
				float3 objToWorld11_g1453 = mul( GetObjectToWorldMatrix(), float4( LocalPivot6_g1448, 1 ) ).xyz;
				float2 appendResult10_g1453 = (float2(objToWorld11_g1453.x , objToWorld11_g1453.z));
				float4 vertexToFrag19_g1450 = tex2Dlod( Nicrom_TerrainColorMap, float4( ( ( ( 1.0 - TerrainPosition4_g1450 ) / TerrainSize2_g1450 ) + ( ( TerrainSize2_g1450 / ( TerrainSize2_g1450 * TerrainSize2_g1450 ) ) * appendResult10_g1453 ) ), 0, 0.0) );
				output.ase_texcoord2 = vertexToFrag19_g1450;
				float vertexToFrag421_g1448 = input.positionOS.xyz.y;
				output.ase_texcoord1.z = vertexToFrag421_g1448;
				#ifdef _SCALEVARIATION_ON
				float staticSwitch73_g1444 = smoothstepResult56_g1444;
				#else
				float staticSwitch73_g1444 = 0.0;
				#endif
				float vertexToFrag71_g1444 = staticSwitch73_g1444;
				output.ase_texcoord1.w = vertexToFrag71_g1444;
				
				float3 customSurfaceDepth3_g1455 = input.positionOS.xyz;
				float customEye3_g1455 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1455)).z;
				output.ase_texcoord3.z = customEye3_g1455;
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				output.ase_texcoord3.xy = input.ase_texcoord1.xy;
				output.ase_color = input.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1444 * clampResult64_g1444 ) + Scale_Pivot15_g1444 ) - input.positionOS.xyz );

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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

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
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
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
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
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

				float Debug_Target308_g1448 = _Debug;
				float2 uv_Albedo = input.ase_texcoord1.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode111_g1448 = tex2D( _Albedo, uv_Albedo );
				float4 FoliageTexture123_g1448 = tex2DNode111_g1448;
				float3 Color1A78_g1448 = _Color1A;
				float4 vertexToFrag19_g1450 = input.ase_texcoord2;
				float4 TerrainColor76_g1448 = vertexToFrag19_g1450;
				float BWT_Top44_g1448 = _BWTTop;
				float IsTerrainAlbedoAssigned36_g1448 = step( 8.0 , Nicrom_TerrainColorMap_TexelSize.z );
				float lerpResult62_g1448 = lerp( 0.0 , BWT_Top44_g1448 , IsTerrainAlbedoAssigned36_g1448);
				float BWT_MaskStart434_g1448 = _BWTMaskStart;
				float BWT_MaskEnd435_g1448 = _BWTMaskEnd;
				float vertexToFrag421_g1448 = input.ase_texcoord1.z;
				float VertexPos_Y430_g1448 = vertexToFrag421_g1448;
				float smoothstepResult273_g1448 = smoothstep( BWT_MaskStart434_g1448 , BWT_MaskEnd435_g1448 , VertexPos_Y430_g1448);
				float BWT_MaskToggle461_g1448 = _BWTMask;
				float lerpResult462_g1448 = lerp( 1.0 , ( 1.0 - smoothstepResult273_g1448 ) , BWT_MaskToggle461_g1448);
				float BWT_Mask277_g1448 = lerpResult462_g1448;
				float lerpResult278_g1448 = lerp( 0.0 , lerpResult62_g1448 , BWT_Mask277_g1448);
				float BWT_Top_F74_g1448 = lerpResult278_g1448;
				float4 lerpResult104_g1448 = lerp( float4( Color1A78_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Top_F74_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch114_g1448 = lerpResult104_g1448;
				#else
				float4 staticSwitch114_g1448 = float4( Color1A78_g1448 , 0.0 );
				#endif
				float4 Color1A_Top_BWT167_g1448 = staticSwitch114_g1448;
				float3 Color1B81_g1448 = _Color1B;
				float BWT_Bottom45_g1448 = _BWTBottom;
				float lerpResult61_g1448 = lerp( 0.0 , BWT_Bottom45_g1448 , IsTerrainAlbedoAssigned36_g1448);
				float lerpResult281_g1448 = lerp( 0.0 , lerpResult61_g1448 , BWT_Mask277_g1448);
				float BWT_Bottom_F75_g1448 = lerpResult281_g1448;
				float4 lerpResult105_g1448 = lerp( float4( Color1B81_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Bottom_F75_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch115_g1448 = lerpResult105_g1448;
				#else
				float4 staticSwitch115_g1448 = float4( Color1B81_g1448 , 0.0 );
				#endif
				float4 Color1B_Bot_BWT169_g1448 = staticSwitch115_g1448;
				float2 uv_ColorMask1 = input.ase_texcoord1.xy * _ColorMask1_ST.xy + _ColorMask1_ST.zw;
				float ColorMask1_Tex66_g1448 = ( 1.0 - tex2D( _ColorMask1, uv_ColorMask1 ).r );
				float ColorMask1_End43_g1448 = _ColorMask1End;
				float ColorMask1_Start42_g1448 = _ColorMask1Start;
				float smoothstepResult427_g1448 = smoothstep( ColorMask1_End43_g1448 , ColorMask1_Start42_g1448 , VertexPos_Y430_g1448);
				#if defined( _COLORMASK1SOURCE_TEXTURE )
				float staticSwitch377_g1448 = ColorMask1_Tex66_g1448;
				#elif defined( _COLORMASK1SOURCE_VERTEX )
				float staticSwitch377_g1448 = smoothstepResult427_g1448;
				#else
				float staticSwitch377_g1448 = ColorMask1_Tex66_g1448;
				#endif
				float ColorMask1101_g1448 = staticSwitch377_g1448;
				float4 lerpResult226_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask1101_g1448);
				float4 Colors2306_g1448 = lerpResult226_g1448;
				float3 Color2A82_g1448 = _Color2A;
				float4 lerpResult106_g1448 = lerp( float4( Color2A82_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Top_F74_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch117_g1448 = lerpResult106_g1448;
				#else
				float4 staticSwitch117_g1448 = float4( Color2A82_g1448 , 0.0 );
				#endif
				float4 Color2A_Top_BWT171_g1448 = staticSwitch117_g1448;
				float CM2_GVToggle400_g1448 = _ColorMask2GV;
				float lerpResult409_g1448 = lerp( _ColorMask2SharpnessMin , Nicrom_Grass_CM2_SharpMin , CM2_GVToggle400_g1448);
				float ColorMask2_SharpMin88_g1448 = lerpResult409_g1448;
				float lerpResult412_g1448 = lerp( _ColorMask2SharpnessMax , Nicrom_Grass_CM2_SharpMax , CM2_GVToggle400_g1448);
				float ColorMask2_SharpMax87_g1448 = lerpResult412_g1448;
				float3 appendResult28_g1449 = (float3(input.ase_texcoord3.xy.x , 0.0 , input.ase_texcoord3.xy.y));
				float3 temp_output_3_33_g1448 = -appendResult28_g1449;
				float3 objToWorld11_g1451 = mul( GetObjectToWorldMatrix(), float4( temp_output_3_33_g1448, 1 ) ).xyz;
				float2 appendResult10_g1451 = (float2(objToWorld11_g1451.x , objToWorld11_g1451.z));
				float2 ColorMask2_WSUVs23_g1448 = appendResult10_g1451;
				float lerpResult402_g1448 = lerp( _ColorMask2Tiling , Nicrom_Grass_CM2_Tilling , CM2_GVToggle400_g1448);
				float ColorMask2_Tiling24_g1448 = lerpResult402_g1448;
				float2 CM2_UVOffset_GV159_g1448 = Nicrom_Grass_CM2_UVOffset;
				float lerpResult406_g1448 = lerp( _ColorMask2Speed , Nicrom_Grass_CM2_Speed , CM2_GVToggle400_g1448);
				float ColorMask2_Speed151_g1448 = lerpResult406_g1448;
				float ColorMask2_Noise85_g1448 = (tex2D( _ColorMask2, ( ( ColorMask2_WSUVs23_g1448 * ColorMask2_Tiling24_g1448 ) + ( CM2_UVOffset_GV159_g1448 * ColorMask2_Speed151_g1448 * 0.1 ) ) )).r;
				float smoothstepResult120_g1448 = smoothstep( ColorMask2_SharpMin88_g1448 , ColorMask2_SharpMax87_g1448 , ColorMask2_Noise85_g1448);
				float ColorMask2_Opacity415_g1448 = _ColorMask2Opacity;
				float ColorMask2_F196_g1448 = ( smoothstepResult120_g1448 * ColorMask2_Opacity415_g1448 );
				float4 lerpResult341_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color2A_Top_BWT171_g1448 , ColorMask2_F196_g1448);
				float4 lerpResult344_g1448 = lerp( lerpResult341_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask1101_g1448);
				float4 Colors3_BMA348_g1448 = lerpResult344_g1448;
				float ColorMask3_Start438_g1448 = _ColorMask3Start;
				float ColorMask3_End439_g1448 = _ColorMask3End;
				float smoothstepResult442_g1448 = smoothstep( ColorMask3_Start438_g1448 , ColorMask3_End439_g1448 , VertexPos_Y430_g1448);
				#if defined( _COLORBLENDINGMODE_A )
				float staticSwitch449_g1448 = 0.0;
				#elif defined( _COLORBLENDINGMODE_B )
				float staticSwitch449_g1448 = ( 1.0 - smoothstepResult442_g1448 );
				#else
				float staticSwitch449_g1448 = 0.0;
				#endif
				float ColorMask3446_g1448 = staticSwitch449_g1448;
				float4 lerpResult352_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask3446_g1448);
				float4 lerpResult353_g1448 = lerp( lerpResult352_g1448 , float4( Color2A82_g1448 , 0.0 ) , ( 1.0 - ColorMask1_Tex66_g1448 ));
				float4 Colors3_BMB357_g1448 = lerpResult353_g1448;
				#if defined( _COLORBLENDINGMODE_A )
				float4 staticSwitch366_g1448 = Colors3_BMA348_g1448;
				#elif defined( _COLORBLENDINGMODE_B )
				float4 staticSwitch366_g1448 = Colors3_BMB357_g1448;
				#else
				float4 staticSwitch366_g1448 = Colors3_BMA348_g1448;
				#endif
				float4 Colors3362_g1448 = staticSwitch366_g1448;
				float3 Color2B83_g1448 = _Color2B;
				float4 lerpResult269_g1448 = lerp( float4( Color2B83_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Bottom_F75_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch270_g1448 = lerpResult269_g1448;
				#else
				float4 staticSwitch270_g1448 = float4( Color2B83_g1448 , 0.0 );
				#endif
				float4 Color2B_Bot_BWT271_g1448 = staticSwitch270_g1448;
				float4 lerpResult227_g1448 = lerp( Color2A_Top_BWT171_g1448 , Color2B_Bot_BWT271_g1448 , ColorMask1101_g1448);
				float4 lerpResult225_g1448 = lerp( Colors2306_g1448 , lerpResult227_g1448 , ColorMask2_F196_g1448);
				float4 Colors4_BMA256_g1448 = lerpResult225_g1448;
				float4 lerpResult242_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask3446_g1448);
				float3 lerpResult249_g1448 = lerp( Color2A82_g1448 , Color2B83_g1448 , ColorMask2_F196_g1448);
				float4 lerpResult246_g1448 = lerp( lerpResult242_g1448 , float4( lerpResult249_g1448 , 0.0 ) , ( 1.0 - ColorMask1_Tex66_g1448 ));
				float4 Colors4_BMB257_g1448 = lerpResult246_g1448;
				#if defined( _COLORBLENDINGMODE_A )
				float4 staticSwitch373_g1448 = Colors4_BMA256_g1448;
				#elif defined( _COLORBLENDINGMODE_B )
				float4 staticSwitch373_g1448 = Colors4_BMB257_g1448;
				#else
				float4 staticSwitch373_g1448 = Colors4_BMA256_g1448;
				#endif
				float4 Colors4363_g1448 = staticSwitch373_g1448;
				#if defined( _COLORS_TWO )
				float4 staticSwitch303_g1448 = Colors2306_g1448;
				#elif defined( _COLORS_THREE )
				float4 staticSwitch303_g1448 = Colors3362_g1448;
				#elif defined( _COLORS_FOUR )
				float4 staticSwitch303_g1448 = Colors4363_g1448;
				#else
				float4 staticSwitch303_g1448 = Colors3362_g1448;
				#endif
				float4 Albedo453_g1448 = ( FoliageTexture123_g1448 * staticSwitch303_g1448 );
				float4 Albedo308_g1448 = Albedo453_g1448;
				#if defined( _COLORBLENDINGMODE_A )
				float staticSwitch456_g1448 = ( 1.0 - ColorMask1101_g1448 );
				#elif defined( _COLORBLENDINGMODE_B )
				float staticSwitch456_g1448 = ( 1.0 - ColorMask1_Tex66_g1448 );
				#else
				float staticSwitch456_g1448 = ( 1.0 - ColorMask1101_g1448 );
				#endif
				float ColorMask1308_g1448 = staticSwitch456_g1448;
				#if defined( _COLORS_TWO )
				float staticSwitch381_g1448 = 0.0;
				#elif defined( _COLORS_THREE )
				float staticSwitch381_g1448 = ColorMask2_F196_g1448;
				#elif defined( _COLORS_FOUR )
				float staticSwitch381_g1448 = ColorMask2_F196_g1448;
				#else
				float staticSwitch381_g1448 = ColorMask2_F196_g1448;
				#endif
				float ColorMask2308_g1448 = staticSwitch381_g1448;
				#if defined( _COLORS_TWO )
				float staticSwitch452_g1448 = 0.0;
				#elif defined( _COLORS_THREE )
				float staticSwitch452_g1448 = ColorMask3446_g1448;
				#elif defined( _COLORS_FOUR )
				float staticSwitch452_g1448 = ColorMask3446_g1448;
				#else
				float staticSwitch452_g1448 = ColorMask3446_g1448;
				#endif
				float ColorMask3308_g1448 = staticSwitch452_g1448;
				float3 objToWorld170_g1440 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GVTime160_g1434 = _GVTime;
				float lerpResult146_g1434 = lerp( _TimeParameters.x , Nicrom_MM_Time_Grass , GVTime160_g1434);
				float ApplicationIsPlaying227_g1434 = Nicrom_ApplicationIsPlaying;
				float lerpResult221_g1434 = lerp( _TimeParameters.x , lerpResult146_g1434 , ApplicationIsPlaying227_g1434);
				float MM_Time140_g1434 = lerpResult221_g1434;
				float Time167_g1440 = MM_Time140_g1434;
				float MM_Speed63_g1434 = _MMSpeed;
				float Speed125_g1440 = MM_Speed63_g1434;
				float temp_output_205_0_g1434 = Nicrom_MM_SpeedScale_Grass;
				float lerpResult208_g1434 = lerp( temp_output_205_0_g1434 , 1.0 , GVTime160_g1434);
				float lerpResult210_g1434 = lerp( temp_output_205_0_g1434 , lerpResult208_g1434 , ApplicationIsPlaying227_g1434);
				float MM_SpeedScale206_g1434 = lerpResult210_g1434;
				float SpeedScale_RotAng201_g1440 = MM_SpeedScale206_g1434;
				float MM_SineWaveLength64_g1434 = _MMSineWaveLength;
				float WaveLength63_g1440 = MM_SineWaveLength64_g1434;
				float3 appendResult28_g1441 = (float3(input.ase_texcoord3.xy.x , 0.0 , input.ase_texcoord3.xy.y));
				float3 MM_LocalPivot3_g1434 = -appendResult28_g1441;
				float3 objToWorld11_g1438 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float2 appendResult10_g1438 = (float2(objToWorld11_g1438.x , objToWorld11_g1438.z));
				float2 WorldSpaceUVs9_g1434 = appendResult10_g1438;
				float StaticNoiseTiling11_g1434 = _StaticNoiseTiling;
				float4 temp_output_16_0_g1434 = tex2D( _MotionNoise, ( WorldSpaceUVs9_g1434 * StaticNoiseTiling11_g1434 ) );
				float4 WorldSpaceStaticNoise23_g1434 = temp_output_16_0_g1434;
				float MM_PhaseShiftSource26_g1434 = _MMPhaseShiftSource;
				float lerpResult38_g1434 = lerp( input.ase_color.a , (WorldSpaceStaticNoise23_g1434).g , MM_PhaseShiftSource26_g1434);
				float MM_PhaseShiftScale34_g1434 = _MMPhaseShiftScale;
				float MM_PhaseShift60_g1434 = ( lerpResult38_g1434 * MM_PhaseShiftScale34_g1434 );
				float PhaseShift127_g1440 = MM_PhaseShift60_g1434;
				float temp_output_20_0_g1440 = sin( ( ( ( objToWorld170_g1440.x + objToWorld170_g1440.z ) + ( ( Time167_g1440 * ( ( Speed125_g1440 * SpeedScale_RotAng201_g1440 ) * WaveLength63_g1440 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1440 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1440 ) ) );
				float MotionSineWave5 =  (0.0 + ( temp_output_20_0_g1440 - -1.0 ) * ( 1.0 - 0.0 ) / ( 1.0 - -1.0 ) );
				float MotionWave308_g1448 = MotionSineWave5;
				float vertexToFrag71_g1444 = input.ase_texcoord1.w;
				float ScaleVarNoise6 = vertexToFrag71_g1444;
				float ScaleVarNoise308_g1448 = ScaleVarNoise6;
				float4 localDebug308_g1448 = Debug308_g1448( Debug_Target308_g1448 , Albedo308_g1448 , ColorMask1308_g1448 , ColorMask2308_g1448 , ColorMask3308_g1448 , MotionWave308_g1448 , ScaleVarNoise308_g1448 );
				
				float temp_output_31_0_g1455 = tex2DNode111_g1448.a;
				float DF_Length_Local38_g1455 = _DistanceFadeLength;
				float DF_Length_Global45_g1455 = Nicrom_Grass_DF_Length;
				float DF_Start_Global43_g1455 = Nicrom_Grass_DF_Start;
				float lerpResult49_g1455 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1455 ));
				float DF_UseGV28_g1455 = lerpResult49_g1455;
				float lerpResult26_g1455 = lerp( DF_Length_Local38_g1455 , DF_Length_Global45_g1455 , DF_UseGV28_g1455);
				float DistanceFadeLength23_g1455 = lerpResult26_g1455;
				float DF_Start_Local36_g1455 = _DistanceFadeStart;
				float lerpResult20_g1455 = lerp( DF_Start_Local36_g1455 , DF_Start_Global43_g1455 , DF_UseGV28_g1455);
				float DistanceFadeStart27_g1455 = lerpResult20_g1455;
				float customEye3_g1455 = input.ase_texcoord3.z;
				float cameraDepthFade3_g1455 = (( customEye3_g1455 -_ProjectionParams.y - DistanceFadeStart27_g1455 ) / DistanceFadeLength23_g1455);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1455 = ( temp_output_31_0_g1455 * saturate( ( 1.0 - cameraDepthFade3_g1455 ) ) );
				#else
				float staticSwitch33_g1455 = temp_output_31_0_g1455;
				#endif
				

				float3 BaseColor = localDebug308_g1448.xyz;
				float Alpha = staticSwitch33_g1455;
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
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#pragma shader_feature_local_fragment _BLENDWITHTERRAIN_ON
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local _MMBENDINGMETHOD_SIMPLE _MMBENDINGMETHOD_ACCURATE
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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
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
			float4 _Albedo_ST;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color1B;
			float3 _Color2A;
			half _MMDirectionAngle;
			float _BWTTop;
			float _BWTMaskStart;
			float _BWTMaskEnd;
			float _BWTMask;
			float _BWTBottom;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask2SharpnessMin;
			float _ColorMask2SharpnessMax;
			float _ColorMask2Tiling;
			float _ColorMask2Speed;
			float _ColorMask2Opacity;
			float _ColorMask3Start;
			float _ColorMask3End;
			float _Metallic;
			float _Smoothness;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _Debug;
			float _ScaleVarNoiseTiling;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _StaticNoiseTiling;
			float _GVTime;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVBendingScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionOffset;
			float _SlopeCorrectionMagnitude;
			float _ScaleVarMin;
			float _ScaleVarMax;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleOffset;
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

			float Nicrom_Grass_DF_Start;
			float Nicrom_Grass_DF_Length;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Grass;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_Grass;
			float Nicrom_MM_BendScale_Grass;
			float Nicrom_MM_AmpScale_Grass;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;


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

				float lerpResult56_g1436 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle35_g1434 = lerpResult56_g1436;
				float MM_DirectionShift68_g1434 = _MMDirectionShift;
				float MM_DirectionShiftOffset69_g1434 = _MMDirectionShiftOffset;
				float3 appendResult28_g1441 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 MM_LocalPivot3_g1434 = -appendResult28_g1441;
				float3 objToWorld11_g1438 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float2 appendResult10_g1438 = (float2(objToWorld11_g1438.x , objToWorld11_g1438.z));
				float2 WorldSpaceUVs9_g1434 = appendResult10_g1438;
				float StaticNoiseTiling11_g1434 = _StaticNoiseTiling;
				float4 temp_output_16_0_g1434 = tex2Dlod( _MotionNoise, float4( ( WorldSpaceUVs9_g1434 * StaticNoiseTiling11_g1434 ), 0, 0.0) );
				float4 WorldSpaceStaticNoise23_g1434 = temp_output_16_0_g1434;
				float4 StaticWorldNoise55_g1439 = WorldSpaceStaticNoise23_g1434;
				float3 objToWorld50_g1439 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float GVTime160_g1434 = _GVTime;
				float lerpResult146_g1434 = lerp( _TimeParameters.x , Nicrom_MM_Time_Grass , GVTime160_g1434);
				float ApplicationIsPlaying227_g1434 = Nicrom_ApplicationIsPlaying;
				float lerpResult221_g1434 = lerp( _TimeParameters.x , lerpResult146_g1434 , ApplicationIsPlaying227_g1434);
				float MM_Time140_g1434 = lerpResult221_g1434;
				float Time76_g1439 = MM_Time140_g1434;
				float temp_output_205_0_g1434 = Nicrom_MM_SpeedScale_Grass;
				float lerpResult208_g1434 = lerp( temp_output_205_0_g1434 , 1.0 , GVTime160_g1434);
				float lerpResult210_g1434 = lerp( temp_output_205_0_g1434 , lerpResult208_g1434 , ApplicationIsPlaying227_g1434);
				float MM_SpeedScale206_g1434 = lerpResult210_g1434;
				float SpeedScale_RA80_g1439 = MM_SpeedScale206_g1434;
				float MM_DirectionShiftSpeed70_g1434 = _MMDirectionShiftSpeed;
				float MM_DirectionShiftNoiseScale71_g1434 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1439 = radians( ( ( MM_DirectionAngle35_g1434 + ( ( MM_DirectionShift68_g1434 + ( MM_DirectionShiftOffset69_g1434 * (StaticWorldNoise55_g1439).x ) ) * sin( ( ( objToWorld50_g1439.x + objToWorld50_g1439.z ) + ( ( Time76_g1439 * ( SpeedScale_RA80_g1439 * MM_DirectionShiftSpeed70_g1434 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1439).z * MM_DirectionShiftNoiseScale71_g1434 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1439 = (float3(cos( temp_output_11_0_g1439 ) , 0.0 , sin( temp_output_11_0_g1439 )));
				float3 worldToObj35_g1439 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1439, 1 ) ).xyz;
				float3 worldToObj36_g1439 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1439 = normalize( (( worldToObj35_g1439 - worldToObj36_g1439 )).xyz );
				float3 MM_RotationAxis101_g1434 = normalizeResult34_g1439;
				float4 StaticWorldNoise31_g1440 = WorldSpaceStaticNoise23_g1434;
				float MM_BendingOfset73_g1434 = _MMBendingOffset;
				float MM_Bending67_g1434 = _MMBending;
				float GVBendingScale164_g1434 = _GVBendingScale;
				float lerpResult155_g1434 = lerp( 1.0 , Nicrom_MM_BendScale_Grass , GVBendingScale164_g1434);
				float MM_BendingScale141_g1434 = lerpResult155_g1434;
				float MM_AmplitudeOffset62_g1434 = _MMAmplitudeOffset;
				float MM_Amplitude61_g1434 = _MMAmplitude;
				float GVAmplitudeScale162_g1434 = _GVAmplitudeScale;
				float lerpResult152_g1434 = lerp( 1.0 , Nicrom_MM_AmpScale_Grass , GVAmplitudeScale162_g1434);
				float MM_AmplitudeScale139_g1434 = lerpResult152_g1434;
				float3 objToWorld170_g1440 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1440 = MM_Time140_g1434;
				float MM_Speed63_g1434 = _MMSpeed;
				float Speed125_g1440 = MM_Speed63_g1434;
				float SpeedScale_RotAng201_g1440 = MM_SpeedScale206_g1434;
				float MM_SineWaveLength64_g1434 = _MMSineWaveLength;
				float WaveLength63_g1440 = MM_SineWaveLength64_g1434;
				float MM_PhaseShiftSource26_g1434 = _MMPhaseShiftSource;
				float lerpResult38_g1434 = lerp( input.ase_color.a , (WorldSpaceStaticNoise23_g1434).g , MM_PhaseShiftSource26_g1434);
				float MM_PhaseShiftScale34_g1434 = _MMPhaseShiftScale;
				float MM_PhaseShift60_g1434 = ( lerpResult38_g1434 * MM_PhaseShiftScale34_g1434 );
				float PhaseShift127_g1440 = MM_PhaseShift60_g1434;
				float temp_output_20_0_g1440 = sin( ( ( ( objToWorld170_g1440.x + objToWorld170_g1440.z ) + ( ( Time167_g1440 * ( ( Speed125_g1440 * SpeedScale_RotAng201_g1440 ) * WaveLength63_g1440 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1440 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1440 ) ) );
				float MM_ObjectHeight66_g1434 = _MMObjectHeight;
				float3 gammaToLinear56_g1440 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource65_g1434 = _MMObjectHeightSource;
				float lerpResult57_g1440 = lerp( ( input.positionOS.xyz.y / MM_ObjectHeight66_g1434 ) , (gammaToLinear56_g1440).x , MM_ObjectHeightSource65_g1434);
				float BendingMask189_g1440 = lerpResult57_g1440;
				float MM_RotationAngle102_g1434 = radians( ( ( ( ( ( (StaticWorldNoise31_g1440).y * MM_BendingOfset73_g1434 ) + MM_Bending67_g1434 ) * MM_BendingScale141_g1434 ) + ( ( ( ( (StaticWorldNoise31_g1440).x * MM_AmplitudeOffset62_g1434 ) + MM_Amplitude61_g1434 ) * MM_AmplitudeScale139_g1434 ) * temp_output_20_0_g1440 ) ) * BendingMask189_g1440 ) );
				float3 appendResult103_g1434 = (float3(input.positionOS.xyz.x , 0.0 , input.positionOS.xyz.z));
				float3 VertexPosition179_g1434 = input.positionOS.xyz;
				float3 rotatedValue108_g1434 = RotateAroundAxis( appendResult103_g1434, VertexPosition179_g1434, MM_RotationAxis101_g1434, MM_RotationAngle102_g1434 );
				float3 RotationAxis56_g1435 = MM_RotationAxis101_g1434;
				float RotationAngle54_g1435 = MM_RotationAngle102_g1434;
				float3 LocalPivotPos60_g1435 = MM_LocalPivot3_g1434;
				float3 break62_g1435 = LocalPivotPos60_g1435;
				float VertexPos_Y67_g1435 = input.positionOS.xyz.y;
				float3 appendResult45_g1435 = (float3(break62_g1435.x , VertexPos_Y67_g1435 , break62_g1435.z));
				float3 VertexPos66_g1435 = input.positionOS.xyz;
				float3 rotatedValue30_g1435 = RotateAroundAxis( appendResult45_g1435, VertexPos66_g1435, RotationAxis56_g1435, RotationAngle54_g1435 );
				float3 DetailMotionVO73_g1435 = float3( 0,0,0 );
				float3 rotatedValue34_g1435 = RotateAroundAxis( LocalPivotPos60_g1435, ( rotatedValue30_g1435 + DetailMotionVO73_g1435 ), RotationAxis56_g1435, RotationAngle54_g1435 );
				#if defined( _MMBENDINGMETHOD_SIMPLE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#elif defined( _MMBENDINGMETHOD_ACCURATE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue34_g1435 - VertexPos66_g1435 ) * step( 0.01 , VertexPos_Y67_g1435 ) );
				#else
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#endif
				float3 LocalVertexOffset89_g1442 = staticSwitch186_g1434;
				float3 appendResult15_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1442, 1 ) ).xyz;
				float3 objToWorld102_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1442 = ( objToWorld98_g1442 - objToWorld102_g1442 );
				float3 appendResult24_g1442 = (float3(-break20_g1442.z , 0.0 , break20_g1442.x));
				float3 appendResult3_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1442, 1 ) ).xyz;
				float3 objToWorld106_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1442 = ( objToWorld100_g1442 - objToWorld106_g1442 );
				float3 break108_g1442 = temp_output_107_0_g1442;
				float3 lerpResult84_g1442 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1442 , step( 0.001 , ( abs( break108_g1442.x ) + abs( break108_g1442.z ) ) ));
				float3 normalizeResult7_g1442 = ASESafeNormalize( lerpResult84_g1442 );
				float dotResult9_g1442 = dot( normalizeResult7_g1442 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1442 = acos( dotResult9_g1442 );
				float NaNPrevention21_g1442 = step( 0.01 , abs( ( temp_output_12_0_g1442 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1442 = lerp( float3( 1, 0, 0 ) , appendResult24_g1442 , NaNPrevention21_g1442);
				float3 worldToObj99_g1442 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1442, 1 ) ).xyz;
				float3 worldToObj105_g1442 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1442 = normalize( ( worldToObj99_g1442 - worldToObj105_g1442 ) );
				float3 RotationAxis30_g1442 = normalizeResult49_g1442;
				float4 WorldSpaceNoise126_g1442 = temp_output_16_0_g1434;
				float SlopeCorrectionOffset120_g1442 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1442 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1442 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1442).x - 0.0 ) * ( SlopeCorrectionOffset120_g1442 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1442 ) ) * temp_output_12_0_g1442 );
				float3 appendResult28_g1443 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 rotatedValue35_g1442 = RotateAroundAxis( -appendResult28_g1443, ( input.positionOS.xyz + LocalVertexOffset89_g1442 ), RotationAxis30_g1442, RotationAngle29_g1442 );
				float3 lerpResult52_g1442 = lerp( LocalVertexOffset89_g1442 , ( rotatedValue35_g1442 - input.positionOS.xyz ) , NaNPrevention21_g1442);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1442 = lerpResult52_g1442;
				#else
				float3 staticSwitch123_g1442 = LocalVertexOffset89_g1442;
				#endif
				float3 appendResult28_g1447 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g1444 = -appendResult28_g1447;
				float3 temp_output_5_0_g1444 = ( ( staticSwitch123_g1442 + input.positionOS.xyz ) - Scale_Pivot15_g1444 );
				float ScaleVartMin40_g1444 = _ScaleVarMin;
				float ScaleVarMax41_g1444 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1444 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1444 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1446 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1444, 1 ) ).xyz;
				float2 appendResult10_g1446 = (float2(objToWorld11_g1446.x , objToWorld11_g1446.z));
				float2 Scale_WorldSpaceUVs30_g1444 = appendResult10_g1446;
				float Scale_VarNoiseTiling23_g1444 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1444 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1444 * Scale_VarNoiseTiling23_g1444 ), 0, 0.0) );
				float smoothstepResult56_g1444 = smoothstep( ScaleNoiseSharpnessMin59_g1444 , ScaleNoiseSharpnessMax60_g1444 , (Scale_WorldSpaceNoise32_g1444).r);
				float lerpResult44_g1444 = lerp( ScaleVartMin40_g1444 , ScaleVarMax41_g1444 , smoothstepResult56_g1444);
				float ScaleVar47_g1444 = lerpResult44_g1444;
				float clampResult63_g1444 = clamp( ( ScaleVar47_g1444 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1444 = ( temp_output_5_0_g1444 * clampResult63_g1444 );
				#else
				float3 staticSwitch72_g1444 = temp_output_5_0_g1444;
				#endif
				float ScaleOffset19_g1444 = _ScaleOffset;
				float clampResult64_g1444 = clamp( ( ScaleOffset19_g1444 + 1.0 ) , 0.0 , 7.0 );
				
				float3 customSurfaceDepth3_g1455 = input.positionOS.xyz;
				float customEye3_g1455 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1455)).z;
				output.ase_texcoord3.z = customEye3_g1455;
				
				output.ase_texcoord3.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1444 * clampResult64_g1444 ) + Scale_Pivot15_g1444 ) - input.positionOS.xyz );

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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

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
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
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
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
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

				float2 uv_Albedo = input.ase_texcoord3.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode111_g1448 = tex2D( _Albedo, uv_Albedo );
				float temp_output_31_0_g1455 = tex2DNode111_g1448.a;
				float DF_Length_Local38_g1455 = _DistanceFadeLength;
				float DF_Length_Global45_g1455 = Nicrom_Grass_DF_Length;
				float DF_Start_Global43_g1455 = Nicrom_Grass_DF_Start;
				float lerpResult49_g1455 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1455 ));
				float DF_UseGV28_g1455 = lerpResult49_g1455;
				float lerpResult26_g1455 = lerp( DF_Length_Local38_g1455 , DF_Length_Global45_g1455 , DF_UseGV28_g1455);
				float DistanceFadeLength23_g1455 = lerpResult26_g1455;
				float DF_Start_Local36_g1455 = _DistanceFadeStart;
				float lerpResult20_g1455 = lerp( DF_Start_Local36_g1455 , DF_Start_Global43_g1455 , DF_UseGV28_g1455);
				float DistanceFadeStart27_g1455 = lerpResult20_g1455;
				float customEye3_g1455 = input.ase_texcoord3.z;
				float cameraDepthFade3_g1455 = (( customEye3_g1455 -_ProjectionParams.y - DistanceFadeStart27_g1455 ) / DistanceFadeLength23_g1455);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1455 = ( temp_output_31_0_g1455 * saturate( ( 1.0 - cameraDepthFade3_g1455 ) ) );
				#else
				float staticSwitch33_g1455 = temp_output_31_0_g1455;
				#endif
				

				float3 Normal = float3(0, 0, 1);
				float Alpha = staticSwitch33_g1455;
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
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES1
			#pragma shader_feature_local_fragment _BLENDWITHTERRAIN_ON
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local _MMBENDINGMETHOD_SIMPLE _MMBENDINGMETHOD_ACCURATE
			#pragma shader_feature_local _COLORS_TWO _COLORS_THREE _COLORS_FOUR
			#pragma shader_feature_local _COLORMASK1SOURCE_TEXTURE _COLORMASK1SOURCE_VERTEX
			#pragma shader_feature_local _COLORBLENDINGMODE_A _COLORBLENDINGMODE_B
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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 Nicrom_TerrainColorMap_TexelSize;
			float4 _ColorMask1_ST;
			float4 _Albedo_ST;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color1B;
			float3 _Color2A;
			half _MMDirectionAngle;
			float _BWTTop;
			float _BWTMaskStart;
			float _BWTMaskEnd;
			float _BWTMask;
			float _BWTBottom;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask2SharpnessMin;
			float _ColorMask2SharpnessMax;
			float _ColorMask2Tiling;
			float _ColorMask2Speed;
			float _ColorMask2Opacity;
			float _ColorMask3Start;
			float _ColorMask3End;
			float _Metallic;
			float _Smoothness;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _Debug;
			float _ScaleVarNoiseTiling;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _StaticNoiseTiling;
			float _GVTime;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVBendingScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionOffset;
			float _SlopeCorrectionMagnitude;
			float _ScaleVarMin;
			float _ScaleVarMax;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleOffset;
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

			float Nicrom_Grass_DF_Start;
			float Nicrom_Grass_DF_Length;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Grass;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_Grass;
			float Nicrom_MM_BendScale_Grass;
			float Nicrom_MM_AmpScale_Grass;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;
			sampler2D Nicrom_TerrainColorMap;
			float2 Nicrom_TerrainPosition;
			float Nicrom_TerrainSize;
			sampler2D _ColorMask1;
			float Nicrom_Grass_CM2_SharpMin;
			float Nicrom_Grass_CM2_SharpMax;
			sampler2D _ColorMask2;
			float Nicrom_Grass_CM2_Tilling;
			float2 Nicrom_Grass_CM2_UVOffset;
			float Nicrom_Grass_CM2_Speed;


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
			
			float4 Debug308_g1448( float Debug_Target, float4 Albedo, float ColorMask1, float ColorMask2, float ColorMask3, float MotionWave, float ScaleVarNoise )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1;
				else if(Debug_Target ==2)
				    return ColorMask2;
				else if(Debug_Target ==3)
				    return ColorMask3;
				else if(Debug_Target ==4)
				    return MotionWave;
				else
				    return ScaleVarNoise;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float lerpResult56_g1436 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle35_g1434 = lerpResult56_g1436;
				float MM_DirectionShift68_g1434 = _MMDirectionShift;
				float MM_DirectionShiftOffset69_g1434 = _MMDirectionShiftOffset;
				float3 appendResult28_g1441 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 MM_LocalPivot3_g1434 = -appendResult28_g1441;
				float3 objToWorld11_g1438 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float2 appendResult10_g1438 = (float2(objToWorld11_g1438.x , objToWorld11_g1438.z));
				float2 WorldSpaceUVs9_g1434 = appendResult10_g1438;
				float StaticNoiseTiling11_g1434 = _StaticNoiseTiling;
				float4 temp_output_16_0_g1434 = tex2Dlod( _MotionNoise, float4( ( WorldSpaceUVs9_g1434 * StaticNoiseTiling11_g1434 ), 0, 0.0) );
				float4 WorldSpaceStaticNoise23_g1434 = temp_output_16_0_g1434;
				float4 StaticWorldNoise55_g1439 = WorldSpaceStaticNoise23_g1434;
				float3 objToWorld50_g1439 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float GVTime160_g1434 = _GVTime;
				float lerpResult146_g1434 = lerp( _TimeParameters.x , Nicrom_MM_Time_Grass , GVTime160_g1434);
				float ApplicationIsPlaying227_g1434 = Nicrom_ApplicationIsPlaying;
				float lerpResult221_g1434 = lerp( _TimeParameters.x , lerpResult146_g1434 , ApplicationIsPlaying227_g1434);
				float MM_Time140_g1434 = lerpResult221_g1434;
				float Time76_g1439 = MM_Time140_g1434;
				float temp_output_205_0_g1434 = Nicrom_MM_SpeedScale_Grass;
				float lerpResult208_g1434 = lerp( temp_output_205_0_g1434 , 1.0 , GVTime160_g1434);
				float lerpResult210_g1434 = lerp( temp_output_205_0_g1434 , lerpResult208_g1434 , ApplicationIsPlaying227_g1434);
				float MM_SpeedScale206_g1434 = lerpResult210_g1434;
				float SpeedScale_RA80_g1439 = MM_SpeedScale206_g1434;
				float MM_DirectionShiftSpeed70_g1434 = _MMDirectionShiftSpeed;
				float MM_DirectionShiftNoiseScale71_g1434 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1439 = radians( ( ( MM_DirectionAngle35_g1434 + ( ( MM_DirectionShift68_g1434 + ( MM_DirectionShiftOffset69_g1434 * (StaticWorldNoise55_g1439).x ) ) * sin( ( ( objToWorld50_g1439.x + objToWorld50_g1439.z ) + ( ( Time76_g1439 * ( SpeedScale_RA80_g1439 * MM_DirectionShiftSpeed70_g1434 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1439).z * MM_DirectionShiftNoiseScale71_g1434 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1439 = (float3(cos( temp_output_11_0_g1439 ) , 0.0 , sin( temp_output_11_0_g1439 )));
				float3 worldToObj35_g1439 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1439, 1 ) ).xyz;
				float3 worldToObj36_g1439 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1439 = normalize( (( worldToObj35_g1439 - worldToObj36_g1439 )).xyz );
				float3 MM_RotationAxis101_g1434 = normalizeResult34_g1439;
				float4 StaticWorldNoise31_g1440 = WorldSpaceStaticNoise23_g1434;
				float MM_BendingOfset73_g1434 = _MMBendingOffset;
				float MM_Bending67_g1434 = _MMBending;
				float GVBendingScale164_g1434 = _GVBendingScale;
				float lerpResult155_g1434 = lerp( 1.0 , Nicrom_MM_BendScale_Grass , GVBendingScale164_g1434);
				float MM_BendingScale141_g1434 = lerpResult155_g1434;
				float MM_AmplitudeOffset62_g1434 = _MMAmplitudeOffset;
				float MM_Amplitude61_g1434 = _MMAmplitude;
				float GVAmplitudeScale162_g1434 = _GVAmplitudeScale;
				float lerpResult152_g1434 = lerp( 1.0 , Nicrom_MM_AmpScale_Grass , GVAmplitudeScale162_g1434);
				float MM_AmplitudeScale139_g1434 = lerpResult152_g1434;
				float3 objToWorld170_g1440 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1440 = MM_Time140_g1434;
				float MM_Speed63_g1434 = _MMSpeed;
				float Speed125_g1440 = MM_Speed63_g1434;
				float SpeedScale_RotAng201_g1440 = MM_SpeedScale206_g1434;
				float MM_SineWaveLength64_g1434 = _MMSineWaveLength;
				float WaveLength63_g1440 = MM_SineWaveLength64_g1434;
				float MM_PhaseShiftSource26_g1434 = _MMPhaseShiftSource;
				float lerpResult38_g1434 = lerp( input.ase_color.a , (WorldSpaceStaticNoise23_g1434).g , MM_PhaseShiftSource26_g1434);
				float MM_PhaseShiftScale34_g1434 = _MMPhaseShiftScale;
				float MM_PhaseShift60_g1434 = ( lerpResult38_g1434 * MM_PhaseShiftScale34_g1434 );
				float PhaseShift127_g1440 = MM_PhaseShift60_g1434;
				float temp_output_20_0_g1440 = sin( ( ( ( objToWorld170_g1440.x + objToWorld170_g1440.z ) + ( ( Time167_g1440 * ( ( Speed125_g1440 * SpeedScale_RotAng201_g1440 ) * WaveLength63_g1440 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1440 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1440 ) ) );
				float MM_ObjectHeight66_g1434 = _MMObjectHeight;
				float3 gammaToLinear56_g1440 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource65_g1434 = _MMObjectHeightSource;
				float lerpResult57_g1440 = lerp( ( input.positionOS.xyz.y / MM_ObjectHeight66_g1434 ) , (gammaToLinear56_g1440).x , MM_ObjectHeightSource65_g1434);
				float BendingMask189_g1440 = lerpResult57_g1440;
				float MM_RotationAngle102_g1434 = radians( ( ( ( ( ( (StaticWorldNoise31_g1440).y * MM_BendingOfset73_g1434 ) + MM_Bending67_g1434 ) * MM_BendingScale141_g1434 ) + ( ( ( ( (StaticWorldNoise31_g1440).x * MM_AmplitudeOffset62_g1434 ) + MM_Amplitude61_g1434 ) * MM_AmplitudeScale139_g1434 ) * temp_output_20_0_g1440 ) ) * BendingMask189_g1440 ) );
				float3 appendResult103_g1434 = (float3(input.positionOS.xyz.x , 0.0 , input.positionOS.xyz.z));
				float3 VertexPosition179_g1434 = input.positionOS.xyz;
				float3 rotatedValue108_g1434 = RotateAroundAxis( appendResult103_g1434, VertexPosition179_g1434, MM_RotationAxis101_g1434, MM_RotationAngle102_g1434 );
				float3 RotationAxis56_g1435 = MM_RotationAxis101_g1434;
				float RotationAngle54_g1435 = MM_RotationAngle102_g1434;
				float3 LocalPivotPos60_g1435 = MM_LocalPivot3_g1434;
				float3 break62_g1435 = LocalPivotPos60_g1435;
				float VertexPos_Y67_g1435 = input.positionOS.xyz.y;
				float3 appendResult45_g1435 = (float3(break62_g1435.x , VertexPos_Y67_g1435 , break62_g1435.z));
				float3 VertexPos66_g1435 = input.positionOS.xyz;
				float3 rotatedValue30_g1435 = RotateAroundAxis( appendResult45_g1435, VertexPos66_g1435, RotationAxis56_g1435, RotationAngle54_g1435 );
				float3 DetailMotionVO73_g1435 = float3( 0,0,0 );
				float3 rotatedValue34_g1435 = RotateAroundAxis( LocalPivotPos60_g1435, ( rotatedValue30_g1435 + DetailMotionVO73_g1435 ), RotationAxis56_g1435, RotationAngle54_g1435 );
				#if defined( _MMBENDINGMETHOD_SIMPLE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#elif defined( _MMBENDINGMETHOD_ACCURATE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue34_g1435 - VertexPos66_g1435 ) * step( 0.01 , VertexPos_Y67_g1435 ) );
				#else
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#endif
				float3 LocalVertexOffset89_g1442 = staticSwitch186_g1434;
				float3 appendResult15_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1442, 1 ) ).xyz;
				float3 objToWorld102_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1442 = ( objToWorld98_g1442 - objToWorld102_g1442 );
				float3 appendResult24_g1442 = (float3(-break20_g1442.z , 0.0 , break20_g1442.x));
				float3 appendResult3_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1442, 1 ) ).xyz;
				float3 objToWorld106_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1442 = ( objToWorld100_g1442 - objToWorld106_g1442 );
				float3 break108_g1442 = temp_output_107_0_g1442;
				float3 lerpResult84_g1442 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1442 , step( 0.001 , ( abs( break108_g1442.x ) + abs( break108_g1442.z ) ) ));
				float3 normalizeResult7_g1442 = ASESafeNormalize( lerpResult84_g1442 );
				float dotResult9_g1442 = dot( normalizeResult7_g1442 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1442 = acos( dotResult9_g1442 );
				float NaNPrevention21_g1442 = step( 0.01 , abs( ( temp_output_12_0_g1442 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1442 = lerp( float3( 1, 0, 0 ) , appendResult24_g1442 , NaNPrevention21_g1442);
				float3 worldToObj99_g1442 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1442, 1 ) ).xyz;
				float3 worldToObj105_g1442 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1442 = normalize( ( worldToObj99_g1442 - worldToObj105_g1442 ) );
				float3 RotationAxis30_g1442 = normalizeResult49_g1442;
				float4 WorldSpaceNoise126_g1442 = temp_output_16_0_g1434;
				float SlopeCorrectionOffset120_g1442 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1442 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1442 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1442).x - 0.0 ) * ( SlopeCorrectionOffset120_g1442 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1442 ) ) * temp_output_12_0_g1442 );
				float3 appendResult28_g1443 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 rotatedValue35_g1442 = RotateAroundAxis( -appendResult28_g1443, ( input.positionOS.xyz + LocalVertexOffset89_g1442 ), RotationAxis30_g1442, RotationAngle29_g1442 );
				float3 lerpResult52_g1442 = lerp( LocalVertexOffset89_g1442 , ( rotatedValue35_g1442 - input.positionOS.xyz ) , NaNPrevention21_g1442);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1442 = lerpResult52_g1442;
				#else
				float3 staticSwitch123_g1442 = LocalVertexOffset89_g1442;
				#endif
				float3 appendResult28_g1447 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 Scale_Pivot15_g1444 = -appendResult28_g1447;
				float3 temp_output_5_0_g1444 = ( ( staticSwitch123_g1442 + input.positionOS.xyz ) - Scale_Pivot15_g1444 );
				float ScaleVartMin40_g1444 = _ScaleVarMin;
				float ScaleVarMax41_g1444 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1444 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1444 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1446 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1444, 1 ) ).xyz;
				float2 appendResult10_g1446 = (float2(objToWorld11_g1446.x , objToWorld11_g1446.z));
				float2 Scale_WorldSpaceUVs30_g1444 = appendResult10_g1446;
				float Scale_VarNoiseTiling23_g1444 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1444 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1444 * Scale_VarNoiseTiling23_g1444 ), 0, 0.0) );
				float smoothstepResult56_g1444 = smoothstep( ScaleNoiseSharpnessMin59_g1444 , ScaleNoiseSharpnessMax60_g1444 , (Scale_WorldSpaceNoise32_g1444).r);
				float lerpResult44_g1444 = lerp( ScaleVartMin40_g1444 , ScaleVarMax41_g1444 , smoothstepResult56_g1444);
				float ScaleVar47_g1444 = lerpResult44_g1444;
				float clampResult63_g1444 = clamp( ( ScaleVar47_g1444 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1444 = ( temp_output_5_0_g1444 * clampResult63_g1444 );
				#else
				float3 staticSwitch72_g1444 = temp_output_5_0_g1444;
				#endif
				float ScaleOffset19_g1444 = _ScaleOffset;
				float clampResult64_g1444 = clamp( ( ScaleOffset19_g1444 + 1.0 ) , 0.0 , 7.0 );
				
				float2 TerrainPosition29_g1448 = ( Nicrom_TerrainPosition + float2( 1,1 ) );
				float2 TerrainPosition4_g1450 = TerrainPosition29_g1448;
				float TerrainSize28_g1448 = Nicrom_TerrainSize;
				float TerrainSize2_g1450 = TerrainSize28_g1448;
				float3 appendResult28_g1449 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 temp_output_3_33_g1448 = -appendResult28_g1449;
				float3 LocalPivot6_g1448 = temp_output_3_33_g1448;
				float3 objToWorld11_g1453 = mul( GetObjectToWorldMatrix(), float4( LocalPivot6_g1448, 1 ) ).xyz;
				float2 appendResult10_g1453 = (float2(objToWorld11_g1453.x , objToWorld11_g1453.z));
				float4 vertexToFrag19_g1450 = tex2Dlod( Nicrom_TerrainColorMap, float4( ( ( ( 1.0 - TerrainPosition4_g1450 ) / TerrainSize2_g1450 ) + ( ( TerrainSize2_g1450 / ( TerrainSize2_g1450 * TerrainSize2_g1450 ) ) * appendResult10_g1453 ) ), 0, 0.0) );
				output.ase_texcoord8 = vertexToFrag19_g1450;
				float vertexToFrag421_g1448 = input.positionOS.xyz.y;
				output.ase_texcoord7.z = vertexToFrag421_g1448;
				#ifdef _SCALEVARIATION_ON
				float staticSwitch73_g1444 = smoothstepResult56_g1444;
				#else
				float staticSwitch73_g1444 = 0.0;
				#endif
				float vertexToFrag71_g1444 = staticSwitch73_g1444;
				output.ase_texcoord7.w = vertexToFrag71_g1444;
				
				float3 customSurfaceDepth3_g1455 = input.positionOS.xyz;
				float customEye3_g1455 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1455)).z;
				output.ase_texcoord9.z = customEye3_g1455;
				
				output.ase_texcoord7.xy = input.texcoord.xy;
				output.ase_texcoord9.xy = input.texcoord1.xy;
				output.ase_color = input.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord9.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1444 * clampResult64_g1444 ) + Scale_Pivot15_g1444 ) - input.positionOS.xyz );

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

				float Debug_Target308_g1448 = _Debug;
				float2 uv_Albedo = input.ase_texcoord7.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode111_g1448 = tex2D( _Albedo, uv_Albedo );
				float4 FoliageTexture123_g1448 = tex2DNode111_g1448;
				float3 Color1A78_g1448 = _Color1A;
				float4 vertexToFrag19_g1450 = input.ase_texcoord8;
				float4 TerrainColor76_g1448 = vertexToFrag19_g1450;
				float BWT_Top44_g1448 = _BWTTop;
				float IsTerrainAlbedoAssigned36_g1448 = step( 8.0 , Nicrom_TerrainColorMap_TexelSize.z );
				float lerpResult62_g1448 = lerp( 0.0 , BWT_Top44_g1448 , IsTerrainAlbedoAssigned36_g1448);
				float BWT_MaskStart434_g1448 = _BWTMaskStart;
				float BWT_MaskEnd435_g1448 = _BWTMaskEnd;
				float vertexToFrag421_g1448 = input.ase_texcoord7.z;
				float VertexPos_Y430_g1448 = vertexToFrag421_g1448;
				float smoothstepResult273_g1448 = smoothstep( BWT_MaskStart434_g1448 , BWT_MaskEnd435_g1448 , VertexPos_Y430_g1448);
				float BWT_MaskToggle461_g1448 = _BWTMask;
				float lerpResult462_g1448 = lerp( 1.0 , ( 1.0 - smoothstepResult273_g1448 ) , BWT_MaskToggle461_g1448);
				float BWT_Mask277_g1448 = lerpResult462_g1448;
				float lerpResult278_g1448 = lerp( 0.0 , lerpResult62_g1448 , BWT_Mask277_g1448);
				float BWT_Top_F74_g1448 = lerpResult278_g1448;
				float4 lerpResult104_g1448 = lerp( float4( Color1A78_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Top_F74_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch114_g1448 = lerpResult104_g1448;
				#else
				float4 staticSwitch114_g1448 = float4( Color1A78_g1448 , 0.0 );
				#endif
				float4 Color1A_Top_BWT167_g1448 = staticSwitch114_g1448;
				float3 Color1B81_g1448 = _Color1B;
				float BWT_Bottom45_g1448 = _BWTBottom;
				float lerpResult61_g1448 = lerp( 0.0 , BWT_Bottom45_g1448 , IsTerrainAlbedoAssigned36_g1448);
				float lerpResult281_g1448 = lerp( 0.0 , lerpResult61_g1448 , BWT_Mask277_g1448);
				float BWT_Bottom_F75_g1448 = lerpResult281_g1448;
				float4 lerpResult105_g1448 = lerp( float4( Color1B81_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Bottom_F75_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch115_g1448 = lerpResult105_g1448;
				#else
				float4 staticSwitch115_g1448 = float4( Color1B81_g1448 , 0.0 );
				#endif
				float4 Color1B_Bot_BWT169_g1448 = staticSwitch115_g1448;
				float2 uv_ColorMask1 = input.ase_texcoord7.xy * _ColorMask1_ST.xy + _ColorMask1_ST.zw;
				float ColorMask1_Tex66_g1448 = ( 1.0 - tex2D( _ColorMask1, uv_ColorMask1 ).r );
				float ColorMask1_End43_g1448 = _ColorMask1End;
				float ColorMask1_Start42_g1448 = _ColorMask1Start;
				float smoothstepResult427_g1448 = smoothstep( ColorMask1_End43_g1448 , ColorMask1_Start42_g1448 , VertexPos_Y430_g1448);
				#if defined( _COLORMASK1SOURCE_TEXTURE )
				float staticSwitch377_g1448 = ColorMask1_Tex66_g1448;
				#elif defined( _COLORMASK1SOURCE_VERTEX )
				float staticSwitch377_g1448 = smoothstepResult427_g1448;
				#else
				float staticSwitch377_g1448 = ColorMask1_Tex66_g1448;
				#endif
				float ColorMask1101_g1448 = staticSwitch377_g1448;
				float4 lerpResult226_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask1101_g1448);
				float4 Colors2306_g1448 = lerpResult226_g1448;
				float3 Color2A82_g1448 = _Color2A;
				float4 lerpResult106_g1448 = lerp( float4( Color2A82_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Top_F74_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch117_g1448 = lerpResult106_g1448;
				#else
				float4 staticSwitch117_g1448 = float4( Color2A82_g1448 , 0.0 );
				#endif
				float4 Color2A_Top_BWT171_g1448 = staticSwitch117_g1448;
				float CM2_GVToggle400_g1448 = _ColorMask2GV;
				float lerpResult409_g1448 = lerp( _ColorMask2SharpnessMin , Nicrom_Grass_CM2_SharpMin , CM2_GVToggle400_g1448);
				float ColorMask2_SharpMin88_g1448 = lerpResult409_g1448;
				float lerpResult412_g1448 = lerp( _ColorMask2SharpnessMax , Nicrom_Grass_CM2_SharpMax , CM2_GVToggle400_g1448);
				float ColorMask2_SharpMax87_g1448 = lerpResult412_g1448;
				float3 appendResult28_g1449 = (float3(input.ase_texcoord9.xy.x , 0.0 , input.ase_texcoord9.xy.y));
				float3 temp_output_3_33_g1448 = -appendResult28_g1449;
				float3 objToWorld11_g1451 = mul( GetObjectToWorldMatrix(), float4( temp_output_3_33_g1448, 1 ) ).xyz;
				float2 appendResult10_g1451 = (float2(objToWorld11_g1451.x , objToWorld11_g1451.z));
				float2 ColorMask2_WSUVs23_g1448 = appendResult10_g1451;
				float lerpResult402_g1448 = lerp( _ColorMask2Tiling , Nicrom_Grass_CM2_Tilling , CM2_GVToggle400_g1448);
				float ColorMask2_Tiling24_g1448 = lerpResult402_g1448;
				float2 CM2_UVOffset_GV159_g1448 = Nicrom_Grass_CM2_UVOffset;
				float lerpResult406_g1448 = lerp( _ColorMask2Speed , Nicrom_Grass_CM2_Speed , CM2_GVToggle400_g1448);
				float ColorMask2_Speed151_g1448 = lerpResult406_g1448;
				float ColorMask2_Noise85_g1448 = (tex2D( _ColorMask2, ( ( ColorMask2_WSUVs23_g1448 * ColorMask2_Tiling24_g1448 ) + ( CM2_UVOffset_GV159_g1448 * ColorMask2_Speed151_g1448 * 0.1 ) ) )).r;
				float smoothstepResult120_g1448 = smoothstep( ColorMask2_SharpMin88_g1448 , ColorMask2_SharpMax87_g1448 , ColorMask2_Noise85_g1448);
				float ColorMask2_Opacity415_g1448 = _ColorMask2Opacity;
				float ColorMask2_F196_g1448 = ( smoothstepResult120_g1448 * ColorMask2_Opacity415_g1448 );
				float4 lerpResult341_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color2A_Top_BWT171_g1448 , ColorMask2_F196_g1448);
				float4 lerpResult344_g1448 = lerp( lerpResult341_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask1101_g1448);
				float4 Colors3_BMA348_g1448 = lerpResult344_g1448;
				float ColorMask3_Start438_g1448 = _ColorMask3Start;
				float ColorMask3_End439_g1448 = _ColorMask3End;
				float smoothstepResult442_g1448 = smoothstep( ColorMask3_Start438_g1448 , ColorMask3_End439_g1448 , VertexPos_Y430_g1448);
				#if defined( _COLORBLENDINGMODE_A )
				float staticSwitch449_g1448 = 0.0;
				#elif defined( _COLORBLENDINGMODE_B )
				float staticSwitch449_g1448 = ( 1.0 - smoothstepResult442_g1448 );
				#else
				float staticSwitch449_g1448 = 0.0;
				#endif
				float ColorMask3446_g1448 = staticSwitch449_g1448;
				float4 lerpResult352_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask3446_g1448);
				float4 lerpResult353_g1448 = lerp( lerpResult352_g1448 , float4( Color2A82_g1448 , 0.0 ) , ( 1.0 - ColorMask1_Tex66_g1448 ));
				float4 Colors3_BMB357_g1448 = lerpResult353_g1448;
				#if defined( _COLORBLENDINGMODE_A )
				float4 staticSwitch366_g1448 = Colors3_BMA348_g1448;
				#elif defined( _COLORBLENDINGMODE_B )
				float4 staticSwitch366_g1448 = Colors3_BMB357_g1448;
				#else
				float4 staticSwitch366_g1448 = Colors3_BMA348_g1448;
				#endif
				float4 Colors3362_g1448 = staticSwitch366_g1448;
				float3 Color2B83_g1448 = _Color2B;
				float4 lerpResult269_g1448 = lerp( float4( Color2B83_g1448 , 0.0 ) , TerrainColor76_g1448 , BWT_Bottom_F75_g1448);
				#ifdef _BLENDWITHTERRAIN_ON
				float4 staticSwitch270_g1448 = lerpResult269_g1448;
				#else
				float4 staticSwitch270_g1448 = float4( Color2B83_g1448 , 0.0 );
				#endif
				float4 Color2B_Bot_BWT271_g1448 = staticSwitch270_g1448;
				float4 lerpResult227_g1448 = lerp( Color2A_Top_BWT171_g1448 , Color2B_Bot_BWT271_g1448 , ColorMask1101_g1448);
				float4 lerpResult225_g1448 = lerp( Colors2306_g1448 , lerpResult227_g1448 , ColorMask2_F196_g1448);
				float4 Colors4_BMA256_g1448 = lerpResult225_g1448;
				float4 lerpResult242_g1448 = lerp( Color1A_Top_BWT167_g1448 , Color1B_Bot_BWT169_g1448 , ColorMask3446_g1448);
				float3 lerpResult249_g1448 = lerp( Color2A82_g1448 , Color2B83_g1448 , ColorMask2_F196_g1448);
				float4 lerpResult246_g1448 = lerp( lerpResult242_g1448 , float4( lerpResult249_g1448 , 0.0 ) , ( 1.0 - ColorMask1_Tex66_g1448 ));
				float4 Colors4_BMB257_g1448 = lerpResult246_g1448;
				#if defined( _COLORBLENDINGMODE_A )
				float4 staticSwitch373_g1448 = Colors4_BMA256_g1448;
				#elif defined( _COLORBLENDINGMODE_B )
				float4 staticSwitch373_g1448 = Colors4_BMB257_g1448;
				#else
				float4 staticSwitch373_g1448 = Colors4_BMA256_g1448;
				#endif
				float4 Colors4363_g1448 = staticSwitch373_g1448;
				#if defined( _COLORS_TWO )
				float4 staticSwitch303_g1448 = Colors2306_g1448;
				#elif defined( _COLORS_THREE )
				float4 staticSwitch303_g1448 = Colors3362_g1448;
				#elif defined( _COLORS_FOUR )
				float4 staticSwitch303_g1448 = Colors4363_g1448;
				#else
				float4 staticSwitch303_g1448 = Colors3362_g1448;
				#endif
				float4 Albedo453_g1448 = ( FoliageTexture123_g1448 * staticSwitch303_g1448 );
				float4 Albedo308_g1448 = Albedo453_g1448;
				#if defined( _COLORBLENDINGMODE_A )
				float staticSwitch456_g1448 = ( 1.0 - ColorMask1101_g1448 );
				#elif defined( _COLORBLENDINGMODE_B )
				float staticSwitch456_g1448 = ( 1.0 - ColorMask1_Tex66_g1448 );
				#else
				float staticSwitch456_g1448 = ( 1.0 - ColorMask1101_g1448 );
				#endif
				float ColorMask1308_g1448 = staticSwitch456_g1448;
				#if defined( _COLORS_TWO )
				float staticSwitch381_g1448 = 0.0;
				#elif defined( _COLORS_THREE )
				float staticSwitch381_g1448 = ColorMask2_F196_g1448;
				#elif defined( _COLORS_FOUR )
				float staticSwitch381_g1448 = ColorMask2_F196_g1448;
				#else
				float staticSwitch381_g1448 = ColorMask2_F196_g1448;
				#endif
				float ColorMask2308_g1448 = staticSwitch381_g1448;
				#if defined( _COLORS_TWO )
				float staticSwitch452_g1448 = 0.0;
				#elif defined( _COLORS_THREE )
				float staticSwitch452_g1448 = ColorMask3446_g1448;
				#elif defined( _COLORS_FOUR )
				float staticSwitch452_g1448 = ColorMask3446_g1448;
				#else
				float staticSwitch452_g1448 = ColorMask3446_g1448;
				#endif
				float ColorMask3308_g1448 = staticSwitch452_g1448;
				float3 objToWorld170_g1440 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GVTime160_g1434 = _GVTime;
				float lerpResult146_g1434 = lerp( _TimeParameters.x , Nicrom_MM_Time_Grass , GVTime160_g1434);
				float ApplicationIsPlaying227_g1434 = Nicrom_ApplicationIsPlaying;
				float lerpResult221_g1434 = lerp( _TimeParameters.x , lerpResult146_g1434 , ApplicationIsPlaying227_g1434);
				float MM_Time140_g1434 = lerpResult221_g1434;
				float Time167_g1440 = MM_Time140_g1434;
				float MM_Speed63_g1434 = _MMSpeed;
				float Speed125_g1440 = MM_Speed63_g1434;
				float temp_output_205_0_g1434 = Nicrom_MM_SpeedScale_Grass;
				float lerpResult208_g1434 = lerp( temp_output_205_0_g1434 , 1.0 , GVTime160_g1434);
				float lerpResult210_g1434 = lerp( temp_output_205_0_g1434 , lerpResult208_g1434 , ApplicationIsPlaying227_g1434);
				float MM_SpeedScale206_g1434 = lerpResult210_g1434;
				float SpeedScale_RotAng201_g1440 = MM_SpeedScale206_g1434;
				float MM_SineWaveLength64_g1434 = _MMSineWaveLength;
				float WaveLength63_g1440 = MM_SineWaveLength64_g1434;
				float3 appendResult28_g1441 = (float3(input.ase_texcoord9.xy.x , 0.0 , input.ase_texcoord9.xy.y));
				float3 MM_LocalPivot3_g1434 = -appendResult28_g1441;
				float3 objToWorld11_g1438 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float2 appendResult10_g1438 = (float2(objToWorld11_g1438.x , objToWorld11_g1438.z));
				float2 WorldSpaceUVs9_g1434 = appendResult10_g1438;
				float StaticNoiseTiling11_g1434 = _StaticNoiseTiling;
				float4 temp_output_16_0_g1434 = tex2D( _MotionNoise, ( WorldSpaceUVs9_g1434 * StaticNoiseTiling11_g1434 ) );
				float4 WorldSpaceStaticNoise23_g1434 = temp_output_16_0_g1434;
				float MM_PhaseShiftSource26_g1434 = _MMPhaseShiftSource;
				float lerpResult38_g1434 = lerp( input.ase_color.a , (WorldSpaceStaticNoise23_g1434).g , MM_PhaseShiftSource26_g1434);
				float MM_PhaseShiftScale34_g1434 = _MMPhaseShiftScale;
				float MM_PhaseShift60_g1434 = ( lerpResult38_g1434 * MM_PhaseShiftScale34_g1434 );
				float PhaseShift127_g1440 = MM_PhaseShift60_g1434;
				float temp_output_20_0_g1440 = sin( ( ( ( objToWorld170_g1440.x + objToWorld170_g1440.z ) + ( ( Time167_g1440 * ( ( Speed125_g1440 * SpeedScale_RotAng201_g1440 ) * WaveLength63_g1440 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1440 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1440 ) ) );
				float MotionSineWave5 =  (0.0 + ( temp_output_20_0_g1440 - -1.0 ) * ( 1.0 - 0.0 ) / ( 1.0 - -1.0 ) );
				float MotionWave308_g1448 = MotionSineWave5;
				float vertexToFrag71_g1444 = input.ase_texcoord7.w;
				float ScaleVarNoise6 = vertexToFrag71_g1444;
				float ScaleVarNoise308_g1448 = ScaleVarNoise6;
				float4 localDebug308_g1448 = Debug308_g1448( Debug_Target308_g1448 , Albedo308_g1448 , ColorMask1308_g1448 , ColorMask2308_g1448 , ColorMask3308_g1448 , MotionWave308_g1448 , ScaleVarNoise308_g1448 );
				
				float temp_output_31_0_g1455 = tex2DNode111_g1448.a;
				float DF_Length_Local38_g1455 = _DistanceFadeLength;
				float DF_Length_Global45_g1455 = Nicrom_Grass_DF_Length;
				float DF_Start_Global43_g1455 = Nicrom_Grass_DF_Start;
				float lerpResult49_g1455 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1455 ));
				float DF_UseGV28_g1455 = lerpResult49_g1455;
				float lerpResult26_g1455 = lerp( DF_Length_Local38_g1455 , DF_Length_Global45_g1455 , DF_UseGV28_g1455);
				float DistanceFadeLength23_g1455 = lerpResult26_g1455;
				float DF_Start_Local36_g1455 = _DistanceFadeStart;
				float lerpResult20_g1455 = lerp( DF_Start_Local36_g1455 , DF_Start_Global43_g1455 , DF_UseGV28_g1455);
				float DistanceFadeStart27_g1455 = lerpResult20_g1455;
				float customEye3_g1455 = input.ase_texcoord9.z;
				float cameraDepthFade3_g1455 = (( customEye3_g1455 -_ProjectionParams.y - DistanceFadeStart27_g1455 ) / DistanceFadeLength23_g1455);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1455 = ( temp_output_31_0_g1455 * saturate( ( 1.0 - cameraDepthFade3_g1455 ) ) );
				#else
				float staticSwitch33_g1455 = temp_output_31_0_g1455;
				#endif
				

				float3 BaseColor = localDebug308_g1448.xyz;
				float3 Normal = float3(0, 0, 1);
				float3 Specular = 0.5;
				float Metallic = _Metallic;
				float Smoothness = _Smoothness;
				float Occlusion = 1;
				float3 Emission = 0;
				float Alpha = staticSwitch33_g1455;
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
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#pragma shader_feature_local_fragment _BLENDWITHTERRAIN_ON
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local _MMBENDINGMETHOD_SIMPLE _MMBENDINGMETHOD_ACCURATE
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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
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
			float4 _Albedo_ST;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color1B;
			float3 _Color2A;
			half _MMDirectionAngle;
			float _BWTTop;
			float _BWTMaskStart;
			float _BWTMaskEnd;
			float _BWTMask;
			float _BWTBottom;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask2SharpnessMin;
			float _ColorMask2SharpnessMax;
			float _ColorMask2Tiling;
			float _ColorMask2Speed;
			float _ColorMask2Opacity;
			float _ColorMask3Start;
			float _ColorMask3End;
			float _Metallic;
			float _Smoothness;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _Debug;
			float _ScaleVarNoiseTiling;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _StaticNoiseTiling;
			float _GVTime;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVBendingScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionOffset;
			float _SlopeCorrectionMagnitude;
			float _ScaleVarMin;
			float _ScaleVarMax;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleOffset;
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

			float Nicrom_Grass_DF_Start;
			float Nicrom_Grass_DF_Length;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Grass;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_Grass;
			float Nicrom_MM_BendScale_Grass;
			float Nicrom_MM_AmpScale_Grass;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;


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

				float lerpResult56_g1436 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle35_g1434 = lerpResult56_g1436;
				float MM_DirectionShift68_g1434 = _MMDirectionShift;
				float MM_DirectionShiftOffset69_g1434 = _MMDirectionShiftOffset;
				float3 appendResult28_g1441 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 MM_LocalPivot3_g1434 = -appendResult28_g1441;
				float3 objToWorld11_g1438 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float2 appendResult10_g1438 = (float2(objToWorld11_g1438.x , objToWorld11_g1438.z));
				float2 WorldSpaceUVs9_g1434 = appendResult10_g1438;
				float StaticNoiseTiling11_g1434 = _StaticNoiseTiling;
				float4 temp_output_16_0_g1434 = tex2Dlod( _MotionNoise, float4( ( WorldSpaceUVs9_g1434 * StaticNoiseTiling11_g1434 ), 0, 0.0) );
				float4 WorldSpaceStaticNoise23_g1434 = temp_output_16_0_g1434;
				float4 StaticWorldNoise55_g1439 = WorldSpaceStaticNoise23_g1434;
				float3 objToWorld50_g1439 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float GVTime160_g1434 = _GVTime;
				float lerpResult146_g1434 = lerp( _TimeParameters.x , Nicrom_MM_Time_Grass , GVTime160_g1434);
				float ApplicationIsPlaying227_g1434 = Nicrom_ApplicationIsPlaying;
				float lerpResult221_g1434 = lerp( _TimeParameters.x , lerpResult146_g1434 , ApplicationIsPlaying227_g1434);
				float MM_Time140_g1434 = lerpResult221_g1434;
				float Time76_g1439 = MM_Time140_g1434;
				float temp_output_205_0_g1434 = Nicrom_MM_SpeedScale_Grass;
				float lerpResult208_g1434 = lerp( temp_output_205_0_g1434 , 1.0 , GVTime160_g1434);
				float lerpResult210_g1434 = lerp( temp_output_205_0_g1434 , lerpResult208_g1434 , ApplicationIsPlaying227_g1434);
				float MM_SpeedScale206_g1434 = lerpResult210_g1434;
				float SpeedScale_RA80_g1439 = MM_SpeedScale206_g1434;
				float MM_DirectionShiftSpeed70_g1434 = _MMDirectionShiftSpeed;
				float MM_DirectionShiftNoiseScale71_g1434 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1439 = radians( ( ( MM_DirectionAngle35_g1434 + ( ( MM_DirectionShift68_g1434 + ( MM_DirectionShiftOffset69_g1434 * (StaticWorldNoise55_g1439).x ) ) * sin( ( ( objToWorld50_g1439.x + objToWorld50_g1439.z ) + ( ( Time76_g1439 * ( SpeedScale_RA80_g1439 * MM_DirectionShiftSpeed70_g1434 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1439).z * MM_DirectionShiftNoiseScale71_g1434 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1439 = (float3(cos( temp_output_11_0_g1439 ) , 0.0 , sin( temp_output_11_0_g1439 )));
				float3 worldToObj35_g1439 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1439, 1 ) ).xyz;
				float3 worldToObj36_g1439 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1439 = normalize( (( worldToObj35_g1439 - worldToObj36_g1439 )).xyz );
				float3 MM_RotationAxis101_g1434 = normalizeResult34_g1439;
				float4 StaticWorldNoise31_g1440 = WorldSpaceStaticNoise23_g1434;
				float MM_BendingOfset73_g1434 = _MMBendingOffset;
				float MM_Bending67_g1434 = _MMBending;
				float GVBendingScale164_g1434 = _GVBendingScale;
				float lerpResult155_g1434 = lerp( 1.0 , Nicrom_MM_BendScale_Grass , GVBendingScale164_g1434);
				float MM_BendingScale141_g1434 = lerpResult155_g1434;
				float MM_AmplitudeOffset62_g1434 = _MMAmplitudeOffset;
				float MM_Amplitude61_g1434 = _MMAmplitude;
				float GVAmplitudeScale162_g1434 = _GVAmplitudeScale;
				float lerpResult152_g1434 = lerp( 1.0 , Nicrom_MM_AmpScale_Grass , GVAmplitudeScale162_g1434);
				float MM_AmplitudeScale139_g1434 = lerpResult152_g1434;
				float3 objToWorld170_g1440 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1440 = MM_Time140_g1434;
				float MM_Speed63_g1434 = _MMSpeed;
				float Speed125_g1440 = MM_Speed63_g1434;
				float SpeedScale_RotAng201_g1440 = MM_SpeedScale206_g1434;
				float MM_SineWaveLength64_g1434 = _MMSineWaveLength;
				float WaveLength63_g1440 = MM_SineWaveLength64_g1434;
				float MM_PhaseShiftSource26_g1434 = _MMPhaseShiftSource;
				float lerpResult38_g1434 = lerp( input.ase_color.a , (WorldSpaceStaticNoise23_g1434).g , MM_PhaseShiftSource26_g1434);
				float MM_PhaseShiftScale34_g1434 = _MMPhaseShiftScale;
				float MM_PhaseShift60_g1434 = ( lerpResult38_g1434 * MM_PhaseShiftScale34_g1434 );
				float PhaseShift127_g1440 = MM_PhaseShift60_g1434;
				float temp_output_20_0_g1440 = sin( ( ( ( objToWorld170_g1440.x + objToWorld170_g1440.z ) + ( ( Time167_g1440 * ( ( Speed125_g1440 * SpeedScale_RotAng201_g1440 ) * WaveLength63_g1440 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1440 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1440 ) ) );
				float MM_ObjectHeight66_g1434 = _MMObjectHeight;
				float3 gammaToLinear56_g1440 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource65_g1434 = _MMObjectHeightSource;
				float lerpResult57_g1440 = lerp( ( input.positionOS.xyz.y / MM_ObjectHeight66_g1434 ) , (gammaToLinear56_g1440).x , MM_ObjectHeightSource65_g1434);
				float BendingMask189_g1440 = lerpResult57_g1440;
				float MM_RotationAngle102_g1434 = radians( ( ( ( ( ( (StaticWorldNoise31_g1440).y * MM_BendingOfset73_g1434 ) + MM_Bending67_g1434 ) * MM_BendingScale141_g1434 ) + ( ( ( ( (StaticWorldNoise31_g1440).x * MM_AmplitudeOffset62_g1434 ) + MM_Amplitude61_g1434 ) * MM_AmplitudeScale139_g1434 ) * temp_output_20_0_g1440 ) ) * BendingMask189_g1440 ) );
				float3 appendResult103_g1434 = (float3(input.positionOS.xyz.x , 0.0 , input.positionOS.xyz.z));
				float3 VertexPosition179_g1434 = input.positionOS.xyz;
				float3 rotatedValue108_g1434 = RotateAroundAxis( appendResult103_g1434, VertexPosition179_g1434, MM_RotationAxis101_g1434, MM_RotationAngle102_g1434 );
				float3 RotationAxis56_g1435 = MM_RotationAxis101_g1434;
				float RotationAngle54_g1435 = MM_RotationAngle102_g1434;
				float3 LocalPivotPos60_g1435 = MM_LocalPivot3_g1434;
				float3 break62_g1435 = LocalPivotPos60_g1435;
				float VertexPos_Y67_g1435 = input.positionOS.xyz.y;
				float3 appendResult45_g1435 = (float3(break62_g1435.x , VertexPos_Y67_g1435 , break62_g1435.z));
				float3 VertexPos66_g1435 = input.positionOS.xyz;
				float3 rotatedValue30_g1435 = RotateAroundAxis( appendResult45_g1435, VertexPos66_g1435, RotationAxis56_g1435, RotationAngle54_g1435 );
				float3 DetailMotionVO73_g1435 = float3( 0,0,0 );
				float3 rotatedValue34_g1435 = RotateAroundAxis( LocalPivotPos60_g1435, ( rotatedValue30_g1435 + DetailMotionVO73_g1435 ), RotationAxis56_g1435, RotationAngle54_g1435 );
				#if defined( _MMBENDINGMETHOD_SIMPLE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#elif defined( _MMBENDINGMETHOD_ACCURATE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue34_g1435 - VertexPos66_g1435 ) * step( 0.01 , VertexPos_Y67_g1435 ) );
				#else
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#endif
				float3 LocalVertexOffset89_g1442 = staticSwitch186_g1434;
				float3 appendResult15_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1442, 1 ) ).xyz;
				float3 objToWorld102_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1442 = ( objToWorld98_g1442 - objToWorld102_g1442 );
				float3 appendResult24_g1442 = (float3(-break20_g1442.z , 0.0 , break20_g1442.x));
				float3 appendResult3_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1442, 1 ) ).xyz;
				float3 objToWorld106_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1442 = ( objToWorld100_g1442 - objToWorld106_g1442 );
				float3 break108_g1442 = temp_output_107_0_g1442;
				float3 lerpResult84_g1442 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1442 , step( 0.001 , ( abs( break108_g1442.x ) + abs( break108_g1442.z ) ) ));
				float3 normalizeResult7_g1442 = ASESafeNormalize( lerpResult84_g1442 );
				float dotResult9_g1442 = dot( normalizeResult7_g1442 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1442 = acos( dotResult9_g1442 );
				float NaNPrevention21_g1442 = step( 0.01 , abs( ( temp_output_12_0_g1442 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1442 = lerp( float3( 1, 0, 0 ) , appendResult24_g1442 , NaNPrevention21_g1442);
				float3 worldToObj99_g1442 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1442, 1 ) ).xyz;
				float3 worldToObj105_g1442 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1442 = normalize( ( worldToObj99_g1442 - worldToObj105_g1442 ) );
				float3 RotationAxis30_g1442 = normalizeResult49_g1442;
				float4 WorldSpaceNoise126_g1442 = temp_output_16_0_g1434;
				float SlopeCorrectionOffset120_g1442 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1442 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1442 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1442).x - 0.0 ) * ( SlopeCorrectionOffset120_g1442 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1442 ) ) * temp_output_12_0_g1442 );
				float3 appendResult28_g1443 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 rotatedValue35_g1442 = RotateAroundAxis( -appendResult28_g1443, ( input.positionOS.xyz + LocalVertexOffset89_g1442 ), RotationAxis30_g1442, RotationAngle29_g1442 );
				float3 lerpResult52_g1442 = lerp( LocalVertexOffset89_g1442 , ( rotatedValue35_g1442 - input.positionOS.xyz ) , NaNPrevention21_g1442);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1442 = lerpResult52_g1442;
				#else
				float3 staticSwitch123_g1442 = LocalVertexOffset89_g1442;
				#endif
				float3 appendResult28_g1447 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g1444 = -appendResult28_g1447;
				float3 temp_output_5_0_g1444 = ( ( staticSwitch123_g1442 + input.positionOS.xyz ) - Scale_Pivot15_g1444 );
				float ScaleVartMin40_g1444 = _ScaleVarMin;
				float ScaleVarMax41_g1444 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1444 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1444 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1446 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1444, 1 ) ).xyz;
				float2 appendResult10_g1446 = (float2(objToWorld11_g1446.x , objToWorld11_g1446.z));
				float2 Scale_WorldSpaceUVs30_g1444 = appendResult10_g1446;
				float Scale_VarNoiseTiling23_g1444 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1444 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1444 * Scale_VarNoiseTiling23_g1444 ), 0, 0.0) );
				float smoothstepResult56_g1444 = smoothstep( ScaleNoiseSharpnessMin59_g1444 , ScaleNoiseSharpnessMax60_g1444 , (Scale_WorldSpaceNoise32_g1444).r);
				float lerpResult44_g1444 = lerp( ScaleVartMin40_g1444 , ScaleVarMax41_g1444 , smoothstepResult56_g1444);
				float ScaleVar47_g1444 = lerpResult44_g1444;
				float clampResult63_g1444 = clamp( ( ScaleVar47_g1444 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1444 = ( temp_output_5_0_g1444 * clampResult63_g1444 );
				#else
				float3 staticSwitch72_g1444 = temp_output_5_0_g1444;
				#endif
				float ScaleOffset19_g1444 = _ScaleOffset;
				float clampResult64_g1444 = clamp( ( ScaleOffset19_g1444 + 1.0 ) , 0.0 , 7.0 );
				
				float3 customSurfaceDepth3_g1455 = input.positionOS.xyz;
				float customEye3_g1455 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1455)).z;
				output.ase_texcoord1.z = customEye3_g1455;
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1444 * clampResult64_g1444 ) + Scale_Pivot15_g1444 ) - input.positionOS.xyz );

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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

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
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
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
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
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

				float2 uv_Albedo = input.ase_texcoord1.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode111_g1448 = tex2D( _Albedo, uv_Albedo );
				float temp_output_31_0_g1455 = tex2DNode111_g1448.a;
				float DF_Length_Local38_g1455 = _DistanceFadeLength;
				float DF_Length_Global45_g1455 = Nicrom_Grass_DF_Length;
				float DF_Start_Global43_g1455 = Nicrom_Grass_DF_Start;
				float lerpResult49_g1455 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1455 ));
				float DF_UseGV28_g1455 = lerpResult49_g1455;
				float lerpResult26_g1455 = lerp( DF_Length_Local38_g1455 , DF_Length_Global45_g1455 , DF_UseGV28_g1455);
				float DistanceFadeLength23_g1455 = lerpResult26_g1455;
				float DF_Start_Local36_g1455 = _DistanceFadeStart;
				float lerpResult20_g1455 = lerp( DF_Start_Local36_g1455 , DF_Start_Global43_g1455 , DF_UseGV28_g1455);
				float DistanceFadeStart27_g1455 = lerpResult20_g1455;
				float customEye3_g1455 = input.ase_texcoord1.z;
				float cameraDepthFade3_g1455 = (( customEye3_g1455 -_ProjectionParams.y - DistanceFadeStart27_g1455 ) / DistanceFadeLength23_g1455);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1455 = ( temp_output_31_0_g1455 * saturate( ( 1.0 - cameraDepthFade3_g1455 ) ) );
				#else
				float staticSwitch33_g1455 = temp_output_31_0_g1455;
				#endif
				

				surfaceDescription.Alpha = staticSwitch33_g1455;
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
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#pragma shader_feature_local_fragment _BLENDWITHTERRAIN_ON
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local _MMBENDINGMETHOD_SIMPLE _MMBENDINGMETHOD_ACCURATE
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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
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
			float4 _Albedo_ST;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color1B;
			float3 _Color2A;
			half _MMDirectionAngle;
			float _BWTTop;
			float _BWTMaskStart;
			float _BWTMaskEnd;
			float _BWTMask;
			float _BWTBottom;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask2SharpnessMin;
			float _ColorMask2SharpnessMax;
			float _ColorMask2Tiling;
			float _ColorMask2Speed;
			float _ColorMask2Opacity;
			float _ColorMask3Start;
			float _ColorMask3End;
			float _Metallic;
			float _Smoothness;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _Debug;
			float _ScaleVarNoiseTiling;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _StaticNoiseTiling;
			float _GVTime;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVBendingScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionOffset;
			float _SlopeCorrectionMagnitude;
			float _ScaleVarMin;
			float _ScaleVarMax;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleOffset;
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

			float Nicrom_Grass_DF_Start;
			float Nicrom_Grass_DF_Length;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Grass;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_Grass;
			float Nicrom_MM_BendScale_Grass;
			float Nicrom_MM_AmpScale_Grass;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;


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

				float lerpResult56_g1436 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle35_g1434 = lerpResult56_g1436;
				float MM_DirectionShift68_g1434 = _MMDirectionShift;
				float MM_DirectionShiftOffset69_g1434 = _MMDirectionShiftOffset;
				float3 appendResult28_g1441 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 MM_LocalPivot3_g1434 = -appendResult28_g1441;
				float3 objToWorld11_g1438 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float2 appendResult10_g1438 = (float2(objToWorld11_g1438.x , objToWorld11_g1438.z));
				float2 WorldSpaceUVs9_g1434 = appendResult10_g1438;
				float StaticNoiseTiling11_g1434 = _StaticNoiseTiling;
				float4 temp_output_16_0_g1434 = tex2Dlod( _MotionNoise, float4( ( WorldSpaceUVs9_g1434 * StaticNoiseTiling11_g1434 ), 0, 0.0) );
				float4 WorldSpaceStaticNoise23_g1434 = temp_output_16_0_g1434;
				float4 StaticWorldNoise55_g1439 = WorldSpaceStaticNoise23_g1434;
				float3 objToWorld50_g1439 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float GVTime160_g1434 = _GVTime;
				float lerpResult146_g1434 = lerp( _TimeParameters.x , Nicrom_MM_Time_Grass , GVTime160_g1434);
				float ApplicationIsPlaying227_g1434 = Nicrom_ApplicationIsPlaying;
				float lerpResult221_g1434 = lerp( _TimeParameters.x , lerpResult146_g1434 , ApplicationIsPlaying227_g1434);
				float MM_Time140_g1434 = lerpResult221_g1434;
				float Time76_g1439 = MM_Time140_g1434;
				float temp_output_205_0_g1434 = Nicrom_MM_SpeedScale_Grass;
				float lerpResult208_g1434 = lerp( temp_output_205_0_g1434 , 1.0 , GVTime160_g1434);
				float lerpResult210_g1434 = lerp( temp_output_205_0_g1434 , lerpResult208_g1434 , ApplicationIsPlaying227_g1434);
				float MM_SpeedScale206_g1434 = lerpResult210_g1434;
				float SpeedScale_RA80_g1439 = MM_SpeedScale206_g1434;
				float MM_DirectionShiftSpeed70_g1434 = _MMDirectionShiftSpeed;
				float MM_DirectionShiftNoiseScale71_g1434 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1439 = radians( ( ( MM_DirectionAngle35_g1434 + ( ( MM_DirectionShift68_g1434 + ( MM_DirectionShiftOffset69_g1434 * (StaticWorldNoise55_g1439).x ) ) * sin( ( ( objToWorld50_g1439.x + objToWorld50_g1439.z ) + ( ( Time76_g1439 * ( SpeedScale_RA80_g1439 * MM_DirectionShiftSpeed70_g1434 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1439).z * MM_DirectionShiftNoiseScale71_g1434 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1439 = (float3(cos( temp_output_11_0_g1439 ) , 0.0 , sin( temp_output_11_0_g1439 )));
				float3 worldToObj35_g1439 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1439, 1 ) ).xyz;
				float3 worldToObj36_g1439 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1439 = normalize( (( worldToObj35_g1439 - worldToObj36_g1439 )).xyz );
				float3 MM_RotationAxis101_g1434 = normalizeResult34_g1439;
				float4 StaticWorldNoise31_g1440 = WorldSpaceStaticNoise23_g1434;
				float MM_BendingOfset73_g1434 = _MMBendingOffset;
				float MM_Bending67_g1434 = _MMBending;
				float GVBendingScale164_g1434 = _GVBendingScale;
				float lerpResult155_g1434 = lerp( 1.0 , Nicrom_MM_BendScale_Grass , GVBendingScale164_g1434);
				float MM_BendingScale141_g1434 = lerpResult155_g1434;
				float MM_AmplitudeOffset62_g1434 = _MMAmplitudeOffset;
				float MM_Amplitude61_g1434 = _MMAmplitude;
				float GVAmplitudeScale162_g1434 = _GVAmplitudeScale;
				float lerpResult152_g1434 = lerp( 1.0 , Nicrom_MM_AmpScale_Grass , GVAmplitudeScale162_g1434);
				float MM_AmplitudeScale139_g1434 = lerpResult152_g1434;
				float3 objToWorld170_g1440 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1440 = MM_Time140_g1434;
				float MM_Speed63_g1434 = _MMSpeed;
				float Speed125_g1440 = MM_Speed63_g1434;
				float SpeedScale_RotAng201_g1440 = MM_SpeedScale206_g1434;
				float MM_SineWaveLength64_g1434 = _MMSineWaveLength;
				float WaveLength63_g1440 = MM_SineWaveLength64_g1434;
				float MM_PhaseShiftSource26_g1434 = _MMPhaseShiftSource;
				float lerpResult38_g1434 = lerp( input.ase_color.a , (WorldSpaceStaticNoise23_g1434).g , MM_PhaseShiftSource26_g1434);
				float MM_PhaseShiftScale34_g1434 = _MMPhaseShiftScale;
				float MM_PhaseShift60_g1434 = ( lerpResult38_g1434 * MM_PhaseShiftScale34_g1434 );
				float PhaseShift127_g1440 = MM_PhaseShift60_g1434;
				float temp_output_20_0_g1440 = sin( ( ( ( objToWorld170_g1440.x + objToWorld170_g1440.z ) + ( ( Time167_g1440 * ( ( Speed125_g1440 * SpeedScale_RotAng201_g1440 ) * WaveLength63_g1440 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1440 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1440 ) ) );
				float MM_ObjectHeight66_g1434 = _MMObjectHeight;
				float3 gammaToLinear56_g1440 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource65_g1434 = _MMObjectHeightSource;
				float lerpResult57_g1440 = lerp( ( input.positionOS.xyz.y / MM_ObjectHeight66_g1434 ) , (gammaToLinear56_g1440).x , MM_ObjectHeightSource65_g1434);
				float BendingMask189_g1440 = lerpResult57_g1440;
				float MM_RotationAngle102_g1434 = radians( ( ( ( ( ( (StaticWorldNoise31_g1440).y * MM_BendingOfset73_g1434 ) + MM_Bending67_g1434 ) * MM_BendingScale141_g1434 ) + ( ( ( ( (StaticWorldNoise31_g1440).x * MM_AmplitudeOffset62_g1434 ) + MM_Amplitude61_g1434 ) * MM_AmplitudeScale139_g1434 ) * temp_output_20_0_g1440 ) ) * BendingMask189_g1440 ) );
				float3 appendResult103_g1434 = (float3(input.positionOS.xyz.x , 0.0 , input.positionOS.xyz.z));
				float3 VertexPosition179_g1434 = input.positionOS.xyz;
				float3 rotatedValue108_g1434 = RotateAroundAxis( appendResult103_g1434, VertexPosition179_g1434, MM_RotationAxis101_g1434, MM_RotationAngle102_g1434 );
				float3 RotationAxis56_g1435 = MM_RotationAxis101_g1434;
				float RotationAngle54_g1435 = MM_RotationAngle102_g1434;
				float3 LocalPivotPos60_g1435 = MM_LocalPivot3_g1434;
				float3 break62_g1435 = LocalPivotPos60_g1435;
				float VertexPos_Y67_g1435 = input.positionOS.xyz.y;
				float3 appendResult45_g1435 = (float3(break62_g1435.x , VertexPos_Y67_g1435 , break62_g1435.z));
				float3 VertexPos66_g1435 = input.positionOS.xyz;
				float3 rotatedValue30_g1435 = RotateAroundAxis( appendResult45_g1435, VertexPos66_g1435, RotationAxis56_g1435, RotationAngle54_g1435 );
				float3 DetailMotionVO73_g1435 = float3( 0,0,0 );
				float3 rotatedValue34_g1435 = RotateAroundAxis( LocalPivotPos60_g1435, ( rotatedValue30_g1435 + DetailMotionVO73_g1435 ), RotationAxis56_g1435, RotationAngle54_g1435 );
				#if defined( _MMBENDINGMETHOD_SIMPLE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#elif defined( _MMBENDINGMETHOD_ACCURATE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue34_g1435 - VertexPos66_g1435 ) * step( 0.01 , VertexPos_Y67_g1435 ) );
				#else
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#endif
				float3 LocalVertexOffset89_g1442 = staticSwitch186_g1434;
				float3 appendResult15_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1442, 1 ) ).xyz;
				float3 objToWorld102_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1442 = ( objToWorld98_g1442 - objToWorld102_g1442 );
				float3 appendResult24_g1442 = (float3(-break20_g1442.z , 0.0 , break20_g1442.x));
				float3 appendResult3_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1442, 1 ) ).xyz;
				float3 objToWorld106_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1442 = ( objToWorld100_g1442 - objToWorld106_g1442 );
				float3 break108_g1442 = temp_output_107_0_g1442;
				float3 lerpResult84_g1442 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1442 , step( 0.001 , ( abs( break108_g1442.x ) + abs( break108_g1442.z ) ) ));
				float3 normalizeResult7_g1442 = ASESafeNormalize( lerpResult84_g1442 );
				float dotResult9_g1442 = dot( normalizeResult7_g1442 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1442 = acos( dotResult9_g1442 );
				float NaNPrevention21_g1442 = step( 0.01 , abs( ( temp_output_12_0_g1442 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1442 = lerp( float3( 1, 0, 0 ) , appendResult24_g1442 , NaNPrevention21_g1442);
				float3 worldToObj99_g1442 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1442, 1 ) ).xyz;
				float3 worldToObj105_g1442 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1442 = normalize( ( worldToObj99_g1442 - worldToObj105_g1442 ) );
				float3 RotationAxis30_g1442 = normalizeResult49_g1442;
				float4 WorldSpaceNoise126_g1442 = temp_output_16_0_g1434;
				float SlopeCorrectionOffset120_g1442 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1442 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1442 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1442).x - 0.0 ) * ( SlopeCorrectionOffset120_g1442 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1442 ) ) * temp_output_12_0_g1442 );
				float3 appendResult28_g1443 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 rotatedValue35_g1442 = RotateAroundAxis( -appendResult28_g1443, ( input.positionOS.xyz + LocalVertexOffset89_g1442 ), RotationAxis30_g1442, RotationAngle29_g1442 );
				float3 lerpResult52_g1442 = lerp( LocalVertexOffset89_g1442 , ( rotatedValue35_g1442 - input.positionOS.xyz ) , NaNPrevention21_g1442);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1442 = lerpResult52_g1442;
				#else
				float3 staticSwitch123_g1442 = LocalVertexOffset89_g1442;
				#endif
				float3 appendResult28_g1447 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g1444 = -appendResult28_g1447;
				float3 temp_output_5_0_g1444 = ( ( staticSwitch123_g1442 + input.positionOS.xyz ) - Scale_Pivot15_g1444 );
				float ScaleVartMin40_g1444 = _ScaleVarMin;
				float ScaleVarMax41_g1444 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1444 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1444 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1446 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1444, 1 ) ).xyz;
				float2 appendResult10_g1446 = (float2(objToWorld11_g1446.x , objToWorld11_g1446.z));
				float2 Scale_WorldSpaceUVs30_g1444 = appendResult10_g1446;
				float Scale_VarNoiseTiling23_g1444 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1444 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1444 * Scale_VarNoiseTiling23_g1444 ), 0, 0.0) );
				float smoothstepResult56_g1444 = smoothstep( ScaleNoiseSharpnessMin59_g1444 , ScaleNoiseSharpnessMax60_g1444 , (Scale_WorldSpaceNoise32_g1444).r);
				float lerpResult44_g1444 = lerp( ScaleVartMin40_g1444 , ScaleVarMax41_g1444 , smoothstepResult56_g1444);
				float ScaleVar47_g1444 = lerpResult44_g1444;
				float clampResult63_g1444 = clamp( ( ScaleVar47_g1444 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1444 = ( temp_output_5_0_g1444 * clampResult63_g1444 );
				#else
				float3 staticSwitch72_g1444 = temp_output_5_0_g1444;
				#endif
				float ScaleOffset19_g1444 = _ScaleOffset;
				float clampResult64_g1444 = clamp( ( ScaleOffset19_g1444 + 1.0 ) , 0.0 , 7.0 );
				
				float3 customSurfaceDepth3_g1455 = input.positionOS.xyz;
				float customEye3_g1455 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1455)).z;
				output.ase_texcoord1.z = customEye3_g1455;
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1444 * clampResult64_g1444 ) + Scale_Pivot15_g1444 ) - input.positionOS.xyz );

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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;

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
				output.ase_texcoord1 = input.ase_texcoord1;
				output.ase_color = input.ase_color;
				output.ase_texcoord = input.ase_texcoord;
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
				output.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
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

				float2 uv_Albedo = input.ase_texcoord1.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode111_g1448 = tex2D( _Albedo, uv_Albedo );
				float temp_output_31_0_g1455 = tex2DNode111_g1448.a;
				float DF_Length_Local38_g1455 = _DistanceFadeLength;
				float DF_Length_Global45_g1455 = Nicrom_Grass_DF_Length;
				float DF_Start_Global43_g1455 = Nicrom_Grass_DF_Start;
				float lerpResult49_g1455 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1455 ));
				float DF_UseGV28_g1455 = lerpResult49_g1455;
				float lerpResult26_g1455 = lerp( DF_Length_Local38_g1455 , DF_Length_Global45_g1455 , DF_UseGV28_g1455);
				float DistanceFadeLength23_g1455 = lerpResult26_g1455;
				float DF_Start_Local36_g1455 = _DistanceFadeStart;
				float lerpResult20_g1455 = lerp( DF_Start_Local36_g1455 , DF_Start_Global43_g1455 , DF_UseGV28_g1455);
				float DistanceFadeStart27_g1455 = lerpResult20_g1455;
				float customEye3_g1455 = input.ase_texcoord1.z;
				float cameraDepthFade3_g1455 = (( customEye3_g1455 -_ProjectionParams.y - DistanceFadeStart27_g1455 ) / DistanceFadeLength23_g1455);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1455 = ( temp_output_31_0_g1455 * saturate( ( 1.0 - cameraDepthFade3_g1455 ) ) );
				#else
				float staticSwitch33_g1455 = temp_output_31_0_g1455;
				#endif
				

				surfaceDescription.Alpha = staticSwitch33_g1455;
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
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#pragma shader_feature_local_fragment _BLENDWITHTERRAIN_ON
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local_vertex _SLOPECORRECTION_ON
			#pragma shader_feature_local _MMBENDINGMETHOD_SIMPLE _MMBENDINGMETHOD_ACCURATE
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
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
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
			float4 _Albedo_ST;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color1B;
			float3 _Color2A;
			half _MMDirectionAngle;
			float _BWTTop;
			float _BWTMaskStart;
			float _BWTMaskEnd;
			float _BWTMask;
			float _BWTBottom;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask2SharpnessMin;
			float _ColorMask2SharpnessMax;
			float _ColorMask2Tiling;
			float _ColorMask2Speed;
			float _ColorMask2Opacity;
			float _ColorMask3Start;
			float _ColorMask3End;
			float _Metallic;
			float _Smoothness;
			float _DistanceFadeLength;
			float _DistanceFadeUseGV;
			float _ColorMask2GV;
			float _DistanceFadeStart;
			float _Debug;
			float _ScaleVarNoiseTiling;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			float _StaticNoiseTiling;
			float _GVTime;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			half _MMBendingOffset;
			half _MMBending;
			half _GVBendingScale;
			half _MMAmplitudeOffset;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			half _MMPhaseShiftScale;
			half _MMObjectHeight;
			half _MMObjectHeightSource;
			float _SlopeCorrectionOffset;
			float _SlopeCorrectionMagnitude;
			float _ScaleVarMin;
			float _ScaleVarMax;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarNoiseSharpMax;
			float _ScaleOffset;
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

			float Nicrom_Grass_DF_Start;
			float Nicrom_Grass_DF_Length;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Grass;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_Grass;
			float Nicrom_MM_BendScale_Grass;
			float Nicrom_MM_AmpScale_Grass;
			sampler2D _ScaleVarNoise;
			sampler2D _Albedo;


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

				float lerpResult56_g1436 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle35_g1434 = lerpResult56_g1436;
				float MM_DirectionShift68_g1434 = _MMDirectionShift;
				float MM_DirectionShiftOffset69_g1434 = _MMDirectionShiftOffset;
				float3 appendResult28_g1441 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 MM_LocalPivot3_g1434 = -appendResult28_g1441;
				float3 objToWorld11_g1438 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float2 appendResult10_g1438 = (float2(objToWorld11_g1438.x , objToWorld11_g1438.z));
				float2 WorldSpaceUVs9_g1434 = appendResult10_g1438;
				float StaticNoiseTiling11_g1434 = _StaticNoiseTiling;
				float4 temp_output_16_0_g1434 = tex2Dlod( _MotionNoise, float4( ( WorldSpaceUVs9_g1434 * StaticNoiseTiling11_g1434 ), 0, 0.0) );
				float4 WorldSpaceStaticNoise23_g1434 = temp_output_16_0_g1434;
				float4 StaticWorldNoise55_g1439 = WorldSpaceStaticNoise23_g1434;
				float3 objToWorld50_g1439 = mul( GetObjectToWorldMatrix(), float4( MM_LocalPivot3_g1434, 1 ) ).xyz;
				float GVTime160_g1434 = _GVTime;
				float lerpResult146_g1434 = lerp( _TimeParameters.x , Nicrom_MM_Time_Grass , GVTime160_g1434);
				float ApplicationIsPlaying227_g1434 = Nicrom_ApplicationIsPlaying;
				float lerpResult221_g1434 = lerp( _TimeParameters.x , lerpResult146_g1434 , ApplicationIsPlaying227_g1434);
				float MM_Time140_g1434 = lerpResult221_g1434;
				float Time76_g1439 = MM_Time140_g1434;
				float temp_output_205_0_g1434 = Nicrom_MM_SpeedScale_Grass;
				float lerpResult208_g1434 = lerp( temp_output_205_0_g1434 , 1.0 , GVTime160_g1434);
				float lerpResult210_g1434 = lerp( temp_output_205_0_g1434 , lerpResult208_g1434 , ApplicationIsPlaying227_g1434);
				float MM_SpeedScale206_g1434 = lerpResult210_g1434;
				float SpeedScale_RA80_g1439 = MM_SpeedScale206_g1434;
				float MM_DirectionShiftSpeed70_g1434 = _MMDirectionShiftSpeed;
				float MM_DirectionShiftNoiseScale71_g1434 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g1439 = radians( ( ( MM_DirectionAngle35_g1434 + ( ( MM_DirectionShift68_g1434 + ( MM_DirectionShiftOffset69_g1434 * (StaticWorldNoise55_g1439).x ) ) * sin( ( ( objToWorld50_g1439.x + objToWorld50_g1439.z ) + ( ( Time76_g1439 * ( SpeedScale_RA80_g1439 * MM_DirectionShiftSpeed70_g1434 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g1439).z * MM_DirectionShiftNoiseScale71_g1434 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g1439 = (float3(cos( temp_output_11_0_g1439 ) , 0.0 , sin( temp_output_11_0_g1439 )));
				float3 worldToObj35_g1439 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g1439, 1 ) ).xyz;
				float3 worldToObj36_g1439 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g1439 = normalize( (( worldToObj35_g1439 - worldToObj36_g1439 )).xyz );
				float3 MM_RotationAxis101_g1434 = normalizeResult34_g1439;
				float4 StaticWorldNoise31_g1440 = WorldSpaceStaticNoise23_g1434;
				float MM_BendingOfset73_g1434 = _MMBendingOffset;
				float MM_Bending67_g1434 = _MMBending;
				float GVBendingScale164_g1434 = _GVBendingScale;
				float lerpResult155_g1434 = lerp( 1.0 , Nicrom_MM_BendScale_Grass , GVBendingScale164_g1434);
				float MM_BendingScale141_g1434 = lerpResult155_g1434;
				float MM_AmplitudeOffset62_g1434 = _MMAmplitudeOffset;
				float MM_Amplitude61_g1434 = _MMAmplitude;
				float GVAmplitudeScale162_g1434 = _GVAmplitudeScale;
				float lerpResult152_g1434 = lerp( 1.0 , Nicrom_MM_AmpScale_Grass , GVAmplitudeScale162_g1434);
				float MM_AmplitudeScale139_g1434 = lerpResult152_g1434;
				float3 objToWorld170_g1440 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g1440 = MM_Time140_g1434;
				float MM_Speed63_g1434 = _MMSpeed;
				float Speed125_g1440 = MM_Speed63_g1434;
				float SpeedScale_RotAng201_g1440 = MM_SpeedScale206_g1434;
				float MM_SineWaveLength64_g1434 = _MMSineWaveLength;
				float WaveLength63_g1440 = MM_SineWaveLength64_g1434;
				float MM_PhaseShiftSource26_g1434 = _MMPhaseShiftSource;
				float lerpResult38_g1434 = lerp( input.ase_color.a , (WorldSpaceStaticNoise23_g1434).g , MM_PhaseShiftSource26_g1434);
				float MM_PhaseShiftScale34_g1434 = _MMPhaseShiftScale;
				float MM_PhaseShift60_g1434 = ( lerpResult38_g1434 * MM_PhaseShiftScale34_g1434 );
				float PhaseShift127_g1440 = MM_PhaseShift60_g1434;
				float temp_output_20_0_g1440 = sin( ( ( ( objToWorld170_g1440.x + objToWorld170_g1440.z ) + ( ( Time167_g1440 * ( ( Speed125_g1440 * SpeedScale_RotAng201_g1440 ) * WaveLength63_g1440 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g1440 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g1440 ) ) );
				float MM_ObjectHeight66_g1434 = _MMObjectHeight;
				float3 gammaToLinear56_g1440 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource65_g1434 = _MMObjectHeightSource;
				float lerpResult57_g1440 = lerp( ( input.positionOS.xyz.y / MM_ObjectHeight66_g1434 ) , (gammaToLinear56_g1440).x , MM_ObjectHeightSource65_g1434);
				float BendingMask189_g1440 = lerpResult57_g1440;
				float MM_RotationAngle102_g1434 = radians( ( ( ( ( ( (StaticWorldNoise31_g1440).y * MM_BendingOfset73_g1434 ) + MM_Bending67_g1434 ) * MM_BendingScale141_g1434 ) + ( ( ( ( (StaticWorldNoise31_g1440).x * MM_AmplitudeOffset62_g1434 ) + MM_Amplitude61_g1434 ) * MM_AmplitudeScale139_g1434 ) * temp_output_20_0_g1440 ) ) * BendingMask189_g1440 ) );
				float3 appendResult103_g1434 = (float3(input.positionOS.xyz.x , 0.0 , input.positionOS.xyz.z));
				float3 VertexPosition179_g1434 = input.positionOS.xyz;
				float3 rotatedValue108_g1434 = RotateAroundAxis( appendResult103_g1434, VertexPosition179_g1434, MM_RotationAxis101_g1434, MM_RotationAngle102_g1434 );
				float3 RotationAxis56_g1435 = MM_RotationAxis101_g1434;
				float RotationAngle54_g1435 = MM_RotationAngle102_g1434;
				float3 LocalPivotPos60_g1435 = MM_LocalPivot3_g1434;
				float3 break62_g1435 = LocalPivotPos60_g1435;
				float VertexPos_Y67_g1435 = input.positionOS.xyz.y;
				float3 appendResult45_g1435 = (float3(break62_g1435.x , VertexPos_Y67_g1435 , break62_g1435.z));
				float3 VertexPos66_g1435 = input.positionOS.xyz;
				float3 rotatedValue30_g1435 = RotateAroundAxis( appendResult45_g1435, VertexPos66_g1435, RotationAxis56_g1435, RotationAngle54_g1435 );
				float3 DetailMotionVO73_g1435 = float3( 0,0,0 );
				float3 rotatedValue34_g1435 = RotateAroundAxis( LocalPivotPos60_g1435, ( rotatedValue30_g1435 + DetailMotionVO73_g1435 ), RotationAxis56_g1435, RotationAngle54_g1435 );
				#if defined( _MMBENDINGMETHOD_SIMPLE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#elif defined( _MMBENDINGMETHOD_ACCURATE )
				float3 staticSwitch186_g1434 = ( ( rotatedValue34_g1435 - VertexPos66_g1435 ) * step( 0.01 , VertexPos_Y67_g1435 ) );
				#else
				float3 staticSwitch186_g1434 = ( ( rotatedValue108_g1434 - VertexPosition179_g1434 ) * step( 0.01 , (VertexPosition179_g1434).y ) );
				#endif
				float3 LocalVertexOffset89_g1442 = staticSwitch186_g1434;
				float3 appendResult15_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld98_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult15_g1442, 1 ) ).xyz;
				float3 objToWorld102_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 break20_g1442 = ( objToWorld98_g1442 - objToWorld102_g1442 );
				float3 appendResult24_g1442 = (float3(-break20_g1442.z , 0.0 , break20_g1442.x));
				float3 appendResult3_g1442 = (float3(0.0 , 1.0 , 0.0));
				float3 objToWorld100_g1442 = mul( GetObjectToWorldMatrix(), float4( appendResult3_g1442, 1 ) ).xyz;
				float3 objToWorld106_g1442 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 temp_output_107_0_g1442 = ( objToWorld100_g1442 - objToWorld106_g1442 );
				float3 break108_g1442 = temp_output_107_0_g1442;
				float3 lerpResult84_g1442 = lerp( float3( 0, 1, 0 ) , temp_output_107_0_g1442 , step( 0.001 , ( abs( break108_g1442.x ) + abs( break108_g1442.z ) ) ));
				float3 normalizeResult7_g1442 = ASESafeNormalize( lerpResult84_g1442 );
				float dotResult9_g1442 = dot( normalizeResult7_g1442 , float3( 0, 1, 0 ) );
				float temp_output_12_0_g1442 = acos( dotResult9_g1442 );
				float NaNPrevention21_g1442 = step( 0.01 , abs( ( temp_output_12_0_g1442 * ( 180.0 / PI ) ) ) );
				float3 lerpResult26_g1442 = lerp( float3( 1, 0, 0 ) , appendResult24_g1442 , NaNPrevention21_g1442);
				float3 worldToObj99_g1442 = mul( GetWorldToObjectMatrix(), float4( lerpResult26_g1442, 1 ) ).xyz;
				float3 worldToObj105_g1442 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult49_g1442 = normalize( ( worldToObj99_g1442 - worldToObj105_g1442 ) );
				float3 RotationAxis30_g1442 = normalizeResult49_g1442;
				float4 WorldSpaceNoise126_g1442 = temp_output_16_0_g1434;
				float SlopeCorrectionOffset120_g1442 = _SlopeCorrectionOffset;
				float SlopeCorrectionMagnitude119_g1442 = _SlopeCorrectionMagnitude;
				float RotationAngle29_g1442 = ( saturate( (  (0.0 + ( (WorldSpaceNoise126_g1442).x - 0.0 ) * ( SlopeCorrectionOffset120_g1442 - 0.0 ) / ( 1.0 - 0.0 ) ) + SlopeCorrectionMagnitude119_g1442 ) ) * temp_output_12_0_g1442 );
				float3 appendResult28_g1443 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 rotatedValue35_g1442 = RotateAroundAxis( -appendResult28_g1443, ( input.positionOS.xyz + LocalVertexOffset89_g1442 ), RotationAxis30_g1442, RotationAngle29_g1442 );
				float3 lerpResult52_g1442 = lerp( LocalVertexOffset89_g1442 , ( rotatedValue35_g1442 - input.positionOS.xyz ) , NaNPrevention21_g1442);
				#ifdef _SLOPECORRECTION_ON
				float3 staticSwitch123_g1442 = lerpResult52_g1442;
				#else
				float3 staticSwitch123_g1442 = LocalVertexOffset89_g1442;
				#endif
				float3 appendResult28_g1447 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g1444 = -appendResult28_g1447;
				float3 temp_output_5_0_g1444 = ( ( staticSwitch123_g1442 + input.positionOS.xyz ) - Scale_Pivot15_g1444 );
				float ScaleVartMin40_g1444 = _ScaleVarMin;
				float ScaleVarMax41_g1444 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g1444 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g1444 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g1446 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g1444, 1 ) ).xyz;
				float2 appendResult10_g1446 = (float2(objToWorld11_g1446.x , objToWorld11_g1446.z));
				float2 Scale_WorldSpaceUVs30_g1444 = appendResult10_g1446;
				float Scale_VarNoiseTiling23_g1444 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g1444 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g1444 * Scale_VarNoiseTiling23_g1444 ), 0, 0.0) );
				float smoothstepResult56_g1444 = smoothstep( ScaleNoiseSharpnessMin59_g1444 , ScaleNoiseSharpnessMax60_g1444 , (Scale_WorldSpaceNoise32_g1444).r);
				float lerpResult44_g1444 = lerp( ScaleVartMin40_g1444 , ScaleVarMax41_g1444 , smoothstepResult56_g1444);
				float ScaleVar47_g1444 = lerpResult44_g1444;
				float clampResult63_g1444 = clamp( ( ScaleVar47_g1444 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g1444 = ( temp_output_5_0_g1444 * clampResult63_g1444 );
				#else
				float3 staticSwitch72_g1444 = temp_output_5_0_g1444;
				#endif
				float ScaleOffset19_g1444 = _ScaleOffset;
				float clampResult64_g1444 = clamp( ( ScaleOffset19_g1444 + 1.0 ) , 0.0 , 7.0 );
				
				float3 customSurfaceDepth3_g1455 = input.positionOS.xyz;
				float customEye3_g1455 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth3_g1455)).z;
				output.ase_texcoord3.z = customEye3_g1455;
				
				output.ase_texcoord3.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g1444 * clampResult64_g1444 ) + Scale_Pivot15_g1444 ) - input.positionOS.xyz );

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

				float2 uv_Albedo = input.ase_texcoord3.xy * _Albedo_ST.xy + _Albedo_ST.zw;
				float4 tex2DNode111_g1448 = tex2D( _Albedo, uv_Albedo );
				float temp_output_31_0_g1455 = tex2DNode111_g1448.a;
				float DF_Length_Local38_g1455 = _DistanceFadeLength;
				float DF_Length_Global45_g1455 = Nicrom_Grass_DF_Length;
				float DF_Start_Global43_g1455 = Nicrom_Grass_DF_Start;
				float lerpResult49_g1455 = lerp( 0.0 , _DistanceFadeUseGV , step( 0.1 , DF_Start_Global43_g1455 ));
				float DF_UseGV28_g1455 = lerpResult49_g1455;
				float lerpResult26_g1455 = lerp( DF_Length_Local38_g1455 , DF_Length_Global45_g1455 , DF_UseGV28_g1455);
				float DistanceFadeLength23_g1455 = lerpResult26_g1455;
				float DF_Start_Local36_g1455 = _DistanceFadeStart;
				float lerpResult20_g1455 = lerp( DF_Start_Local36_g1455 , DF_Start_Global43_g1455 , DF_UseGV28_g1455);
				float DistanceFadeStart27_g1455 = lerpResult20_g1455;
				float customEye3_g1455 = input.ase_texcoord3.z;
				float cameraDepthFade3_g1455 = (( customEye3_g1455 -_ProjectionParams.y - DistanceFadeStart27_g1455 ) / DistanceFadeLength23_g1455);
				#ifdef _DISTANCEFADE_ON
				float staticSwitch33_g1455 = ( temp_output_31_0_g1455 * saturate( ( 1.0 - cameraDepthFade3_g1455 ) ) );
				#else
				float staticSwitch33_g1455 = temp_output_31_0_g1455;
				#endif
				

				float Alpha = staticSwitch33_g1455;
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
	
	CustomEditor "Nicrom.CMI_Grass"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}

/*ASEBEGIN
Version=19901
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;70;-1280,80;Inherit;False;Nicrom - Grass - Motion - GP;-1;;470;68dce5914ef6ba4418bc01519e972983;0;0;4;FLOAT;0;FLOAT;7;FLOAT;4;FLOAT;5
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;82;-992,80;Inherit;False;Nicrom - Grass - Motion;37;;1434;d7cb44a0013d9e84a87b655f189eee6d;0;4;133;FLOAT;0;False;205;FLOAT;1;False;143;FLOAT;0;False;144;FLOAT;1;False;3;FLOAT3;0;COLOR;197;FLOAT;132
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;3;-608,80;Inherit;False;Nicrom - Slope Correction;61;;1442;af072765142b7b4418aadc0762673233;0;2;87;FLOAT3;0,0,0;False;93;FLOAT4;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;29;-288,80;Inherit;False;Nicrom - Scale;65;;1444;8d53ba1ace8e1014986c3779ab835fd1;0;1;13;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT;70
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;5;-608,176;Inherit;False;MotionSineWave;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;6;32,96;Inherit;False;ScaleVarNoise;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;7;-928,-256;Inherit;False;6;ScaleVarNoise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;8;-928,-192;Inherit;False;5;MotionSineWave;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;53;-672,-256;Inherit;False;Nicrom - Grass - Main;1;;1448;62a1cdac75bdea94380b1bdaa4a29bd6;0;2;286;FLOAT;0;False;155;FLOAT;0;False;4;FLOAT4;0;FLOAT;398;FLOAT;397;FLOAT;154
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;62;-608,-80;Inherit;False;Nicrom - Grass - DF - GP;-1;;1454;91399c2db953a9045923ce80682c110c;0;0;2;FLOAT;0;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;65;-288,-128;Inherit;False;Nicrom - Distance Fade;32;;1455;05e2fd54e656b694286271db4b0312fc;0;3;31;FLOAT;0;False;34;FLOAT;50;False;35;FLOAT;30;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;95;-64,-192;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;96;-80,-176;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;10;-320,0;Inherit;False;Property;_AlphaCutoff;Alpha Cutoff;0;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;83;0,-256;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;6;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;85;0,-256;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;86;0,-256;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;87;0,-256;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;88;0,-256;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;89;0,-256;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;90;0,-256;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;91;0,-256;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;92;0,-256;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;93;0,-256;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;MotionVectors;0;10;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;94;0,-256;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;XRMotionVectors;0;11;XRMotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;True;1;False;;255;False;;1;False;;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;1;LightMode=XRMotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;84;64,-256;Float;False;True;-1;3;Nicrom.CMI_Grass;0;12;Nicrom/ASE/Vegetation/Grass;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;48;Lighting Model;0;0;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;0;638871549468028053;Alpha Clipping;1;0;  Use Shadow Threshold;0;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;Receive Shadows;1;0;Receive SSAO;1;0;Specular Highlights;1;0;Environment Reflections;1;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;  XR Motion Vectors;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;12;False;True;True;True;True;True;True;True;True;True;True;False;False;;False;0
WireConnection;82;133;70;0
WireConnection;82;205;70;7
WireConnection;82;143;70;4
WireConnection;82;144;70;5
WireConnection;3;87;82;0
WireConnection;3;93;82;197
WireConnection;29;13;3;0
WireConnection;5;0;82;132
WireConnection;6;0;29;70
WireConnection;53;286;7;0
WireConnection;53;155;8;0
WireConnection;65;31;53;154
WireConnection;65;34;62;0
WireConnection;65;35;62;3
WireConnection;95;0;53;398
WireConnection;96;0;53;397
WireConnection;84;0;53;0
WireConnection;84;3;95;0
WireConnection;84;4;96;0
WireConnection;84;6;65;0
WireConnection;84;7;10;0
WireConnection;84;8;29;0
ASEEND*/
//CHKSM=1EE30931BDDE15EC10A89D421B760B080A001F51