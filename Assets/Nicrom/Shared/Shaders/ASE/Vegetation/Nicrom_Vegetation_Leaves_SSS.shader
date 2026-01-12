// Made with Amplify Shader Editor v1.9.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Nicrom/ASE/Vegetation/Leaves + SSS"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		_AlphaCutoff( "Alpha Cutoff", Range( 0, 1 ) ) = 0.5
		[Toggle] _SubsurfaceScatering( "Subsurface Scatering", Float ) = 0
		[HDR] _SSColor( "SS Color", Color ) = ( 1, 1, 1, 1 )
		[KeywordEnum( Two,Four )] _Colors( "Colors", Float ) = 0
		_Color1A( "Color 1A", Color ) = ( 0.4666667, 0.6313726, 0.2470588 )
		_Color1B( "Color 1B", Color ) = ( 0.2588235, 0.3882353, 0.09411765 )
		_Color2A( "Color 2A", Color ) = ( 0.6196079, 0.7607843, 0.1333333 )
		_Color2B( "Color 2B", Color ) = ( 0.4862745, 0.5960785, 0.1058824 )
		[Space][KeywordEnum( Y,XZ )] _ColorBlendAxis( "Color Blend Axis", Float ) = 0
		[Enum(None,0,Color Mask 1,1,Color Mask 2,2,Color Mask Noise,3)] _Debug( "Debug", Float ) = 0
		[NoScaleOffset][Normal][SingleLineTexture] _Normal( "Normal", 2D ) = "bump" {}
		[NoScaleOffset][SingleLineTexture][Space] _Albedo( "Albedo", 2D ) = "white" {}
		_Metallic( "Metallic", Range( 0, 1 ) ) = 0
		_Smoothness( "Smoothness", Range( 0, 1 ) ) = 0
		[NoScaleOffset][SingleLineTexture] _ColorMask1( "Color Mask 1", 2D ) = "white" {}
		_NormalScale( "Normal Scale", Range( 0, 3 ) ) = 1
		_ColorMask1Start( "Color Mask 1 Start", Range( 0, 1 ) ) = 0.1
		_ColorMask1End( "Color Mask 1 End", Range( 0, 1 ) ) = 0.5
		_ColorMask1FadeStart( "Color Mask 1 Fade Start", Range( 0, 1 ) ) = 0.8
		_ColorMask1FadeEnd( "Color Mask 1 Fade End", Range( 0, 1 ) ) = 1
		[Space] _ColorMask2Start( "Color Mask 2 Start", Range( 0, 1 ) ) = 0.4
		_ColorMask2StartOffset( "Color Mask 2 Start Offset", Range( -1, 1 ) ) = 0.15
		_ColorMask2End( "Color Mask 2 End", Range( 0, 1 ) ) = 0.8
		_ColorMask2Alpha( "Color Mask 2 Alpha", Range( 0, 1 ) ) = 1
		_ColorMask2AlphaOffset( "Color Mask 2 Alpha Offset", Range( -1, 1 ) ) = -0.3
		[NoScaleOffset][SingleLineTexture][Space] _MaskNoise( "Mask Noise", 2D ) = "white" {}
		_MaskNoiseTiling( "Mask Noise Tiling", Range( 0.0001, 4 ) ) = 0.05
		_MaskNoiseSharpMin( "Mask Noise Sharp Min", Range( 0, 1 ) ) = 0
		_MaskNoiseSharpMax( "Mask Noise Sharp Max", Range( 0, 1 ) ) = 0.5
		[KeywordEnum( Texture,UVs )] _ColorMask1Source( "Color Mask 1 Source", Float ) = 0
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
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		_TransStrength( "Strength", Range( 0, 50 ) ) = 1
		_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
		_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
		_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
		_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
		_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
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
			Tags { "LightMode"="UniversalForwardOnly" }

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
			#define ASE_TRANSLUCENCY 1
			#define _NORMALMAP 1
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
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _COLORS_TWO _COLORS_FOUR
			#pragma shader_feature_local _COLORMASK1SOURCE_TEXTURE _COLORMASK1SOURCE_UVS
			#pragma shader_feature_local _COLORBLENDAXIS_Y _COLORBLENDAXIS_XZ


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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _SSColor;
			float3 _Color1B;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color2A;
			float _Debug;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask1FadeStart;
			float _ColorMask1FadeEnd;
			float _ColorMask2Start;
			float _ColorMask2StartOffset;
			float _MaskNoiseSharpMin;
			float _MaskNoiseSharpMax;
			float _MaskNoiseTiling;
			float _ColorMask2End;
			float _ColorMask2AlphaOffset;
			float _ColorMask2Alpha;
			float _NormalScale;
			float _Metallic;
			float _Smoothness;
			float _AlphaCutoff;
			half _MMObjectHeightSource;
			half _GVBendingScale;
			half _MMObjectHeight;
			half _MMPhaseShiftSource;
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
			half _MMPhaseShiftScale;
			float _SubsurfaceScatering;
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

			float Nicrom_DM_AmpScale_Vegetation;
			float Nicrom_DM_Time_Vegetation;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Vegetation;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Vegetation;
			float Nicrom_MM_SpeedScale_Vegetation;
			float Nicrom_MM_BendScale_Vegetation;
			float Nicrom_MM_AmpScale_Vegetation;
			sampler2D _Albedo;
			sampler2D _ColorMask1;
			sampler2D _MaskNoise;
			sampler2D _Normal;


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
			
			float4 Debug139_g578( float Debug_Target, float4 Albedo, float ColorMask1, float ColorMask2, float MaskNoise )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1;
				else if(Debug_Target ==2)
				    return ColorMask2;
				else
				    return MaskNoise;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g584 = radians( ( 90.0 + ( input.texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g584 = (float3(cos( temp_output_23_0_g584 ) , 0.0 , sin( temp_output_23_0_g584 )));
				float3 DB_RotationAxis87_g582 = appendResult25_g584;
				float GV_AmplitudeScale175_g582 = _GVBendingScale;
				float lerpResult186_g582 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float DM_AmplitudeScale168_g582 = lerpResult186_g582;
				float DM1_Amplitude28_g582 = _DM1Amplitude;
				float3 objToWorld80_g592 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g582 = _GVTime;
				float lerpResult187_g582 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g582);
				float ApplicationIsPlaying241_g582 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g582 = lerp( _TimeParameters.x , lerpResult187_g582 , ApplicationIsPlaying241_g582);
				float DM_Time169_g582 = lerpResult256_g582;
				float Time90_g592 = DM_Time169_g582;
				float DM1_Speed29_g582 = _DM1Speed;
				float Speed45_g592 = DM1_Speed29_g582;
				float temp_output_244_0_g582 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g582 = lerp( temp_output_244_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult262_g582 = lerp( temp_output_244_0_g582 , lerpResult261_g582 , ApplicationIsPlaying241_g582);
				float DM_SpeedScale265_g582 = lerpResult262_g582;
				float SpeedScale95_g592 = DM_SpeedScale265_g582;
				float DM_PhaseShift91_g582 = input.ase_color.a;
				float PhaseShift48_g592 = DM_PhaseShift91_g582;
				float3 appendResult24_g584 = (float3(0.0 , input.texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g582 = appendResult24_g584;
				float3 PivotPosOnYAxis56_g592 = DM_PivotPosOnYAxis88_g582;
				float DM1_FoliageLength32_g582 = _DM1FoliageLength;
				float3 rotatedValue29_g592 = RotateAroundAxis( PivotPosOnYAxis56_g592, input.positionOS.xyz, DB_RotationAxis87_g582, radians( ( ( ( DM_AmplitudeScale168_g582 * DM1_Amplitude28_g582 ) * sin( ( ( ( objToWorld80_g592.x + objToWorld80_g592.z ) + ( ( Time90_g592 * ( Speed45_g592 * SpeedScale95_g592 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g592 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g592 ) / DM1_FoliageLength32_g582 ) ) ) );
				float DM1_MotionMask89_g582 = step( 1.5 , input.texcoord.y );
				float3 DM1_VertexOffset231_g582 = ( ( rotatedValue29_g592 - input.positionOS.xyz ) * DM1_MotionMask89_g582 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g582 = DM1_VertexOffset231_g582;
				#else
				float3 staticSwitch104_g582 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g582 = _DM2Amplitude;
				float Amplitude58_g593 = DM2_Amplitude30_g582;
				float3 LocalPivot159_g582 = float3( 0,0,0 );
				float3 PivotPoint49_g593 = LocalPivot159_g582;
				float3 objToWorld53_g593 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g593, 1 ) ).xyz;
				float Time87_g593 = DM_Time169_g582;
				float SpeedScale93_g593 = DM_SpeedScale265_g582;
				float DM2_Speed31_g582 = _DM2Speed;
				float Speed41_g593 = DM2_Speed31_g582;
				float PhaseShift54_g593 = DM_PhaseShift91_g582;
				float3 break52_g593 = PivotPoint49_g593;
				float3 appendResult20_g593 = (float3(break52_g593.x , input.positionOS.xyz.y , break52_g593.z));
				float DM2_ObjectRadius33_g582 = _DM2ObjectRadius;
				float ObjectRadius60_g593 = DM2_ObjectRadius33_g582;
				float3 rotatedValue33_g593 = RotateAroundAxis( PivotPoint49_g593, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g582 * Amplitude58_g593 ) * sin( ( ( ( objToWorld53_g593.x + objToWorld53_g593.z ) + ( ( Time87_g593 * ( SpeedScale93_g593 * Speed41_g593 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g593 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g593 ) / ObjectRadius60_g593 ) ) ) );
				float DM2_MotionMask90_g582 = step( 1.5 , input.texcoord.x );
				float BendingMask62_g593 = DM2_MotionMask90_g582;
				float3 DM2_VertexOffset232_g582 = ( ( rotatedValue33_g593 - input.positionOS.xyz ) * BendingMask62_g593 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g582 = DM2_VertexOffset232_g582;
				#else
				float3 staticSwitch103_g582 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g582 = ( staticSwitch104_g582 + staticSwitch103_g582 );
				float lerpResult56_g590 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g582 = lerpResult56_g590;
				float MM_DirShift59_g582 = _MMDirectionShift;
				float MM_DirShiftOffset60_g582 = _MMDirectionShiftOffset;
				float3 objToWorld11_g587 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float2 appendResult10_g587 = (float2(objToWorld11_g587.x , objToWorld11_g587.z));
				float MotionNoiseTiling20_g582 = _MotionNoiseTiling;
				float4 temp_output_73_0_g582 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g587 * MotionNoiseTiling20_g582 ), 0, 0.0) );
				float4 StaticWorldNoise78_g582 = temp_output_73_0_g582;
				float4 StaticWorldNoise55_g586 = StaticWorldNoise78_g582;
				float3 objToWorld50_g586 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float lerpResult182_g582 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g582);
				float lerpResult246_g582 = lerp( _TimeParameters.x , lerpResult182_g582 , ApplicationIsPlaying241_g582);
				float MM_Time13_g582 = lerpResult246_g582;
				float Time76_g586 = MM_Time13_g582;
				float temp_output_243_0_g582 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g582 = lerp( temp_output_243_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult249_g582 = lerp( temp_output_243_0_g582 , lerpResult245_g582 , ApplicationIsPlaying241_g582);
				float MM_SpeedScale253_g582 = lerpResult249_g582;
				float SpeedScale_RA80_g586 = MM_SpeedScale253_g582;
				float MM_DirShiftSpeed56_g582 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g582 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g586 = radians( ( ( MM_DirAngle51_g582 + ( ( MM_DirShift59_g582 + ( MM_DirShiftOffset60_g582 * (StaticWorldNoise55_g586).x ) ) * sin( ( ( objToWorld50_g586.x + objToWorld50_g586.z ) + ( ( Time76_g586 * ( SpeedScale_RA80_g586 * MM_DirShiftSpeed56_g582 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g586).z * MM_DirShiftNoiseScale57_g582 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g586 = (float3(cos( temp_output_11_0_g586 ) , 0.0 , sin( temp_output_11_0_g586 )));
				float3 worldToObj35_g586 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g586, 1 ) ).xyz;
				float3 worldToObj36_g586 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g586 = normalize( (( worldToObj35_g586 - worldToObj36_g586 )).xyz );
				float3 MB_RotationAxis129_g582 = normalizeResult34_g586;
				float3 RotationAxis56_g585 = MB_RotationAxis129_g582;
				float4 StaticWorldNoise31_g591 = StaticWorldNoise78_g582;
				float MM_BendingOfset37_g582 = _MMBendingOffset;
				float MM_Bending35_g582 = _MMBending;
				float GV_BendingScale176_g582 = _GVAmplitudeScale;
				float lerpResult188_g582 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g582);
				float MM_BendingScale17_g582 = lerpResult188_g582;
				float MM_AmplitudeOffset52_g582 = _MMAmplitudeOffset;
				float MM_Amplitude66_g582 = _MMAmplitude;
				float lerpResult189_g582 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float MM_AmplitudeScale15_g582 = lerpResult189_g582;
				float3 objToWorld170_g591 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g591 = MM_Time13_g582;
				float MM_Speed53_g582 = _MMSpeed;
				float Speed125_g591 = MM_Speed53_g582;
				float SpeedScale_RotAng201_g591 = MM_SpeedScale253_g582;
				float MM_SineWaveLength58_g582 = _MMSineWaveLength;
				float WaveLength63_g591 = MM_SineWaveLength58_g582;
				float MM_PhaseShiftSource207_g582 = _MMPhaseShiftSource;
				float lerpResult154_g582 = lerp( input.ase_color.a , (StaticWorldNoise78_g582).g , MM_PhaseShiftSource207_g582);
				float MM_PhaseShiftScale39_g582 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g582 = ( lerpResult154_g582 * MM_PhaseShiftScale39_g582 );
				float PhaseShift127_g591 = MB_PhaseShift79_g582;
				float temp_output_20_0_g591 = sin( ( ( ( objToWorld170_g591.x + objToWorld170_g591.z ) + ( ( Time167_g591 * ( ( Speed125_g591 * SpeedScale_RotAng201_g591 ) * WaveLength63_g591 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g591 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g591 ) ) );
				float MM_MaxHeight55_g582 = _MMObjectHeight;
				float3 gammaToLinear56_g591 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g582 = _MMObjectHeightSource;
				float lerpResult57_g591 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g582 ) , (gammaToLinear56_g591).x , MM_ObjectHeightSource54_g582);
				float BendingMask189_g591 = lerpResult57_g591;
				float MB_RotationAngle130_g582 = radians( ( ( ( ( ( (StaticWorldNoise31_g591).y * MM_BendingOfset37_g582 ) + MM_Bending35_g582 ) * MM_BendingScale17_g582 ) + ( ( ( ( (StaticWorldNoise31_g591).x * MM_AmplitudeOffset52_g582 ) + MM_Amplitude66_g582 ) * MM_AmplitudeScale15_g582 ) * temp_output_20_0_g591 ) ) * BendingMask189_g591 ) );
				float RotationAngle54_g585 = MB_RotationAngle130_g582;
				float3 LocalPivotPos60_g585 = LocalPivot159_g582;
				float3 break62_g585 = LocalPivotPos60_g585;
				float VertexPos_Y67_g585 = input.positionOS.xyz.y;
				float3 appendResult45_g585 = (float3(break62_g585.x , VertexPos_Y67_g585 , break62_g585.z));
				float3 VertexPos66_g585 = input.positionOS.xyz;
				float3 rotatedValue30_g585 = RotateAroundAxis( appendResult45_g585, VertexPos66_g585, RotationAxis56_g585, RotationAngle54_g585 );
				float3 DetailMotionVO73_g585 = DM_VertexOffset128_g582;
				float3 rotatedValue34_g585 = RotateAroundAxis( LocalPivotPos60_g585, ( rotatedValue30_g585 + DetailMotionVO73_g585 ), RotationAxis56_g585, RotationAngle54_g585 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g582 = ( ( rotatedValue34_g585 - VertexPos66_g585 ) * step( 0.01 , VertexPos_Y67_g585 ) );
				#else
				float3 staticSwitch205_g582 = DM_VertexOffset128_g582;
				#endif
				
				float ColorMask1FadeStart100_g578 = _ColorMask1FadeStart;
				float ColorMask1FadeEnd101_g578 = _ColorMask1FadeEnd;
				float3 gammaToLinear84_g578 = FastSRGBToLinear( input.ase_color.rgb );
				float VC_R86_g578 = (gammaToLinear84_g578).x;
				float smoothstepResult13_g578 = smoothstep( ColorMask1FadeStart100_g578 , ColorMask1FadeEnd101_g578 , VC_R86_g578);
				float vertexToFrag16_g578 = smoothstepResult13_g578;
				output.ase_texcoord7.z = vertexToFrag16_g578;
				float3 objToWorld78_g578 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float2 appendResult79_g578 = (float2(objToWorld78_g578.x , objToWorld78_g578.z));
				float MaskNoiseTiling93_g578 = _MaskNoiseTiling;
				float vertexToFrag88_g578 = (tex2Dlod( _MaskNoise, float4( ( appendResult79_g578 * MaskNoiseTiling93_g578 ), 0, 0.0) )).r;
				output.ase_texcoord7.w = vertexToFrag88_g578;
				
				output.ase_texcoord7.xy = input.texcoord.xy;
				output.ase_color = input.ase_color;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g582;

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

				float Debug_Target139_g578 = _Debug;
				float2 uv_Albedo128_g578 = input.ase_texcoord7.xy;
				float4 tex2DNode128_g578 = tex2D( _Albedo, uv_Albedo128_g578 );
				float4 AlbedoTex129_g578 = tex2DNode128_g578;
				float3 Color1B121_g578 = _Color1B;
				float3 Color1A118_g578 = _Color1A;
				float2 uv_ColorMask1103_g578 = input.ase_texcoord7.xy;
				float ColorMask1Tex105_g578 = tex2D( _ColorMask1, uv_ColorMask1103_g578 ).r;
				float ColorMask1End98_g578 = _ColorMask1End;
				float ColorMask1Start99_g578 = _ColorMask1Start;
				float2 texCoord74_g578 = input.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult11_g578 = smoothstep( ColorMask1End98_g578 , ColorMask1Start99_g578 , ( 1.0 - ( texCoord74_g578.y - 2.0 ) ));
				#if defined( _COLORMASK1SOURCE_TEXTURE )
				float staticSwitch184_g578 = ColorMask1Tex105_g578;
				#elif defined( _COLORMASK1SOURCE_UVS )
				float staticSwitch184_g578 = smoothstepResult11_g578;
				#else
				float staticSwitch184_g578 = ColorMask1Tex105_g578;
				#endif
				float vertexToFrag16_g578 = input.ase_texcoord7.z;
				float lerpResult22_g578 = lerp( staticSwitch184_g578 , 1.0 , vertexToFrag16_g578);
				float ColorMask175_g578 = lerpResult22_g578;
				float3 lerpResult40_g578 = lerp( Color1B121_g578 , Color1A118_g578 , ColorMask175_g578);
				float3 Color145_g578 = lerpResult40_g578;
				float3 Color2B123_g578 = _Color2B;
				float3 Color2A122_g578 = _Color2A;
				float3 lerpResult39_g578 = lerp( Color2B123_g578 , Color2A122_g578 , ColorMask175_g578);
				float3 Color244_g578 = lerpResult39_g578;
				float3 gammaToLinear84_g578 = FastSRGBToLinear( input.ase_color.rgb );
				float VC_R86_g578 = (gammaToLinear84_g578).x;
				float ColorMask2Start117_g578 = _ColorMask2Start;
				float ColorMask2StartOffset110_g578 = _ColorMask2StartOffset;
				float MaskNoiseSharpMin111_g578 = _MaskNoiseSharpMin;
				float MaskNoiseSharpMax112_g578 = _MaskNoiseSharpMax;
				float vertexToFrag88_g578 = input.ase_texcoord7.w;
				float smoothstepResult25_g578 = smoothstep( MaskNoiseSharpMin111_g578 , MaskNoiseSharpMax112_g578 , vertexToFrag88_g578);
				#if defined( _COLORS_TWO )
				float staticSwitch172_g578 = 0.0;
				#elif defined( _COLORS_FOUR )
				float staticSwitch172_g578 = smoothstepResult25_g578;
				#else
				float staticSwitch172_g578 = 0.0;
				#endif
				float ColorMaskSharpNoise27_g578 = staticSwitch172_g578;
				float ColorMask2End124_g578 = _ColorMask2End;
				float ColorMask2AlphaOffset126_g578 = _ColorMask2AlphaOffset;
				float ColorMask2Alpha127_g578 = _ColorMask2Alpha;
				float ColorMask2Opacity_F148_g578 = saturate( ( ( ColorMask2AlphaOffset126_g578 * ColorMaskSharpNoise27_g578 ) + ColorMask2Alpha127_g578 ) );
				float lerpResult158_g578 = lerp( 0.0 , saturate(  (0.0 + ( VC_R86_g578 - saturate( ( ColorMask2Start117_g578 + ( ColorMask2StartOffset110_g578 * ColorMaskSharpNoise27_g578 ) ) ) ) * ( 1.0 - 0.0 ) / ( ColorMask2End124_g578 - saturate( ( ColorMask2Start117_g578 + ( ColorMask2StartOffset110_g578 * ColorMaskSharpNoise27_g578 ) ) ) ) ) ) , ColorMask2Opacity_F148_g578);
				#if defined( _COLORBLENDAXIS_Y )
				float staticSwitch160_g578 = lerpResult158_g578;
				#elif defined( _COLORBLENDAXIS_XZ )
				float staticSwitch160_g578 = ( ColorMask2Opacity_F148_g578 * ColorMaskSharpNoise27_g578 );
				#else
				float staticSwitch160_g578 = lerpResult158_g578;
				#endif
				#if defined( _COLORS_TWO )
				float staticSwitch170_g578 = 0.0;
				#elif defined( _COLORS_FOUR )
				float staticSwitch170_g578 = staticSwitch160_g578;
				#else
				float staticSwitch170_g578 = 0.0;
				#endif
				float ColorMask2145_g578 = staticSwitch170_g578;
				float3 lerpResult56_g578 = lerp( Color145_g578 , Color244_g578 , ColorMask2145_g578);
				#if defined( _COLORS_TWO )
				float3 staticSwitch168_g578 = Color145_g578;
				#elif defined( _COLORS_FOUR )
				float3 staticSwitch168_g578 = lerpResult56_g578;
				#else
				float3 staticSwitch168_g578 = Color145_g578;
				#endif
				float4 Albedo166_g578 = ( AlbedoTex129_g578 * float4( staticSwitch168_g578 , 0.0 ) );
				float4 Albedo139_g578 = Albedo166_g578;
				float ColorMask1139_g578 = ColorMask175_g578;
				float ColorMask2139_g578 = ColorMask2145_g578;
				float MaskNoise139_g578 = ColorMaskSharpNoise27_g578;
				float4 localDebug139_g578 = Debug139_g578( Debug_Target139_g578 , Albedo139_g578 , ColorMask1139_g578 , ColorMask2139_g578 , MaskNoise139_g578 );
				
				float2 uv_Normal196_g578 = input.ase_texcoord7.xy;
				float3 unpack196_g578 = UnpackNormalScale( tex2D( _Normal, uv_Normal196_g578 ), _NormalScale );
				unpack196_g578.z = lerp( 1, unpack196_g578.z, saturate(_NormalScale) );
				
				float4 lerpResult5_g594 = lerp( float4( float3( 0, 0, 0 ) , 0.0 ) , _SSColor , _SubsurfaceScatering);
				

				float3 BaseColor = localDebug139_g578.xyz;
				float3 Normal = unpack196_g578;
				float3 Specular = 0.5;
				float Metallic = _Metallic;
				float Smoothness = _Smoothness;
				float Occlusion = 1;
				float3 Emission = 0;
				float Alpha = tex2DNode128_g578.a;
				float AlphaClipThreshold = _AlphaCutoff;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = lerpResult5_g594.rgb;

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
			#define ASE_TRANSLUCENCY 1
			#define _NORMALMAP 1
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
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON


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
			float4 _SSColor;
			float3 _Color1B;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color2A;
			float _Debug;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask1FadeStart;
			float _ColorMask1FadeEnd;
			float _ColorMask2Start;
			float _ColorMask2StartOffset;
			float _MaskNoiseSharpMin;
			float _MaskNoiseSharpMax;
			float _MaskNoiseTiling;
			float _ColorMask2End;
			float _ColorMask2AlphaOffset;
			float _ColorMask2Alpha;
			float _NormalScale;
			float _Metallic;
			float _Smoothness;
			float _AlphaCutoff;
			half _MMObjectHeightSource;
			half _GVBendingScale;
			half _MMObjectHeight;
			half _MMPhaseShiftSource;
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
			half _MMPhaseShiftScale;
			float _SubsurfaceScatering;
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

			float Nicrom_DM_AmpScale_Vegetation;
			float Nicrom_DM_Time_Vegetation;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Vegetation;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Vegetation;
			float Nicrom_MM_SpeedScale_Vegetation;
			float Nicrom_MM_BendScale_Vegetation;
			float Nicrom_MM_AmpScale_Vegetation;
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
			

			PackedVaryings VertexFunction( Attributes input )
			{
				PackedVaryings output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float temp_output_23_0_g584 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g584 = (float3(cos( temp_output_23_0_g584 ) , 0.0 , sin( temp_output_23_0_g584 )));
				float3 DB_RotationAxis87_g582 = appendResult25_g584;
				float GV_AmplitudeScale175_g582 = _GVBendingScale;
				float lerpResult186_g582 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float DM_AmplitudeScale168_g582 = lerpResult186_g582;
				float DM1_Amplitude28_g582 = _DM1Amplitude;
				float3 objToWorld80_g592 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g582 = _GVTime;
				float lerpResult187_g582 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g582);
				float ApplicationIsPlaying241_g582 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g582 = lerp( _TimeParameters.x , lerpResult187_g582 , ApplicationIsPlaying241_g582);
				float DM_Time169_g582 = lerpResult256_g582;
				float Time90_g592 = DM_Time169_g582;
				float DM1_Speed29_g582 = _DM1Speed;
				float Speed45_g592 = DM1_Speed29_g582;
				float temp_output_244_0_g582 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g582 = lerp( temp_output_244_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult262_g582 = lerp( temp_output_244_0_g582 , lerpResult261_g582 , ApplicationIsPlaying241_g582);
				float DM_SpeedScale265_g582 = lerpResult262_g582;
				float SpeedScale95_g592 = DM_SpeedScale265_g582;
				float DM_PhaseShift91_g582 = input.ase_color.a;
				float PhaseShift48_g592 = DM_PhaseShift91_g582;
				float3 appendResult24_g584 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g582 = appendResult24_g584;
				float3 PivotPosOnYAxis56_g592 = DM_PivotPosOnYAxis88_g582;
				float DM1_FoliageLength32_g582 = _DM1FoliageLength;
				float3 rotatedValue29_g592 = RotateAroundAxis( PivotPosOnYAxis56_g592, input.positionOS.xyz, DB_RotationAxis87_g582, radians( ( ( ( DM_AmplitudeScale168_g582 * DM1_Amplitude28_g582 ) * sin( ( ( ( objToWorld80_g592.x + objToWorld80_g592.z ) + ( ( Time90_g592 * ( Speed45_g592 * SpeedScale95_g592 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g592 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g592 ) / DM1_FoliageLength32_g582 ) ) ) );
				float DM1_MotionMask89_g582 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g582 = ( ( rotatedValue29_g592 - input.positionOS.xyz ) * DM1_MotionMask89_g582 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g582 = DM1_VertexOffset231_g582;
				#else
				float3 staticSwitch104_g582 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g582 = _DM2Amplitude;
				float Amplitude58_g593 = DM2_Amplitude30_g582;
				float3 LocalPivot159_g582 = float3( 0,0,0 );
				float3 PivotPoint49_g593 = LocalPivot159_g582;
				float3 objToWorld53_g593 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g593, 1 ) ).xyz;
				float Time87_g593 = DM_Time169_g582;
				float SpeedScale93_g593 = DM_SpeedScale265_g582;
				float DM2_Speed31_g582 = _DM2Speed;
				float Speed41_g593 = DM2_Speed31_g582;
				float PhaseShift54_g593 = DM_PhaseShift91_g582;
				float3 break52_g593 = PivotPoint49_g593;
				float3 appendResult20_g593 = (float3(break52_g593.x , input.positionOS.xyz.y , break52_g593.z));
				float DM2_ObjectRadius33_g582 = _DM2ObjectRadius;
				float ObjectRadius60_g593 = DM2_ObjectRadius33_g582;
				float3 rotatedValue33_g593 = RotateAroundAxis( PivotPoint49_g593, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g582 * Amplitude58_g593 ) * sin( ( ( ( objToWorld53_g593.x + objToWorld53_g593.z ) + ( ( Time87_g593 * ( SpeedScale93_g593 * Speed41_g593 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g593 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g593 ) / ObjectRadius60_g593 ) ) ) );
				float DM2_MotionMask90_g582 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g593 = DM2_MotionMask90_g582;
				float3 DM2_VertexOffset232_g582 = ( ( rotatedValue33_g593 - input.positionOS.xyz ) * BendingMask62_g593 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g582 = DM2_VertexOffset232_g582;
				#else
				float3 staticSwitch103_g582 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g582 = ( staticSwitch104_g582 + staticSwitch103_g582 );
				float lerpResult56_g590 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g582 = lerpResult56_g590;
				float MM_DirShift59_g582 = _MMDirectionShift;
				float MM_DirShiftOffset60_g582 = _MMDirectionShiftOffset;
				float3 objToWorld11_g587 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float2 appendResult10_g587 = (float2(objToWorld11_g587.x , objToWorld11_g587.z));
				float MotionNoiseTiling20_g582 = _MotionNoiseTiling;
				float4 temp_output_73_0_g582 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g587 * MotionNoiseTiling20_g582 ), 0, 0.0) );
				float4 StaticWorldNoise78_g582 = temp_output_73_0_g582;
				float4 StaticWorldNoise55_g586 = StaticWorldNoise78_g582;
				float3 objToWorld50_g586 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float lerpResult182_g582 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g582);
				float lerpResult246_g582 = lerp( _TimeParameters.x , lerpResult182_g582 , ApplicationIsPlaying241_g582);
				float MM_Time13_g582 = lerpResult246_g582;
				float Time76_g586 = MM_Time13_g582;
				float temp_output_243_0_g582 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g582 = lerp( temp_output_243_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult249_g582 = lerp( temp_output_243_0_g582 , lerpResult245_g582 , ApplicationIsPlaying241_g582);
				float MM_SpeedScale253_g582 = lerpResult249_g582;
				float SpeedScale_RA80_g586 = MM_SpeedScale253_g582;
				float MM_DirShiftSpeed56_g582 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g582 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g586 = radians( ( ( MM_DirAngle51_g582 + ( ( MM_DirShift59_g582 + ( MM_DirShiftOffset60_g582 * (StaticWorldNoise55_g586).x ) ) * sin( ( ( objToWorld50_g586.x + objToWorld50_g586.z ) + ( ( Time76_g586 * ( SpeedScale_RA80_g586 * MM_DirShiftSpeed56_g582 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g586).z * MM_DirShiftNoiseScale57_g582 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g586 = (float3(cos( temp_output_11_0_g586 ) , 0.0 , sin( temp_output_11_0_g586 )));
				float3 worldToObj35_g586 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g586, 1 ) ).xyz;
				float3 worldToObj36_g586 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g586 = normalize( (( worldToObj35_g586 - worldToObj36_g586 )).xyz );
				float3 MB_RotationAxis129_g582 = normalizeResult34_g586;
				float3 RotationAxis56_g585 = MB_RotationAxis129_g582;
				float4 StaticWorldNoise31_g591 = StaticWorldNoise78_g582;
				float MM_BendingOfset37_g582 = _MMBendingOffset;
				float MM_Bending35_g582 = _MMBending;
				float GV_BendingScale176_g582 = _GVAmplitudeScale;
				float lerpResult188_g582 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g582);
				float MM_BendingScale17_g582 = lerpResult188_g582;
				float MM_AmplitudeOffset52_g582 = _MMAmplitudeOffset;
				float MM_Amplitude66_g582 = _MMAmplitude;
				float lerpResult189_g582 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float MM_AmplitudeScale15_g582 = lerpResult189_g582;
				float3 objToWorld170_g591 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g591 = MM_Time13_g582;
				float MM_Speed53_g582 = _MMSpeed;
				float Speed125_g591 = MM_Speed53_g582;
				float SpeedScale_RotAng201_g591 = MM_SpeedScale253_g582;
				float MM_SineWaveLength58_g582 = _MMSineWaveLength;
				float WaveLength63_g591 = MM_SineWaveLength58_g582;
				float MM_PhaseShiftSource207_g582 = _MMPhaseShiftSource;
				float lerpResult154_g582 = lerp( input.ase_color.a , (StaticWorldNoise78_g582).g , MM_PhaseShiftSource207_g582);
				float MM_PhaseShiftScale39_g582 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g582 = ( lerpResult154_g582 * MM_PhaseShiftScale39_g582 );
				float PhaseShift127_g591 = MB_PhaseShift79_g582;
				float temp_output_20_0_g591 = sin( ( ( ( objToWorld170_g591.x + objToWorld170_g591.z ) + ( ( Time167_g591 * ( ( Speed125_g591 * SpeedScale_RotAng201_g591 ) * WaveLength63_g591 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g591 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g591 ) ) );
				float MM_MaxHeight55_g582 = _MMObjectHeight;
				float3 gammaToLinear56_g591 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g582 = _MMObjectHeightSource;
				float lerpResult57_g591 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g582 ) , (gammaToLinear56_g591).x , MM_ObjectHeightSource54_g582);
				float BendingMask189_g591 = lerpResult57_g591;
				float MB_RotationAngle130_g582 = radians( ( ( ( ( ( (StaticWorldNoise31_g591).y * MM_BendingOfset37_g582 ) + MM_Bending35_g582 ) * MM_BendingScale17_g582 ) + ( ( ( ( (StaticWorldNoise31_g591).x * MM_AmplitudeOffset52_g582 ) + MM_Amplitude66_g582 ) * MM_AmplitudeScale15_g582 ) * temp_output_20_0_g591 ) ) * BendingMask189_g591 ) );
				float RotationAngle54_g585 = MB_RotationAngle130_g582;
				float3 LocalPivotPos60_g585 = LocalPivot159_g582;
				float3 break62_g585 = LocalPivotPos60_g585;
				float VertexPos_Y67_g585 = input.positionOS.xyz.y;
				float3 appendResult45_g585 = (float3(break62_g585.x , VertexPos_Y67_g585 , break62_g585.z));
				float3 VertexPos66_g585 = input.positionOS.xyz;
				float3 rotatedValue30_g585 = RotateAroundAxis( appendResult45_g585, VertexPos66_g585, RotationAxis56_g585, RotationAngle54_g585 );
				float3 DetailMotionVO73_g585 = DM_VertexOffset128_g582;
				float3 rotatedValue34_g585 = RotateAroundAxis( LocalPivotPos60_g585, ( rotatedValue30_g585 + DetailMotionVO73_g585 ), RotationAxis56_g585, RotationAngle54_g585 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g582 = ( ( rotatedValue34_g585 - VertexPos66_g585 ) * step( 0.01 , VertexPos_Y67_g585 ) );
				#else
				float3 staticSwitch205_g582 = DM_VertexOffset128_g582;
				#endif
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g582;
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

				float2 uv_Albedo128_g578 = input.ase_texcoord1.xy;
				float4 tex2DNode128_g578 = tex2D( _Albedo, uv_Albedo128_g578 );
				

				float Alpha = tex2DNode128_g578.a;
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
			#define ASE_TRANSLUCENCY 1
			#define _NORMALMAP 1
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
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON


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
			float4 _SSColor;
			float3 _Color1B;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color2A;
			float _Debug;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask1FadeStart;
			float _ColorMask1FadeEnd;
			float _ColorMask2Start;
			float _ColorMask2StartOffset;
			float _MaskNoiseSharpMin;
			float _MaskNoiseSharpMax;
			float _MaskNoiseTiling;
			float _ColorMask2End;
			float _ColorMask2AlphaOffset;
			float _ColorMask2Alpha;
			float _NormalScale;
			float _Metallic;
			float _Smoothness;
			float _AlphaCutoff;
			half _MMObjectHeightSource;
			half _GVBendingScale;
			half _MMObjectHeight;
			half _MMPhaseShiftSource;
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
			half _MMPhaseShiftScale;
			float _SubsurfaceScatering;
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

			float Nicrom_DM_AmpScale_Vegetation;
			float Nicrom_DM_Time_Vegetation;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Vegetation;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Vegetation;
			float Nicrom_MM_SpeedScale_Vegetation;
			float Nicrom_MM_BendScale_Vegetation;
			float Nicrom_MM_AmpScale_Vegetation;
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
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g584 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g584 = (float3(cos( temp_output_23_0_g584 ) , 0.0 , sin( temp_output_23_0_g584 )));
				float3 DB_RotationAxis87_g582 = appendResult25_g584;
				float GV_AmplitudeScale175_g582 = _GVBendingScale;
				float lerpResult186_g582 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float DM_AmplitudeScale168_g582 = lerpResult186_g582;
				float DM1_Amplitude28_g582 = _DM1Amplitude;
				float3 objToWorld80_g592 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g582 = _GVTime;
				float lerpResult187_g582 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g582);
				float ApplicationIsPlaying241_g582 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g582 = lerp( _TimeParameters.x , lerpResult187_g582 , ApplicationIsPlaying241_g582);
				float DM_Time169_g582 = lerpResult256_g582;
				float Time90_g592 = DM_Time169_g582;
				float DM1_Speed29_g582 = _DM1Speed;
				float Speed45_g592 = DM1_Speed29_g582;
				float temp_output_244_0_g582 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g582 = lerp( temp_output_244_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult262_g582 = lerp( temp_output_244_0_g582 , lerpResult261_g582 , ApplicationIsPlaying241_g582);
				float DM_SpeedScale265_g582 = lerpResult262_g582;
				float SpeedScale95_g592 = DM_SpeedScale265_g582;
				float DM_PhaseShift91_g582 = input.ase_color.a;
				float PhaseShift48_g592 = DM_PhaseShift91_g582;
				float3 appendResult24_g584 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g582 = appendResult24_g584;
				float3 PivotPosOnYAxis56_g592 = DM_PivotPosOnYAxis88_g582;
				float DM1_FoliageLength32_g582 = _DM1FoliageLength;
				float3 rotatedValue29_g592 = RotateAroundAxis( PivotPosOnYAxis56_g592, input.positionOS.xyz, DB_RotationAxis87_g582, radians( ( ( ( DM_AmplitudeScale168_g582 * DM1_Amplitude28_g582 ) * sin( ( ( ( objToWorld80_g592.x + objToWorld80_g592.z ) + ( ( Time90_g592 * ( Speed45_g592 * SpeedScale95_g592 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g592 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g592 ) / DM1_FoliageLength32_g582 ) ) ) );
				float DM1_MotionMask89_g582 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g582 = ( ( rotatedValue29_g592 - input.positionOS.xyz ) * DM1_MotionMask89_g582 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g582 = DM1_VertexOffset231_g582;
				#else
				float3 staticSwitch104_g582 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g582 = _DM2Amplitude;
				float Amplitude58_g593 = DM2_Amplitude30_g582;
				float3 LocalPivot159_g582 = float3( 0,0,0 );
				float3 PivotPoint49_g593 = LocalPivot159_g582;
				float3 objToWorld53_g593 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g593, 1 ) ).xyz;
				float Time87_g593 = DM_Time169_g582;
				float SpeedScale93_g593 = DM_SpeedScale265_g582;
				float DM2_Speed31_g582 = _DM2Speed;
				float Speed41_g593 = DM2_Speed31_g582;
				float PhaseShift54_g593 = DM_PhaseShift91_g582;
				float3 break52_g593 = PivotPoint49_g593;
				float3 appendResult20_g593 = (float3(break52_g593.x , input.positionOS.xyz.y , break52_g593.z));
				float DM2_ObjectRadius33_g582 = _DM2ObjectRadius;
				float ObjectRadius60_g593 = DM2_ObjectRadius33_g582;
				float3 rotatedValue33_g593 = RotateAroundAxis( PivotPoint49_g593, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g582 * Amplitude58_g593 ) * sin( ( ( ( objToWorld53_g593.x + objToWorld53_g593.z ) + ( ( Time87_g593 * ( SpeedScale93_g593 * Speed41_g593 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g593 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g593 ) / ObjectRadius60_g593 ) ) ) );
				float DM2_MotionMask90_g582 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g593 = DM2_MotionMask90_g582;
				float3 DM2_VertexOffset232_g582 = ( ( rotatedValue33_g593 - input.positionOS.xyz ) * BendingMask62_g593 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g582 = DM2_VertexOffset232_g582;
				#else
				float3 staticSwitch103_g582 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g582 = ( staticSwitch104_g582 + staticSwitch103_g582 );
				float lerpResult56_g590 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g582 = lerpResult56_g590;
				float MM_DirShift59_g582 = _MMDirectionShift;
				float MM_DirShiftOffset60_g582 = _MMDirectionShiftOffset;
				float3 objToWorld11_g587 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float2 appendResult10_g587 = (float2(objToWorld11_g587.x , objToWorld11_g587.z));
				float MotionNoiseTiling20_g582 = _MotionNoiseTiling;
				float4 temp_output_73_0_g582 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g587 * MotionNoiseTiling20_g582 ), 0, 0.0) );
				float4 StaticWorldNoise78_g582 = temp_output_73_0_g582;
				float4 StaticWorldNoise55_g586 = StaticWorldNoise78_g582;
				float3 objToWorld50_g586 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float lerpResult182_g582 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g582);
				float lerpResult246_g582 = lerp( _TimeParameters.x , lerpResult182_g582 , ApplicationIsPlaying241_g582);
				float MM_Time13_g582 = lerpResult246_g582;
				float Time76_g586 = MM_Time13_g582;
				float temp_output_243_0_g582 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g582 = lerp( temp_output_243_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult249_g582 = lerp( temp_output_243_0_g582 , lerpResult245_g582 , ApplicationIsPlaying241_g582);
				float MM_SpeedScale253_g582 = lerpResult249_g582;
				float SpeedScale_RA80_g586 = MM_SpeedScale253_g582;
				float MM_DirShiftSpeed56_g582 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g582 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g586 = radians( ( ( MM_DirAngle51_g582 + ( ( MM_DirShift59_g582 + ( MM_DirShiftOffset60_g582 * (StaticWorldNoise55_g586).x ) ) * sin( ( ( objToWorld50_g586.x + objToWorld50_g586.z ) + ( ( Time76_g586 * ( SpeedScale_RA80_g586 * MM_DirShiftSpeed56_g582 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g586).z * MM_DirShiftNoiseScale57_g582 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g586 = (float3(cos( temp_output_11_0_g586 ) , 0.0 , sin( temp_output_11_0_g586 )));
				float3 worldToObj35_g586 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g586, 1 ) ).xyz;
				float3 worldToObj36_g586 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g586 = normalize( (( worldToObj35_g586 - worldToObj36_g586 )).xyz );
				float3 MB_RotationAxis129_g582 = normalizeResult34_g586;
				float3 RotationAxis56_g585 = MB_RotationAxis129_g582;
				float4 StaticWorldNoise31_g591 = StaticWorldNoise78_g582;
				float MM_BendingOfset37_g582 = _MMBendingOffset;
				float MM_Bending35_g582 = _MMBending;
				float GV_BendingScale176_g582 = _GVAmplitudeScale;
				float lerpResult188_g582 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g582);
				float MM_BendingScale17_g582 = lerpResult188_g582;
				float MM_AmplitudeOffset52_g582 = _MMAmplitudeOffset;
				float MM_Amplitude66_g582 = _MMAmplitude;
				float lerpResult189_g582 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float MM_AmplitudeScale15_g582 = lerpResult189_g582;
				float3 objToWorld170_g591 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g591 = MM_Time13_g582;
				float MM_Speed53_g582 = _MMSpeed;
				float Speed125_g591 = MM_Speed53_g582;
				float SpeedScale_RotAng201_g591 = MM_SpeedScale253_g582;
				float MM_SineWaveLength58_g582 = _MMSineWaveLength;
				float WaveLength63_g591 = MM_SineWaveLength58_g582;
				float MM_PhaseShiftSource207_g582 = _MMPhaseShiftSource;
				float lerpResult154_g582 = lerp( input.ase_color.a , (StaticWorldNoise78_g582).g , MM_PhaseShiftSource207_g582);
				float MM_PhaseShiftScale39_g582 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g582 = ( lerpResult154_g582 * MM_PhaseShiftScale39_g582 );
				float PhaseShift127_g591 = MB_PhaseShift79_g582;
				float temp_output_20_0_g591 = sin( ( ( ( objToWorld170_g591.x + objToWorld170_g591.z ) + ( ( Time167_g591 * ( ( Speed125_g591 * SpeedScale_RotAng201_g591 ) * WaveLength63_g591 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g591 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g591 ) ) );
				float MM_MaxHeight55_g582 = _MMObjectHeight;
				float3 gammaToLinear56_g591 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g582 = _MMObjectHeightSource;
				float lerpResult57_g591 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g582 ) , (gammaToLinear56_g591).x , MM_ObjectHeightSource54_g582);
				float BendingMask189_g591 = lerpResult57_g591;
				float MB_RotationAngle130_g582 = radians( ( ( ( ( ( (StaticWorldNoise31_g591).y * MM_BendingOfset37_g582 ) + MM_Bending35_g582 ) * MM_BendingScale17_g582 ) + ( ( ( ( (StaticWorldNoise31_g591).x * MM_AmplitudeOffset52_g582 ) + MM_Amplitude66_g582 ) * MM_AmplitudeScale15_g582 ) * temp_output_20_0_g591 ) ) * BendingMask189_g591 ) );
				float RotationAngle54_g585 = MB_RotationAngle130_g582;
				float3 LocalPivotPos60_g585 = LocalPivot159_g582;
				float3 break62_g585 = LocalPivotPos60_g585;
				float VertexPos_Y67_g585 = input.positionOS.xyz.y;
				float3 appendResult45_g585 = (float3(break62_g585.x , VertexPos_Y67_g585 , break62_g585.z));
				float3 VertexPos66_g585 = input.positionOS.xyz;
				float3 rotatedValue30_g585 = RotateAroundAxis( appendResult45_g585, VertexPos66_g585, RotationAxis56_g585, RotationAngle54_g585 );
				float3 DetailMotionVO73_g585 = DM_VertexOffset128_g582;
				float3 rotatedValue34_g585 = RotateAroundAxis( LocalPivotPos60_g585, ( rotatedValue30_g585 + DetailMotionVO73_g585 ), RotationAxis56_g585, RotationAngle54_g585 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g582 = ( ( rotatedValue34_g585 - VertexPos66_g585 ) * step( 0.01 , VertexPos_Y67_g585 ) );
				#else
				float3 staticSwitch205_g582 = DM_VertexOffset128_g582;
				#endif
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g582;

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

				float2 uv_Albedo128_g578 = input.ase_texcoord1.xy;
				float4 tex2DNode128_g578 = tex2D( _Albedo, uv_Albedo128_g578 );
				

				float Alpha = tex2DNode128_g578.a;
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
			#define ASE_TRANSLUCENCY 1
			#define _NORMALMAP 1
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
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _COLORS_TWO _COLORS_FOUR
			#pragma shader_feature_local _COLORMASK1SOURCE_TEXTURE _COLORMASK1SOURCE_UVS
			#pragma shader_feature_local _COLORBLENDAXIS_Y _COLORBLENDAXIS_XZ


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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _SSColor;
			float3 _Color1B;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color2A;
			float _Debug;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask1FadeStart;
			float _ColorMask1FadeEnd;
			float _ColorMask2Start;
			float _ColorMask2StartOffset;
			float _MaskNoiseSharpMin;
			float _MaskNoiseSharpMax;
			float _MaskNoiseTiling;
			float _ColorMask2End;
			float _ColorMask2AlphaOffset;
			float _ColorMask2Alpha;
			float _NormalScale;
			float _Metallic;
			float _Smoothness;
			float _AlphaCutoff;
			half _MMObjectHeightSource;
			half _GVBendingScale;
			half _MMObjectHeight;
			half _MMPhaseShiftSource;
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
			half _MMPhaseShiftScale;
			float _SubsurfaceScatering;
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

			float Nicrom_DM_AmpScale_Vegetation;
			float Nicrom_DM_Time_Vegetation;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Vegetation;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Vegetation;
			float Nicrom_MM_SpeedScale_Vegetation;
			float Nicrom_MM_BendScale_Vegetation;
			float Nicrom_MM_AmpScale_Vegetation;
			sampler2D _Albedo;
			sampler2D _ColorMask1;
			sampler2D _MaskNoise;


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
			
			float4 Debug139_g578( float Debug_Target, float4 Albedo, float ColorMask1, float ColorMask2, float MaskNoise )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1;
				else if(Debug_Target ==2)
				    return ColorMask2;
				else
				    return MaskNoise;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g584 = radians( ( 90.0 + ( input.texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g584 = (float3(cos( temp_output_23_0_g584 ) , 0.0 , sin( temp_output_23_0_g584 )));
				float3 DB_RotationAxis87_g582 = appendResult25_g584;
				float GV_AmplitudeScale175_g582 = _GVBendingScale;
				float lerpResult186_g582 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float DM_AmplitudeScale168_g582 = lerpResult186_g582;
				float DM1_Amplitude28_g582 = _DM1Amplitude;
				float3 objToWorld80_g592 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g582 = _GVTime;
				float lerpResult187_g582 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g582);
				float ApplicationIsPlaying241_g582 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g582 = lerp( _TimeParameters.x , lerpResult187_g582 , ApplicationIsPlaying241_g582);
				float DM_Time169_g582 = lerpResult256_g582;
				float Time90_g592 = DM_Time169_g582;
				float DM1_Speed29_g582 = _DM1Speed;
				float Speed45_g592 = DM1_Speed29_g582;
				float temp_output_244_0_g582 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g582 = lerp( temp_output_244_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult262_g582 = lerp( temp_output_244_0_g582 , lerpResult261_g582 , ApplicationIsPlaying241_g582);
				float DM_SpeedScale265_g582 = lerpResult262_g582;
				float SpeedScale95_g592 = DM_SpeedScale265_g582;
				float DM_PhaseShift91_g582 = input.ase_color.a;
				float PhaseShift48_g592 = DM_PhaseShift91_g582;
				float3 appendResult24_g584 = (float3(0.0 , input.texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g582 = appendResult24_g584;
				float3 PivotPosOnYAxis56_g592 = DM_PivotPosOnYAxis88_g582;
				float DM1_FoliageLength32_g582 = _DM1FoliageLength;
				float3 rotatedValue29_g592 = RotateAroundAxis( PivotPosOnYAxis56_g592, input.positionOS.xyz, DB_RotationAxis87_g582, radians( ( ( ( DM_AmplitudeScale168_g582 * DM1_Amplitude28_g582 ) * sin( ( ( ( objToWorld80_g592.x + objToWorld80_g592.z ) + ( ( Time90_g592 * ( Speed45_g592 * SpeedScale95_g592 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g592 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g592 ) / DM1_FoliageLength32_g582 ) ) ) );
				float DM1_MotionMask89_g582 = step( 1.5 , input.texcoord0.y );
				float3 DM1_VertexOffset231_g582 = ( ( rotatedValue29_g592 - input.positionOS.xyz ) * DM1_MotionMask89_g582 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g582 = DM1_VertexOffset231_g582;
				#else
				float3 staticSwitch104_g582 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g582 = _DM2Amplitude;
				float Amplitude58_g593 = DM2_Amplitude30_g582;
				float3 LocalPivot159_g582 = float3( 0,0,0 );
				float3 PivotPoint49_g593 = LocalPivot159_g582;
				float3 objToWorld53_g593 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g593, 1 ) ).xyz;
				float Time87_g593 = DM_Time169_g582;
				float SpeedScale93_g593 = DM_SpeedScale265_g582;
				float DM2_Speed31_g582 = _DM2Speed;
				float Speed41_g593 = DM2_Speed31_g582;
				float PhaseShift54_g593 = DM_PhaseShift91_g582;
				float3 break52_g593 = PivotPoint49_g593;
				float3 appendResult20_g593 = (float3(break52_g593.x , input.positionOS.xyz.y , break52_g593.z));
				float DM2_ObjectRadius33_g582 = _DM2ObjectRadius;
				float ObjectRadius60_g593 = DM2_ObjectRadius33_g582;
				float3 rotatedValue33_g593 = RotateAroundAxis( PivotPoint49_g593, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g582 * Amplitude58_g593 ) * sin( ( ( ( objToWorld53_g593.x + objToWorld53_g593.z ) + ( ( Time87_g593 * ( SpeedScale93_g593 * Speed41_g593 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g593 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g593 ) / ObjectRadius60_g593 ) ) ) );
				float DM2_MotionMask90_g582 = step( 1.5 , input.texcoord0.x );
				float BendingMask62_g593 = DM2_MotionMask90_g582;
				float3 DM2_VertexOffset232_g582 = ( ( rotatedValue33_g593 - input.positionOS.xyz ) * BendingMask62_g593 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g582 = DM2_VertexOffset232_g582;
				#else
				float3 staticSwitch103_g582 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g582 = ( staticSwitch104_g582 + staticSwitch103_g582 );
				float lerpResult56_g590 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g582 = lerpResult56_g590;
				float MM_DirShift59_g582 = _MMDirectionShift;
				float MM_DirShiftOffset60_g582 = _MMDirectionShiftOffset;
				float3 objToWorld11_g587 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float2 appendResult10_g587 = (float2(objToWorld11_g587.x , objToWorld11_g587.z));
				float MotionNoiseTiling20_g582 = _MotionNoiseTiling;
				float4 temp_output_73_0_g582 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g587 * MotionNoiseTiling20_g582 ), 0, 0.0) );
				float4 StaticWorldNoise78_g582 = temp_output_73_0_g582;
				float4 StaticWorldNoise55_g586 = StaticWorldNoise78_g582;
				float3 objToWorld50_g586 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float lerpResult182_g582 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g582);
				float lerpResult246_g582 = lerp( _TimeParameters.x , lerpResult182_g582 , ApplicationIsPlaying241_g582);
				float MM_Time13_g582 = lerpResult246_g582;
				float Time76_g586 = MM_Time13_g582;
				float temp_output_243_0_g582 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g582 = lerp( temp_output_243_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult249_g582 = lerp( temp_output_243_0_g582 , lerpResult245_g582 , ApplicationIsPlaying241_g582);
				float MM_SpeedScale253_g582 = lerpResult249_g582;
				float SpeedScale_RA80_g586 = MM_SpeedScale253_g582;
				float MM_DirShiftSpeed56_g582 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g582 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g586 = radians( ( ( MM_DirAngle51_g582 + ( ( MM_DirShift59_g582 + ( MM_DirShiftOffset60_g582 * (StaticWorldNoise55_g586).x ) ) * sin( ( ( objToWorld50_g586.x + objToWorld50_g586.z ) + ( ( Time76_g586 * ( SpeedScale_RA80_g586 * MM_DirShiftSpeed56_g582 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g586).z * MM_DirShiftNoiseScale57_g582 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g586 = (float3(cos( temp_output_11_0_g586 ) , 0.0 , sin( temp_output_11_0_g586 )));
				float3 worldToObj35_g586 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g586, 1 ) ).xyz;
				float3 worldToObj36_g586 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g586 = normalize( (( worldToObj35_g586 - worldToObj36_g586 )).xyz );
				float3 MB_RotationAxis129_g582 = normalizeResult34_g586;
				float3 RotationAxis56_g585 = MB_RotationAxis129_g582;
				float4 StaticWorldNoise31_g591 = StaticWorldNoise78_g582;
				float MM_BendingOfset37_g582 = _MMBendingOffset;
				float MM_Bending35_g582 = _MMBending;
				float GV_BendingScale176_g582 = _GVAmplitudeScale;
				float lerpResult188_g582 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g582);
				float MM_BendingScale17_g582 = lerpResult188_g582;
				float MM_AmplitudeOffset52_g582 = _MMAmplitudeOffset;
				float MM_Amplitude66_g582 = _MMAmplitude;
				float lerpResult189_g582 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float MM_AmplitudeScale15_g582 = lerpResult189_g582;
				float3 objToWorld170_g591 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g591 = MM_Time13_g582;
				float MM_Speed53_g582 = _MMSpeed;
				float Speed125_g591 = MM_Speed53_g582;
				float SpeedScale_RotAng201_g591 = MM_SpeedScale253_g582;
				float MM_SineWaveLength58_g582 = _MMSineWaveLength;
				float WaveLength63_g591 = MM_SineWaveLength58_g582;
				float MM_PhaseShiftSource207_g582 = _MMPhaseShiftSource;
				float lerpResult154_g582 = lerp( input.ase_color.a , (StaticWorldNoise78_g582).g , MM_PhaseShiftSource207_g582);
				float MM_PhaseShiftScale39_g582 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g582 = ( lerpResult154_g582 * MM_PhaseShiftScale39_g582 );
				float PhaseShift127_g591 = MB_PhaseShift79_g582;
				float temp_output_20_0_g591 = sin( ( ( ( objToWorld170_g591.x + objToWorld170_g591.z ) + ( ( Time167_g591 * ( ( Speed125_g591 * SpeedScale_RotAng201_g591 ) * WaveLength63_g591 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g591 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g591 ) ) );
				float MM_MaxHeight55_g582 = _MMObjectHeight;
				float3 gammaToLinear56_g591 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g582 = _MMObjectHeightSource;
				float lerpResult57_g591 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g582 ) , (gammaToLinear56_g591).x , MM_ObjectHeightSource54_g582);
				float BendingMask189_g591 = lerpResult57_g591;
				float MB_RotationAngle130_g582 = radians( ( ( ( ( ( (StaticWorldNoise31_g591).y * MM_BendingOfset37_g582 ) + MM_Bending35_g582 ) * MM_BendingScale17_g582 ) + ( ( ( ( (StaticWorldNoise31_g591).x * MM_AmplitudeOffset52_g582 ) + MM_Amplitude66_g582 ) * MM_AmplitudeScale15_g582 ) * temp_output_20_0_g591 ) ) * BendingMask189_g591 ) );
				float RotationAngle54_g585 = MB_RotationAngle130_g582;
				float3 LocalPivotPos60_g585 = LocalPivot159_g582;
				float3 break62_g585 = LocalPivotPos60_g585;
				float VertexPos_Y67_g585 = input.positionOS.xyz.y;
				float3 appendResult45_g585 = (float3(break62_g585.x , VertexPos_Y67_g585 , break62_g585.z));
				float3 VertexPos66_g585 = input.positionOS.xyz;
				float3 rotatedValue30_g585 = RotateAroundAxis( appendResult45_g585, VertexPos66_g585, RotationAxis56_g585, RotationAngle54_g585 );
				float3 DetailMotionVO73_g585 = DM_VertexOffset128_g582;
				float3 rotatedValue34_g585 = RotateAroundAxis( LocalPivotPos60_g585, ( rotatedValue30_g585 + DetailMotionVO73_g585 ), RotationAxis56_g585, RotationAngle54_g585 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g582 = ( ( rotatedValue34_g585 - VertexPos66_g585 ) * step( 0.01 , VertexPos_Y67_g585 ) );
				#else
				float3 staticSwitch205_g582 = DM_VertexOffset128_g582;
				#endif
				
				float ColorMask1FadeStart100_g578 = _ColorMask1FadeStart;
				float ColorMask1FadeEnd101_g578 = _ColorMask1FadeEnd;
				float3 gammaToLinear84_g578 = FastSRGBToLinear( input.ase_color.rgb );
				float VC_R86_g578 = (gammaToLinear84_g578).x;
				float smoothstepResult13_g578 = smoothstep( ColorMask1FadeStart100_g578 , ColorMask1FadeEnd101_g578 , VC_R86_g578);
				float vertexToFrag16_g578 = smoothstepResult13_g578;
				output.ase_texcoord3.z = vertexToFrag16_g578;
				float3 objToWorld78_g578 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float2 appendResult79_g578 = (float2(objToWorld78_g578.x , objToWorld78_g578.z));
				float MaskNoiseTiling93_g578 = _MaskNoiseTiling;
				float vertexToFrag88_g578 = (tex2Dlod( _MaskNoise, float4( ( appendResult79_g578 * MaskNoiseTiling93_g578 ), 0, 0.0) )).r;
				output.ase_texcoord3.w = vertexToFrag88_g578;
				
				output.ase_texcoord3.xy = input.texcoord0.xy;
				output.ase_color = input.ase_color;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g582;

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

				float Debug_Target139_g578 = _Debug;
				float2 uv_Albedo128_g578 = input.ase_texcoord3.xy;
				float4 tex2DNode128_g578 = tex2D( _Albedo, uv_Albedo128_g578 );
				float4 AlbedoTex129_g578 = tex2DNode128_g578;
				float3 Color1B121_g578 = _Color1B;
				float3 Color1A118_g578 = _Color1A;
				float2 uv_ColorMask1103_g578 = input.ase_texcoord3.xy;
				float ColorMask1Tex105_g578 = tex2D( _ColorMask1, uv_ColorMask1103_g578 ).r;
				float ColorMask1End98_g578 = _ColorMask1End;
				float ColorMask1Start99_g578 = _ColorMask1Start;
				float2 texCoord74_g578 = input.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult11_g578 = smoothstep( ColorMask1End98_g578 , ColorMask1Start99_g578 , ( 1.0 - ( texCoord74_g578.y - 2.0 ) ));
				#if defined( _COLORMASK1SOURCE_TEXTURE )
				float staticSwitch184_g578 = ColorMask1Tex105_g578;
				#elif defined( _COLORMASK1SOURCE_UVS )
				float staticSwitch184_g578 = smoothstepResult11_g578;
				#else
				float staticSwitch184_g578 = ColorMask1Tex105_g578;
				#endif
				float vertexToFrag16_g578 = input.ase_texcoord3.z;
				float lerpResult22_g578 = lerp( staticSwitch184_g578 , 1.0 , vertexToFrag16_g578);
				float ColorMask175_g578 = lerpResult22_g578;
				float3 lerpResult40_g578 = lerp( Color1B121_g578 , Color1A118_g578 , ColorMask175_g578);
				float3 Color145_g578 = lerpResult40_g578;
				float3 Color2B123_g578 = _Color2B;
				float3 Color2A122_g578 = _Color2A;
				float3 lerpResult39_g578 = lerp( Color2B123_g578 , Color2A122_g578 , ColorMask175_g578);
				float3 Color244_g578 = lerpResult39_g578;
				float3 gammaToLinear84_g578 = FastSRGBToLinear( input.ase_color.rgb );
				float VC_R86_g578 = (gammaToLinear84_g578).x;
				float ColorMask2Start117_g578 = _ColorMask2Start;
				float ColorMask2StartOffset110_g578 = _ColorMask2StartOffset;
				float MaskNoiseSharpMin111_g578 = _MaskNoiseSharpMin;
				float MaskNoiseSharpMax112_g578 = _MaskNoiseSharpMax;
				float vertexToFrag88_g578 = input.ase_texcoord3.w;
				float smoothstepResult25_g578 = smoothstep( MaskNoiseSharpMin111_g578 , MaskNoiseSharpMax112_g578 , vertexToFrag88_g578);
				#if defined( _COLORS_TWO )
				float staticSwitch172_g578 = 0.0;
				#elif defined( _COLORS_FOUR )
				float staticSwitch172_g578 = smoothstepResult25_g578;
				#else
				float staticSwitch172_g578 = 0.0;
				#endif
				float ColorMaskSharpNoise27_g578 = staticSwitch172_g578;
				float ColorMask2End124_g578 = _ColorMask2End;
				float ColorMask2AlphaOffset126_g578 = _ColorMask2AlphaOffset;
				float ColorMask2Alpha127_g578 = _ColorMask2Alpha;
				float ColorMask2Opacity_F148_g578 = saturate( ( ( ColorMask2AlphaOffset126_g578 * ColorMaskSharpNoise27_g578 ) + ColorMask2Alpha127_g578 ) );
				float lerpResult158_g578 = lerp( 0.0 , saturate(  (0.0 + ( VC_R86_g578 - saturate( ( ColorMask2Start117_g578 + ( ColorMask2StartOffset110_g578 * ColorMaskSharpNoise27_g578 ) ) ) ) * ( 1.0 - 0.0 ) / ( ColorMask2End124_g578 - saturate( ( ColorMask2Start117_g578 + ( ColorMask2StartOffset110_g578 * ColorMaskSharpNoise27_g578 ) ) ) ) ) ) , ColorMask2Opacity_F148_g578);
				#if defined( _COLORBLENDAXIS_Y )
				float staticSwitch160_g578 = lerpResult158_g578;
				#elif defined( _COLORBLENDAXIS_XZ )
				float staticSwitch160_g578 = ( ColorMask2Opacity_F148_g578 * ColorMaskSharpNoise27_g578 );
				#else
				float staticSwitch160_g578 = lerpResult158_g578;
				#endif
				#if defined( _COLORS_TWO )
				float staticSwitch170_g578 = 0.0;
				#elif defined( _COLORS_FOUR )
				float staticSwitch170_g578 = staticSwitch160_g578;
				#else
				float staticSwitch170_g578 = 0.0;
				#endif
				float ColorMask2145_g578 = staticSwitch170_g578;
				float3 lerpResult56_g578 = lerp( Color145_g578 , Color244_g578 , ColorMask2145_g578);
				#if defined( _COLORS_TWO )
				float3 staticSwitch168_g578 = Color145_g578;
				#elif defined( _COLORS_FOUR )
				float3 staticSwitch168_g578 = lerpResult56_g578;
				#else
				float3 staticSwitch168_g578 = Color145_g578;
				#endif
				float4 Albedo166_g578 = ( AlbedoTex129_g578 * float4( staticSwitch168_g578 , 0.0 ) );
				float4 Albedo139_g578 = Albedo166_g578;
				float ColorMask1139_g578 = ColorMask175_g578;
				float ColorMask2139_g578 = ColorMask2145_g578;
				float MaskNoise139_g578 = ColorMaskSharpNoise27_g578;
				float4 localDebug139_g578 = Debug139_g578( Debug_Target139_g578 , Albedo139_g578 , ColorMask1139_g578 , ColorMask2139_g578 , MaskNoise139_g578 );
				

				float3 BaseColor = localDebug139_g578.xyz;
				float3 Emission = 0;
				float Alpha = tex2DNode128_g578.a;
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
			#define ASE_TRANSLUCENCY 1
			#define _NORMALMAP 1
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
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _COLORS_TWO _COLORS_FOUR
			#pragma shader_feature_local _COLORMASK1SOURCE_TEXTURE _COLORMASK1SOURCE_UVS
			#pragma shader_feature_local _COLORBLENDAXIS_Y _COLORBLENDAXIS_XZ


			struct Attributes
			{
				float4 positionOS : POSITION;
				half3 normalOS : NORMAL;
				half4 tangentOS : TANGENT;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _SSColor;
			float3 _Color1B;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color2A;
			float _Debug;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask1FadeStart;
			float _ColorMask1FadeEnd;
			float _ColorMask2Start;
			float _ColorMask2StartOffset;
			float _MaskNoiseSharpMin;
			float _MaskNoiseSharpMax;
			float _MaskNoiseTiling;
			float _ColorMask2End;
			float _ColorMask2AlphaOffset;
			float _ColorMask2Alpha;
			float _NormalScale;
			float _Metallic;
			float _Smoothness;
			float _AlphaCutoff;
			half _MMObjectHeightSource;
			half _GVBendingScale;
			half _MMObjectHeight;
			half _MMPhaseShiftSource;
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
			half _MMPhaseShiftScale;
			float _SubsurfaceScatering;
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

			float Nicrom_DM_AmpScale_Vegetation;
			float Nicrom_DM_Time_Vegetation;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Vegetation;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Vegetation;
			float Nicrom_MM_SpeedScale_Vegetation;
			float Nicrom_MM_BendScale_Vegetation;
			float Nicrom_MM_AmpScale_Vegetation;
			sampler2D _Albedo;
			sampler2D _ColorMask1;
			sampler2D _MaskNoise;


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
			
			float4 Debug139_g578( float Debug_Target, float4 Albedo, float ColorMask1, float ColorMask2, float MaskNoise )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1;
				else if(Debug_Target ==2)
				    return ColorMask2;
				else
				    return MaskNoise;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_TRANSFER_INSTANCE_ID( input, output );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float temp_output_23_0_g584 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g584 = (float3(cos( temp_output_23_0_g584 ) , 0.0 , sin( temp_output_23_0_g584 )));
				float3 DB_RotationAxis87_g582 = appendResult25_g584;
				float GV_AmplitudeScale175_g582 = _GVBendingScale;
				float lerpResult186_g582 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float DM_AmplitudeScale168_g582 = lerpResult186_g582;
				float DM1_Amplitude28_g582 = _DM1Amplitude;
				float3 objToWorld80_g592 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g582 = _GVTime;
				float lerpResult187_g582 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g582);
				float ApplicationIsPlaying241_g582 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g582 = lerp( _TimeParameters.x , lerpResult187_g582 , ApplicationIsPlaying241_g582);
				float DM_Time169_g582 = lerpResult256_g582;
				float Time90_g592 = DM_Time169_g582;
				float DM1_Speed29_g582 = _DM1Speed;
				float Speed45_g592 = DM1_Speed29_g582;
				float temp_output_244_0_g582 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g582 = lerp( temp_output_244_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult262_g582 = lerp( temp_output_244_0_g582 , lerpResult261_g582 , ApplicationIsPlaying241_g582);
				float DM_SpeedScale265_g582 = lerpResult262_g582;
				float SpeedScale95_g592 = DM_SpeedScale265_g582;
				float DM_PhaseShift91_g582 = input.ase_color.a;
				float PhaseShift48_g592 = DM_PhaseShift91_g582;
				float3 appendResult24_g584 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g582 = appendResult24_g584;
				float3 PivotPosOnYAxis56_g592 = DM_PivotPosOnYAxis88_g582;
				float DM1_FoliageLength32_g582 = _DM1FoliageLength;
				float3 rotatedValue29_g592 = RotateAroundAxis( PivotPosOnYAxis56_g592, input.positionOS.xyz, DB_RotationAxis87_g582, radians( ( ( ( DM_AmplitudeScale168_g582 * DM1_Amplitude28_g582 ) * sin( ( ( ( objToWorld80_g592.x + objToWorld80_g592.z ) + ( ( Time90_g592 * ( Speed45_g592 * SpeedScale95_g592 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g592 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g592 ) / DM1_FoliageLength32_g582 ) ) ) );
				float DM1_MotionMask89_g582 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g582 = ( ( rotatedValue29_g592 - input.positionOS.xyz ) * DM1_MotionMask89_g582 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g582 = DM1_VertexOffset231_g582;
				#else
				float3 staticSwitch104_g582 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g582 = _DM2Amplitude;
				float Amplitude58_g593 = DM2_Amplitude30_g582;
				float3 LocalPivot159_g582 = float3( 0,0,0 );
				float3 PivotPoint49_g593 = LocalPivot159_g582;
				float3 objToWorld53_g593 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g593, 1 ) ).xyz;
				float Time87_g593 = DM_Time169_g582;
				float SpeedScale93_g593 = DM_SpeedScale265_g582;
				float DM2_Speed31_g582 = _DM2Speed;
				float Speed41_g593 = DM2_Speed31_g582;
				float PhaseShift54_g593 = DM_PhaseShift91_g582;
				float3 break52_g593 = PivotPoint49_g593;
				float3 appendResult20_g593 = (float3(break52_g593.x , input.positionOS.xyz.y , break52_g593.z));
				float DM2_ObjectRadius33_g582 = _DM2ObjectRadius;
				float ObjectRadius60_g593 = DM2_ObjectRadius33_g582;
				float3 rotatedValue33_g593 = RotateAroundAxis( PivotPoint49_g593, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g582 * Amplitude58_g593 ) * sin( ( ( ( objToWorld53_g593.x + objToWorld53_g593.z ) + ( ( Time87_g593 * ( SpeedScale93_g593 * Speed41_g593 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g593 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g593 ) / ObjectRadius60_g593 ) ) ) );
				float DM2_MotionMask90_g582 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g593 = DM2_MotionMask90_g582;
				float3 DM2_VertexOffset232_g582 = ( ( rotatedValue33_g593 - input.positionOS.xyz ) * BendingMask62_g593 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g582 = DM2_VertexOffset232_g582;
				#else
				float3 staticSwitch103_g582 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g582 = ( staticSwitch104_g582 + staticSwitch103_g582 );
				float lerpResult56_g590 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g582 = lerpResult56_g590;
				float MM_DirShift59_g582 = _MMDirectionShift;
				float MM_DirShiftOffset60_g582 = _MMDirectionShiftOffset;
				float3 objToWorld11_g587 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float2 appendResult10_g587 = (float2(objToWorld11_g587.x , objToWorld11_g587.z));
				float MotionNoiseTiling20_g582 = _MotionNoiseTiling;
				float4 temp_output_73_0_g582 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g587 * MotionNoiseTiling20_g582 ), 0, 0.0) );
				float4 StaticWorldNoise78_g582 = temp_output_73_0_g582;
				float4 StaticWorldNoise55_g586 = StaticWorldNoise78_g582;
				float3 objToWorld50_g586 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float lerpResult182_g582 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g582);
				float lerpResult246_g582 = lerp( _TimeParameters.x , lerpResult182_g582 , ApplicationIsPlaying241_g582);
				float MM_Time13_g582 = lerpResult246_g582;
				float Time76_g586 = MM_Time13_g582;
				float temp_output_243_0_g582 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g582 = lerp( temp_output_243_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult249_g582 = lerp( temp_output_243_0_g582 , lerpResult245_g582 , ApplicationIsPlaying241_g582);
				float MM_SpeedScale253_g582 = lerpResult249_g582;
				float SpeedScale_RA80_g586 = MM_SpeedScale253_g582;
				float MM_DirShiftSpeed56_g582 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g582 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g586 = radians( ( ( MM_DirAngle51_g582 + ( ( MM_DirShift59_g582 + ( MM_DirShiftOffset60_g582 * (StaticWorldNoise55_g586).x ) ) * sin( ( ( objToWorld50_g586.x + objToWorld50_g586.z ) + ( ( Time76_g586 * ( SpeedScale_RA80_g586 * MM_DirShiftSpeed56_g582 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g586).z * MM_DirShiftNoiseScale57_g582 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g586 = (float3(cos( temp_output_11_0_g586 ) , 0.0 , sin( temp_output_11_0_g586 )));
				float3 worldToObj35_g586 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g586, 1 ) ).xyz;
				float3 worldToObj36_g586 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g586 = normalize( (( worldToObj35_g586 - worldToObj36_g586 )).xyz );
				float3 MB_RotationAxis129_g582 = normalizeResult34_g586;
				float3 RotationAxis56_g585 = MB_RotationAxis129_g582;
				float4 StaticWorldNoise31_g591 = StaticWorldNoise78_g582;
				float MM_BendingOfset37_g582 = _MMBendingOffset;
				float MM_Bending35_g582 = _MMBending;
				float GV_BendingScale176_g582 = _GVAmplitudeScale;
				float lerpResult188_g582 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g582);
				float MM_BendingScale17_g582 = lerpResult188_g582;
				float MM_AmplitudeOffset52_g582 = _MMAmplitudeOffset;
				float MM_Amplitude66_g582 = _MMAmplitude;
				float lerpResult189_g582 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float MM_AmplitudeScale15_g582 = lerpResult189_g582;
				float3 objToWorld170_g591 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g591 = MM_Time13_g582;
				float MM_Speed53_g582 = _MMSpeed;
				float Speed125_g591 = MM_Speed53_g582;
				float SpeedScale_RotAng201_g591 = MM_SpeedScale253_g582;
				float MM_SineWaveLength58_g582 = _MMSineWaveLength;
				float WaveLength63_g591 = MM_SineWaveLength58_g582;
				float MM_PhaseShiftSource207_g582 = _MMPhaseShiftSource;
				float lerpResult154_g582 = lerp( input.ase_color.a , (StaticWorldNoise78_g582).g , MM_PhaseShiftSource207_g582);
				float MM_PhaseShiftScale39_g582 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g582 = ( lerpResult154_g582 * MM_PhaseShiftScale39_g582 );
				float PhaseShift127_g591 = MB_PhaseShift79_g582;
				float temp_output_20_0_g591 = sin( ( ( ( objToWorld170_g591.x + objToWorld170_g591.z ) + ( ( Time167_g591 * ( ( Speed125_g591 * SpeedScale_RotAng201_g591 ) * WaveLength63_g591 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g591 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g591 ) ) );
				float MM_MaxHeight55_g582 = _MMObjectHeight;
				float3 gammaToLinear56_g591 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g582 = _MMObjectHeightSource;
				float lerpResult57_g591 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g582 ) , (gammaToLinear56_g591).x , MM_ObjectHeightSource54_g582);
				float BendingMask189_g591 = lerpResult57_g591;
				float MB_RotationAngle130_g582 = radians( ( ( ( ( ( (StaticWorldNoise31_g591).y * MM_BendingOfset37_g582 ) + MM_Bending35_g582 ) * MM_BendingScale17_g582 ) + ( ( ( ( (StaticWorldNoise31_g591).x * MM_AmplitudeOffset52_g582 ) + MM_Amplitude66_g582 ) * MM_AmplitudeScale15_g582 ) * temp_output_20_0_g591 ) ) * BendingMask189_g591 ) );
				float RotationAngle54_g585 = MB_RotationAngle130_g582;
				float3 LocalPivotPos60_g585 = LocalPivot159_g582;
				float3 break62_g585 = LocalPivotPos60_g585;
				float VertexPos_Y67_g585 = input.positionOS.xyz.y;
				float3 appendResult45_g585 = (float3(break62_g585.x , VertexPos_Y67_g585 , break62_g585.z));
				float3 VertexPos66_g585 = input.positionOS.xyz;
				float3 rotatedValue30_g585 = RotateAroundAxis( appendResult45_g585, VertexPos66_g585, RotationAxis56_g585, RotationAngle54_g585 );
				float3 DetailMotionVO73_g585 = DM_VertexOffset128_g582;
				float3 rotatedValue34_g585 = RotateAroundAxis( LocalPivotPos60_g585, ( rotatedValue30_g585 + DetailMotionVO73_g585 ), RotationAxis56_g585, RotationAngle54_g585 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g582 = ( ( rotatedValue34_g585 - VertexPos66_g585 ) * step( 0.01 , VertexPos_Y67_g585 ) );
				#else
				float3 staticSwitch205_g582 = DM_VertexOffset128_g582;
				#endif
				
				float ColorMask1FadeStart100_g578 = _ColorMask1FadeStart;
				float ColorMask1FadeEnd101_g578 = _ColorMask1FadeEnd;
				float3 gammaToLinear84_g578 = FastSRGBToLinear( input.ase_color.rgb );
				float VC_R86_g578 = (gammaToLinear84_g578).x;
				float smoothstepResult13_g578 = smoothstep( ColorMask1FadeStart100_g578 , ColorMask1FadeEnd101_g578 , VC_R86_g578);
				float vertexToFrag16_g578 = smoothstepResult13_g578;
				output.ase_texcoord1.z = vertexToFrag16_g578;
				float3 objToWorld78_g578 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float2 appendResult79_g578 = (float2(objToWorld78_g578.x , objToWorld78_g578.z));
				float MaskNoiseTiling93_g578 = _MaskNoiseTiling;
				float vertexToFrag88_g578 = (tex2Dlod( _MaskNoise, float4( ( appendResult79_g578 * MaskNoiseTiling93_g578 ), 0, 0.0) )).r;
				output.ase_texcoord1.w = vertexToFrag88_g578;
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				output.ase_color = input.ase_color;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g582;

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

				float Debug_Target139_g578 = _Debug;
				float2 uv_Albedo128_g578 = input.ase_texcoord1.xy;
				float4 tex2DNode128_g578 = tex2D( _Albedo, uv_Albedo128_g578 );
				float4 AlbedoTex129_g578 = tex2DNode128_g578;
				float3 Color1B121_g578 = _Color1B;
				float3 Color1A118_g578 = _Color1A;
				float2 uv_ColorMask1103_g578 = input.ase_texcoord1.xy;
				float ColorMask1Tex105_g578 = tex2D( _ColorMask1, uv_ColorMask1103_g578 ).r;
				float ColorMask1End98_g578 = _ColorMask1End;
				float ColorMask1Start99_g578 = _ColorMask1Start;
				float2 texCoord74_g578 = input.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult11_g578 = smoothstep( ColorMask1End98_g578 , ColorMask1Start99_g578 , ( 1.0 - ( texCoord74_g578.y - 2.0 ) ));
				#if defined( _COLORMASK1SOURCE_TEXTURE )
				float staticSwitch184_g578 = ColorMask1Tex105_g578;
				#elif defined( _COLORMASK1SOURCE_UVS )
				float staticSwitch184_g578 = smoothstepResult11_g578;
				#else
				float staticSwitch184_g578 = ColorMask1Tex105_g578;
				#endif
				float vertexToFrag16_g578 = input.ase_texcoord1.z;
				float lerpResult22_g578 = lerp( staticSwitch184_g578 , 1.0 , vertexToFrag16_g578);
				float ColorMask175_g578 = lerpResult22_g578;
				float3 lerpResult40_g578 = lerp( Color1B121_g578 , Color1A118_g578 , ColorMask175_g578);
				float3 Color145_g578 = lerpResult40_g578;
				float3 Color2B123_g578 = _Color2B;
				float3 Color2A122_g578 = _Color2A;
				float3 lerpResult39_g578 = lerp( Color2B123_g578 , Color2A122_g578 , ColorMask175_g578);
				float3 Color244_g578 = lerpResult39_g578;
				float3 gammaToLinear84_g578 = FastSRGBToLinear( input.ase_color.rgb );
				float VC_R86_g578 = (gammaToLinear84_g578).x;
				float ColorMask2Start117_g578 = _ColorMask2Start;
				float ColorMask2StartOffset110_g578 = _ColorMask2StartOffset;
				float MaskNoiseSharpMin111_g578 = _MaskNoiseSharpMin;
				float MaskNoiseSharpMax112_g578 = _MaskNoiseSharpMax;
				float vertexToFrag88_g578 = input.ase_texcoord1.w;
				float smoothstepResult25_g578 = smoothstep( MaskNoiseSharpMin111_g578 , MaskNoiseSharpMax112_g578 , vertexToFrag88_g578);
				#if defined( _COLORS_TWO )
				float staticSwitch172_g578 = 0.0;
				#elif defined( _COLORS_FOUR )
				float staticSwitch172_g578 = smoothstepResult25_g578;
				#else
				float staticSwitch172_g578 = 0.0;
				#endif
				float ColorMaskSharpNoise27_g578 = staticSwitch172_g578;
				float ColorMask2End124_g578 = _ColorMask2End;
				float ColorMask2AlphaOffset126_g578 = _ColorMask2AlphaOffset;
				float ColorMask2Alpha127_g578 = _ColorMask2Alpha;
				float ColorMask2Opacity_F148_g578 = saturate( ( ( ColorMask2AlphaOffset126_g578 * ColorMaskSharpNoise27_g578 ) + ColorMask2Alpha127_g578 ) );
				float lerpResult158_g578 = lerp( 0.0 , saturate(  (0.0 + ( VC_R86_g578 - saturate( ( ColorMask2Start117_g578 + ( ColorMask2StartOffset110_g578 * ColorMaskSharpNoise27_g578 ) ) ) ) * ( 1.0 - 0.0 ) / ( ColorMask2End124_g578 - saturate( ( ColorMask2Start117_g578 + ( ColorMask2StartOffset110_g578 * ColorMaskSharpNoise27_g578 ) ) ) ) ) ) , ColorMask2Opacity_F148_g578);
				#if defined( _COLORBLENDAXIS_Y )
				float staticSwitch160_g578 = lerpResult158_g578;
				#elif defined( _COLORBLENDAXIS_XZ )
				float staticSwitch160_g578 = ( ColorMask2Opacity_F148_g578 * ColorMaskSharpNoise27_g578 );
				#else
				float staticSwitch160_g578 = lerpResult158_g578;
				#endif
				#if defined( _COLORS_TWO )
				float staticSwitch170_g578 = 0.0;
				#elif defined( _COLORS_FOUR )
				float staticSwitch170_g578 = staticSwitch160_g578;
				#else
				float staticSwitch170_g578 = 0.0;
				#endif
				float ColorMask2145_g578 = staticSwitch170_g578;
				float3 lerpResult56_g578 = lerp( Color145_g578 , Color244_g578 , ColorMask2145_g578);
				#if defined( _COLORS_TWO )
				float3 staticSwitch168_g578 = Color145_g578;
				#elif defined( _COLORS_FOUR )
				float3 staticSwitch168_g578 = lerpResult56_g578;
				#else
				float3 staticSwitch168_g578 = Color145_g578;
				#endif
				float4 Albedo166_g578 = ( AlbedoTex129_g578 * float4( staticSwitch168_g578 , 0.0 ) );
				float4 Albedo139_g578 = Albedo166_g578;
				float ColorMask1139_g578 = ColorMask175_g578;
				float ColorMask2139_g578 = ColorMask2145_g578;
				float MaskNoise139_g578 = ColorMaskSharpNoise27_g578;
				float4 localDebug139_g578 = Debug139_g578( Debug_Target139_g578 , Albedo139_g578 , ColorMask1139_g578 , ColorMask2139_g578 , MaskNoise139_g578 );
				

				float3 BaseColor = localDebug139_g578.xyz;
				float Alpha = tex2DNode128_g578.a;
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
			Tags { "LightMode"="DepthNormalsOnly" }

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
			#define ASE_TRANSLUCENCY 1
			#define _NORMALMAP 1
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
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON


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
			float4 _SSColor;
			float3 _Color1B;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color2A;
			float _Debug;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask1FadeStart;
			float _ColorMask1FadeEnd;
			float _ColorMask2Start;
			float _ColorMask2StartOffset;
			float _MaskNoiseSharpMin;
			float _MaskNoiseSharpMax;
			float _MaskNoiseTiling;
			float _ColorMask2End;
			float _ColorMask2AlphaOffset;
			float _ColorMask2Alpha;
			float _NormalScale;
			float _Metallic;
			float _Smoothness;
			float _AlphaCutoff;
			half _MMObjectHeightSource;
			half _GVBendingScale;
			half _MMObjectHeight;
			half _MMPhaseShiftSource;
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
			half _MMPhaseShiftScale;
			float _SubsurfaceScatering;
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

			float Nicrom_DM_AmpScale_Vegetation;
			float Nicrom_DM_Time_Vegetation;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Vegetation;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Vegetation;
			float Nicrom_MM_SpeedScale_Vegetation;
			float Nicrom_MM_BendScale_Vegetation;
			float Nicrom_MM_AmpScale_Vegetation;
			sampler2D _Normal;
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
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g584 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g584 = (float3(cos( temp_output_23_0_g584 ) , 0.0 , sin( temp_output_23_0_g584 )));
				float3 DB_RotationAxis87_g582 = appendResult25_g584;
				float GV_AmplitudeScale175_g582 = _GVBendingScale;
				float lerpResult186_g582 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float DM_AmplitudeScale168_g582 = lerpResult186_g582;
				float DM1_Amplitude28_g582 = _DM1Amplitude;
				float3 objToWorld80_g592 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g582 = _GVTime;
				float lerpResult187_g582 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g582);
				float ApplicationIsPlaying241_g582 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g582 = lerp( _TimeParameters.x , lerpResult187_g582 , ApplicationIsPlaying241_g582);
				float DM_Time169_g582 = lerpResult256_g582;
				float Time90_g592 = DM_Time169_g582;
				float DM1_Speed29_g582 = _DM1Speed;
				float Speed45_g592 = DM1_Speed29_g582;
				float temp_output_244_0_g582 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g582 = lerp( temp_output_244_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult262_g582 = lerp( temp_output_244_0_g582 , lerpResult261_g582 , ApplicationIsPlaying241_g582);
				float DM_SpeedScale265_g582 = lerpResult262_g582;
				float SpeedScale95_g592 = DM_SpeedScale265_g582;
				float DM_PhaseShift91_g582 = input.ase_color.a;
				float PhaseShift48_g592 = DM_PhaseShift91_g582;
				float3 appendResult24_g584 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g582 = appendResult24_g584;
				float3 PivotPosOnYAxis56_g592 = DM_PivotPosOnYAxis88_g582;
				float DM1_FoliageLength32_g582 = _DM1FoliageLength;
				float3 rotatedValue29_g592 = RotateAroundAxis( PivotPosOnYAxis56_g592, input.positionOS.xyz, DB_RotationAxis87_g582, radians( ( ( ( DM_AmplitudeScale168_g582 * DM1_Amplitude28_g582 ) * sin( ( ( ( objToWorld80_g592.x + objToWorld80_g592.z ) + ( ( Time90_g592 * ( Speed45_g592 * SpeedScale95_g592 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g592 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g592 ) / DM1_FoliageLength32_g582 ) ) ) );
				float DM1_MotionMask89_g582 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g582 = ( ( rotatedValue29_g592 - input.positionOS.xyz ) * DM1_MotionMask89_g582 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g582 = DM1_VertexOffset231_g582;
				#else
				float3 staticSwitch104_g582 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g582 = _DM2Amplitude;
				float Amplitude58_g593 = DM2_Amplitude30_g582;
				float3 LocalPivot159_g582 = float3( 0,0,0 );
				float3 PivotPoint49_g593 = LocalPivot159_g582;
				float3 objToWorld53_g593 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g593, 1 ) ).xyz;
				float Time87_g593 = DM_Time169_g582;
				float SpeedScale93_g593 = DM_SpeedScale265_g582;
				float DM2_Speed31_g582 = _DM2Speed;
				float Speed41_g593 = DM2_Speed31_g582;
				float PhaseShift54_g593 = DM_PhaseShift91_g582;
				float3 break52_g593 = PivotPoint49_g593;
				float3 appendResult20_g593 = (float3(break52_g593.x , input.positionOS.xyz.y , break52_g593.z));
				float DM2_ObjectRadius33_g582 = _DM2ObjectRadius;
				float ObjectRadius60_g593 = DM2_ObjectRadius33_g582;
				float3 rotatedValue33_g593 = RotateAroundAxis( PivotPoint49_g593, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g582 * Amplitude58_g593 ) * sin( ( ( ( objToWorld53_g593.x + objToWorld53_g593.z ) + ( ( Time87_g593 * ( SpeedScale93_g593 * Speed41_g593 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g593 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g593 ) / ObjectRadius60_g593 ) ) ) );
				float DM2_MotionMask90_g582 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g593 = DM2_MotionMask90_g582;
				float3 DM2_VertexOffset232_g582 = ( ( rotatedValue33_g593 - input.positionOS.xyz ) * BendingMask62_g593 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g582 = DM2_VertexOffset232_g582;
				#else
				float3 staticSwitch103_g582 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g582 = ( staticSwitch104_g582 + staticSwitch103_g582 );
				float lerpResult56_g590 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g582 = lerpResult56_g590;
				float MM_DirShift59_g582 = _MMDirectionShift;
				float MM_DirShiftOffset60_g582 = _MMDirectionShiftOffset;
				float3 objToWorld11_g587 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float2 appendResult10_g587 = (float2(objToWorld11_g587.x , objToWorld11_g587.z));
				float MotionNoiseTiling20_g582 = _MotionNoiseTiling;
				float4 temp_output_73_0_g582 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g587 * MotionNoiseTiling20_g582 ), 0, 0.0) );
				float4 StaticWorldNoise78_g582 = temp_output_73_0_g582;
				float4 StaticWorldNoise55_g586 = StaticWorldNoise78_g582;
				float3 objToWorld50_g586 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float lerpResult182_g582 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g582);
				float lerpResult246_g582 = lerp( _TimeParameters.x , lerpResult182_g582 , ApplicationIsPlaying241_g582);
				float MM_Time13_g582 = lerpResult246_g582;
				float Time76_g586 = MM_Time13_g582;
				float temp_output_243_0_g582 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g582 = lerp( temp_output_243_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult249_g582 = lerp( temp_output_243_0_g582 , lerpResult245_g582 , ApplicationIsPlaying241_g582);
				float MM_SpeedScale253_g582 = lerpResult249_g582;
				float SpeedScale_RA80_g586 = MM_SpeedScale253_g582;
				float MM_DirShiftSpeed56_g582 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g582 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g586 = radians( ( ( MM_DirAngle51_g582 + ( ( MM_DirShift59_g582 + ( MM_DirShiftOffset60_g582 * (StaticWorldNoise55_g586).x ) ) * sin( ( ( objToWorld50_g586.x + objToWorld50_g586.z ) + ( ( Time76_g586 * ( SpeedScale_RA80_g586 * MM_DirShiftSpeed56_g582 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g586).z * MM_DirShiftNoiseScale57_g582 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g586 = (float3(cos( temp_output_11_0_g586 ) , 0.0 , sin( temp_output_11_0_g586 )));
				float3 worldToObj35_g586 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g586, 1 ) ).xyz;
				float3 worldToObj36_g586 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g586 = normalize( (( worldToObj35_g586 - worldToObj36_g586 )).xyz );
				float3 MB_RotationAxis129_g582 = normalizeResult34_g586;
				float3 RotationAxis56_g585 = MB_RotationAxis129_g582;
				float4 StaticWorldNoise31_g591 = StaticWorldNoise78_g582;
				float MM_BendingOfset37_g582 = _MMBendingOffset;
				float MM_Bending35_g582 = _MMBending;
				float GV_BendingScale176_g582 = _GVAmplitudeScale;
				float lerpResult188_g582 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g582);
				float MM_BendingScale17_g582 = lerpResult188_g582;
				float MM_AmplitudeOffset52_g582 = _MMAmplitudeOffset;
				float MM_Amplitude66_g582 = _MMAmplitude;
				float lerpResult189_g582 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float MM_AmplitudeScale15_g582 = lerpResult189_g582;
				float3 objToWorld170_g591 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g591 = MM_Time13_g582;
				float MM_Speed53_g582 = _MMSpeed;
				float Speed125_g591 = MM_Speed53_g582;
				float SpeedScale_RotAng201_g591 = MM_SpeedScale253_g582;
				float MM_SineWaveLength58_g582 = _MMSineWaveLength;
				float WaveLength63_g591 = MM_SineWaveLength58_g582;
				float MM_PhaseShiftSource207_g582 = _MMPhaseShiftSource;
				float lerpResult154_g582 = lerp( input.ase_color.a , (StaticWorldNoise78_g582).g , MM_PhaseShiftSource207_g582);
				float MM_PhaseShiftScale39_g582 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g582 = ( lerpResult154_g582 * MM_PhaseShiftScale39_g582 );
				float PhaseShift127_g591 = MB_PhaseShift79_g582;
				float temp_output_20_0_g591 = sin( ( ( ( objToWorld170_g591.x + objToWorld170_g591.z ) + ( ( Time167_g591 * ( ( Speed125_g591 * SpeedScale_RotAng201_g591 ) * WaveLength63_g591 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g591 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g591 ) ) );
				float MM_MaxHeight55_g582 = _MMObjectHeight;
				float3 gammaToLinear56_g591 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g582 = _MMObjectHeightSource;
				float lerpResult57_g591 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g582 ) , (gammaToLinear56_g591).x , MM_ObjectHeightSource54_g582);
				float BendingMask189_g591 = lerpResult57_g591;
				float MB_RotationAngle130_g582 = radians( ( ( ( ( ( (StaticWorldNoise31_g591).y * MM_BendingOfset37_g582 ) + MM_Bending35_g582 ) * MM_BendingScale17_g582 ) + ( ( ( ( (StaticWorldNoise31_g591).x * MM_AmplitudeOffset52_g582 ) + MM_Amplitude66_g582 ) * MM_AmplitudeScale15_g582 ) * temp_output_20_0_g591 ) ) * BendingMask189_g591 ) );
				float RotationAngle54_g585 = MB_RotationAngle130_g582;
				float3 LocalPivotPos60_g585 = LocalPivot159_g582;
				float3 break62_g585 = LocalPivotPos60_g585;
				float VertexPos_Y67_g585 = input.positionOS.xyz.y;
				float3 appendResult45_g585 = (float3(break62_g585.x , VertexPos_Y67_g585 , break62_g585.z));
				float3 VertexPos66_g585 = input.positionOS.xyz;
				float3 rotatedValue30_g585 = RotateAroundAxis( appendResult45_g585, VertexPos66_g585, RotationAxis56_g585, RotationAngle54_g585 );
				float3 DetailMotionVO73_g585 = DM_VertexOffset128_g582;
				float3 rotatedValue34_g585 = RotateAroundAxis( LocalPivotPos60_g585, ( rotatedValue30_g585 + DetailMotionVO73_g585 ), RotationAxis56_g585, RotationAngle54_g585 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g582 = ( ( rotatedValue34_g585 - VertexPos66_g585 ) * step( 0.01 , VertexPos_Y67_g585 ) );
				#else
				float3 staticSwitch205_g582 = DM_VertexOffset128_g582;
				#endif
				
				output.ase_texcoord3.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g582;

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

				float2 uv_Normal196_g578 = input.ase_texcoord3.xy;
				float3 unpack196_g578 = UnpackNormalScale( tex2D( _Normal, uv_Normal196_g578 ), _NormalScale );
				unpack196_g578.z = lerp( 1, unpack196_g578.z, saturate(_NormalScale) );
				
				float2 uv_Albedo128_g578 = input.ase_texcoord3.xy;
				float4 tex2DNode128_g578 = tex2D( _Albedo, uv_Albedo128_g578 );
				

				float3 Normal = unpack196_g578;
				float Alpha = tex2DNode128_g578.a;
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
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			#pragma multi_compile_local _ALPHATEST_ON
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_TRANSLUCENCY 1
			#define _NORMALMAP 1
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
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON


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
			float4 _SSColor;
			float3 _Color1B;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color2A;
			float _Debug;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask1FadeStart;
			float _ColorMask1FadeEnd;
			float _ColorMask2Start;
			float _ColorMask2StartOffset;
			float _MaskNoiseSharpMin;
			float _MaskNoiseSharpMax;
			float _MaskNoiseTiling;
			float _ColorMask2End;
			float _ColorMask2AlphaOffset;
			float _ColorMask2Alpha;
			float _NormalScale;
			float _Metallic;
			float _Smoothness;
			float _AlphaCutoff;
			half _MMObjectHeightSource;
			half _GVBendingScale;
			half _MMObjectHeight;
			half _MMPhaseShiftSource;
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
			half _MMPhaseShiftScale;
			float _SubsurfaceScatering;
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

			float Nicrom_DM_AmpScale_Vegetation;
			float Nicrom_DM_Time_Vegetation;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Vegetation;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Vegetation;
			float Nicrom_MM_SpeedScale_Vegetation;
			float Nicrom_MM_BendScale_Vegetation;
			float Nicrom_MM_AmpScale_Vegetation;
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

				float temp_output_23_0_g584 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g584 = (float3(cos( temp_output_23_0_g584 ) , 0.0 , sin( temp_output_23_0_g584 )));
				float3 DB_RotationAxis87_g582 = appendResult25_g584;
				float GV_AmplitudeScale175_g582 = _GVBendingScale;
				float lerpResult186_g582 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float DM_AmplitudeScale168_g582 = lerpResult186_g582;
				float DM1_Amplitude28_g582 = _DM1Amplitude;
				float3 objToWorld80_g592 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g582 = _GVTime;
				float lerpResult187_g582 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g582);
				float ApplicationIsPlaying241_g582 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g582 = lerp( _TimeParameters.x , lerpResult187_g582 , ApplicationIsPlaying241_g582);
				float DM_Time169_g582 = lerpResult256_g582;
				float Time90_g592 = DM_Time169_g582;
				float DM1_Speed29_g582 = _DM1Speed;
				float Speed45_g592 = DM1_Speed29_g582;
				float temp_output_244_0_g582 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g582 = lerp( temp_output_244_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult262_g582 = lerp( temp_output_244_0_g582 , lerpResult261_g582 , ApplicationIsPlaying241_g582);
				float DM_SpeedScale265_g582 = lerpResult262_g582;
				float SpeedScale95_g592 = DM_SpeedScale265_g582;
				float DM_PhaseShift91_g582 = input.ase_color.a;
				float PhaseShift48_g592 = DM_PhaseShift91_g582;
				float3 appendResult24_g584 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g582 = appendResult24_g584;
				float3 PivotPosOnYAxis56_g592 = DM_PivotPosOnYAxis88_g582;
				float DM1_FoliageLength32_g582 = _DM1FoliageLength;
				float3 rotatedValue29_g592 = RotateAroundAxis( PivotPosOnYAxis56_g592, input.positionOS.xyz, DB_RotationAxis87_g582, radians( ( ( ( DM_AmplitudeScale168_g582 * DM1_Amplitude28_g582 ) * sin( ( ( ( objToWorld80_g592.x + objToWorld80_g592.z ) + ( ( Time90_g592 * ( Speed45_g592 * SpeedScale95_g592 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g592 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g592 ) / DM1_FoliageLength32_g582 ) ) ) );
				float DM1_MotionMask89_g582 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g582 = ( ( rotatedValue29_g592 - input.positionOS.xyz ) * DM1_MotionMask89_g582 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g582 = DM1_VertexOffset231_g582;
				#else
				float3 staticSwitch104_g582 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g582 = _DM2Amplitude;
				float Amplitude58_g593 = DM2_Amplitude30_g582;
				float3 LocalPivot159_g582 = float3( 0,0,0 );
				float3 PivotPoint49_g593 = LocalPivot159_g582;
				float3 objToWorld53_g593 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g593, 1 ) ).xyz;
				float Time87_g593 = DM_Time169_g582;
				float SpeedScale93_g593 = DM_SpeedScale265_g582;
				float DM2_Speed31_g582 = _DM2Speed;
				float Speed41_g593 = DM2_Speed31_g582;
				float PhaseShift54_g593 = DM_PhaseShift91_g582;
				float3 break52_g593 = PivotPoint49_g593;
				float3 appendResult20_g593 = (float3(break52_g593.x , input.positionOS.xyz.y , break52_g593.z));
				float DM2_ObjectRadius33_g582 = _DM2ObjectRadius;
				float ObjectRadius60_g593 = DM2_ObjectRadius33_g582;
				float3 rotatedValue33_g593 = RotateAroundAxis( PivotPoint49_g593, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g582 * Amplitude58_g593 ) * sin( ( ( ( objToWorld53_g593.x + objToWorld53_g593.z ) + ( ( Time87_g593 * ( SpeedScale93_g593 * Speed41_g593 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g593 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g593 ) / ObjectRadius60_g593 ) ) ) );
				float DM2_MotionMask90_g582 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g593 = DM2_MotionMask90_g582;
				float3 DM2_VertexOffset232_g582 = ( ( rotatedValue33_g593 - input.positionOS.xyz ) * BendingMask62_g593 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g582 = DM2_VertexOffset232_g582;
				#else
				float3 staticSwitch103_g582 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g582 = ( staticSwitch104_g582 + staticSwitch103_g582 );
				float lerpResult56_g590 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g582 = lerpResult56_g590;
				float MM_DirShift59_g582 = _MMDirectionShift;
				float MM_DirShiftOffset60_g582 = _MMDirectionShiftOffset;
				float3 objToWorld11_g587 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float2 appendResult10_g587 = (float2(objToWorld11_g587.x , objToWorld11_g587.z));
				float MotionNoiseTiling20_g582 = _MotionNoiseTiling;
				float4 temp_output_73_0_g582 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g587 * MotionNoiseTiling20_g582 ), 0, 0.0) );
				float4 StaticWorldNoise78_g582 = temp_output_73_0_g582;
				float4 StaticWorldNoise55_g586 = StaticWorldNoise78_g582;
				float3 objToWorld50_g586 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float lerpResult182_g582 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g582);
				float lerpResult246_g582 = lerp( _TimeParameters.x , lerpResult182_g582 , ApplicationIsPlaying241_g582);
				float MM_Time13_g582 = lerpResult246_g582;
				float Time76_g586 = MM_Time13_g582;
				float temp_output_243_0_g582 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g582 = lerp( temp_output_243_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult249_g582 = lerp( temp_output_243_0_g582 , lerpResult245_g582 , ApplicationIsPlaying241_g582);
				float MM_SpeedScale253_g582 = lerpResult249_g582;
				float SpeedScale_RA80_g586 = MM_SpeedScale253_g582;
				float MM_DirShiftSpeed56_g582 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g582 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g586 = radians( ( ( MM_DirAngle51_g582 + ( ( MM_DirShift59_g582 + ( MM_DirShiftOffset60_g582 * (StaticWorldNoise55_g586).x ) ) * sin( ( ( objToWorld50_g586.x + objToWorld50_g586.z ) + ( ( Time76_g586 * ( SpeedScale_RA80_g586 * MM_DirShiftSpeed56_g582 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g586).z * MM_DirShiftNoiseScale57_g582 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g586 = (float3(cos( temp_output_11_0_g586 ) , 0.0 , sin( temp_output_11_0_g586 )));
				float3 worldToObj35_g586 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g586, 1 ) ).xyz;
				float3 worldToObj36_g586 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g586 = normalize( (( worldToObj35_g586 - worldToObj36_g586 )).xyz );
				float3 MB_RotationAxis129_g582 = normalizeResult34_g586;
				float3 RotationAxis56_g585 = MB_RotationAxis129_g582;
				float4 StaticWorldNoise31_g591 = StaticWorldNoise78_g582;
				float MM_BendingOfset37_g582 = _MMBendingOffset;
				float MM_Bending35_g582 = _MMBending;
				float GV_BendingScale176_g582 = _GVAmplitudeScale;
				float lerpResult188_g582 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g582);
				float MM_BendingScale17_g582 = lerpResult188_g582;
				float MM_AmplitudeOffset52_g582 = _MMAmplitudeOffset;
				float MM_Amplitude66_g582 = _MMAmplitude;
				float lerpResult189_g582 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float MM_AmplitudeScale15_g582 = lerpResult189_g582;
				float3 objToWorld170_g591 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g591 = MM_Time13_g582;
				float MM_Speed53_g582 = _MMSpeed;
				float Speed125_g591 = MM_Speed53_g582;
				float SpeedScale_RotAng201_g591 = MM_SpeedScale253_g582;
				float MM_SineWaveLength58_g582 = _MMSineWaveLength;
				float WaveLength63_g591 = MM_SineWaveLength58_g582;
				float MM_PhaseShiftSource207_g582 = _MMPhaseShiftSource;
				float lerpResult154_g582 = lerp( input.ase_color.a , (StaticWorldNoise78_g582).g , MM_PhaseShiftSource207_g582);
				float MM_PhaseShiftScale39_g582 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g582 = ( lerpResult154_g582 * MM_PhaseShiftScale39_g582 );
				float PhaseShift127_g591 = MB_PhaseShift79_g582;
				float temp_output_20_0_g591 = sin( ( ( ( objToWorld170_g591.x + objToWorld170_g591.z ) + ( ( Time167_g591 * ( ( Speed125_g591 * SpeedScale_RotAng201_g591 ) * WaveLength63_g591 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g591 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g591 ) ) );
				float MM_MaxHeight55_g582 = _MMObjectHeight;
				float3 gammaToLinear56_g591 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g582 = _MMObjectHeightSource;
				float lerpResult57_g591 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g582 ) , (gammaToLinear56_g591).x , MM_ObjectHeightSource54_g582);
				float BendingMask189_g591 = lerpResult57_g591;
				float MB_RotationAngle130_g582 = radians( ( ( ( ( ( (StaticWorldNoise31_g591).y * MM_BendingOfset37_g582 ) + MM_Bending35_g582 ) * MM_BendingScale17_g582 ) + ( ( ( ( (StaticWorldNoise31_g591).x * MM_AmplitudeOffset52_g582 ) + MM_Amplitude66_g582 ) * MM_AmplitudeScale15_g582 ) * temp_output_20_0_g591 ) ) * BendingMask189_g591 ) );
				float RotationAngle54_g585 = MB_RotationAngle130_g582;
				float3 LocalPivotPos60_g585 = LocalPivot159_g582;
				float3 break62_g585 = LocalPivotPos60_g585;
				float VertexPos_Y67_g585 = input.positionOS.xyz.y;
				float3 appendResult45_g585 = (float3(break62_g585.x , VertexPos_Y67_g585 , break62_g585.z));
				float3 VertexPos66_g585 = input.positionOS.xyz;
				float3 rotatedValue30_g585 = RotateAroundAxis( appendResult45_g585, VertexPos66_g585, RotationAxis56_g585, RotationAngle54_g585 );
				float3 DetailMotionVO73_g585 = DM_VertexOffset128_g582;
				float3 rotatedValue34_g585 = RotateAroundAxis( LocalPivotPos60_g585, ( rotatedValue30_g585 + DetailMotionVO73_g585 ), RotationAxis56_g585, RotationAngle54_g585 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g582 = ( ( rotatedValue34_g585 - VertexPos66_g585 ) * step( 0.01 , VertexPos_Y67_g585 ) );
				#else
				float3 staticSwitch205_g582 = DM_VertexOffset128_g582;
				#endif
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g582;

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

				float2 uv_Albedo128_g578 = input.ase_texcoord1.xy;
				float4 tex2DNode128_g578 = tex2D( _Albedo, uv_Albedo128_g578 );
				

				surfaceDescription.Alpha = tex2DNode128_g578.a;
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
			#define ASE_TRANSLUCENCY 1
			#define _NORMALMAP 1
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
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON


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
			float4 _SSColor;
			float3 _Color1B;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color2A;
			float _Debug;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask1FadeStart;
			float _ColorMask1FadeEnd;
			float _ColorMask2Start;
			float _ColorMask2StartOffset;
			float _MaskNoiseSharpMin;
			float _MaskNoiseSharpMax;
			float _MaskNoiseTiling;
			float _ColorMask2End;
			float _ColorMask2AlphaOffset;
			float _ColorMask2Alpha;
			float _NormalScale;
			float _Metallic;
			float _Smoothness;
			float _AlphaCutoff;
			half _MMObjectHeightSource;
			half _GVBendingScale;
			half _MMObjectHeight;
			half _MMPhaseShiftSource;
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
			half _MMPhaseShiftScale;
			float _SubsurfaceScatering;
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

			float Nicrom_DM_AmpScale_Vegetation;
			float Nicrom_DM_Time_Vegetation;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Vegetation;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Vegetation;
			float Nicrom_MM_SpeedScale_Vegetation;
			float Nicrom_MM_BendScale_Vegetation;
			float Nicrom_MM_AmpScale_Vegetation;
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

				float temp_output_23_0_g584 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g584 = (float3(cos( temp_output_23_0_g584 ) , 0.0 , sin( temp_output_23_0_g584 )));
				float3 DB_RotationAxis87_g582 = appendResult25_g584;
				float GV_AmplitudeScale175_g582 = _GVBendingScale;
				float lerpResult186_g582 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float DM_AmplitudeScale168_g582 = lerpResult186_g582;
				float DM1_Amplitude28_g582 = _DM1Amplitude;
				float3 objToWorld80_g592 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g582 = _GVTime;
				float lerpResult187_g582 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g582);
				float ApplicationIsPlaying241_g582 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g582 = lerp( _TimeParameters.x , lerpResult187_g582 , ApplicationIsPlaying241_g582);
				float DM_Time169_g582 = lerpResult256_g582;
				float Time90_g592 = DM_Time169_g582;
				float DM1_Speed29_g582 = _DM1Speed;
				float Speed45_g592 = DM1_Speed29_g582;
				float temp_output_244_0_g582 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g582 = lerp( temp_output_244_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult262_g582 = lerp( temp_output_244_0_g582 , lerpResult261_g582 , ApplicationIsPlaying241_g582);
				float DM_SpeedScale265_g582 = lerpResult262_g582;
				float SpeedScale95_g592 = DM_SpeedScale265_g582;
				float DM_PhaseShift91_g582 = input.ase_color.a;
				float PhaseShift48_g592 = DM_PhaseShift91_g582;
				float3 appendResult24_g584 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g582 = appendResult24_g584;
				float3 PivotPosOnYAxis56_g592 = DM_PivotPosOnYAxis88_g582;
				float DM1_FoliageLength32_g582 = _DM1FoliageLength;
				float3 rotatedValue29_g592 = RotateAroundAxis( PivotPosOnYAxis56_g592, input.positionOS.xyz, DB_RotationAxis87_g582, radians( ( ( ( DM_AmplitudeScale168_g582 * DM1_Amplitude28_g582 ) * sin( ( ( ( objToWorld80_g592.x + objToWorld80_g592.z ) + ( ( Time90_g592 * ( Speed45_g592 * SpeedScale95_g592 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g592 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g592 ) / DM1_FoliageLength32_g582 ) ) ) );
				float DM1_MotionMask89_g582 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g582 = ( ( rotatedValue29_g592 - input.positionOS.xyz ) * DM1_MotionMask89_g582 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g582 = DM1_VertexOffset231_g582;
				#else
				float3 staticSwitch104_g582 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g582 = _DM2Amplitude;
				float Amplitude58_g593 = DM2_Amplitude30_g582;
				float3 LocalPivot159_g582 = float3( 0,0,0 );
				float3 PivotPoint49_g593 = LocalPivot159_g582;
				float3 objToWorld53_g593 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g593, 1 ) ).xyz;
				float Time87_g593 = DM_Time169_g582;
				float SpeedScale93_g593 = DM_SpeedScale265_g582;
				float DM2_Speed31_g582 = _DM2Speed;
				float Speed41_g593 = DM2_Speed31_g582;
				float PhaseShift54_g593 = DM_PhaseShift91_g582;
				float3 break52_g593 = PivotPoint49_g593;
				float3 appendResult20_g593 = (float3(break52_g593.x , input.positionOS.xyz.y , break52_g593.z));
				float DM2_ObjectRadius33_g582 = _DM2ObjectRadius;
				float ObjectRadius60_g593 = DM2_ObjectRadius33_g582;
				float3 rotatedValue33_g593 = RotateAroundAxis( PivotPoint49_g593, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g582 * Amplitude58_g593 ) * sin( ( ( ( objToWorld53_g593.x + objToWorld53_g593.z ) + ( ( Time87_g593 * ( SpeedScale93_g593 * Speed41_g593 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g593 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g593 ) / ObjectRadius60_g593 ) ) ) );
				float DM2_MotionMask90_g582 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g593 = DM2_MotionMask90_g582;
				float3 DM2_VertexOffset232_g582 = ( ( rotatedValue33_g593 - input.positionOS.xyz ) * BendingMask62_g593 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g582 = DM2_VertexOffset232_g582;
				#else
				float3 staticSwitch103_g582 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g582 = ( staticSwitch104_g582 + staticSwitch103_g582 );
				float lerpResult56_g590 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g582 = lerpResult56_g590;
				float MM_DirShift59_g582 = _MMDirectionShift;
				float MM_DirShiftOffset60_g582 = _MMDirectionShiftOffset;
				float3 objToWorld11_g587 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float2 appendResult10_g587 = (float2(objToWorld11_g587.x , objToWorld11_g587.z));
				float MotionNoiseTiling20_g582 = _MotionNoiseTiling;
				float4 temp_output_73_0_g582 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g587 * MotionNoiseTiling20_g582 ), 0, 0.0) );
				float4 StaticWorldNoise78_g582 = temp_output_73_0_g582;
				float4 StaticWorldNoise55_g586 = StaticWorldNoise78_g582;
				float3 objToWorld50_g586 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float lerpResult182_g582 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g582);
				float lerpResult246_g582 = lerp( _TimeParameters.x , lerpResult182_g582 , ApplicationIsPlaying241_g582);
				float MM_Time13_g582 = lerpResult246_g582;
				float Time76_g586 = MM_Time13_g582;
				float temp_output_243_0_g582 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g582 = lerp( temp_output_243_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult249_g582 = lerp( temp_output_243_0_g582 , lerpResult245_g582 , ApplicationIsPlaying241_g582);
				float MM_SpeedScale253_g582 = lerpResult249_g582;
				float SpeedScale_RA80_g586 = MM_SpeedScale253_g582;
				float MM_DirShiftSpeed56_g582 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g582 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g586 = radians( ( ( MM_DirAngle51_g582 + ( ( MM_DirShift59_g582 + ( MM_DirShiftOffset60_g582 * (StaticWorldNoise55_g586).x ) ) * sin( ( ( objToWorld50_g586.x + objToWorld50_g586.z ) + ( ( Time76_g586 * ( SpeedScale_RA80_g586 * MM_DirShiftSpeed56_g582 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g586).z * MM_DirShiftNoiseScale57_g582 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g586 = (float3(cos( temp_output_11_0_g586 ) , 0.0 , sin( temp_output_11_0_g586 )));
				float3 worldToObj35_g586 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g586, 1 ) ).xyz;
				float3 worldToObj36_g586 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g586 = normalize( (( worldToObj35_g586 - worldToObj36_g586 )).xyz );
				float3 MB_RotationAxis129_g582 = normalizeResult34_g586;
				float3 RotationAxis56_g585 = MB_RotationAxis129_g582;
				float4 StaticWorldNoise31_g591 = StaticWorldNoise78_g582;
				float MM_BendingOfset37_g582 = _MMBendingOffset;
				float MM_Bending35_g582 = _MMBending;
				float GV_BendingScale176_g582 = _GVAmplitudeScale;
				float lerpResult188_g582 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g582);
				float MM_BendingScale17_g582 = lerpResult188_g582;
				float MM_AmplitudeOffset52_g582 = _MMAmplitudeOffset;
				float MM_Amplitude66_g582 = _MMAmplitude;
				float lerpResult189_g582 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float MM_AmplitudeScale15_g582 = lerpResult189_g582;
				float3 objToWorld170_g591 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g591 = MM_Time13_g582;
				float MM_Speed53_g582 = _MMSpeed;
				float Speed125_g591 = MM_Speed53_g582;
				float SpeedScale_RotAng201_g591 = MM_SpeedScale253_g582;
				float MM_SineWaveLength58_g582 = _MMSineWaveLength;
				float WaveLength63_g591 = MM_SineWaveLength58_g582;
				float MM_PhaseShiftSource207_g582 = _MMPhaseShiftSource;
				float lerpResult154_g582 = lerp( input.ase_color.a , (StaticWorldNoise78_g582).g , MM_PhaseShiftSource207_g582);
				float MM_PhaseShiftScale39_g582 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g582 = ( lerpResult154_g582 * MM_PhaseShiftScale39_g582 );
				float PhaseShift127_g591 = MB_PhaseShift79_g582;
				float temp_output_20_0_g591 = sin( ( ( ( objToWorld170_g591.x + objToWorld170_g591.z ) + ( ( Time167_g591 * ( ( Speed125_g591 * SpeedScale_RotAng201_g591 ) * WaveLength63_g591 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g591 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g591 ) ) );
				float MM_MaxHeight55_g582 = _MMObjectHeight;
				float3 gammaToLinear56_g591 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g582 = _MMObjectHeightSource;
				float lerpResult57_g591 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g582 ) , (gammaToLinear56_g591).x , MM_ObjectHeightSource54_g582);
				float BendingMask189_g591 = lerpResult57_g591;
				float MB_RotationAngle130_g582 = radians( ( ( ( ( ( (StaticWorldNoise31_g591).y * MM_BendingOfset37_g582 ) + MM_Bending35_g582 ) * MM_BendingScale17_g582 ) + ( ( ( ( (StaticWorldNoise31_g591).x * MM_AmplitudeOffset52_g582 ) + MM_Amplitude66_g582 ) * MM_AmplitudeScale15_g582 ) * temp_output_20_0_g591 ) ) * BendingMask189_g591 ) );
				float RotationAngle54_g585 = MB_RotationAngle130_g582;
				float3 LocalPivotPos60_g585 = LocalPivot159_g582;
				float3 break62_g585 = LocalPivotPos60_g585;
				float VertexPos_Y67_g585 = input.positionOS.xyz.y;
				float3 appendResult45_g585 = (float3(break62_g585.x , VertexPos_Y67_g585 , break62_g585.z));
				float3 VertexPos66_g585 = input.positionOS.xyz;
				float3 rotatedValue30_g585 = RotateAroundAxis( appendResult45_g585, VertexPos66_g585, RotationAxis56_g585, RotationAngle54_g585 );
				float3 DetailMotionVO73_g585 = DM_VertexOffset128_g582;
				float3 rotatedValue34_g585 = RotateAroundAxis( LocalPivotPos60_g585, ( rotatedValue30_g585 + DetailMotionVO73_g585 ), RotationAxis56_g585, RotationAngle54_g585 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g582 = ( ( rotatedValue34_g585 - VertexPos66_g585 ) * step( 0.01 , VertexPos_Y67_g585 ) );
				#else
				float3 staticSwitch205_g582 = DM_VertexOffset128_g582;
				#endif
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g582;

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

				float2 uv_Albedo128_g578 = input.ase_texcoord1.xy;
				float4 tex2DNode128_g578 = tex2D( _Albedo, uv_Albedo128_g578 );
				

				surfaceDescription.Alpha = tex2DNode128_g578.a;
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
			#define ASE_TRANSLUCENCY 1
			#define _NORMALMAP 1
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
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON


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
			float4 _SSColor;
			float3 _Color1B;
			float3 _Color1A;
			float3 _Color2B;
			float3 _Color2A;
			float _Debug;
			float _ColorMask1End;
			float _ColorMask1Start;
			float _ColorMask1FadeStart;
			float _ColorMask1FadeEnd;
			float _ColorMask2Start;
			float _ColorMask2StartOffset;
			float _MaskNoiseSharpMin;
			float _MaskNoiseSharpMax;
			float _MaskNoiseTiling;
			float _ColorMask2End;
			float _ColorMask2AlphaOffset;
			float _ColorMask2Alpha;
			float _NormalScale;
			float _Metallic;
			float _Smoothness;
			float _AlphaCutoff;
			half _MMObjectHeightSource;
			half _GVBendingScale;
			half _MMObjectHeight;
			half _MMPhaseShiftSource;
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
			half _MMPhaseShiftScale;
			float _SubsurfaceScatering;
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

			float Nicrom_DM_AmpScale_Vegetation;
			float Nicrom_DM_Time_Vegetation;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_DM_SpeedScale_Vegetation;
			half Nicrom_WindDirAngle;
			sampler2D _MotionNoise;
			float Nicrom_MM_Time_Vegetation;
			float Nicrom_MM_SpeedScale_Vegetation;
			float Nicrom_MM_BendScale_Vegetation;
			float Nicrom_MM_AmpScale_Vegetation;
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
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g584 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g584 = (float3(cos( temp_output_23_0_g584 ) , 0.0 , sin( temp_output_23_0_g584 )));
				float3 DB_RotationAxis87_g582 = appendResult25_g584;
				float GV_AmplitudeScale175_g582 = _GVBendingScale;
				float lerpResult186_g582 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float DM_AmplitudeScale168_g582 = lerpResult186_g582;
				float DM1_Amplitude28_g582 = _DM1Amplitude;
				float3 objToWorld80_g592 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g582 = _GVTime;
				float lerpResult187_g582 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g582);
				float ApplicationIsPlaying241_g582 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g582 = lerp( _TimeParameters.x , lerpResult187_g582 , ApplicationIsPlaying241_g582);
				float DM_Time169_g582 = lerpResult256_g582;
				float Time90_g592 = DM_Time169_g582;
				float DM1_Speed29_g582 = _DM1Speed;
				float Speed45_g592 = DM1_Speed29_g582;
				float temp_output_244_0_g582 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g582 = lerp( temp_output_244_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult262_g582 = lerp( temp_output_244_0_g582 , lerpResult261_g582 , ApplicationIsPlaying241_g582);
				float DM_SpeedScale265_g582 = lerpResult262_g582;
				float SpeedScale95_g592 = DM_SpeedScale265_g582;
				float DM_PhaseShift91_g582 = input.ase_color.a;
				float PhaseShift48_g592 = DM_PhaseShift91_g582;
				float3 appendResult24_g584 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g582 = appendResult24_g584;
				float3 PivotPosOnYAxis56_g592 = DM_PivotPosOnYAxis88_g582;
				float DM1_FoliageLength32_g582 = _DM1FoliageLength;
				float3 rotatedValue29_g592 = RotateAroundAxis( PivotPosOnYAxis56_g592, input.positionOS.xyz, DB_RotationAxis87_g582, radians( ( ( ( DM_AmplitudeScale168_g582 * DM1_Amplitude28_g582 ) * sin( ( ( ( objToWorld80_g592.x + objToWorld80_g592.z ) + ( ( Time90_g592 * ( Speed45_g592 * SpeedScale95_g592 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g592 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g592 ) / DM1_FoliageLength32_g582 ) ) ) );
				float DM1_MotionMask89_g582 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g582 = ( ( rotatedValue29_g592 - input.positionOS.xyz ) * DM1_MotionMask89_g582 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g582 = DM1_VertexOffset231_g582;
				#else
				float3 staticSwitch104_g582 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g582 = _DM2Amplitude;
				float Amplitude58_g593 = DM2_Amplitude30_g582;
				float3 LocalPivot159_g582 = float3( 0,0,0 );
				float3 PivotPoint49_g593 = LocalPivot159_g582;
				float3 objToWorld53_g593 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g593, 1 ) ).xyz;
				float Time87_g593 = DM_Time169_g582;
				float SpeedScale93_g593 = DM_SpeedScale265_g582;
				float DM2_Speed31_g582 = _DM2Speed;
				float Speed41_g593 = DM2_Speed31_g582;
				float PhaseShift54_g593 = DM_PhaseShift91_g582;
				float3 break52_g593 = PivotPoint49_g593;
				float3 appendResult20_g593 = (float3(break52_g593.x , input.positionOS.xyz.y , break52_g593.z));
				float DM2_ObjectRadius33_g582 = _DM2ObjectRadius;
				float ObjectRadius60_g593 = DM2_ObjectRadius33_g582;
				float3 rotatedValue33_g593 = RotateAroundAxis( PivotPoint49_g593, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g582 * Amplitude58_g593 ) * sin( ( ( ( objToWorld53_g593.x + objToWorld53_g593.z ) + ( ( Time87_g593 * ( SpeedScale93_g593 * Speed41_g593 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g593 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g593 ) / ObjectRadius60_g593 ) ) ) );
				float DM2_MotionMask90_g582 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g593 = DM2_MotionMask90_g582;
				float3 DM2_VertexOffset232_g582 = ( ( rotatedValue33_g593 - input.positionOS.xyz ) * BendingMask62_g593 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g582 = DM2_VertexOffset232_g582;
				#else
				float3 staticSwitch103_g582 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g582 = ( staticSwitch104_g582 + staticSwitch103_g582 );
				float lerpResult56_g590 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g582 = lerpResult56_g590;
				float MM_DirShift59_g582 = _MMDirectionShift;
				float MM_DirShiftOffset60_g582 = _MMDirectionShiftOffset;
				float3 objToWorld11_g587 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float2 appendResult10_g587 = (float2(objToWorld11_g587.x , objToWorld11_g587.z));
				float MotionNoiseTiling20_g582 = _MotionNoiseTiling;
				float4 temp_output_73_0_g582 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g587 * MotionNoiseTiling20_g582 ), 0, 0.0) );
				float4 StaticWorldNoise78_g582 = temp_output_73_0_g582;
				float4 StaticWorldNoise55_g586 = StaticWorldNoise78_g582;
				float3 objToWorld50_g586 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g582, 1 ) ).xyz;
				float lerpResult182_g582 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g582);
				float lerpResult246_g582 = lerp( _TimeParameters.x , lerpResult182_g582 , ApplicationIsPlaying241_g582);
				float MM_Time13_g582 = lerpResult246_g582;
				float Time76_g586 = MM_Time13_g582;
				float temp_output_243_0_g582 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g582 = lerp( temp_output_243_0_g582 , 1.0 , GV_Time174_g582);
				float lerpResult249_g582 = lerp( temp_output_243_0_g582 , lerpResult245_g582 , ApplicationIsPlaying241_g582);
				float MM_SpeedScale253_g582 = lerpResult249_g582;
				float SpeedScale_RA80_g586 = MM_SpeedScale253_g582;
				float MM_DirShiftSpeed56_g582 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g582 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g586 = radians( ( ( MM_DirAngle51_g582 + ( ( MM_DirShift59_g582 + ( MM_DirShiftOffset60_g582 * (StaticWorldNoise55_g586).x ) ) * sin( ( ( objToWorld50_g586.x + objToWorld50_g586.z ) + ( ( Time76_g586 * ( SpeedScale_RA80_g586 * MM_DirShiftSpeed56_g582 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g586).z * MM_DirShiftNoiseScale57_g582 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g586 = (float3(cos( temp_output_11_0_g586 ) , 0.0 , sin( temp_output_11_0_g586 )));
				float3 worldToObj35_g586 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g586, 1 ) ).xyz;
				float3 worldToObj36_g586 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g586 = normalize( (( worldToObj35_g586 - worldToObj36_g586 )).xyz );
				float3 MB_RotationAxis129_g582 = normalizeResult34_g586;
				float3 RotationAxis56_g585 = MB_RotationAxis129_g582;
				float4 StaticWorldNoise31_g591 = StaticWorldNoise78_g582;
				float MM_BendingOfset37_g582 = _MMBendingOffset;
				float MM_Bending35_g582 = _MMBending;
				float GV_BendingScale176_g582 = _GVAmplitudeScale;
				float lerpResult188_g582 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g582);
				float MM_BendingScale17_g582 = lerpResult188_g582;
				float MM_AmplitudeOffset52_g582 = _MMAmplitudeOffset;
				float MM_Amplitude66_g582 = _MMAmplitude;
				float lerpResult189_g582 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g582);
				float MM_AmplitudeScale15_g582 = lerpResult189_g582;
				float3 objToWorld170_g591 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g591 = MM_Time13_g582;
				float MM_Speed53_g582 = _MMSpeed;
				float Speed125_g591 = MM_Speed53_g582;
				float SpeedScale_RotAng201_g591 = MM_SpeedScale253_g582;
				float MM_SineWaveLength58_g582 = _MMSineWaveLength;
				float WaveLength63_g591 = MM_SineWaveLength58_g582;
				float MM_PhaseShiftSource207_g582 = _MMPhaseShiftSource;
				float lerpResult154_g582 = lerp( input.ase_color.a , (StaticWorldNoise78_g582).g , MM_PhaseShiftSource207_g582);
				float MM_PhaseShiftScale39_g582 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g582 = ( lerpResult154_g582 * MM_PhaseShiftScale39_g582 );
				float PhaseShift127_g591 = MB_PhaseShift79_g582;
				float temp_output_20_0_g591 = sin( ( ( ( objToWorld170_g591.x + objToWorld170_g591.z ) + ( ( Time167_g591 * ( ( Speed125_g591 * SpeedScale_RotAng201_g591 ) * WaveLength63_g591 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g591 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g591 ) ) );
				float MM_MaxHeight55_g582 = _MMObjectHeight;
				float3 gammaToLinear56_g591 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g582 = _MMObjectHeightSource;
				float lerpResult57_g591 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g582 ) , (gammaToLinear56_g591).x , MM_ObjectHeightSource54_g582);
				float BendingMask189_g591 = lerpResult57_g591;
				float MB_RotationAngle130_g582 = radians( ( ( ( ( ( (StaticWorldNoise31_g591).y * MM_BendingOfset37_g582 ) + MM_Bending35_g582 ) * MM_BendingScale17_g582 ) + ( ( ( ( (StaticWorldNoise31_g591).x * MM_AmplitudeOffset52_g582 ) + MM_Amplitude66_g582 ) * MM_AmplitudeScale15_g582 ) * temp_output_20_0_g591 ) ) * BendingMask189_g591 ) );
				float RotationAngle54_g585 = MB_RotationAngle130_g582;
				float3 LocalPivotPos60_g585 = LocalPivot159_g582;
				float3 break62_g585 = LocalPivotPos60_g585;
				float VertexPos_Y67_g585 = input.positionOS.xyz.y;
				float3 appendResult45_g585 = (float3(break62_g585.x , VertexPos_Y67_g585 , break62_g585.z));
				float3 VertexPos66_g585 = input.positionOS.xyz;
				float3 rotatedValue30_g585 = RotateAroundAxis( appendResult45_g585, VertexPos66_g585, RotationAxis56_g585, RotationAngle54_g585 );
				float3 DetailMotionVO73_g585 = DM_VertexOffset128_g582;
				float3 rotatedValue34_g585 = RotateAroundAxis( LocalPivotPos60_g585, ( rotatedValue30_g585 + DetailMotionVO73_g585 ), RotationAxis56_g585, RotationAngle54_g585 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g582 = ( ( rotatedValue34_g585 - VertexPos66_g585 ) * step( 0.01 , VertexPos_Y67_g585 ) );
				#else
				float3 staticSwitch205_g582 = DM_VertexOffset128_g582;
				#endif
				
				output.ase_texcoord3.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g582;

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

				float2 uv_Albedo128_g578 = input.ase_texcoord3.xy;
				float4 tex2DNode128_g578 = tex2D( _Albedo, uv_Albedo128_g578 );
				

				float Alpha = tex2DNode128_g578.a;
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
	
	CustomEditor "Nicrom.CMI_Vegetation_Leaves"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}

/*ASEBEGIN
Version=19901
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2147;2464,1920;Inherit;False;Nicrom - Vegetation - Leaves - Main;4;;578;68e3b7fe7db0a9940b2e5eae22653de7;0;0;5;FLOAT4;133;FLOAT3;201;FLOAT;177;FLOAT;178;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2110;2432,2256;Inherit;False;Nicrom - Vegetation - Motion - GP;-1;;580;2010567f31880844287a8b7519991b43;0;0;7;FLOAT;10;FLOAT;12;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;14;FLOAT;9
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1330;-19002.03,10716.32;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1328;-19355.95,10790.4;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2134;2784,2256;Inherit;False;Nicrom - Motion;33;;582;ba60642b1d9af614f93c28cb2553ff1c;0;8;179;FLOAT;0;False;243;FLOAT;1;False;178;FLOAT;0;False;180;FLOAT;0;False;184;FLOAT;0;False;244;FLOAT;1;False;185;FLOAT;0;False;238;FLOAT3;0,0,0;False;2;FLOAT3;0;COLOR;215
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2144;2912,2176;Inherit;False;Nicrom - Translucency;1;;594;742a8874b4ad44247b24c8fe99e09d4f;0;0;1;COLOR;6
Node;AmplifyShaderEditor.WireNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2161;3152,2064;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1593;2880,2096;Inherit;False;Property;_AlphaCutoff;Alpha Cutoff;0;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2149;3200,1920;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;6;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2151;3200,1920;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2152;3200,1920;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2153;3200,1920;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2154;3200,1920;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2155;3200,1920;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2156;3200,1920;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2157;3200,1920;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2158;3200,1920;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2159;3200,1920;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;MotionVectors;0;10;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2160;3200,1920;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;XRMotionVectors;0;11;XRMotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;True;1;False;;255;False;;1;False;;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;1;LightMode=XRMotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2150;3264,1920;Float;False;True;-1;3;Nicrom.CMI_Vegetation_Leaves;0;12;Nicrom/ASE/Vegetation/Leaves + SSS;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;48;Lighting Model;0;0;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;0;638871555054658193;Alpha Clipping;1;0;  Use Shadow Threshold;0;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;1;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;1;638871555106489200;  Translucency Strength;1,True,_TransStrength;638871555622488561;  Normal Distortion;0.5,True,_TransNormal;638871555688430356;  Scattering;2,True,_TransScattering;638871555736523268;  Direct;0.9,True,_TransDirect;638871555777099420;  Ambient;0.1,True,_TransAmbient;638871555815727374;  Shadow;0.5,True,_TransShadow;638871555848575842;Cast Shadows;1;0;Receive Shadows;1;0;Receive SSAO;1;0;Specular Highlights;1;0;Environment Reflections;1;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;  XR Motion Vectors;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;12;False;True;True;True;True;True;True;False;True;True;True;False;False;;False;0
WireConnection;2134;179;2110;10
WireConnection;2134;243;2110;12
WireConnection;2134;178;2110;6
WireConnection;2134;180;2110;7
WireConnection;2134;184;2110;8
WireConnection;2134;244;2110;14
WireConnection;2134;185;2110;9
WireConnection;2161;0;2147;0
WireConnection;2150;0;2147;133
WireConnection;2150;1;2147;201
WireConnection;2150;3;2147;177
WireConnection;2150;4;2147;178
WireConnection;2150;6;2161;0
WireConnection;2150;7;1593;0
WireConnection;2150;15;2144;6
WireConnection;2150;8;2134;0
ASEEND*/
//CHKSM=4847A48929DE5740A91A59A7E4A67A8B9EBEC57E