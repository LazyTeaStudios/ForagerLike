// Made with Amplify Shader Editor v1.9.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Nicrom/ASE/Vegetation//WSP"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		_AlphaCutoff( "Alpha Cutoff", Range( 0, 1 ) ) = 0.5
		[NoScaleOffset][SingleLineTexture] _Albedo( "Albedo", 2D ) = "white" {}
		[NoScaleOffset][Normal][SingleLineTexture] _Normal( "Normal", 2D ) = "bump" {}
		_NormalScale( "Normal Scale", Range( 0, 3 ) ) = 1
		_Metallic( "Metallic", Range( 0, 1 ) ) = 0
		[SingleLineTexture] _Smoothness( "Smoothness", 2D ) = "white" {}
		_SmoothnessScale( "Smoothness Scale", Range( 0, 1 ) ) = 0
		[KeywordEnum( One,Two,Four )] _Colors( "Colors", Float ) = 0
		_Color1A( "Color 1A", Color ) = ( 1, 1, 1 )
		_Color1B( "Color 1B", Color ) = ( 1, 1, 1 )
		_Color2A( "Color 2A", Color ) = ( 1, 1, 1 )
		_Color2B( "Color 2B", Color ) = ( 1, 1, 1 )
		[Enum(None,0,Color Mask 1,1,Color Mask 2,2)] _Debug( "Debug", Float ) = 0
		[KeywordEnum( UVs,VertexPos )] _ColorMask1Source( "Color Mask 1 Source ", Float ) = 0
		_ColorMask1StartV( "Color Mask 1 Start V", Range( 0, 1 ) ) = 0
		_ColorMask1EndV( "Color Mask 1 End V", Range( 0, 1 ) ) = 1
		_ColorMask1StartVert( "Color Mask 1 Start Vert", Range( -6, 1 ) ) = -0.5
		_ColorMask1EndVert( "Color Mask 1 End Vert", Range( -6, 1 ) ) = 0.1
		[SingleLineTexture] _ColorMask2( "Color Mask 2", 2D ) = "white" {}
		_ColorMask2Tiling( "Color Mask 2 Tiling", Range( 0.0001, 4 ) ) = 0.05
		_ColorMask2SharpMin( "Color Mask 2 Sharp Min", Range( 0, 1 ) ) = 0
		_ColorMask2SharpMax( "Color Mask 2 Sharp Max", Range( 0, 1 ) ) = 0.5
		[Toggle( _MAINMOTION_ON )] _MainMotion( "MainMotion", Float ) = 1
		[Toggle] _GVTime( "GV Time", Float ) = 1
		[Toggle] _GVAmplitudeScale( "GV Amplitude Scale", Float ) = 1
		[Toggle] _GVDirectionAngle( "GV Direction Angle", Float ) = 1
		_MMSpeed( "MM Speed", Range( 0, 3 ) ) = 0.4
		_MMAmplitude( "MM Amplitude", Range( 0, 90 ) ) = 1.5
		_MMAmplitudeOffset( "MM Amplitude Offset", Range( 0, 90 ) ) = 2
		[Enum(Vertex Colors,0,Noise Texture,1)] _MMPhaseShiftSource( "MM Phase Shift Source", Float ) = 1
		_MMPhaseShiftScale( "MM Phase Shift Scale", Range( 0, 1 ) ) = 1
		_MMDirectionShift( "MM Direction Shift", Range( 0, 90 ) ) = 20
		_MMDirectionShiftOffset( "MM Direction Shift Offset", Range( 0, 90 ) ) = 10
		_MMDirectionShiftSpeed( "MM Direction Shift Speed", Range( 0, 5 ) ) = 1
		_MMDirectionShiftNoiseScale( "MM Direction Shift Noise Scale", Range( 0, 1 ) ) = 1
		_MMDirectionAngle( "MM Direction Angle", Range( 0, 360 ) ) = 0
		_MMSineWaveLength( "MM Sine Wave Length", Range( 0.001, 20 ) ) = 6
		_MMObjectHeight( "MM Object Height", Range( 0, 100 ) ) = 1
		[Space][Toggle( _DETAILMOTION1_ON )] _DetailMotion1( "Detail Motion 1", Float ) = 1
		_DM1Speed( "DM1 Speed", Range( 0, 10 ) ) = 2
		_DM1Amplitude( "DM1 Amplitude", Range( 0, 40 ) ) = 0.5
		_DM1AmplitudeOffset( "DM1 Amplitude Offset", Range( 0, 40 ) ) = 3
		[SingleLineTexture] _MotionNoise( "Motion Noise", 2D ) = "white" {}
		_MotionNoiseTiling( "Motion Noise Tiling", Range( 0.0001, 4 ) ) = 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local _MAINMOTION_ON
			#pragma shader_feature_local _DETAILMOTION1_ON
			#pragma shader_feature_local _COLORS_ONE _COLORS_TWO _COLORS_FOUR
			#pragma shader_feature_local _COLORMASK1SOURCE_UVS _COLORMASK1SOURCE_VERTEXPOS


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Smoothness_ST;
			float3 _Color1A;
			float3 _Color1B;
			float3 _Color2A;
			float3 _Color2B;
			half _MMObjectHeight;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask1StartV;
			float _ColorMask1EndV;
			float _ColorMask1EndVert;
			float _ScaleVarNoiseSharpMax;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ColorMask2Tiling;
			float _NormalScale;
			float _Metallic;
			float _ColorMask1StartVert;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarMax;
			float _ScaleVarMin;
			half _MMAmplitudeOffset;
			float _MotionNoiseTiling;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			float _GVTime;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			float _SmoothnessScale;
			half _MMPhaseShiftScale;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			float _DM1AmplitudeOffset;
			float _DM1Amplitude;
			float _DM1Speed;
			half _MMDirectionAngle;
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

			sampler2D _MotionNoise;
			float Nicrom_MM_AmpScale_WSP;
			float Nicrom_MM_Time_WSP;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_WSP;
			half Nicrom_WindDirAngle;
			float Nicrom_DM_AmpScale_WSP;
			float Nicrom_DM_Time_WSP;
			float Nicrom_DM_SpeedScale_WSP;
			sampler2D _ScaleVarNoise;
			sampler2D _ColorMask2;
			sampler2D _Albedo;
			sampler2D _Normal;
			sampler2D _Smoothness;


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
			
			float4 Debug90_g581( float Debug_Target, float4 Albedo, float ColorMask1, float ColorMask2 )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1;
				else
				    return ColorMask2;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float MM_ObjectHeight196_g571 = _MMObjectHeight;
				float lerpResult201_g571 = lerp( 1.0 , ( 1.0 - saturate( ( abs( input.positionOS.xyz.y ) / MM_ObjectHeight196_g571 ) ) ) , step( input.positionOS.xyz.y , 0.0 ));
				float MM_Mask198_g571 = lerpResult201_g571;
				float MM_AmplitudeOffset77_g571 = _MMAmplitudeOffset;
				float3 appendResult28_g574 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 LocalPivot16_g571 = -appendResult28_g574;
				float3 objToWorld11_g575 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float2 appendResult10_g575 = (float2(objToWorld11_g575.x , objToWorld11_g575.z));
				float MotionNoiseTiling20_g571 = _MotionNoiseTiling;
				float4 WorldSpaceStaticNoise28_g571 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g575 * MotionNoiseTiling20_g571 ), 0, 0.0) );
				float MM_Amplitude85_g571 = _MMAmplitude;
				float GV_AmplitudeScale175_g571 = _GVAmplitudeScale;
				float lerpResult181_g571 = lerp( 1.0 , Nicrom_MM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float MM_AmplitudeScale87_g571 = lerpResult181_g571;
				float3 objToWorld134_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float MM_Time_G46_g571 = Nicrom_MM_Time_WSP;
				float GV_Time174_g571 = _GVTime;
				float lerpResult59_g571 = lerp( _TimeParameters.x , MM_Time_G46_g571 , GV_Time174_g571);
				float ApplicationIsPlaying208_g571 = Nicrom_ApplicationIsPlaying;
				float lerpResult227_g571 = lerp( _TimeParameters.x , lerpResult59_g571 , ApplicationIsPlaying208_g571);
				float MM_Time65_g571 = lerpResult227_g571;
				float MM_Speed58_g571 = _MMSpeed;
				float MM_SpeedScale_GV212_g571 = Nicrom_MM_SpeedScale_WSP;
				float lerpResult220_g571 = lerp( MM_SpeedScale_GV212_g571 , 1.0 , GV_Time174_g571);
				float lerpResult221_g571 = lerp( MM_SpeedScale_GV212_g571 , lerpResult220_g571 , ApplicationIsPlaying208_g571);
				float MM_SpeedScale222_g571 = lerpResult221_g571;
				float MM_SineWaveLength57_g571 = _MMSineWaveLength;
				float MM_PhaseShiftSource34_g571 = _MMPhaseShiftSource;
				float lerpResult47_g571 = lerp( input.ase_color.a , (WorldSpaceStaticNoise28_g571).g , MM_PhaseShiftSource34_g571);
				float MM_PhaseShiftScale43_g571 = _MMPhaseShiftScale;
				float MB_PhaseShift61_g571 = ( lerpResult47_g571 * MM_PhaseShiftScale43_g571 );
				float lerpResult56_g572 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle80_g571 = lerpResult56_g572;
				float MM_DirShift81_g571 = _MMDirectionShift;
				float MM_DirShiftOffset82_g571 = _MMDirectionShiftOffset;
				float4 StaticWorldNoise55_g573 = WorldSpaceStaticNoise28_g571;
				float3 objToWorld50_g573 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float Time76_g573 = MM_Time65_g571;
				float SpeedScale_RA80_g573 = 1.0;
				float MM_DirShiftSpeed83_g571 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale84_g571 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g573 = radians( ( ( ( 90.0 + MM_DirectionAngle80_g571 ) + ( ( MM_DirShift81_g571 + ( MM_DirShiftOffset82_g571 * (StaticWorldNoise55_g573).x ) ) * sin( ( ( objToWorld50_g573.x + objToWorld50_g573.z ) + ( ( Time76_g573 * ( SpeedScale_RA80_g573 * MM_DirShiftSpeed83_g571 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g573).z * MM_DirShiftNoiseScale84_g571 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g573 = (float3(cos( temp_output_11_0_g573 ) , 0.0 , sin( temp_output_11_0_g573 )));
				float3 worldToObj35_g573 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g573, 1 ) ).xyz;
				float3 worldToObj36_g573 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g573 = normalize( (( worldToObj35_g573 - worldToObj36_g573 )).xyz );
				float3 DirectionVector165_g571 = normalizeResult34_g573;
				#ifdef _MAINMOTION_ON
				float3 staticSwitch188_g571 = ( ( ( MM_Mask198_g571 * ( ( ( MM_AmplitudeOffset77_g571 * (WorldSpaceStaticNoise28_g571).r ) + MM_Amplitude85_g571 ) * MM_AmplitudeScale87_g571 ) ) * sin( ( ( ( objToWorld134_g571.x + objToWorld134_g571.z ) + ( ( MM_Time65_g571 * ( ( MM_Speed58_g571 * MM_SpeedScale222_g571 ) * MM_SineWaveLength57_g571 ) ) + ( ( 2.0 * PI ) * MB_PhaseShift61_g571 ) ) ) * ( ( 2.0 * PI ) / MM_SineWaveLength57_g571 ) ) ) ) * DirectionVector165_g571 );
				#else
				float3 staticSwitch188_g571 = float3( 0, 0, 0 );
				#endif
				float3 HorizontalMovement157_g571 = staticSwitch188_g571;
				float DM1_AmplitudeOffset66_g571 = _DM1AmplitudeOffset;
				float DM1_Amplitude70_g571 = _DM1Amplitude;
				float lerpResult184_g571 = lerp( 1.0 , Nicrom_DM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float DM_AmplitudeScale79_g571 = lerpResult184_g571;
				float3 objToWorld96_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float DM_Time_G31_g571 = Nicrom_DM_Time_WSP;
				float lerpResult45_g571 = lerp( _TimeParameters.x , DM_Time_G31_g571 , GV_Time174_g571);
				float lerpResult239_g571 = lerp( _TimeParameters.x , lerpResult45_g571 , ApplicationIsPlaying208_g571);
				float DM_Time53_g571 = lerpResult239_g571;
				float DM_SpeedScale_GV213_g571 = Nicrom_DM_SpeedScale_WSP;
				float lerpResult231_g571 = lerp( DM_SpeedScale_GV213_g571 , 1.0 , GV_Time174_g571);
				float lerpResult235_g571 = lerp( DM_SpeedScale_GV213_g571 , lerpResult231_g571 , ApplicationIsPlaying208_g571);
				float DM_SpeedScale236_g571 = lerpResult235_g571;
				float DM1_Speed50_g571 = _DM1Speed;
				float VC_PhaseShift42_g571 = input.ase_color.a;
				float3 rotatedValue126_g571 = RotateAroundAxis( LocalPivot16_g571, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( ( DM1_AmplitudeOffset66_g571 * (WorldSpaceStaticNoise28_g571).r ) + DM1_Amplitude70_g571 ) * DM_AmplitudeScale79_g571 ) * sin( ( ( ( objToWorld96_g571.x + objToWorld96_g571.z ) + ( ( DM_Time53_g571 * ( DM_SpeedScale236_g571 * DM1_Speed50_g571 ) ) + ( ( 2.0 * PI ) * ( 1.0 - VC_PhaseShift42_g571 ) ) ) ) * ( 2.0 * PI ) ) ) ) ) );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch130_g571 = ( rotatedValue126_g571 - input.positionOS.xyz );
				#else
				float3 staticSwitch130_g571 = float3( 0, 0, 0 );
				#endif
				float3 RotationMovement131_g571 = staticSwitch130_g571;
				float3 appendResult28_g580 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 Scale_Pivot15_g577 = -appendResult28_g580;
				float3 temp_output_5_0_g577 = ( ( ( HorizontalMovement157_g571 + RotationMovement131_g571 ) + input.positionOS.xyz ) - Scale_Pivot15_g577 );
				float ScaleVartMin40_g577 = _ScaleVarMin;
				float ScaleVarMax41_g577 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g577 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g577 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g579 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g577, 1 ) ).xyz;
				float2 appendResult10_g579 = (float2(objToWorld11_g579.x , objToWorld11_g579.z));
				float2 Scale_WorldSpaceUVs30_g577 = appendResult10_g579;
				float Scale_VarNoiseTiling23_g577 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g577 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g577 * Scale_VarNoiseTiling23_g577 ), 0, 0.0) );
				float smoothstepResult56_g577 = smoothstep( ScaleNoiseSharpnessMin59_g577 , ScaleNoiseSharpnessMax60_g577 , (Scale_WorldSpaceNoise32_g577).r);
				float lerpResult44_g577 = lerp( ScaleVartMin40_g577 , ScaleVarMax41_g577 , smoothstepResult56_g577);
				float ScaleVar47_g577 = lerpResult44_g577;
				float clampResult63_g577 = clamp( ( ScaleVar47_g577 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g577 = ( temp_output_5_0_g577 * clampResult63_g577 );
				#else
				float3 staticSwitch72_g577 = temp_output_5_0_g577;
				#endif
				float ScaleOffset19_g577 = _ScaleOffset;
				float clampResult64_g577 = clamp( ( ScaleOffset19_g577 + 1.0 ) , 0.0 , 7.0 );
				
				float3 appendResult28_g582 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 objToWorld11_g583 = mul( GetObjectToWorldMatrix(), float4( -appendResult28_g582, 1 ) ).xyz;
				float2 appendResult10_g583 = (float2(objToWorld11_g583.x , objToWorld11_g583.z));
				float ColorMask2Tiling17_g581 = _ColorMask2Tiling;
				float2 ColorMask2UVs83_g581 = ( appendResult10_g583 * ColorMask2Tiling17_g581 );
				float vertexToFrag25_g581 = (tex2Dlod( _ColorMask2, float4( ColorMask2UVs83_g581, 0, 0.0) )).r;
				output.ase_texcoord7.z = vertexToFrag25_g581;
				
				output.ase_texcoord7.xy = input.texcoord.xy;
				output.ase_texcoord8 = input.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g577 * clampResult64_g577 ) + Scale_Pivot15_g577 ) - input.positionOS.xyz );

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

				float Debug_Target90_g581 = _Debug;
				float3 Color1A35_g581 = _Color1A;
				float3 Color1B36_g581 = _Color1B;
				float ColorMask1StartV54_g581 = _ColorMask1StartV;
				float ColorMask1EndV55_g581 = _ColorMask1EndV;
				float2 texCoord45_g581 = input.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult51_g581 = smoothstep( ( 1.0 - ColorMask1StartV54_g581 ) , ( 1.0 - ColorMask1EndV55_g581 ) , ( 1.0 - texCoord45_g581.y ));
				float ColorMask1StartVert58_g581 = _ColorMask1StartVert;
				float ColorMask1EndVert59_g581 = _ColorMask1EndVert;
				float smoothstepResult60_g581 = smoothstep( ColorMask1StartVert58_g581 , ColorMask1EndVert59_g581 , input.ase_texcoord8.xyz.y);
				#if defined( _COLORMASK1SOURCE_UVS )
				float staticSwitch44_g581 = smoothstepResult51_g581;
				#elif defined( _COLORMASK1SOURCE_VERTEXPOS )
				float staticSwitch44_g581 = smoothstepResult60_g581;
				#else
				float staticSwitch44_g581 = smoothstepResult51_g581;
				#endif
				float ColorMask1_F64_g581 = staticSwitch44_g581;
				float3 lerpResult67_g581 = lerp( Color1B36_g581 , Color1A35_g581 , ColorMask1_F64_g581);
				float3 Color175_g581 = lerpResult67_g581;
				float3 Color2B74_g581 = _Color2B;
				float3 Color2A73_g581 = _Color2A;
				float3 lerpResult76_g581 = lerp( Color2B74_g581 , Color2A73_g581 , ColorMask1_F64_g581);
				float3 Color280_g581 = lerpResult76_g581;
				float ColorMask2SharpMin30_g581 = _ColorMask2SharpMin;
				float ColorMask2SharpMax29_g581 = _ColorMask2SharpMax;
				float vertexToFrag25_g581 = input.ase_texcoord7.z;
				float smoothstepResult87_g581 = smoothstep( ColorMask2SharpMin30_g581 , ColorMask2SharpMax29_g581 , vertexToFrag25_g581);
				float ColorMask2_F26_g581 = smoothstepResult87_g581;
				float3 lerpResult11_g581 = lerp( Color175_g581 , Color280_g581 , ColorMask2_F26_g581);
				#if defined( _COLORS_ONE )
				float3 staticSwitch81_g581 = Color1A35_g581;
				#elif defined( _COLORS_TWO )
				float3 staticSwitch81_g581 = Color175_g581;
				#elif defined( _COLORS_FOUR )
				float3 staticSwitch81_g581 = lerpResult11_g581;
				#else
				float3 staticSwitch81_g581 = Color1A35_g581;
				#endif
				float2 uv_Albedo34_g581 = input.ase_texcoord7.xy;
				float4 tex2DNode34_g581 = tex2D( _Albedo, uv_Albedo34_g581 );
				float4 TextureColor37_g581 = tex2DNode34_g581;
				float4 Albedo90_g581 = ( float4( staticSwitch81_g581 , 0.0 ) * TextureColor37_g581 );
				#if defined( _COLORS_ONE )
				float staticSwitch100_g581 = 0.0;
				#elif defined( _COLORS_TWO )
				float staticSwitch100_g581 = ColorMask1_F64_g581;
				#elif defined( _COLORS_FOUR )
				float staticSwitch100_g581 = ColorMask1_F64_g581;
				#else
				float staticSwitch100_g581 = 0.0;
				#endif
				float ColorMask190_g581 = staticSwitch100_g581;
				#if defined( _COLORS_ONE )
				float staticSwitch95_g581 = 0.0;
				#elif defined( _COLORS_TWO )
				float staticSwitch95_g581 = 0.0;
				#elif defined( _COLORS_FOUR )
				float staticSwitch95_g581 = ColorMask2_F26_g581;
				#else
				float staticSwitch95_g581 = 0.0;
				#endif
				float ColorMask290_g581 = staticSwitch95_g581;
				float4 localDebug90_g581 = Debug90_g581( Debug_Target90_g581 , Albedo90_g581 , ColorMask190_g581 , ColorMask290_g581 );
				
				float2 uv_Normal103_g581 = input.ase_texcoord7.xy;
				float3 unpack103_g581 = UnpackNormalScale( tex2D( _Normal, uv_Normal103_g581 ), _NormalScale );
				unpack103_g581.z = lerp( 1, unpack103_g581.z, saturate(_NormalScale) );
				
				float2 uv_Smoothness = input.ase_texcoord7.xy * _Smoothness_ST.xy + _Smoothness_ST.zw;
				

				float3 BaseColor = localDebug90_g581.xyz;
				float3 Normal = unpack103_g581;
				float3 Specular = 0.5;
				float Metallic = _Metallic;
				float Smoothness = ( tex2D( _Smoothness, uv_Smoothness ).r * _SmoothnessScale );
				float Occlusion = 1;
				float3 Emission = 0;
				float Alpha = tex2DNode34_g581.a;
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local _MAINMOTION_ON
			#pragma shader_feature_local _DETAILMOTION1_ON


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
			float4 _Smoothness_ST;
			float3 _Color1A;
			float3 _Color1B;
			float3 _Color2A;
			float3 _Color2B;
			half _MMObjectHeight;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask1StartV;
			float _ColorMask1EndV;
			float _ColorMask1EndVert;
			float _ScaleVarNoiseSharpMax;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ColorMask2Tiling;
			float _NormalScale;
			float _Metallic;
			float _ColorMask1StartVert;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarMax;
			float _ScaleVarMin;
			half _MMAmplitudeOffset;
			float _MotionNoiseTiling;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			float _GVTime;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			float _SmoothnessScale;
			half _MMPhaseShiftScale;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			float _DM1AmplitudeOffset;
			float _DM1Amplitude;
			float _DM1Speed;
			half _MMDirectionAngle;
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

			sampler2D _MotionNoise;
			float Nicrom_MM_AmpScale_WSP;
			float Nicrom_MM_Time_WSP;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_WSP;
			half Nicrom_WindDirAngle;
			float Nicrom_DM_AmpScale_WSP;
			float Nicrom_DM_Time_WSP;
			float Nicrom_DM_SpeedScale_WSP;
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
			

			PackedVaryings VertexFunction( Attributes input )
			{
				PackedVaryings output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float MM_ObjectHeight196_g571 = _MMObjectHeight;
				float lerpResult201_g571 = lerp( 1.0 , ( 1.0 - saturate( ( abs( input.positionOS.xyz.y ) / MM_ObjectHeight196_g571 ) ) ) , step( input.positionOS.xyz.y , 0.0 ));
				float MM_Mask198_g571 = lerpResult201_g571;
				float MM_AmplitudeOffset77_g571 = _MMAmplitudeOffset;
				float3 appendResult28_g574 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot16_g571 = -appendResult28_g574;
				float3 objToWorld11_g575 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float2 appendResult10_g575 = (float2(objToWorld11_g575.x , objToWorld11_g575.z));
				float MotionNoiseTiling20_g571 = _MotionNoiseTiling;
				float4 WorldSpaceStaticNoise28_g571 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g575 * MotionNoiseTiling20_g571 ), 0, 0.0) );
				float MM_Amplitude85_g571 = _MMAmplitude;
				float GV_AmplitudeScale175_g571 = _GVAmplitudeScale;
				float lerpResult181_g571 = lerp( 1.0 , Nicrom_MM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float MM_AmplitudeScale87_g571 = lerpResult181_g571;
				float3 objToWorld134_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float MM_Time_G46_g571 = Nicrom_MM_Time_WSP;
				float GV_Time174_g571 = _GVTime;
				float lerpResult59_g571 = lerp( _TimeParameters.x , MM_Time_G46_g571 , GV_Time174_g571);
				float ApplicationIsPlaying208_g571 = Nicrom_ApplicationIsPlaying;
				float lerpResult227_g571 = lerp( _TimeParameters.x , lerpResult59_g571 , ApplicationIsPlaying208_g571);
				float MM_Time65_g571 = lerpResult227_g571;
				float MM_Speed58_g571 = _MMSpeed;
				float MM_SpeedScale_GV212_g571 = Nicrom_MM_SpeedScale_WSP;
				float lerpResult220_g571 = lerp( MM_SpeedScale_GV212_g571 , 1.0 , GV_Time174_g571);
				float lerpResult221_g571 = lerp( MM_SpeedScale_GV212_g571 , lerpResult220_g571 , ApplicationIsPlaying208_g571);
				float MM_SpeedScale222_g571 = lerpResult221_g571;
				float MM_SineWaveLength57_g571 = _MMSineWaveLength;
				float MM_PhaseShiftSource34_g571 = _MMPhaseShiftSource;
				float lerpResult47_g571 = lerp( input.ase_color.a , (WorldSpaceStaticNoise28_g571).g , MM_PhaseShiftSource34_g571);
				float MM_PhaseShiftScale43_g571 = _MMPhaseShiftScale;
				float MB_PhaseShift61_g571 = ( lerpResult47_g571 * MM_PhaseShiftScale43_g571 );
				float lerpResult56_g572 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle80_g571 = lerpResult56_g572;
				float MM_DirShift81_g571 = _MMDirectionShift;
				float MM_DirShiftOffset82_g571 = _MMDirectionShiftOffset;
				float4 StaticWorldNoise55_g573 = WorldSpaceStaticNoise28_g571;
				float3 objToWorld50_g573 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float Time76_g573 = MM_Time65_g571;
				float SpeedScale_RA80_g573 = 1.0;
				float MM_DirShiftSpeed83_g571 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale84_g571 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g573 = radians( ( ( ( 90.0 + MM_DirectionAngle80_g571 ) + ( ( MM_DirShift81_g571 + ( MM_DirShiftOffset82_g571 * (StaticWorldNoise55_g573).x ) ) * sin( ( ( objToWorld50_g573.x + objToWorld50_g573.z ) + ( ( Time76_g573 * ( SpeedScale_RA80_g573 * MM_DirShiftSpeed83_g571 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g573).z * MM_DirShiftNoiseScale84_g571 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g573 = (float3(cos( temp_output_11_0_g573 ) , 0.0 , sin( temp_output_11_0_g573 )));
				float3 worldToObj35_g573 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g573, 1 ) ).xyz;
				float3 worldToObj36_g573 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g573 = normalize( (( worldToObj35_g573 - worldToObj36_g573 )).xyz );
				float3 DirectionVector165_g571 = normalizeResult34_g573;
				#ifdef _MAINMOTION_ON
				float3 staticSwitch188_g571 = ( ( ( MM_Mask198_g571 * ( ( ( MM_AmplitudeOffset77_g571 * (WorldSpaceStaticNoise28_g571).r ) + MM_Amplitude85_g571 ) * MM_AmplitudeScale87_g571 ) ) * sin( ( ( ( objToWorld134_g571.x + objToWorld134_g571.z ) + ( ( MM_Time65_g571 * ( ( MM_Speed58_g571 * MM_SpeedScale222_g571 ) * MM_SineWaveLength57_g571 ) ) + ( ( 2.0 * PI ) * MB_PhaseShift61_g571 ) ) ) * ( ( 2.0 * PI ) / MM_SineWaveLength57_g571 ) ) ) ) * DirectionVector165_g571 );
				#else
				float3 staticSwitch188_g571 = float3( 0, 0, 0 );
				#endif
				float3 HorizontalMovement157_g571 = staticSwitch188_g571;
				float DM1_AmplitudeOffset66_g571 = _DM1AmplitudeOffset;
				float DM1_Amplitude70_g571 = _DM1Amplitude;
				float lerpResult184_g571 = lerp( 1.0 , Nicrom_DM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float DM_AmplitudeScale79_g571 = lerpResult184_g571;
				float3 objToWorld96_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float DM_Time_G31_g571 = Nicrom_DM_Time_WSP;
				float lerpResult45_g571 = lerp( _TimeParameters.x , DM_Time_G31_g571 , GV_Time174_g571);
				float lerpResult239_g571 = lerp( _TimeParameters.x , lerpResult45_g571 , ApplicationIsPlaying208_g571);
				float DM_Time53_g571 = lerpResult239_g571;
				float DM_SpeedScale_GV213_g571 = Nicrom_DM_SpeedScale_WSP;
				float lerpResult231_g571 = lerp( DM_SpeedScale_GV213_g571 , 1.0 , GV_Time174_g571);
				float lerpResult235_g571 = lerp( DM_SpeedScale_GV213_g571 , lerpResult231_g571 , ApplicationIsPlaying208_g571);
				float DM_SpeedScale236_g571 = lerpResult235_g571;
				float DM1_Speed50_g571 = _DM1Speed;
				float VC_PhaseShift42_g571 = input.ase_color.a;
				float3 rotatedValue126_g571 = RotateAroundAxis( LocalPivot16_g571, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( ( DM1_AmplitudeOffset66_g571 * (WorldSpaceStaticNoise28_g571).r ) + DM1_Amplitude70_g571 ) * DM_AmplitudeScale79_g571 ) * sin( ( ( ( objToWorld96_g571.x + objToWorld96_g571.z ) + ( ( DM_Time53_g571 * ( DM_SpeedScale236_g571 * DM1_Speed50_g571 ) ) + ( ( 2.0 * PI ) * ( 1.0 - VC_PhaseShift42_g571 ) ) ) ) * ( 2.0 * PI ) ) ) ) ) );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch130_g571 = ( rotatedValue126_g571 - input.positionOS.xyz );
				#else
				float3 staticSwitch130_g571 = float3( 0, 0, 0 );
				#endif
				float3 RotationMovement131_g571 = staticSwitch130_g571;
				float3 appendResult28_g580 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g577 = -appendResult28_g580;
				float3 temp_output_5_0_g577 = ( ( ( HorizontalMovement157_g571 + RotationMovement131_g571 ) + input.positionOS.xyz ) - Scale_Pivot15_g577 );
				float ScaleVartMin40_g577 = _ScaleVarMin;
				float ScaleVarMax41_g577 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g577 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g577 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g579 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g577, 1 ) ).xyz;
				float2 appendResult10_g579 = (float2(objToWorld11_g579.x , objToWorld11_g579.z));
				float2 Scale_WorldSpaceUVs30_g577 = appendResult10_g579;
				float Scale_VarNoiseTiling23_g577 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g577 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g577 * Scale_VarNoiseTiling23_g577 ), 0, 0.0) );
				float smoothstepResult56_g577 = smoothstep( ScaleNoiseSharpnessMin59_g577 , ScaleNoiseSharpnessMax60_g577 , (Scale_WorldSpaceNoise32_g577).r);
				float lerpResult44_g577 = lerp( ScaleVartMin40_g577 , ScaleVarMax41_g577 , smoothstepResult56_g577);
				float ScaleVar47_g577 = lerpResult44_g577;
				float clampResult63_g577 = clamp( ( ScaleVar47_g577 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g577 = ( temp_output_5_0_g577 * clampResult63_g577 );
				#else
				float3 staticSwitch72_g577 = temp_output_5_0_g577;
				#endif
				float ScaleOffset19_g577 = _ScaleOffset;
				float clampResult64_g577 = clamp( ( ScaleOffset19_g577 + 1.0 ) , 0.0 , 7.0 );
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g577 * clampResult64_g577 ) + Scale_Pivot15_g577 ) - input.positionOS.xyz );
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

				float2 uv_Albedo34_g581 = input.ase_texcoord1.xy;
				float4 tex2DNode34_g581 = tex2D( _Albedo, uv_Albedo34_g581 );
				

				float Alpha = tex2DNode34_g581.a;
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local _MAINMOTION_ON
			#pragma shader_feature_local _DETAILMOTION1_ON


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
			float4 _Smoothness_ST;
			float3 _Color1A;
			float3 _Color1B;
			float3 _Color2A;
			float3 _Color2B;
			half _MMObjectHeight;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask1StartV;
			float _ColorMask1EndV;
			float _ColorMask1EndVert;
			float _ScaleVarNoiseSharpMax;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ColorMask2Tiling;
			float _NormalScale;
			float _Metallic;
			float _ColorMask1StartVert;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarMax;
			float _ScaleVarMin;
			half _MMAmplitudeOffset;
			float _MotionNoiseTiling;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			float _GVTime;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			float _SmoothnessScale;
			half _MMPhaseShiftScale;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			float _DM1AmplitudeOffset;
			float _DM1Amplitude;
			float _DM1Speed;
			half _MMDirectionAngle;
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

			sampler2D _MotionNoise;
			float Nicrom_MM_AmpScale_WSP;
			float Nicrom_MM_Time_WSP;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_WSP;
			half Nicrom_WindDirAngle;
			float Nicrom_DM_AmpScale_WSP;
			float Nicrom_DM_Time_WSP;
			float Nicrom_DM_SpeedScale_WSP;
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
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float MM_ObjectHeight196_g571 = _MMObjectHeight;
				float lerpResult201_g571 = lerp( 1.0 , ( 1.0 - saturate( ( abs( input.positionOS.xyz.y ) / MM_ObjectHeight196_g571 ) ) ) , step( input.positionOS.xyz.y , 0.0 ));
				float MM_Mask198_g571 = lerpResult201_g571;
				float MM_AmplitudeOffset77_g571 = _MMAmplitudeOffset;
				float3 appendResult28_g574 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot16_g571 = -appendResult28_g574;
				float3 objToWorld11_g575 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float2 appendResult10_g575 = (float2(objToWorld11_g575.x , objToWorld11_g575.z));
				float MotionNoiseTiling20_g571 = _MotionNoiseTiling;
				float4 WorldSpaceStaticNoise28_g571 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g575 * MotionNoiseTiling20_g571 ), 0, 0.0) );
				float MM_Amplitude85_g571 = _MMAmplitude;
				float GV_AmplitudeScale175_g571 = _GVAmplitudeScale;
				float lerpResult181_g571 = lerp( 1.0 , Nicrom_MM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float MM_AmplitudeScale87_g571 = lerpResult181_g571;
				float3 objToWorld134_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float MM_Time_G46_g571 = Nicrom_MM_Time_WSP;
				float GV_Time174_g571 = _GVTime;
				float lerpResult59_g571 = lerp( _TimeParameters.x , MM_Time_G46_g571 , GV_Time174_g571);
				float ApplicationIsPlaying208_g571 = Nicrom_ApplicationIsPlaying;
				float lerpResult227_g571 = lerp( _TimeParameters.x , lerpResult59_g571 , ApplicationIsPlaying208_g571);
				float MM_Time65_g571 = lerpResult227_g571;
				float MM_Speed58_g571 = _MMSpeed;
				float MM_SpeedScale_GV212_g571 = Nicrom_MM_SpeedScale_WSP;
				float lerpResult220_g571 = lerp( MM_SpeedScale_GV212_g571 , 1.0 , GV_Time174_g571);
				float lerpResult221_g571 = lerp( MM_SpeedScale_GV212_g571 , lerpResult220_g571 , ApplicationIsPlaying208_g571);
				float MM_SpeedScale222_g571 = lerpResult221_g571;
				float MM_SineWaveLength57_g571 = _MMSineWaveLength;
				float MM_PhaseShiftSource34_g571 = _MMPhaseShiftSource;
				float lerpResult47_g571 = lerp( input.ase_color.a , (WorldSpaceStaticNoise28_g571).g , MM_PhaseShiftSource34_g571);
				float MM_PhaseShiftScale43_g571 = _MMPhaseShiftScale;
				float MB_PhaseShift61_g571 = ( lerpResult47_g571 * MM_PhaseShiftScale43_g571 );
				float lerpResult56_g572 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle80_g571 = lerpResult56_g572;
				float MM_DirShift81_g571 = _MMDirectionShift;
				float MM_DirShiftOffset82_g571 = _MMDirectionShiftOffset;
				float4 StaticWorldNoise55_g573 = WorldSpaceStaticNoise28_g571;
				float3 objToWorld50_g573 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float Time76_g573 = MM_Time65_g571;
				float SpeedScale_RA80_g573 = 1.0;
				float MM_DirShiftSpeed83_g571 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale84_g571 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g573 = radians( ( ( ( 90.0 + MM_DirectionAngle80_g571 ) + ( ( MM_DirShift81_g571 + ( MM_DirShiftOffset82_g571 * (StaticWorldNoise55_g573).x ) ) * sin( ( ( objToWorld50_g573.x + objToWorld50_g573.z ) + ( ( Time76_g573 * ( SpeedScale_RA80_g573 * MM_DirShiftSpeed83_g571 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g573).z * MM_DirShiftNoiseScale84_g571 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g573 = (float3(cos( temp_output_11_0_g573 ) , 0.0 , sin( temp_output_11_0_g573 )));
				float3 worldToObj35_g573 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g573, 1 ) ).xyz;
				float3 worldToObj36_g573 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g573 = normalize( (( worldToObj35_g573 - worldToObj36_g573 )).xyz );
				float3 DirectionVector165_g571 = normalizeResult34_g573;
				#ifdef _MAINMOTION_ON
				float3 staticSwitch188_g571 = ( ( ( MM_Mask198_g571 * ( ( ( MM_AmplitudeOffset77_g571 * (WorldSpaceStaticNoise28_g571).r ) + MM_Amplitude85_g571 ) * MM_AmplitudeScale87_g571 ) ) * sin( ( ( ( objToWorld134_g571.x + objToWorld134_g571.z ) + ( ( MM_Time65_g571 * ( ( MM_Speed58_g571 * MM_SpeedScale222_g571 ) * MM_SineWaveLength57_g571 ) ) + ( ( 2.0 * PI ) * MB_PhaseShift61_g571 ) ) ) * ( ( 2.0 * PI ) / MM_SineWaveLength57_g571 ) ) ) ) * DirectionVector165_g571 );
				#else
				float3 staticSwitch188_g571 = float3( 0, 0, 0 );
				#endif
				float3 HorizontalMovement157_g571 = staticSwitch188_g571;
				float DM1_AmplitudeOffset66_g571 = _DM1AmplitudeOffset;
				float DM1_Amplitude70_g571 = _DM1Amplitude;
				float lerpResult184_g571 = lerp( 1.0 , Nicrom_DM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float DM_AmplitudeScale79_g571 = lerpResult184_g571;
				float3 objToWorld96_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float DM_Time_G31_g571 = Nicrom_DM_Time_WSP;
				float lerpResult45_g571 = lerp( _TimeParameters.x , DM_Time_G31_g571 , GV_Time174_g571);
				float lerpResult239_g571 = lerp( _TimeParameters.x , lerpResult45_g571 , ApplicationIsPlaying208_g571);
				float DM_Time53_g571 = lerpResult239_g571;
				float DM_SpeedScale_GV213_g571 = Nicrom_DM_SpeedScale_WSP;
				float lerpResult231_g571 = lerp( DM_SpeedScale_GV213_g571 , 1.0 , GV_Time174_g571);
				float lerpResult235_g571 = lerp( DM_SpeedScale_GV213_g571 , lerpResult231_g571 , ApplicationIsPlaying208_g571);
				float DM_SpeedScale236_g571 = lerpResult235_g571;
				float DM1_Speed50_g571 = _DM1Speed;
				float VC_PhaseShift42_g571 = input.ase_color.a;
				float3 rotatedValue126_g571 = RotateAroundAxis( LocalPivot16_g571, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( ( DM1_AmplitudeOffset66_g571 * (WorldSpaceStaticNoise28_g571).r ) + DM1_Amplitude70_g571 ) * DM_AmplitudeScale79_g571 ) * sin( ( ( ( objToWorld96_g571.x + objToWorld96_g571.z ) + ( ( DM_Time53_g571 * ( DM_SpeedScale236_g571 * DM1_Speed50_g571 ) ) + ( ( 2.0 * PI ) * ( 1.0 - VC_PhaseShift42_g571 ) ) ) ) * ( 2.0 * PI ) ) ) ) ) );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch130_g571 = ( rotatedValue126_g571 - input.positionOS.xyz );
				#else
				float3 staticSwitch130_g571 = float3( 0, 0, 0 );
				#endif
				float3 RotationMovement131_g571 = staticSwitch130_g571;
				float3 appendResult28_g580 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g577 = -appendResult28_g580;
				float3 temp_output_5_0_g577 = ( ( ( HorizontalMovement157_g571 + RotationMovement131_g571 ) + input.positionOS.xyz ) - Scale_Pivot15_g577 );
				float ScaleVartMin40_g577 = _ScaleVarMin;
				float ScaleVarMax41_g577 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g577 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g577 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g579 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g577, 1 ) ).xyz;
				float2 appendResult10_g579 = (float2(objToWorld11_g579.x , objToWorld11_g579.z));
				float2 Scale_WorldSpaceUVs30_g577 = appendResult10_g579;
				float Scale_VarNoiseTiling23_g577 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g577 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g577 * Scale_VarNoiseTiling23_g577 ), 0, 0.0) );
				float smoothstepResult56_g577 = smoothstep( ScaleNoiseSharpnessMin59_g577 , ScaleNoiseSharpnessMax60_g577 , (Scale_WorldSpaceNoise32_g577).r);
				float lerpResult44_g577 = lerp( ScaleVartMin40_g577 , ScaleVarMax41_g577 , smoothstepResult56_g577);
				float ScaleVar47_g577 = lerpResult44_g577;
				float clampResult63_g577 = clamp( ( ScaleVar47_g577 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g577 = ( temp_output_5_0_g577 * clampResult63_g577 );
				#else
				float3 staticSwitch72_g577 = temp_output_5_0_g577;
				#endif
				float ScaleOffset19_g577 = _ScaleOffset;
				float clampResult64_g577 = clamp( ( ScaleOffset19_g577 + 1.0 ) , 0.0 , 7.0 );
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g577 * clampResult64_g577 ) + Scale_Pivot15_g577 ) - input.positionOS.xyz );

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

				float2 uv_Albedo34_g581 = input.ase_texcoord1.xy;
				float4 tex2DNode34_g581 = tex2D( _Albedo, uv_Albedo34_g581 );
				

				float Alpha = tex2DNode34_g581.a;
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local _MAINMOTION_ON
			#pragma shader_feature_local _DETAILMOTION1_ON
			#pragma shader_feature_local _COLORS_ONE _COLORS_TWO _COLORS_FOUR
			#pragma shader_feature_local _COLORMASK1SOURCE_UVS _COLORMASK1SOURCE_VERTEXPOS


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Smoothness_ST;
			float3 _Color1A;
			float3 _Color1B;
			float3 _Color2A;
			float3 _Color2B;
			half _MMObjectHeight;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask1StartV;
			float _ColorMask1EndV;
			float _ColorMask1EndVert;
			float _ScaleVarNoiseSharpMax;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ColorMask2Tiling;
			float _NormalScale;
			float _Metallic;
			float _ColorMask1StartVert;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarMax;
			float _ScaleVarMin;
			half _MMAmplitudeOffset;
			float _MotionNoiseTiling;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			float _GVTime;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			float _SmoothnessScale;
			half _MMPhaseShiftScale;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			float _DM1AmplitudeOffset;
			float _DM1Amplitude;
			float _DM1Speed;
			half _MMDirectionAngle;
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

			sampler2D _MotionNoise;
			float Nicrom_MM_AmpScale_WSP;
			float Nicrom_MM_Time_WSP;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_WSP;
			half Nicrom_WindDirAngle;
			float Nicrom_DM_AmpScale_WSP;
			float Nicrom_DM_Time_WSP;
			float Nicrom_DM_SpeedScale_WSP;
			sampler2D _ScaleVarNoise;
			sampler2D _ColorMask2;
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
			
			float4 Debug90_g581( float Debug_Target, float4 Albedo, float ColorMask1, float ColorMask2 )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1;
				else
				    return ColorMask2;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float MM_ObjectHeight196_g571 = _MMObjectHeight;
				float lerpResult201_g571 = lerp( 1.0 , ( 1.0 - saturate( ( abs( input.positionOS.xyz.y ) / MM_ObjectHeight196_g571 ) ) ) , step( input.positionOS.xyz.y , 0.0 ));
				float MM_Mask198_g571 = lerpResult201_g571;
				float MM_AmplitudeOffset77_g571 = _MMAmplitudeOffset;
				float3 appendResult28_g574 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 LocalPivot16_g571 = -appendResult28_g574;
				float3 objToWorld11_g575 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float2 appendResult10_g575 = (float2(objToWorld11_g575.x , objToWorld11_g575.z));
				float MotionNoiseTiling20_g571 = _MotionNoiseTiling;
				float4 WorldSpaceStaticNoise28_g571 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g575 * MotionNoiseTiling20_g571 ), 0, 0.0) );
				float MM_Amplitude85_g571 = _MMAmplitude;
				float GV_AmplitudeScale175_g571 = _GVAmplitudeScale;
				float lerpResult181_g571 = lerp( 1.0 , Nicrom_MM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float MM_AmplitudeScale87_g571 = lerpResult181_g571;
				float3 objToWorld134_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float MM_Time_G46_g571 = Nicrom_MM_Time_WSP;
				float GV_Time174_g571 = _GVTime;
				float lerpResult59_g571 = lerp( _TimeParameters.x , MM_Time_G46_g571 , GV_Time174_g571);
				float ApplicationIsPlaying208_g571 = Nicrom_ApplicationIsPlaying;
				float lerpResult227_g571 = lerp( _TimeParameters.x , lerpResult59_g571 , ApplicationIsPlaying208_g571);
				float MM_Time65_g571 = lerpResult227_g571;
				float MM_Speed58_g571 = _MMSpeed;
				float MM_SpeedScale_GV212_g571 = Nicrom_MM_SpeedScale_WSP;
				float lerpResult220_g571 = lerp( MM_SpeedScale_GV212_g571 , 1.0 , GV_Time174_g571);
				float lerpResult221_g571 = lerp( MM_SpeedScale_GV212_g571 , lerpResult220_g571 , ApplicationIsPlaying208_g571);
				float MM_SpeedScale222_g571 = lerpResult221_g571;
				float MM_SineWaveLength57_g571 = _MMSineWaveLength;
				float MM_PhaseShiftSource34_g571 = _MMPhaseShiftSource;
				float lerpResult47_g571 = lerp( input.ase_color.a , (WorldSpaceStaticNoise28_g571).g , MM_PhaseShiftSource34_g571);
				float MM_PhaseShiftScale43_g571 = _MMPhaseShiftScale;
				float MB_PhaseShift61_g571 = ( lerpResult47_g571 * MM_PhaseShiftScale43_g571 );
				float lerpResult56_g572 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle80_g571 = lerpResult56_g572;
				float MM_DirShift81_g571 = _MMDirectionShift;
				float MM_DirShiftOffset82_g571 = _MMDirectionShiftOffset;
				float4 StaticWorldNoise55_g573 = WorldSpaceStaticNoise28_g571;
				float3 objToWorld50_g573 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float Time76_g573 = MM_Time65_g571;
				float SpeedScale_RA80_g573 = 1.0;
				float MM_DirShiftSpeed83_g571 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale84_g571 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g573 = radians( ( ( ( 90.0 + MM_DirectionAngle80_g571 ) + ( ( MM_DirShift81_g571 + ( MM_DirShiftOffset82_g571 * (StaticWorldNoise55_g573).x ) ) * sin( ( ( objToWorld50_g573.x + objToWorld50_g573.z ) + ( ( Time76_g573 * ( SpeedScale_RA80_g573 * MM_DirShiftSpeed83_g571 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g573).z * MM_DirShiftNoiseScale84_g571 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g573 = (float3(cos( temp_output_11_0_g573 ) , 0.0 , sin( temp_output_11_0_g573 )));
				float3 worldToObj35_g573 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g573, 1 ) ).xyz;
				float3 worldToObj36_g573 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g573 = normalize( (( worldToObj35_g573 - worldToObj36_g573 )).xyz );
				float3 DirectionVector165_g571 = normalizeResult34_g573;
				#ifdef _MAINMOTION_ON
				float3 staticSwitch188_g571 = ( ( ( MM_Mask198_g571 * ( ( ( MM_AmplitudeOffset77_g571 * (WorldSpaceStaticNoise28_g571).r ) + MM_Amplitude85_g571 ) * MM_AmplitudeScale87_g571 ) ) * sin( ( ( ( objToWorld134_g571.x + objToWorld134_g571.z ) + ( ( MM_Time65_g571 * ( ( MM_Speed58_g571 * MM_SpeedScale222_g571 ) * MM_SineWaveLength57_g571 ) ) + ( ( 2.0 * PI ) * MB_PhaseShift61_g571 ) ) ) * ( ( 2.0 * PI ) / MM_SineWaveLength57_g571 ) ) ) ) * DirectionVector165_g571 );
				#else
				float3 staticSwitch188_g571 = float3( 0, 0, 0 );
				#endif
				float3 HorizontalMovement157_g571 = staticSwitch188_g571;
				float DM1_AmplitudeOffset66_g571 = _DM1AmplitudeOffset;
				float DM1_Amplitude70_g571 = _DM1Amplitude;
				float lerpResult184_g571 = lerp( 1.0 , Nicrom_DM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float DM_AmplitudeScale79_g571 = lerpResult184_g571;
				float3 objToWorld96_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float DM_Time_G31_g571 = Nicrom_DM_Time_WSP;
				float lerpResult45_g571 = lerp( _TimeParameters.x , DM_Time_G31_g571 , GV_Time174_g571);
				float lerpResult239_g571 = lerp( _TimeParameters.x , lerpResult45_g571 , ApplicationIsPlaying208_g571);
				float DM_Time53_g571 = lerpResult239_g571;
				float DM_SpeedScale_GV213_g571 = Nicrom_DM_SpeedScale_WSP;
				float lerpResult231_g571 = lerp( DM_SpeedScale_GV213_g571 , 1.0 , GV_Time174_g571);
				float lerpResult235_g571 = lerp( DM_SpeedScale_GV213_g571 , lerpResult231_g571 , ApplicationIsPlaying208_g571);
				float DM_SpeedScale236_g571 = lerpResult235_g571;
				float DM1_Speed50_g571 = _DM1Speed;
				float VC_PhaseShift42_g571 = input.ase_color.a;
				float3 rotatedValue126_g571 = RotateAroundAxis( LocalPivot16_g571, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( ( DM1_AmplitudeOffset66_g571 * (WorldSpaceStaticNoise28_g571).r ) + DM1_Amplitude70_g571 ) * DM_AmplitudeScale79_g571 ) * sin( ( ( ( objToWorld96_g571.x + objToWorld96_g571.z ) + ( ( DM_Time53_g571 * ( DM_SpeedScale236_g571 * DM1_Speed50_g571 ) ) + ( ( 2.0 * PI ) * ( 1.0 - VC_PhaseShift42_g571 ) ) ) ) * ( 2.0 * PI ) ) ) ) ) );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch130_g571 = ( rotatedValue126_g571 - input.positionOS.xyz );
				#else
				float3 staticSwitch130_g571 = float3( 0, 0, 0 );
				#endif
				float3 RotationMovement131_g571 = staticSwitch130_g571;
				float3 appendResult28_g580 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 Scale_Pivot15_g577 = -appendResult28_g580;
				float3 temp_output_5_0_g577 = ( ( ( HorizontalMovement157_g571 + RotationMovement131_g571 ) + input.positionOS.xyz ) - Scale_Pivot15_g577 );
				float ScaleVartMin40_g577 = _ScaleVarMin;
				float ScaleVarMax41_g577 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g577 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g577 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g579 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g577, 1 ) ).xyz;
				float2 appendResult10_g579 = (float2(objToWorld11_g579.x , objToWorld11_g579.z));
				float2 Scale_WorldSpaceUVs30_g577 = appendResult10_g579;
				float Scale_VarNoiseTiling23_g577 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g577 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g577 * Scale_VarNoiseTiling23_g577 ), 0, 0.0) );
				float smoothstepResult56_g577 = smoothstep( ScaleNoiseSharpnessMin59_g577 , ScaleNoiseSharpnessMax60_g577 , (Scale_WorldSpaceNoise32_g577).r);
				float lerpResult44_g577 = lerp( ScaleVartMin40_g577 , ScaleVarMax41_g577 , smoothstepResult56_g577);
				float ScaleVar47_g577 = lerpResult44_g577;
				float clampResult63_g577 = clamp( ( ScaleVar47_g577 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g577 = ( temp_output_5_0_g577 * clampResult63_g577 );
				#else
				float3 staticSwitch72_g577 = temp_output_5_0_g577;
				#endif
				float ScaleOffset19_g577 = _ScaleOffset;
				float clampResult64_g577 = clamp( ( ScaleOffset19_g577 + 1.0 ) , 0.0 , 7.0 );
				
				float3 appendResult28_g582 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 objToWorld11_g583 = mul( GetObjectToWorldMatrix(), float4( -appendResult28_g582, 1 ) ).xyz;
				float2 appendResult10_g583 = (float2(objToWorld11_g583.x , objToWorld11_g583.z));
				float ColorMask2Tiling17_g581 = _ColorMask2Tiling;
				float2 ColorMask2UVs83_g581 = ( appendResult10_g583 * ColorMask2Tiling17_g581 );
				float vertexToFrag25_g581 = (tex2Dlod( _ColorMask2, float4( ColorMask2UVs83_g581, 0, 0.0) )).r;
				output.ase_texcoord3.z = vertexToFrag25_g581;
				
				output.ase_texcoord3.xy = input.texcoord0.xy;
				output.ase_texcoord4 = input.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g577 * clampResult64_g577 ) + Scale_Pivot15_g577 ) - input.positionOS.xyz );

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

				float Debug_Target90_g581 = _Debug;
				float3 Color1A35_g581 = _Color1A;
				float3 Color1B36_g581 = _Color1B;
				float ColorMask1StartV54_g581 = _ColorMask1StartV;
				float ColorMask1EndV55_g581 = _ColorMask1EndV;
				float2 texCoord45_g581 = input.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult51_g581 = smoothstep( ( 1.0 - ColorMask1StartV54_g581 ) , ( 1.0 - ColorMask1EndV55_g581 ) , ( 1.0 - texCoord45_g581.y ));
				float ColorMask1StartVert58_g581 = _ColorMask1StartVert;
				float ColorMask1EndVert59_g581 = _ColorMask1EndVert;
				float smoothstepResult60_g581 = smoothstep( ColorMask1StartVert58_g581 , ColorMask1EndVert59_g581 , input.ase_texcoord4.xyz.y);
				#if defined( _COLORMASK1SOURCE_UVS )
				float staticSwitch44_g581 = smoothstepResult51_g581;
				#elif defined( _COLORMASK1SOURCE_VERTEXPOS )
				float staticSwitch44_g581 = smoothstepResult60_g581;
				#else
				float staticSwitch44_g581 = smoothstepResult51_g581;
				#endif
				float ColorMask1_F64_g581 = staticSwitch44_g581;
				float3 lerpResult67_g581 = lerp( Color1B36_g581 , Color1A35_g581 , ColorMask1_F64_g581);
				float3 Color175_g581 = lerpResult67_g581;
				float3 Color2B74_g581 = _Color2B;
				float3 Color2A73_g581 = _Color2A;
				float3 lerpResult76_g581 = lerp( Color2B74_g581 , Color2A73_g581 , ColorMask1_F64_g581);
				float3 Color280_g581 = lerpResult76_g581;
				float ColorMask2SharpMin30_g581 = _ColorMask2SharpMin;
				float ColorMask2SharpMax29_g581 = _ColorMask2SharpMax;
				float vertexToFrag25_g581 = input.ase_texcoord3.z;
				float smoothstepResult87_g581 = smoothstep( ColorMask2SharpMin30_g581 , ColorMask2SharpMax29_g581 , vertexToFrag25_g581);
				float ColorMask2_F26_g581 = smoothstepResult87_g581;
				float3 lerpResult11_g581 = lerp( Color175_g581 , Color280_g581 , ColorMask2_F26_g581);
				#if defined( _COLORS_ONE )
				float3 staticSwitch81_g581 = Color1A35_g581;
				#elif defined( _COLORS_TWO )
				float3 staticSwitch81_g581 = Color175_g581;
				#elif defined( _COLORS_FOUR )
				float3 staticSwitch81_g581 = lerpResult11_g581;
				#else
				float3 staticSwitch81_g581 = Color1A35_g581;
				#endif
				float2 uv_Albedo34_g581 = input.ase_texcoord3.xy;
				float4 tex2DNode34_g581 = tex2D( _Albedo, uv_Albedo34_g581 );
				float4 TextureColor37_g581 = tex2DNode34_g581;
				float4 Albedo90_g581 = ( float4( staticSwitch81_g581 , 0.0 ) * TextureColor37_g581 );
				#if defined( _COLORS_ONE )
				float staticSwitch100_g581 = 0.0;
				#elif defined( _COLORS_TWO )
				float staticSwitch100_g581 = ColorMask1_F64_g581;
				#elif defined( _COLORS_FOUR )
				float staticSwitch100_g581 = ColorMask1_F64_g581;
				#else
				float staticSwitch100_g581 = 0.0;
				#endif
				float ColorMask190_g581 = staticSwitch100_g581;
				#if defined( _COLORS_ONE )
				float staticSwitch95_g581 = 0.0;
				#elif defined( _COLORS_TWO )
				float staticSwitch95_g581 = 0.0;
				#elif defined( _COLORS_FOUR )
				float staticSwitch95_g581 = ColorMask2_F26_g581;
				#else
				float staticSwitch95_g581 = 0.0;
				#endif
				float ColorMask290_g581 = staticSwitch95_g581;
				float4 localDebug90_g581 = Debug90_g581( Debug_Target90_g581 , Albedo90_g581 , ColorMask190_g581 , ColorMask290_g581 );
				

				float3 BaseColor = localDebug90_g581.xyz;
				float3 Emission = 0;
				float Alpha = tex2DNode34_g581.a;
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local _MAINMOTION_ON
			#pragma shader_feature_local _DETAILMOTION1_ON
			#pragma shader_feature_local _COLORS_ONE _COLORS_TWO _COLORS_FOUR
			#pragma shader_feature_local _COLORMASK1SOURCE_UVS _COLORMASK1SOURCE_VERTEXPOS


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Smoothness_ST;
			float3 _Color1A;
			float3 _Color1B;
			float3 _Color2A;
			float3 _Color2B;
			half _MMObjectHeight;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask1StartV;
			float _ColorMask1EndV;
			float _ColorMask1EndVert;
			float _ScaleVarNoiseSharpMax;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ColorMask2Tiling;
			float _NormalScale;
			float _Metallic;
			float _ColorMask1StartVert;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarMax;
			float _ScaleVarMin;
			half _MMAmplitudeOffset;
			float _MotionNoiseTiling;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			float _GVTime;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			float _SmoothnessScale;
			half _MMPhaseShiftScale;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			float _DM1AmplitudeOffset;
			float _DM1Amplitude;
			float _DM1Speed;
			half _MMDirectionAngle;
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

			sampler2D _MotionNoise;
			float Nicrom_MM_AmpScale_WSP;
			float Nicrom_MM_Time_WSP;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_WSP;
			half Nicrom_WindDirAngle;
			float Nicrom_DM_AmpScale_WSP;
			float Nicrom_DM_Time_WSP;
			float Nicrom_DM_SpeedScale_WSP;
			sampler2D _ScaleVarNoise;
			sampler2D _ColorMask2;
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
			
			float4 Debug90_g581( float Debug_Target, float4 Albedo, float ColorMask1, float ColorMask2 )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1;
				else
				    return ColorMask2;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_TRANSFER_INSTANCE_ID( input, output );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float MM_ObjectHeight196_g571 = _MMObjectHeight;
				float lerpResult201_g571 = lerp( 1.0 , ( 1.0 - saturate( ( abs( input.positionOS.xyz.y ) / MM_ObjectHeight196_g571 ) ) ) , step( input.positionOS.xyz.y , 0.0 ));
				float MM_Mask198_g571 = lerpResult201_g571;
				float MM_AmplitudeOffset77_g571 = _MMAmplitudeOffset;
				float3 appendResult28_g574 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot16_g571 = -appendResult28_g574;
				float3 objToWorld11_g575 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float2 appendResult10_g575 = (float2(objToWorld11_g575.x , objToWorld11_g575.z));
				float MotionNoiseTiling20_g571 = _MotionNoiseTiling;
				float4 WorldSpaceStaticNoise28_g571 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g575 * MotionNoiseTiling20_g571 ), 0, 0.0) );
				float MM_Amplitude85_g571 = _MMAmplitude;
				float GV_AmplitudeScale175_g571 = _GVAmplitudeScale;
				float lerpResult181_g571 = lerp( 1.0 , Nicrom_MM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float MM_AmplitudeScale87_g571 = lerpResult181_g571;
				float3 objToWorld134_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float MM_Time_G46_g571 = Nicrom_MM_Time_WSP;
				float GV_Time174_g571 = _GVTime;
				float lerpResult59_g571 = lerp( _TimeParameters.x , MM_Time_G46_g571 , GV_Time174_g571);
				float ApplicationIsPlaying208_g571 = Nicrom_ApplicationIsPlaying;
				float lerpResult227_g571 = lerp( _TimeParameters.x , lerpResult59_g571 , ApplicationIsPlaying208_g571);
				float MM_Time65_g571 = lerpResult227_g571;
				float MM_Speed58_g571 = _MMSpeed;
				float MM_SpeedScale_GV212_g571 = Nicrom_MM_SpeedScale_WSP;
				float lerpResult220_g571 = lerp( MM_SpeedScale_GV212_g571 , 1.0 , GV_Time174_g571);
				float lerpResult221_g571 = lerp( MM_SpeedScale_GV212_g571 , lerpResult220_g571 , ApplicationIsPlaying208_g571);
				float MM_SpeedScale222_g571 = lerpResult221_g571;
				float MM_SineWaveLength57_g571 = _MMSineWaveLength;
				float MM_PhaseShiftSource34_g571 = _MMPhaseShiftSource;
				float lerpResult47_g571 = lerp( input.ase_color.a , (WorldSpaceStaticNoise28_g571).g , MM_PhaseShiftSource34_g571);
				float MM_PhaseShiftScale43_g571 = _MMPhaseShiftScale;
				float MB_PhaseShift61_g571 = ( lerpResult47_g571 * MM_PhaseShiftScale43_g571 );
				float lerpResult56_g572 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle80_g571 = lerpResult56_g572;
				float MM_DirShift81_g571 = _MMDirectionShift;
				float MM_DirShiftOffset82_g571 = _MMDirectionShiftOffset;
				float4 StaticWorldNoise55_g573 = WorldSpaceStaticNoise28_g571;
				float3 objToWorld50_g573 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float Time76_g573 = MM_Time65_g571;
				float SpeedScale_RA80_g573 = 1.0;
				float MM_DirShiftSpeed83_g571 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale84_g571 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g573 = radians( ( ( ( 90.0 + MM_DirectionAngle80_g571 ) + ( ( MM_DirShift81_g571 + ( MM_DirShiftOffset82_g571 * (StaticWorldNoise55_g573).x ) ) * sin( ( ( objToWorld50_g573.x + objToWorld50_g573.z ) + ( ( Time76_g573 * ( SpeedScale_RA80_g573 * MM_DirShiftSpeed83_g571 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g573).z * MM_DirShiftNoiseScale84_g571 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g573 = (float3(cos( temp_output_11_0_g573 ) , 0.0 , sin( temp_output_11_0_g573 )));
				float3 worldToObj35_g573 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g573, 1 ) ).xyz;
				float3 worldToObj36_g573 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g573 = normalize( (( worldToObj35_g573 - worldToObj36_g573 )).xyz );
				float3 DirectionVector165_g571 = normalizeResult34_g573;
				#ifdef _MAINMOTION_ON
				float3 staticSwitch188_g571 = ( ( ( MM_Mask198_g571 * ( ( ( MM_AmplitudeOffset77_g571 * (WorldSpaceStaticNoise28_g571).r ) + MM_Amplitude85_g571 ) * MM_AmplitudeScale87_g571 ) ) * sin( ( ( ( objToWorld134_g571.x + objToWorld134_g571.z ) + ( ( MM_Time65_g571 * ( ( MM_Speed58_g571 * MM_SpeedScale222_g571 ) * MM_SineWaveLength57_g571 ) ) + ( ( 2.0 * PI ) * MB_PhaseShift61_g571 ) ) ) * ( ( 2.0 * PI ) / MM_SineWaveLength57_g571 ) ) ) ) * DirectionVector165_g571 );
				#else
				float3 staticSwitch188_g571 = float3( 0, 0, 0 );
				#endif
				float3 HorizontalMovement157_g571 = staticSwitch188_g571;
				float DM1_AmplitudeOffset66_g571 = _DM1AmplitudeOffset;
				float DM1_Amplitude70_g571 = _DM1Amplitude;
				float lerpResult184_g571 = lerp( 1.0 , Nicrom_DM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float DM_AmplitudeScale79_g571 = lerpResult184_g571;
				float3 objToWorld96_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float DM_Time_G31_g571 = Nicrom_DM_Time_WSP;
				float lerpResult45_g571 = lerp( _TimeParameters.x , DM_Time_G31_g571 , GV_Time174_g571);
				float lerpResult239_g571 = lerp( _TimeParameters.x , lerpResult45_g571 , ApplicationIsPlaying208_g571);
				float DM_Time53_g571 = lerpResult239_g571;
				float DM_SpeedScale_GV213_g571 = Nicrom_DM_SpeedScale_WSP;
				float lerpResult231_g571 = lerp( DM_SpeedScale_GV213_g571 , 1.0 , GV_Time174_g571);
				float lerpResult235_g571 = lerp( DM_SpeedScale_GV213_g571 , lerpResult231_g571 , ApplicationIsPlaying208_g571);
				float DM_SpeedScale236_g571 = lerpResult235_g571;
				float DM1_Speed50_g571 = _DM1Speed;
				float VC_PhaseShift42_g571 = input.ase_color.a;
				float3 rotatedValue126_g571 = RotateAroundAxis( LocalPivot16_g571, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( ( DM1_AmplitudeOffset66_g571 * (WorldSpaceStaticNoise28_g571).r ) + DM1_Amplitude70_g571 ) * DM_AmplitudeScale79_g571 ) * sin( ( ( ( objToWorld96_g571.x + objToWorld96_g571.z ) + ( ( DM_Time53_g571 * ( DM_SpeedScale236_g571 * DM1_Speed50_g571 ) ) + ( ( 2.0 * PI ) * ( 1.0 - VC_PhaseShift42_g571 ) ) ) ) * ( 2.0 * PI ) ) ) ) ) );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch130_g571 = ( rotatedValue126_g571 - input.positionOS.xyz );
				#else
				float3 staticSwitch130_g571 = float3( 0, 0, 0 );
				#endif
				float3 RotationMovement131_g571 = staticSwitch130_g571;
				float3 appendResult28_g580 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g577 = -appendResult28_g580;
				float3 temp_output_5_0_g577 = ( ( ( HorizontalMovement157_g571 + RotationMovement131_g571 ) + input.positionOS.xyz ) - Scale_Pivot15_g577 );
				float ScaleVartMin40_g577 = _ScaleVarMin;
				float ScaleVarMax41_g577 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g577 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g577 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g579 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g577, 1 ) ).xyz;
				float2 appendResult10_g579 = (float2(objToWorld11_g579.x , objToWorld11_g579.z));
				float2 Scale_WorldSpaceUVs30_g577 = appendResult10_g579;
				float Scale_VarNoiseTiling23_g577 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g577 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g577 * Scale_VarNoiseTiling23_g577 ), 0, 0.0) );
				float smoothstepResult56_g577 = smoothstep( ScaleNoiseSharpnessMin59_g577 , ScaleNoiseSharpnessMax60_g577 , (Scale_WorldSpaceNoise32_g577).r);
				float lerpResult44_g577 = lerp( ScaleVartMin40_g577 , ScaleVarMax41_g577 , smoothstepResult56_g577);
				float ScaleVar47_g577 = lerpResult44_g577;
				float clampResult63_g577 = clamp( ( ScaleVar47_g577 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g577 = ( temp_output_5_0_g577 * clampResult63_g577 );
				#else
				float3 staticSwitch72_g577 = temp_output_5_0_g577;
				#endif
				float ScaleOffset19_g577 = _ScaleOffset;
				float clampResult64_g577 = clamp( ( ScaleOffset19_g577 + 1.0 ) , 0.0 , 7.0 );
				
				float3 appendResult28_g582 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 objToWorld11_g583 = mul( GetObjectToWorldMatrix(), float4( -appendResult28_g582, 1 ) ).xyz;
				float2 appendResult10_g583 = (float2(objToWorld11_g583.x , objToWorld11_g583.z));
				float ColorMask2Tiling17_g581 = _ColorMask2Tiling;
				float2 ColorMask2UVs83_g581 = ( appendResult10_g583 * ColorMask2Tiling17_g581 );
				float vertexToFrag25_g581 = (tex2Dlod( _ColorMask2, float4( ColorMask2UVs83_g581, 0, 0.0) )).r;
				output.ase_texcoord1.z = vertexToFrag25_g581;
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				output.ase_texcoord2 = input.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g577 * clampResult64_g577 ) + Scale_Pivot15_g577 ) - input.positionOS.xyz );

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

				float Debug_Target90_g581 = _Debug;
				float3 Color1A35_g581 = _Color1A;
				float3 Color1B36_g581 = _Color1B;
				float ColorMask1StartV54_g581 = _ColorMask1StartV;
				float ColorMask1EndV55_g581 = _ColorMask1EndV;
				float2 texCoord45_g581 = input.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult51_g581 = smoothstep( ( 1.0 - ColorMask1StartV54_g581 ) , ( 1.0 - ColorMask1EndV55_g581 ) , ( 1.0 - texCoord45_g581.y ));
				float ColorMask1StartVert58_g581 = _ColorMask1StartVert;
				float ColorMask1EndVert59_g581 = _ColorMask1EndVert;
				float smoothstepResult60_g581 = smoothstep( ColorMask1StartVert58_g581 , ColorMask1EndVert59_g581 , input.ase_texcoord2.xyz.y);
				#if defined( _COLORMASK1SOURCE_UVS )
				float staticSwitch44_g581 = smoothstepResult51_g581;
				#elif defined( _COLORMASK1SOURCE_VERTEXPOS )
				float staticSwitch44_g581 = smoothstepResult60_g581;
				#else
				float staticSwitch44_g581 = smoothstepResult51_g581;
				#endif
				float ColorMask1_F64_g581 = staticSwitch44_g581;
				float3 lerpResult67_g581 = lerp( Color1B36_g581 , Color1A35_g581 , ColorMask1_F64_g581);
				float3 Color175_g581 = lerpResult67_g581;
				float3 Color2B74_g581 = _Color2B;
				float3 Color2A73_g581 = _Color2A;
				float3 lerpResult76_g581 = lerp( Color2B74_g581 , Color2A73_g581 , ColorMask1_F64_g581);
				float3 Color280_g581 = lerpResult76_g581;
				float ColorMask2SharpMin30_g581 = _ColorMask2SharpMin;
				float ColorMask2SharpMax29_g581 = _ColorMask2SharpMax;
				float vertexToFrag25_g581 = input.ase_texcoord1.z;
				float smoothstepResult87_g581 = smoothstep( ColorMask2SharpMin30_g581 , ColorMask2SharpMax29_g581 , vertexToFrag25_g581);
				float ColorMask2_F26_g581 = smoothstepResult87_g581;
				float3 lerpResult11_g581 = lerp( Color175_g581 , Color280_g581 , ColorMask2_F26_g581);
				#if defined( _COLORS_ONE )
				float3 staticSwitch81_g581 = Color1A35_g581;
				#elif defined( _COLORS_TWO )
				float3 staticSwitch81_g581 = Color175_g581;
				#elif defined( _COLORS_FOUR )
				float3 staticSwitch81_g581 = lerpResult11_g581;
				#else
				float3 staticSwitch81_g581 = Color1A35_g581;
				#endif
				float2 uv_Albedo34_g581 = input.ase_texcoord1.xy;
				float4 tex2DNode34_g581 = tex2D( _Albedo, uv_Albedo34_g581 );
				float4 TextureColor37_g581 = tex2DNode34_g581;
				float4 Albedo90_g581 = ( float4( staticSwitch81_g581 , 0.0 ) * TextureColor37_g581 );
				#if defined( _COLORS_ONE )
				float staticSwitch100_g581 = 0.0;
				#elif defined( _COLORS_TWO )
				float staticSwitch100_g581 = ColorMask1_F64_g581;
				#elif defined( _COLORS_FOUR )
				float staticSwitch100_g581 = ColorMask1_F64_g581;
				#else
				float staticSwitch100_g581 = 0.0;
				#endif
				float ColorMask190_g581 = staticSwitch100_g581;
				#if defined( _COLORS_ONE )
				float staticSwitch95_g581 = 0.0;
				#elif defined( _COLORS_TWO )
				float staticSwitch95_g581 = 0.0;
				#elif defined( _COLORS_FOUR )
				float staticSwitch95_g581 = ColorMask2_F26_g581;
				#else
				float staticSwitch95_g581 = 0.0;
				#endif
				float ColorMask290_g581 = staticSwitch95_g581;
				float4 localDebug90_g581 = Debug90_g581( Debug_Target90_g581 , Albedo90_g581 , ColorMask190_g581 , ColorMask290_g581 );
				

				float3 BaseColor = localDebug90_g581.xyz;
				float Alpha = tex2DNode34_g581.a;
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local _MAINMOTION_ON
			#pragma shader_feature_local _DETAILMOTION1_ON


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
			float4 _Smoothness_ST;
			float3 _Color1A;
			float3 _Color1B;
			float3 _Color2A;
			float3 _Color2B;
			half _MMObjectHeight;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask1StartV;
			float _ColorMask1EndV;
			float _ColorMask1EndVert;
			float _ScaleVarNoiseSharpMax;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ColorMask2Tiling;
			float _NormalScale;
			float _Metallic;
			float _ColorMask1StartVert;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarMax;
			float _ScaleVarMin;
			half _MMAmplitudeOffset;
			float _MotionNoiseTiling;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			float _GVTime;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			float _SmoothnessScale;
			half _MMPhaseShiftScale;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			float _DM1AmplitudeOffset;
			float _DM1Amplitude;
			float _DM1Speed;
			half _MMDirectionAngle;
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

			sampler2D _MotionNoise;
			float Nicrom_MM_AmpScale_WSP;
			float Nicrom_MM_Time_WSP;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_WSP;
			half Nicrom_WindDirAngle;
			float Nicrom_DM_AmpScale_WSP;
			float Nicrom_DM_Time_WSP;
			float Nicrom_DM_SpeedScale_WSP;
			sampler2D _ScaleVarNoise;
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

				float MM_ObjectHeight196_g571 = _MMObjectHeight;
				float lerpResult201_g571 = lerp( 1.0 , ( 1.0 - saturate( ( abs( input.positionOS.xyz.y ) / MM_ObjectHeight196_g571 ) ) ) , step( input.positionOS.xyz.y , 0.0 ));
				float MM_Mask198_g571 = lerpResult201_g571;
				float MM_AmplitudeOffset77_g571 = _MMAmplitudeOffset;
				float3 appendResult28_g574 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot16_g571 = -appendResult28_g574;
				float3 objToWorld11_g575 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float2 appendResult10_g575 = (float2(objToWorld11_g575.x , objToWorld11_g575.z));
				float MotionNoiseTiling20_g571 = _MotionNoiseTiling;
				float4 WorldSpaceStaticNoise28_g571 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g575 * MotionNoiseTiling20_g571 ), 0, 0.0) );
				float MM_Amplitude85_g571 = _MMAmplitude;
				float GV_AmplitudeScale175_g571 = _GVAmplitudeScale;
				float lerpResult181_g571 = lerp( 1.0 , Nicrom_MM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float MM_AmplitudeScale87_g571 = lerpResult181_g571;
				float3 objToWorld134_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float MM_Time_G46_g571 = Nicrom_MM_Time_WSP;
				float GV_Time174_g571 = _GVTime;
				float lerpResult59_g571 = lerp( _TimeParameters.x , MM_Time_G46_g571 , GV_Time174_g571);
				float ApplicationIsPlaying208_g571 = Nicrom_ApplicationIsPlaying;
				float lerpResult227_g571 = lerp( _TimeParameters.x , lerpResult59_g571 , ApplicationIsPlaying208_g571);
				float MM_Time65_g571 = lerpResult227_g571;
				float MM_Speed58_g571 = _MMSpeed;
				float MM_SpeedScale_GV212_g571 = Nicrom_MM_SpeedScale_WSP;
				float lerpResult220_g571 = lerp( MM_SpeedScale_GV212_g571 , 1.0 , GV_Time174_g571);
				float lerpResult221_g571 = lerp( MM_SpeedScale_GV212_g571 , lerpResult220_g571 , ApplicationIsPlaying208_g571);
				float MM_SpeedScale222_g571 = lerpResult221_g571;
				float MM_SineWaveLength57_g571 = _MMSineWaveLength;
				float MM_PhaseShiftSource34_g571 = _MMPhaseShiftSource;
				float lerpResult47_g571 = lerp( input.ase_color.a , (WorldSpaceStaticNoise28_g571).g , MM_PhaseShiftSource34_g571);
				float MM_PhaseShiftScale43_g571 = _MMPhaseShiftScale;
				float MB_PhaseShift61_g571 = ( lerpResult47_g571 * MM_PhaseShiftScale43_g571 );
				float lerpResult56_g572 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle80_g571 = lerpResult56_g572;
				float MM_DirShift81_g571 = _MMDirectionShift;
				float MM_DirShiftOffset82_g571 = _MMDirectionShiftOffset;
				float4 StaticWorldNoise55_g573 = WorldSpaceStaticNoise28_g571;
				float3 objToWorld50_g573 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float Time76_g573 = MM_Time65_g571;
				float SpeedScale_RA80_g573 = 1.0;
				float MM_DirShiftSpeed83_g571 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale84_g571 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g573 = radians( ( ( ( 90.0 + MM_DirectionAngle80_g571 ) + ( ( MM_DirShift81_g571 + ( MM_DirShiftOffset82_g571 * (StaticWorldNoise55_g573).x ) ) * sin( ( ( objToWorld50_g573.x + objToWorld50_g573.z ) + ( ( Time76_g573 * ( SpeedScale_RA80_g573 * MM_DirShiftSpeed83_g571 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g573).z * MM_DirShiftNoiseScale84_g571 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g573 = (float3(cos( temp_output_11_0_g573 ) , 0.0 , sin( temp_output_11_0_g573 )));
				float3 worldToObj35_g573 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g573, 1 ) ).xyz;
				float3 worldToObj36_g573 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g573 = normalize( (( worldToObj35_g573 - worldToObj36_g573 )).xyz );
				float3 DirectionVector165_g571 = normalizeResult34_g573;
				#ifdef _MAINMOTION_ON
				float3 staticSwitch188_g571 = ( ( ( MM_Mask198_g571 * ( ( ( MM_AmplitudeOffset77_g571 * (WorldSpaceStaticNoise28_g571).r ) + MM_Amplitude85_g571 ) * MM_AmplitudeScale87_g571 ) ) * sin( ( ( ( objToWorld134_g571.x + objToWorld134_g571.z ) + ( ( MM_Time65_g571 * ( ( MM_Speed58_g571 * MM_SpeedScale222_g571 ) * MM_SineWaveLength57_g571 ) ) + ( ( 2.0 * PI ) * MB_PhaseShift61_g571 ) ) ) * ( ( 2.0 * PI ) / MM_SineWaveLength57_g571 ) ) ) ) * DirectionVector165_g571 );
				#else
				float3 staticSwitch188_g571 = float3( 0, 0, 0 );
				#endif
				float3 HorizontalMovement157_g571 = staticSwitch188_g571;
				float DM1_AmplitudeOffset66_g571 = _DM1AmplitudeOffset;
				float DM1_Amplitude70_g571 = _DM1Amplitude;
				float lerpResult184_g571 = lerp( 1.0 , Nicrom_DM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float DM_AmplitudeScale79_g571 = lerpResult184_g571;
				float3 objToWorld96_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float DM_Time_G31_g571 = Nicrom_DM_Time_WSP;
				float lerpResult45_g571 = lerp( _TimeParameters.x , DM_Time_G31_g571 , GV_Time174_g571);
				float lerpResult239_g571 = lerp( _TimeParameters.x , lerpResult45_g571 , ApplicationIsPlaying208_g571);
				float DM_Time53_g571 = lerpResult239_g571;
				float DM_SpeedScale_GV213_g571 = Nicrom_DM_SpeedScale_WSP;
				float lerpResult231_g571 = lerp( DM_SpeedScale_GV213_g571 , 1.0 , GV_Time174_g571);
				float lerpResult235_g571 = lerp( DM_SpeedScale_GV213_g571 , lerpResult231_g571 , ApplicationIsPlaying208_g571);
				float DM_SpeedScale236_g571 = lerpResult235_g571;
				float DM1_Speed50_g571 = _DM1Speed;
				float VC_PhaseShift42_g571 = input.ase_color.a;
				float3 rotatedValue126_g571 = RotateAroundAxis( LocalPivot16_g571, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( ( DM1_AmplitudeOffset66_g571 * (WorldSpaceStaticNoise28_g571).r ) + DM1_Amplitude70_g571 ) * DM_AmplitudeScale79_g571 ) * sin( ( ( ( objToWorld96_g571.x + objToWorld96_g571.z ) + ( ( DM_Time53_g571 * ( DM_SpeedScale236_g571 * DM1_Speed50_g571 ) ) + ( ( 2.0 * PI ) * ( 1.0 - VC_PhaseShift42_g571 ) ) ) ) * ( 2.0 * PI ) ) ) ) ) );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch130_g571 = ( rotatedValue126_g571 - input.positionOS.xyz );
				#else
				float3 staticSwitch130_g571 = float3( 0, 0, 0 );
				#endif
				float3 RotationMovement131_g571 = staticSwitch130_g571;
				float3 appendResult28_g580 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g577 = -appendResult28_g580;
				float3 temp_output_5_0_g577 = ( ( ( HorizontalMovement157_g571 + RotationMovement131_g571 ) + input.positionOS.xyz ) - Scale_Pivot15_g577 );
				float ScaleVartMin40_g577 = _ScaleVarMin;
				float ScaleVarMax41_g577 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g577 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g577 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g579 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g577, 1 ) ).xyz;
				float2 appendResult10_g579 = (float2(objToWorld11_g579.x , objToWorld11_g579.z));
				float2 Scale_WorldSpaceUVs30_g577 = appendResult10_g579;
				float Scale_VarNoiseTiling23_g577 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g577 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g577 * Scale_VarNoiseTiling23_g577 ), 0, 0.0) );
				float smoothstepResult56_g577 = smoothstep( ScaleNoiseSharpnessMin59_g577 , ScaleNoiseSharpnessMax60_g577 , (Scale_WorldSpaceNoise32_g577).r);
				float lerpResult44_g577 = lerp( ScaleVartMin40_g577 , ScaleVarMax41_g577 , smoothstepResult56_g577);
				float ScaleVar47_g577 = lerpResult44_g577;
				float clampResult63_g577 = clamp( ( ScaleVar47_g577 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g577 = ( temp_output_5_0_g577 * clampResult63_g577 );
				#else
				float3 staticSwitch72_g577 = temp_output_5_0_g577;
				#endif
				float ScaleOffset19_g577 = _ScaleOffset;
				float clampResult64_g577 = clamp( ( ScaleOffset19_g577 + 1.0 ) , 0.0 , 7.0 );
				
				output.ase_texcoord3.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g577 * clampResult64_g577 ) + Scale_Pivot15_g577 ) - input.positionOS.xyz );

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

				float2 uv_Normal103_g581 = input.ase_texcoord3.xy;
				float3 unpack103_g581 = UnpackNormalScale( tex2D( _Normal, uv_Normal103_g581 ), _NormalScale );
				unpack103_g581.z = lerp( 1, unpack103_g581.z, saturate(_NormalScale) );
				
				float2 uv_Albedo34_g581 = input.ase_texcoord3.xy;
				float4 tex2DNode34_g581 = tex2D( _Albedo, uv_Albedo34_g581 );
				

				float3 Normal = unpack103_g581;
				float Alpha = tex2DNode34_g581.a;
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
			#define _NORMALMAP 1
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local _MAINMOTION_ON
			#pragma shader_feature_local _DETAILMOTION1_ON
			#pragma shader_feature_local _COLORS_ONE _COLORS_TWO _COLORS_FOUR
			#pragma shader_feature_local _COLORMASK1SOURCE_UVS _COLORMASK1SOURCE_VERTEXPOS


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Smoothness_ST;
			float3 _Color1A;
			float3 _Color1B;
			float3 _Color2A;
			float3 _Color2B;
			half _MMObjectHeight;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask1StartV;
			float _ColorMask1EndV;
			float _ColorMask1EndVert;
			float _ScaleVarNoiseSharpMax;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ColorMask2Tiling;
			float _NormalScale;
			float _Metallic;
			float _ColorMask1StartVert;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarMax;
			float _ScaleVarMin;
			half _MMAmplitudeOffset;
			float _MotionNoiseTiling;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			float _GVTime;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			float _SmoothnessScale;
			half _MMPhaseShiftScale;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			float _DM1AmplitudeOffset;
			float _DM1Amplitude;
			float _DM1Speed;
			half _MMDirectionAngle;
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

			sampler2D _MotionNoise;
			float Nicrom_MM_AmpScale_WSP;
			float Nicrom_MM_Time_WSP;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_WSP;
			half Nicrom_WindDirAngle;
			float Nicrom_DM_AmpScale_WSP;
			float Nicrom_DM_Time_WSP;
			float Nicrom_DM_SpeedScale_WSP;
			sampler2D _ScaleVarNoise;
			sampler2D _ColorMask2;
			sampler2D _Albedo;
			sampler2D _Normal;
			sampler2D _Smoothness;


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
			
			float4 Debug90_g581( float Debug_Target, float4 Albedo, float ColorMask1, float ColorMask2 )
			{
				if(Debug_Target ==0)
				    return Albedo;
				else if(Debug_Target ==1)
				    return ColorMask1;
				else
				    return ColorMask2;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float MM_ObjectHeight196_g571 = _MMObjectHeight;
				float lerpResult201_g571 = lerp( 1.0 , ( 1.0 - saturate( ( abs( input.positionOS.xyz.y ) / MM_ObjectHeight196_g571 ) ) ) , step( input.positionOS.xyz.y , 0.0 ));
				float MM_Mask198_g571 = lerpResult201_g571;
				float MM_AmplitudeOffset77_g571 = _MMAmplitudeOffset;
				float3 appendResult28_g574 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 LocalPivot16_g571 = -appendResult28_g574;
				float3 objToWorld11_g575 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float2 appendResult10_g575 = (float2(objToWorld11_g575.x , objToWorld11_g575.z));
				float MotionNoiseTiling20_g571 = _MotionNoiseTiling;
				float4 WorldSpaceStaticNoise28_g571 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g575 * MotionNoiseTiling20_g571 ), 0, 0.0) );
				float MM_Amplitude85_g571 = _MMAmplitude;
				float GV_AmplitudeScale175_g571 = _GVAmplitudeScale;
				float lerpResult181_g571 = lerp( 1.0 , Nicrom_MM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float MM_AmplitudeScale87_g571 = lerpResult181_g571;
				float3 objToWorld134_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float MM_Time_G46_g571 = Nicrom_MM_Time_WSP;
				float GV_Time174_g571 = _GVTime;
				float lerpResult59_g571 = lerp( _TimeParameters.x , MM_Time_G46_g571 , GV_Time174_g571);
				float ApplicationIsPlaying208_g571 = Nicrom_ApplicationIsPlaying;
				float lerpResult227_g571 = lerp( _TimeParameters.x , lerpResult59_g571 , ApplicationIsPlaying208_g571);
				float MM_Time65_g571 = lerpResult227_g571;
				float MM_Speed58_g571 = _MMSpeed;
				float MM_SpeedScale_GV212_g571 = Nicrom_MM_SpeedScale_WSP;
				float lerpResult220_g571 = lerp( MM_SpeedScale_GV212_g571 , 1.0 , GV_Time174_g571);
				float lerpResult221_g571 = lerp( MM_SpeedScale_GV212_g571 , lerpResult220_g571 , ApplicationIsPlaying208_g571);
				float MM_SpeedScale222_g571 = lerpResult221_g571;
				float MM_SineWaveLength57_g571 = _MMSineWaveLength;
				float MM_PhaseShiftSource34_g571 = _MMPhaseShiftSource;
				float lerpResult47_g571 = lerp( input.ase_color.a , (WorldSpaceStaticNoise28_g571).g , MM_PhaseShiftSource34_g571);
				float MM_PhaseShiftScale43_g571 = _MMPhaseShiftScale;
				float MB_PhaseShift61_g571 = ( lerpResult47_g571 * MM_PhaseShiftScale43_g571 );
				float lerpResult56_g572 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle80_g571 = lerpResult56_g572;
				float MM_DirShift81_g571 = _MMDirectionShift;
				float MM_DirShiftOffset82_g571 = _MMDirectionShiftOffset;
				float4 StaticWorldNoise55_g573 = WorldSpaceStaticNoise28_g571;
				float3 objToWorld50_g573 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float Time76_g573 = MM_Time65_g571;
				float SpeedScale_RA80_g573 = 1.0;
				float MM_DirShiftSpeed83_g571 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale84_g571 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g573 = radians( ( ( ( 90.0 + MM_DirectionAngle80_g571 ) + ( ( MM_DirShift81_g571 + ( MM_DirShiftOffset82_g571 * (StaticWorldNoise55_g573).x ) ) * sin( ( ( objToWorld50_g573.x + objToWorld50_g573.z ) + ( ( Time76_g573 * ( SpeedScale_RA80_g573 * MM_DirShiftSpeed83_g571 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g573).z * MM_DirShiftNoiseScale84_g571 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g573 = (float3(cos( temp_output_11_0_g573 ) , 0.0 , sin( temp_output_11_0_g573 )));
				float3 worldToObj35_g573 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g573, 1 ) ).xyz;
				float3 worldToObj36_g573 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g573 = normalize( (( worldToObj35_g573 - worldToObj36_g573 )).xyz );
				float3 DirectionVector165_g571 = normalizeResult34_g573;
				#ifdef _MAINMOTION_ON
				float3 staticSwitch188_g571 = ( ( ( MM_Mask198_g571 * ( ( ( MM_AmplitudeOffset77_g571 * (WorldSpaceStaticNoise28_g571).r ) + MM_Amplitude85_g571 ) * MM_AmplitudeScale87_g571 ) ) * sin( ( ( ( objToWorld134_g571.x + objToWorld134_g571.z ) + ( ( MM_Time65_g571 * ( ( MM_Speed58_g571 * MM_SpeedScale222_g571 ) * MM_SineWaveLength57_g571 ) ) + ( ( 2.0 * PI ) * MB_PhaseShift61_g571 ) ) ) * ( ( 2.0 * PI ) / MM_SineWaveLength57_g571 ) ) ) ) * DirectionVector165_g571 );
				#else
				float3 staticSwitch188_g571 = float3( 0, 0, 0 );
				#endif
				float3 HorizontalMovement157_g571 = staticSwitch188_g571;
				float DM1_AmplitudeOffset66_g571 = _DM1AmplitudeOffset;
				float DM1_Amplitude70_g571 = _DM1Amplitude;
				float lerpResult184_g571 = lerp( 1.0 , Nicrom_DM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float DM_AmplitudeScale79_g571 = lerpResult184_g571;
				float3 objToWorld96_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float DM_Time_G31_g571 = Nicrom_DM_Time_WSP;
				float lerpResult45_g571 = lerp( _TimeParameters.x , DM_Time_G31_g571 , GV_Time174_g571);
				float lerpResult239_g571 = lerp( _TimeParameters.x , lerpResult45_g571 , ApplicationIsPlaying208_g571);
				float DM_Time53_g571 = lerpResult239_g571;
				float DM_SpeedScale_GV213_g571 = Nicrom_DM_SpeedScale_WSP;
				float lerpResult231_g571 = lerp( DM_SpeedScale_GV213_g571 , 1.0 , GV_Time174_g571);
				float lerpResult235_g571 = lerp( DM_SpeedScale_GV213_g571 , lerpResult231_g571 , ApplicationIsPlaying208_g571);
				float DM_SpeedScale236_g571 = lerpResult235_g571;
				float DM1_Speed50_g571 = _DM1Speed;
				float VC_PhaseShift42_g571 = input.ase_color.a;
				float3 rotatedValue126_g571 = RotateAroundAxis( LocalPivot16_g571, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( ( DM1_AmplitudeOffset66_g571 * (WorldSpaceStaticNoise28_g571).r ) + DM1_Amplitude70_g571 ) * DM_AmplitudeScale79_g571 ) * sin( ( ( ( objToWorld96_g571.x + objToWorld96_g571.z ) + ( ( DM_Time53_g571 * ( DM_SpeedScale236_g571 * DM1_Speed50_g571 ) ) + ( ( 2.0 * PI ) * ( 1.0 - VC_PhaseShift42_g571 ) ) ) ) * ( 2.0 * PI ) ) ) ) ) );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch130_g571 = ( rotatedValue126_g571 - input.positionOS.xyz );
				#else
				float3 staticSwitch130_g571 = float3( 0, 0, 0 );
				#endif
				float3 RotationMovement131_g571 = staticSwitch130_g571;
				float3 appendResult28_g580 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 Scale_Pivot15_g577 = -appendResult28_g580;
				float3 temp_output_5_0_g577 = ( ( ( HorizontalMovement157_g571 + RotationMovement131_g571 ) + input.positionOS.xyz ) - Scale_Pivot15_g577 );
				float ScaleVartMin40_g577 = _ScaleVarMin;
				float ScaleVarMax41_g577 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g577 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g577 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g579 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g577, 1 ) ).xyz;
				float2 appendResult10_g579 = (float2(objToWorld11_g579.x , objToWorld11_g579.z));
				float2 Scale_WorldSpaceUVs30_g577 = appendResult10_g579;
				float Scale_VarNoiseTiling23_g577 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g577 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g577 * Scale_VarNoiseTiling23_g577 ), 0, 0.0) );
				float smoothstepResult56_g577 = smoothstep( ScaleNoiseSharpnessMin59_g577 , ScaleNoiseSharpnessMax60_g577 , (Scale_WorldSpaceNoise32_g577).r);
				float lerpResult44_g577 = lerp( ScaleVartMin40_g577 , ScaleVarMax41_g577 , smoothstepResult56_g577);
				float ScaleVar47_g577 = lerpResult44_g577;
				float clampResult63_g577 = clamp( ( ScaleVar47_g577 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g577 = ( temp_output_5_0_g577 * clampResult63_g577 );
				#else
				float3 staticSwitch72_g577 = temp_output_5_0_g577;
				#endif
				float ScaleOffset19_g577 = _ScaleOffset;
				float clampResult64_g577 = clamp( ( ScaleOffset19_g577 + 1.0 ) , 0.0 , 7.0 );
				
				float3 appendResult28_g582 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 objToWorld11_g583 = mul( GetObjectToWorldMatrix(), float4( -appendResult28_g582, 1 ) ).xyz;
				float2 appendResult10_g583 = (float2(objToWorld11_g583.x , objToWorld11_g583.z));
				float ColorMask2Tiling17_g581 = _ColorMask2Tiling;
				float2 ColorMask2UVs83_g581 = ( appendResult10_g583 * ColorMask2Tiling17_g581 );
				float vertexToFrag25_g581 = (tex2Dlod( _ColorMask2, float4( ColorMask2UVs83_g581, 0, 0.0) )).r;
				output.ase_texcoord7.z = vertexToFrag25_g581;
				
				output.ase_texcoord7.xy = input.texcoord.xy;
				output.ase_texcoord8 = input.positionOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord7.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g577 * clampResult64_g577 ) + Scale_Pivot15_g577 ) - input.positionOS.xyz );

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

				float Debug_Target90_g581 = _Debug;
				float3 Color1A35_g581 = _Color1A;
				float3 Color1B36_g581 = _Color1B;
				float ColorMask1StartV54_g581 = _ColorMask1StartV;
				float ColorMask1EndV55_g581 = _ColorMask1EndV;
				float2 texCoord45_g581 = input.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult51_g581 = smoothstep( ( 1.0 - ColorMask1StartV54_g581 ) , ( 1.0 - ColorMask1EndV55_g581 ) , ( 1.0 - texCoord45_g581.y ));
				float ColorMask1StartVert58_g581 = _ColorMask1StartVert;
				float ColorMask1EndVert59_g581 = _ColorMask1EndVert;
				float smoothstepResult60_g581 = smoothstep( ColorMask1StartVert58_g581 , ColorMask1EndVert59_g581 , input.ase_texcoord8.xyz.y);
				#if defined( _COLORMASK1SOURCE_UVS )
				float staticSwitch44_g581 = smoothstepResult51_g581;
				#elif defined( _COLORMASK1SOURCE_VERTEXPOS )
				float staticSwitch44_g581 = smoothstepResult60_g581;
				#else
				float staticSwitch44_g581 = smoothstepResult51_g581;
				#endif
				float ColorMask1_F64_g581 = staticSwitch44_g581;
				float3 lerpResult67_g581 = lerp( Color1B36_g581 , Color1A35_g581 , ColorMask1_F64_g581);
				float3 Color175_g581 = lerpResult67_g581;
				float3 Color2B74_g581 = _Color2B;
				float3 Color2A73_g581 = _Color2A;
				float3 lerpResult76_g581 = lerp( Color2B74_g581 , Color2A73_g581 , ColorMask1_F64_g581);
				float3 Color280_g581 = lerpResult76_g581;
				float ColorMask2SharpMin30_g581 = _ColorMask2SharpMin;
				float ColorMask2SharpMax29_g581 = _ColorMask2SharpMax;
				float vertexToFrag25_g581 = input.ase_texcoord7.z;
				float smoothstepResult87_g581 = smoothstep( ColorMask2SharpMin30_g581 , ColorMask2SharpMax29_g581 , vertexToFrag25_g581);
				float ColorMask2_F26_g581 = smoothstepResult87_g581;
				float3 lerpResult11_g581 = lerp( Color175_g581 , Color280_g581 , ColorMask2_F26_g581);
				#if defined( _COLORS_ONE )
				float3 staticSwitch81_g581 = Color1A35_g581;
				#elif defined( _COLORS_TWO )
				float3 staticSwitch81_g581 = Color175_g581;
				#elif defined( _COLORS_FOUR )
				float3 staticSwitch81_g581 = lerpResult11_g581;
				#else
				float3 staticSwitch81_g581 = Color1A35_g581;
				#endif
				float2 uv_Albedo34_g581 = input.ase_texcoord7.xy;
				float4 tex2DNode34_g581 = tex2D( _Albedo, uv_Albedo34_g581 );
				float4 TextureColor37_g581 = tex2DNode34_g581;
				float4 Albedo90_g581 = ( float4( staticSwitch81_g581 , 0.0 ) * TextureColor37_g581 );
				#if defined( _COLORS_ONE )
				float staticSwitch100_g581 = 0.0;
				#elif defined( _COLORS_TWO )
				float staticSwitch100_g581 = ColorMask1_F64_g581;
				#elif defined( _COLORS_FOUR )
				float staticSwitch100_g581 = ColorMask1_F64_g581;
				#else
				float staticSwitch100_g581 = 0.0;
				#endif
				float ColorMask190_g581 = staticSwitch100_g581;
				#if defined( _COLORS_ONE )
				float staticSwitch95_g581 = 0.0;
				#elif defined( _COLORS_TWO )
				float staticSwitch95_g581 = 0.0;
				#elif defined( _COLORS_FOUR )
				float staticSwitch95_g581 = ColorMask2_F26_g581;
				#else
				float staticSwitch95_g581 = 0.0;
				#endif
				float ColorMask290_g581 = staticSwitch95_g581;
				float4 localDebug90_g581 = Debug90_g581( Debug_Target90_g581 , Albedo90_g581 , ColorMask190_g581 , ColorMask290_g581 );
				
				float2 uv_Normal103_g581 = input.ase_texcoord7.xy;
				float3 unpack103_g581 = UnpackNormalScale( tex2D( _Normal, uv_Normal103_g581 ), _NormalScale );
				unpack103_g581.z = lerp( 1, unpack103_g581.z, saturate(_NormalScale) );
				
				float2 uv_Smoothness = input.ase_texcoord7.xy * _Smoothness_ST.xy + _Smoothness_ST.zw;
				

				float3 BaseColor = localDebug90_g581.xyz;
				float3 Normal = unpack103_g581;
				float3 Specular = 0.5;
				float Metallic = _Metallic;
				float Smoothness = ( tex2D( _Smoothness, uv_Smoothness ).r * _SmoothnessScale );
				float Occlusion = 1;
				float3 Emission = 0;
				float Alpha = tex2DNode34_g581.a;
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local _MAINMOTION_ON
			#pragma shader_feature_local _DETAILMOTION1_ON


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
			float4 _Smoothness_ST;
			float3 _Color1A;
			float3 _Color1B;
			float3 _Color2A;
			float3 _Color2B;
			half _MMObjectHeight;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask1StartV;
			float _ColorMask1EndV;
			float _ColorMask1EndVert;
			float _ScaleVarNoiseSharpMax;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ColorMask2Tiling;
			float _NormalScale;
			float _Metallic;
			float _ColorMask1StartVert;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarMax;
			float _ScaleVarMin;
			half _MMAmplitudeOffset;
			float _MotionNoiseTiling;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			float _GVTime;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			float _SmoothnessScale;
			half _MMPhaseShiftScale;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			float _DM1AmplitudeOffset;
			float _DM1Amplitude;
			float _DM1Speed;
			half _MMDirectionAngle;
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

			sampler2D _MotionNoise;
			float Nicrom_MM_AmpScale_WSP;
			float Nicrom_MM_Time_WSP;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_WSP;
			half Nicrom_WindDirAngle;
			float Nicrom_DM_AmpScale_WSP;
			float Nicrom_DM_Time_WSP;
			float Nicrom_DM_SpeedScale_WSP;
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

				float MM_ObjectHeight196_g571 = _MMObjectHeight;
				float lerpResult201_g571 = lerp( 1.0 , ( 1.0 - saturate( ( abs( input.positionOS.xyz.y ) / MM_ObjectHeight196_g571 ) ) ) , step( input.positionOS.xyz.y , 0.0 ));
				float MM_Mask198_g571 = lerpResult201_g571;
				float MM_AmplitudeOffset77_g571 = _MMAmplitudeOffset;
				float3 appendResult28_g574 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot16_g571 = -appendResult28_g574;
				float3 objToWorld11_g575 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float2 appendResult10_g575 = (float2(objToWorld11_g575.x , objToWorld11_g575.z));
				float MotionNoiseTiling20_g571 = _MotionNoiseTiling;
				float4 WorldSpaceStaticNoise28_g571 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g575 * MotionNoiseTiling20_g571 ), 0, 0.0) );
				float MM_Amplitude85_g571 = _MMAmplitude;
				float GV_AmplitudeScale175_g571 = _GVAmplitudeScale;
				float lerpResult181_g571 = lerp( 1.0 , Nicrom_MM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float MM_AmplitudeScale87_g571 = lerpResult181_g571;
				float3 objToWorld134_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float MM_Time_G46_g571 = Nicrom_MM_Time_WSP;
				float GV_Time174_g571 = _GVTime;
				float lerpResult59_g571 = lerp( _TimeParameters.x , MM_Time_G46_g571 , GV_Time174_g571);
				float ApplicationIsPlaying208_g571 = Nicrom_ApplicationIsPlaying;
				float lerpResult227_g571 = lerp( _TimeParameters.x , lerpResult59_g571 , ApplicationIsPlaying208_g571);
				float MM_Time65_g571 = lerpResult227_g571;
				float MM_Speed58_g571 = _MMSpeed;
				float MM_SpeedScale_GV212_g571 = Nicrom_MM_SpeedScale_WSP;
				float lerpResult220_g571 = lerp( MM_SpeedScale_GV212_g571 , 1.0 , GV_Time174_g571);
				float lerpResult221_g571 = lerp( MM_SpeedScale_GV212_g571 , lerpResult220_g571 , ApplicationIsPlaying208_g571);
				float MM_SpeedScale222_g571 = lerpResult221_g571;
				float MM_SineWaveLength57_g571 = _MMSineWaveLength;
				float MM_PhaseShiftSource34_g571 = _MMPhaseShiftSource;
				float lerpResult47_g571 = lerp( input.ase_color.a , (WorldSpaceStaticNoise28_g571).g , MM_PhaseShiftSource34_g571);
				float MM_PhaseShiftScale43_g571 = _MMPhaseShiftScale;
				float MB_PhaseShift61_g571 = ( lerpResult47_g571 * MM_PhaseShiftScale43_g571 );
				float lerpResult56_g572 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle80_g571 = lerpResult56_g572;
				float MM_DirShift81_g571 = _MMDirectionShift;
				float MM_DirShiftOffset82_g571 = _MMDirectionShiftOffset;
				float4 StaticWorldNoise55_g573 = WorldSpaceStaticNoise28_g571;
				float3 objToWorld50_g573 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float Time76_g573 = MM_Time65_g571;
				float SpeedScale_RA80_g573 = 1.0;
				float MM_DirShiftSpeed83_g571 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale84_g571 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g573 = radians( ( ( ( 90.0 + MM_DirectionAngle80_g571 ) + ( ( MM_DirShift81_g571 + ( MM_DirShiftOffset82_g571 * (StaticWorldNoise55_g573).x ) ) * sin( ( ( objToWorld50_g573.x + objToWorld50_g573.z ) + ( ( Time76_g573 * ( SpeedScale_RA80_g573 * MM_DirShiftSpeed83_g571 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g573).z * MM_DirShiftNoiseScale84_g571 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g573 = (float3(cos( temp_output_11_0_g573 ) , 0.0 , sin( temp_output_11_0_g573 )));
				float3 worldToObj35_g573 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g573, 1 ) ).xyz;
				float3 worldToObj36_g573 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g573 = normalize( (( worldToObj35_g573 - worldToObj36_g573 )).xyz );
				float3 DirectionVector165_g571 = normalizeResult34_g573;
				#ifdef _MAINMOTION_ON
				float3 staticSwitch188_g571 = ( ( ( MM_Mask198_g571 * ( ( ( MM_AmplitudeOffset77_g571 * (WorldSpaceStaticNoise28_g571).r ) + MM_Amplitude85_g571 ) * MM_AmplitudeScale87_g571 ) ) * sin( ( ( ( objToWorld134_g571.x + objToWorld134_g571.z ) + ( ( MM_Time65_g571 * ( ( MM_Speed58_g571 * MM_SpeedScale222_g571 ) * MM_SineWaveLength57_g571 ) ) + ( ( 2.0 * PI ) * MB_PhaseShift61_g571 ) ) ) * ( ( 2.0 * PI ) / MM_SineWaveLength57_g571 ) ) ) ) * DirectionVector165_g571 );
				#else
				float3 staticSwitch188_g571 = float3( 0, 0, 0 );
				#endif
				float3 HorizontalMovement157_g571 = staticSwitch188_g571;
				float DM1_AmplitudeOffset66_g571 = _DM1AmplitudeOffset;
				float DM1_Amplitude70_g571 = _DM1Amplitude;
				float lerpResult184_g571 = lerp( 1.0 , Nicrom_DM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float DM_AmplitudeScale79_g571 = lerpResult184_g571;
				float3 objToWorld96_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float DM_Time_G31_g571 = Nicrom_DM_Time_WSP;
				float lerpResult45_g571 = lerp( _TimeParameters.x , DM_Time_G31_g571 , GV_Time174_g571);
				float lerpResult239_g571 = lerp( _TimeParameters.x , lerpResult45_g571 , ApplicationIsPlaying208_g571);
				float DM_Time53_g571 = lerpResult239_g571;
				float DM_SpeedScale_GV213_g571 = Nicrom_DM_SpeedScale_WSP;
				float lerpResult231_g571 = lerp( DM_SpeedScale_GV213_g571 , 1.0 , GV_Time174_g571);
				float lerpResult235_g571 = lerp( DM_SpeedScale_GV213_g571 , lerpResult231_g571 , ApplicationIsPlaying208_g571);
				float DM_SpeedScale236_g571 = lerpResult235_g571;
				float DM1_Speed50_g571 = _DM1Speed;
				float VC_PhaseShift42_g571 = input.ase_color.a;
				float3 rotatedValue126_g571 = RotateAroundAxis( LocalPivot16_g571, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( ( DM1_AmplitudeOffset66_g571 * (WorldSpaceStaticNoise28_g571).r ) + DM1_Amplitude70_g571 ) * DM_AmplitudeScale79_g571 ) * sin( ( ( ( objToWorld96_g571.x + objToWorld96_g571.z ) + ( ( DM_Time53_g571 * ( DM_SpeedScale236_g571 * DM1_Speed50_g571 ) ) + ( ( 2.0 * PI ) * ( 1.0 - VC_PhaseShift42_g571 ) ) ) ) * ( 2.0 * PI ) ) ) ) ) );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch130_g571 = ( rotatedValue126_g571 - input.positionOS.xyz );
				#else
				float3 staticSwitch130_g571 = float3( 0, 0, 0 );
				#endif
				float3 RotationMovement131_g571 = staticSwitch130_g571;
				float3 appendResult28_g580 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g577 = -appendResult28_g580;
				float3 temp_output_5_0_g577 = ( ( ( HorizontalMovement157_g571 + RotationMovement131_g571 ) + input.positionOS.xyz ) - Scale_Pivot15_g577 );
				float ScaleVartMin40_g577 = _ScaleVarMin;
				float ScaleVarMax41_g577 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g577 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g577 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g579 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g577, 1 ) ).xyz;
				float2 appendResult10_g579 = (float2(objToWorld11_g579.x , objToWorld11_g579.z));
				float2 Scale_WorldSpaceUVs30_g577 = appendResult10_g579;
				float Scale_VarNoiseTiling23_g577 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g577 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g577 * Scale_VarNoiseTiling23_g577 ), 0, 0.0) );
				float smoothstepResult56_g577 = smoothstep( ScaleNoiseSharpnessMin59_g577 , ScaleNoiseSharpnessMax60_g577 , (Scale_WorldSpaceNoise32_g577).r);
				float lerpResult44_g577 = lerp( ScaleVartMin40_g577 , ScaleVarMax41_g577 , smoothstepResult56_g577);
				float ScaleVar47_g577 = lerpResult44_g577;
				float clampResult63_g577 = clamp( ( ScaleVar47_g577 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g577 = ( temp_output_5_0_g577 * clampResult63_g577 );
				#else
				float3 staticSwitch72_g577 = temp_output_5_0_g577;
				#endif
				float ScaleOffset19_g577 = _ScaleOffset;
				float clampResult64_g577 = clamp( ( ScaleOffset19_g577 + 1.0 ) , 0.0 , 7.0 );
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g577 * clampResult64_g577 ) + Scale_Pivot15_g577 ) - input.positionOS.xyz );

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

				float2 uv_Albedo34_g581 = input.ase_texcoord1.xy;
				float4 tex2DNode34_g581 = tex2D( _Albedo, uv_Albedo34_g581 );
				

				surfaceDescription.Alpha = tex2DNode34_g581.a;
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local _MAINMOTION_ON
			#pragma shader_feature_local _DETAILMOTION1_ON


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
			float4 _Smoothness_ST;
			float3 _Color1A;
			float3 _Color1B;
			float3 _Color2A;
			float3 _Color2B;
			half _MMObjectHeight;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask1StartV;
			float _ColorMask1EndV;
			float _ColorMask1EndVert;
			float _ScaleVarNoiseSharpMax;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ColorMask2Tiling;
			float _NormalScale;
			float _Metallic;
			float _ColorMask1StartVert;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarMax;
			float _ScaleVarMin;
			half _MMAmplitudeOffset;
			float _MotionNoiseTiling;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			float _GVTime;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			float _SmoothnessScale;
			half _MMPhaseShiftScale;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			float _DM1AmplitudeOffset;
			float _DM1Amplitude;
			float _DM1Speed;
			half _MMDirectionAngle;
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

			sampler2D _MotionNoise;
			float Nicrom_MM_AmpScale_WSP;
			float Nicrom_MM_Time_WSP;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_WSP;
			half Nicrom_WindDirAngle;
			float Nicrom_DM_AmpScale_WSP;
			float Nicrom_DM_Time_WSP;
			float Nicrom_DM_SpeedScale_WSP;
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

				float MM_ObjectHeight196_g571 = _MMObjectHeight;
				float lerpResult201_g571 = lerp( 1.0 , ( 1.0 - saturate( ( abs( input.positionOS.xyz.y ) / MM_ObjectHeight196_g571 ) ) ) , step( input.positionOS.xyz.y , 0.0 ));
				float MM_Mask198_g571 = lerpResult201_g571;
				float MM_AmplitudeOffset77_g571 = _MMAmplitudeOffset;
				float3 appendResult28_g574 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot16_g571 = -appendResult28_g574;
				float3 objToWorld11_g575 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float2 appendResult10_g575 = (float2(objToWorld11_g575.x , objToWorld11_g575.z));
				float MotionNoiseTiling20_g571 = _MotionNoiseTiling;
				float4 WorldSpaceStaticNoise28_g571 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g575 * MotionNoiseTiling20_g571 ), 0, 0.0) );
				float MM_Amplitude85_g571 = _MMAmplitude;
				float GV_AmplitudeScale175_g571 = _GVAmplitudeScale;
				float lerpResult181_g571 = lerp( 1.0 , Nicrom_MM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float MM_AmplitudeScale87_g571 = lerpResult181_g571;
				float3 objToWorld134_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float MM_Time_G46_g571 = Nicrom_MM_Time_WSP;
				float GV_Time174_g571 = _GVTime;
				float lerpResult59_g571 = lerp( _TimeParameters.x , MM_Time_G46_g571 , GV_Time174_g571);
				float ApplicationIsPlaying208_g571 = Nicrom_ApplicationIsPlaying;
				float lerpResult227_g571 = lerp( _TimeParameters.x , lerpResult59_g571 , ApplicationIsPlaying208_g571);
				float MM_Time65_g571 = lerpResult227_g571;
				float MM_Speed58_g571 = _MMSpeed;
				float MM_SpeedScale_GV212_g571 = Nicrom_MM_SpeedScale_WSP;
				float lerpResult220_g571 = lerp( MM_SpeedScale_GV212_g571 , 1.0 , GV_Time174_g571);
				float lerpResult221_g571 = lerp( MM_SpeedScale_GV212_g571 , lerpResult220_g571 , ApplicationIsPlaying208_g571);
				float MM_SpeedScale222_g571 = lerpResult221_g571;
				float MM_SineWaveLength57_g571 = _MMSineWaveLength;
				float MM_PhaseShiftSource34_g571 = _MMPhaseShiftSource;
				float lerpResult47_g571 = lerp( input.ase_color.a , (WorldSpaceStaticNoise28_g571).g , MM_PhaseShiftSource34_g571);
				float MM_PhaseShiftScale43_g571 = _MMPhaseShiftScale;
				float MB_PhaseShift61_g571 = ( lerpResult47_g571 * MM_PhaseShiftScale43_g571 );
				float lerpResult56_g572 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle80_g571 = lerpResult56_g572;
				float MM_DirShift81_g571 = _MMDirectionShift;
				float MM_DirShiftOffset82_g571 = _MMDirectionShiftOffset;
				float4 StaticWorldNoise55_g573 = WorldSpaceStaticNoise28_g571;
				float3 objToWorld50_g573 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float Time76_g573 = MM_Time65_g571;
				float SpeedScale_RA80_g573 = 1.0;
				float MM_DirShiftSpeed83_g571 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale84_g571 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g573 = radians( ( ( ( 90.0 + MM_DirectionAngle80_g571 ) + ( ( MM_DirShift81_g571 + ( MM_DirShiftOffset82_g571 * (StaticWorldNoise55_g573).x ) ) * sin( ( ( objToWorld50_g573.x + objToWorld50_g573.z ) + ( ( Time76_g573 * ( SpeedScale_RA80_g573 * MM_DirShiftSpeed83_g571 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g573).z * MM_DirShiftNoiseScale84_g571 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g573 = (float3(cos( temp_output_11_0_g573 ) , 0.0 , sin( temp_output_11_0_g573 )));
				float3 worldToObj35_g573 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g573, 1 ) ).xyz;
				float3 worldToObj36_g573 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g573 = normalize( (( worldToObj35_g573 - worldToObj36_g573 )).xyz );
				float3 DirectionVector165_g571 = normalizeResult34_g573;
				#ifdef _MAINMOTION_ON
				float3 staticSwitch188_g571 = ( ( ( MM_Mask198_g571 * ( ( ( MM_AmplitudeOffset77_g571 * (WorldSpaceStaticNoise28_g571).r ) + MM_Amplitude85_g571 ) * MM_AmplitudeScale87_g571 ) ) * sin( ( ( ( objToWorld134_g571.x + objToWorld134_g571.z ) + ( ( MM_Time65_g571 * ( ( MM_Speed58_g571 * MM_SpeedScale222_g571 ) * MM_SineWaveLength57_g571 ) ) + ( ( 2.0 * PI ) * MB_PhaseShift61_g571 ) ) ) * ( ( 2.0 * PI ) / MM_SineWaveLength57_g571 ) ) ) ) * DirectionVector165_g571 );
				#else
				float3 staticSwitch188_g571 = float3( 0, 0, 0 );
				#endif
				float3 HorizontalMovement157_g571 = staticSwitch188_g571;
				float DM1_AmplitudeOffset66_g571 = _DM1AmplitudeOffset;
				float DM1_Amplitude70_g571 = _DM1Amplitude;
				float lerpResult184_g571 = lerp( 1.0 , Nicrom_DM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float DM_AmplitudeScale79_g571 = lerpResult184_g571;
				float3 objToWorld96_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float DM_Time_G31_g571 = Nicrom_DM_Time_WSP;
				float lerpResult45_g571 = lerp( _TimeParameters.x , DM_Time_G31_g571 , GV_Time174_g571);
				float lerpResult239_g571 = lerp( _TimeParameters.x , lerpResult45_g571 , ApplicationIsPlaying208_g571);
				float DM_Time53_g571 = lerpResult239_g571;
				float DM_SpeedScale_GV213_g571 = Nicrom_DM_SpeedScale_WSP;
				float lerpResult231_g571 = lerp( DM_SpeedScale_GV213_g571 , 1.0 , GV_Time174_g571);
				float lerpResult235_g571 = lerp( DM_SpeedScale_GV213_g571 , lerpResult231_g571 , ApplicationIsPlaying208_g571);
				float DM_SpeedScale236_g571 = lerpResult235_g571;
				float DM1_Speed50_g571 = _DM1Speed;
				float VC_PhaseShift42_g571 = input.ase_color.a;
				float3 rotatedValue126_g571 = RotateAroundAxis( LocalPivot16_g571, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( ( DM1_AmplitudeOffset66_g571 * (WorldSpaceStaticNoise28_g571).r ) + DM1_Amplitude70_g571 ) * DM_AmplitudeScale79_g571 ) * sin( ( ( ( objToWorld96_g571.x + objToWorld96_g571.z ) + ( ( DM_Time53_g571 * ( DM_SpeedScale236_g571 * DM1_Speed50_g571 ) ) + ( ( 2.0 * PI ) * ( 1.0 - VC_PhaseShift42_g571 ) ) ) ) * ( 2.0 * PI ) ) ) ) ) );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch130_g571 = ( rotatedValue126_g571 - input.positionOS.xyz );
				#else
				float3 staticSwitch130_g571 = float3( 0, 0, 0 );
				#endif
				float3 RotationMovement131_g571 = staticSwitch130_g571;
				float3 appendResult28_g580 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g577 = -appendResult28_g580;
				float3 temp_output_5_0_g577 = ( ( ( HorizontalMovement157_g571 + RotationMovement131_g571 ) + input.positionOS.xyz ) - Scale_Pivot15_g577 );
				float ScaleVartMin40_g577 = _ScaleVarMin;
				float ScaleVarMax41_g577 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g577 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g577 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g579 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g577, 1 ) ).xyz;
				float2 appendResult10_g579 = (float2(objToWorld11_g579.x , objToWorld11_g579.z));
				float2 Scale_WorldSpaceUVs30_g577 = appendResult10_g579;
				float Scale_VarNoiseTiling23_g577 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g577 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g577 * Scale_VarNoiseTiling23_g577 ), 0, 0.0) );
				float smoothstepResult56_g577 = smoothstep( ScaleNoiseSharpnessMin59_g577 , ScaleNoiseSharpnessMax60_g577 , (Scale_WorldSpaceNoise32_g577).r);
				float lerpResult44_g577 = lerp( ScaleVartMin40_g577 , ScaleVarMax41_g577 , smoothstepResult56_g577);
				float ScaleVar47_g577 = lerpResult44_g577;
				float clampResult63_g577 = clamp( ( ScaleVar47_g577 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g577 = ( temp_output_5_0_g577 * clampResult63_g577 );
				#else
				float3 staticSwitch72_g577 = temp_output_5_0_g577;
				#endif
				float ScaleOffset19_g577 = _ScaleOffset;
				float clampResult64_g577 = clamp( ( ScaleOffset19_g577 + 1.0 ) , 0.0 , 7.0 );
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g577 * clampResult64_g577 ) + Scale_Pivot15_g577 ) - input.positionOS.xyz );

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

				float2 uv_Albedo34_g581 = input.ase_texcoord1.xy;
				float4 tex2DNode34_g581 = tex2D( _Albedo, uv_Albedo34_g581 );
				

				surfaceDescription.Alpha = tex2DNode34_g581.a;
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

			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_TEXTURE_COORDINATES1
			#define ASE_NEEDS_VERT_TEXTURE_COORDINATES1
			#define ASE_NEEDS_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _SCALEVARIATION_ON
			#pragma shader_feature_local _MAINMOTION_ON
			#pragma shader_feature_local _DETAILMOTION1_ON


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
			float4 _Smoothness_ST;
			float3 _Color1A;
			float3 _Color1B;
			float3 _Color2A;
			float3 _Color2B;
			half _MMObjectHeight;
			float _ScaleVarNoiseTiling;
			float _ScaleOffset;
			float _Debug;
			float _ColorMask1StartV;
			float _ColorMask1EndV;
			float _ColorMask1EndVert;
			float _ScaleVarNoiseSharpMax;
			float _ColorMask2SharpMin;
			float _ColorMask2SharpMax;
			float _ColorMask2Tiling;
			float _NormalScale;
			float _Metallic;
			float _ColorMask1StartVert;
			float _ScaleVarNoiseSharpMin;
			float _ScaleVarMax;
			float _ScaleVarMin;
			half _MMAmplitudeOffset;
			float _MotionNoiseTiling;
			half _MMAmplitude;
			half _GVAmplitudeScale;
			float _GVTime;
			half _MMSpeed;
			half _MMSineWaveLength;
			half _MMPhaseShiftSource;
			float _SmoothnessScale;
			half _MMPhaseShiftScale;
			half _GVDirectionAngle;
			half _MMDirectionShift;
			half _MMDirectionShiftOffset;
			half _MMDirectionShiftSpeed;
			half _MMDirectionShiftNoiseScale;
			float _DM1AmplitudeOffset;
			float _DM1Amplitude;
			float _DM1Speed;
			half _MMDirectionAngle;
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

			sampler2D _MotionNoise;
			float Nicrom_MM_AmpScale_WSP;
			float Nicrom_MM_Time_WSP;
			half Nicrom_ApplicationIsPlaying;
			float Nicrom_MM_SpeedScale_WSP;
			half Nicrom_WindDirAngle;
			float Nicrom_DM_AmpScale_WSP;
			float Nicrom_DM_Time_WSP;
			float Nicrom_DM_SpeedScale_WSP;
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
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float MM_ObjectHeight196_g571 = _MMObjectHeight;
				float lerpResult201_g571 = lerp( 1.0 , ( 1.0 - saturate( ( abs( input.positionOS.xyz.y ) / MM_ObjectHeight196_g571 ) ) ) , step( input.positionOS.xyz.y , 0.0 ));
				float MM_Mask198_g571 = lerpResult201_g571;
				float MM_AmplitudeOffset77_g571 = _MMAmplitudeOffset;
				float3 appendResult28_g574 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 LocalPivot16_g571 = -appendResult28_g574;
				float3 objToWorld11_g575 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float2 appendResult10_g575 = (float2(objToWorld11_g575.x , objToWorld11_g575.z));
				float MotionNoiseTiling20_g571 = _MotionNoiseTiling;
				float4 WorldSpaceStaticNoise28_g571 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g575 * MotionNoiseTiling20_g571 ), 0, 0.0) );
				float MM_Amplitude85_g571 = _MMAmplitude;
				float GV_AmplitudeScale175_g571 = _GVAmplitudeScale;
				float lerpResult181_g571 = lerp( 1.0 , Nicrom_MM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float MM_AmplitudeScale87_g571 = lerpResult181_g571;
				float3 objToWorld134_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float MM_Time_G46_g571 = Nicrom_MM_Time_WSP;
				float GV_Time174_g571 = _GVTime;
				float lerpResult59_g571 = lerp( _TimeParameters.x , MM_Time_G46_g571 , GV_Time174_g571);
				float ApplicationIsPlaying208_g571 = Nicrom_ApplicationIsPlaying;
				float lerpResult227_g571 = lerp( _TimeParameters.x , lerpResult59_g571 , ApplicationIsPlaying208_g571);
				float MM_Time65_g571 = lerpResult227_g571;
				float MM_Speed58_g571 = _MMSpeed;
				float MM_SpeedScale_GV212_g571 = Nicrom_MM_SpeedScale_WSP;
				float lerpResult220_g571 = lerp( MM_SpeedScale_GV212_g571 , 1.0 , GV_Time174_g571);
				float lerpResult221_g571 = lerp( MM_SpeedScale_GV212_g571 , lerpResult220_g571 , ApplicationIsPlaying208_g571);
				float MM_SpeedScale222_g571 = lerpResult221_g571;
				float MM_SineWaveLength57_g571 = _MMSineWaveLength;
				float MM_PhaseShiftSource34_g571 = _MMPhaseShiftSource;
				float lerpResult47_g571 = lerp( input.ase_color.a , (WorldSpaceStaticNoise28_g571).g , MM_PhaseShiftSource34_g571);
				float MM_PhaseShiftScale43_g571 = _MMPhaseShiftScale;
				float MB_PhaseShift61_g571 = ( lerpResult47_g571 * MM_PhaseShiftScale43_g571 );
				float lerpResult56_g572 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirectionAngle80_g571 = lerpResult56_g572;
				float MM_DirShift81_g571 = _MMDirectionShift;
				float MM_DirShiftOffset82_g571 = _MMDirectionShiftOffset;
				float4 StaticWorldNoise55_g573 = WorldSpaceStaticNoise28_g571;
				float3 objToWorld50_g573 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float Time76_g573 = MM_Time65_g571;
				float SpeedScale_RA80_g573 = 1.0;
				float MM_DirShiftSpeed83_g571 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale84_g571 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g573 = radians( ( ( ( 90.0 + MM_DirectionAngle80_g571 ) + ( ( MM_DirShift81_g571 + ( MM_DirShiftOffset82_g571 * (StaticWorldNoise55_g573).x ) ) * sin( ( ( objToWorld50_g573.x + objToWorld50_g573.z ) + ( ( Time76_g573 * ( SpeedScale_RA80_g573 * MM_DirShiftSpeed83_g571 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g573).z * MM_DirShiftNoiseScale84_g571 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g573 = (float3(cos( temp_output_11_0_g573 ) , 0.0 , sin( temp_output_11_0_g573 )));
				float3 worldToObj35_g573 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g573, 1 ) ).xyz;
				float3 worldToObj36_g573 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g573 = normalize( (( worldToObj35_g573 - worldToObj36_g573 )).xyz );
				float3 DirectionVector165_g571 = normalizeResult34_g573;
				#ifdef _MAINMOTION_ON
				float3 staticSwitch188_g571 = ( ( ( MM_Mask198_g571 * ( ( ( MM_AmplitudeOffset77_g571 * (WorldSpaceStaticNoise28_g571).r ) + MM_Amplitude85_g571 ) * MM_AmplitudeScale87_g571 ) ) * sin( ( ( ( objToWorld134_g571.x + objToWorld134_g571.z ) + ( ( MM_Time65_g571 * ( ( MM_Speed58_g571 * MM_SpeedScale222_g571 ) * MM_SineWaveLength57_g571 ) ) + ( ( 2.0 * PI ) * MB_PhaseShift61_g571 ) ) ) * ( ( 2.0 * PI ) / MM_SineWaveLength57_g571 ) ) ) ) * DirectionVector165_g571 );
				#else
				float3 staticSwitch188_g571 = float3( 0, 0, 0 );
				#endif
				float3 HorizontalMovement157_g571 = staticSwitch188_g571;
				float DM1_AmplitudeOffset66_g571 = _DM1AmplitudeOffset;
				float DM1_Amplitude70_g571 = _DM1Amplitude;
				float lerpResult184_g571 = lerp( 1.0 , Nicrom_DM_AmpScale_WSP , GV_AmplitudeScale175_g571);
				float DM_AmplitudeScale79_g571 = lerpResult184_g571;
				float3 objToWorld96_g571 = mul( GetObjectToWorldMatrix(), float4( LocalPivot16_g571, 1 ) ).xyz;
				float DM_Time_G31_g571 = Nicrom_DM_Time_WSP;
				float lerpResult45_g571 = lerp( _TimeParameters.x , DM_Time_G31_g571 , GV_Time174_g571);
				float lerpResult239_g571 = lerp( _TimeParameters.x , lerpResult45_g571 , ApplicationIsPlaying208_g571);
				float DM_Time53_g571 = lerpResult239_g571;
				float DM_SpeedScale_GV213_g571 = Nicrom_DM_SpeedScale_WSP;
				float lerpResult231_g571 = lerp( DM_SpeedScale_GV213_g571 , 1.0 , GV_Time174_g571);
				float lerpResult235_g571 = lerp( DM_SpeedScale_GV213_g571 , lerpResult231_g571 , ApplicationIsPlaying208_g571);
				float DM_SpeedScale236_g571 = lerpResult235_g571;
				float DM1_Speed50_g571 = _DM1Speed;
				float VC_PhaseShift42_g571 = input.ase_color.a;
				float3 rotatedValue126_g571 = RotateAroundAxis( LocalPivot16_g571, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( ( DM1_AmplitudeOffset66_g571 * (WorldSpaceStaticNoise28_g571).r ) + DM1_Amplitude70_g571 ) * DM_AmplitudeScale79_g571 ) * sin( ( ( ( objToWorld96_g571.x + objToWorld96_g571.z ) + ( ( DM_Time53_g571 * ( DM_SpeedScale236_g571 * DM1_Speed50_g571 ) ) + ( ( 2.0 * PI ) * ( 1.0 - VC_PhaseShift42_g571 ) ) ) ) * ( 2.0 * PI ) ) ) ) ) );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch130_g571 = ( rotatedValue126_g571 - input.positionOS.xyz );
				#else
				float3 staticSwitch130_g571 = float3( 0, 0, 0 );
				#endif
				float3 RotationMovement131_g571 = staticSwitch130_g571;
				float3 appendResult28_g580 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 Scale_Pivot15_g577 = -appendResult28_g580;
				float3 temp_output_5_0_g577 = ( ( ( HorizontalMovement157_g571 + RotationMovement131_g571 ) + input.positionOS.xyz ) - Scale_Pivot15_g577 );
				float ScaleVartMin40_g577 = _ScaleVarMin;
				float ScaleVarMax41_g577 = _ScaleVarMax;
				float ScaleNoiseSharpnessMin59_g577 = _ScaleVarNoiseSharpMin;
				float ScaleNoiseSharpnessMax60_g577 = _ScaleVarNoiseSharpMax;
				float3 objToWorld11_g579 = mul( GetObjectToWorldMatrix(), float4( Scale_Pivot15_g577, 1 ) ).xyz;
				float2 appendResult10_g579 = (float2(objToWorld11_g579.x , objToWorld11_g579.z));
				float2 Scale_WorldSpaceUVs30_g577 = appendResult10_g579;
				float Scale_VarNoiseTiling23_g577 = _ScaleVarNoiseTiling;
				float4 Scale_WorldSpaceNoise32_g577 = tex2Dlod( _ScaleVarNoise, float4( ( Scale_WorldSpaceUVs30_g577 * Scale_VarNoiseTiling23_g577 ), 0, 0.0) );
				float smoothstepResult56_g577 = smoothstep( ScaleNoiseSharpnessMin59_g577 , ScaleNoiseSharpnessMax60_g577 , (Scale_WorldSpaceNoise32_g577).r);
				float lerpResult44_g577 = lerp( ScaleVartMin40_g577 , ScaleVarMax41_g577 , smoothstepResult56_g577);
				float ScaleVar47_g577 = lerpResult44_g577;
				float clampResult63_g577 = clamp( ( ScaleVar47_g577 + 1.0 ) , 0.0 , 7.0 );
				#ifdef _SCALEVARIATION_ON
				float3 staticSwitch72_g577 = ( temp_output_5_0_g577 * clampResult63_g577 );
				#else
				float3 staticSwitch72_g577 = temp_output_5_0_g577;
				#endif
				float ScaleOffset19_g577 = _ScaleOffset;
				float clampResult64_g577 = clamp( ( ScaleOffset19_g577 + 1.0 ) , 0.0 , 7.0 );
				
				output.ase_texcoord3.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = ( ( ( staticSwitch72_g577 * clampResult64_g577 ) + Scale_Pivot15_g577 ) - input.positionOS.xyz );

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

				float2 uv_Albedo34_g581 = input.ase_texcoord3.xy;
				float4 tex2DNode34_g581 = tex2D( _Albedo, uv_Albedo34_g581 );
				

				float Alpha = tex2DNode34_g581.a;
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
	
	CustomEditor "Nicrom.CMI_WaterSurfacePlant"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}

/*ASEBEGIN
Version=19901
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1970;2464,1920;Inherit;False;Nicrom - WSP - Motion;23;;571;99f4962385c468c4ca519d7a5042f6a0;0;0;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1330;-19002.03,10716.32;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1963;2752,1664;Inherit;False;Nicrom - WSP - Main;1;;581;f68b2bfe998374742a3f787a29e76c16;0;0;5;FLOAT4;0;FLOAT3;105;FLOAT;42;FLOAT;43;FLOAT;39
Node;AmplifyShaderEditor.RangedFloatNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1932;2688,1840;Inherit;False;Property;_AlphaCutoff;Alpha Cutoff;0;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1948;2720,1920;Inherit;False;Nicrom - Scale;51;;577;8d53ba1ace8e1014986c3779ab835fd1;0;1;13;FLOAT3;0,0,0;False;2;FLOAT3;0;FLOAT;70
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1971;3072,1664;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;6;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1972;3072,1664;Float;False;True;-1;3;Nicrom.CMI_WaterSurfacePlant;0;12;Nicrom/ASE/Vegetation//WSP;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;48;Lighting Model;0;0;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;0;638871557040374834;Alpha Clipping;1;0;  Use Shadow Threshold;0;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,True,_TransStrength;0;  Normal Distortion;0.5,True,_TransNormal;0;  Scattering;2,True,_TransScattering;0;  Direct;0.9,True,_TransDirect;0;  Ambient;0.1,True,_TransAmbient;0;  Shadow;0.5,True,_TransShadow;0;Cast Shadows;1;0;Receive Shadows;1;0;Receive SSAO;1;0;Specular Highlights;1;0;Environment Reflections;1;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;  XR Motion Vectors;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;12;False;True;True;True;True;True;True;True;True;True;True;False;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1973;3072,1664;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1974;3072,1664;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1975;3072,1664;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1976;3072,1664;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1977;3072,1664;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1978;3072,1664;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1979;3072,1664;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1980;3072,1664;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1981;3072,1664;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;MotionVectors;0;10;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1982;3072,1664;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;XRMotionVectors;0;11;XRMotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;True;1;False;;255;False;;1;False;;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;1;LightMode=XRMotionVectors;False;False;0;;0;0;Standard;0;False;0
WireConnection;1948;13;1970;0
WireConnection;1972;0;1963;0
WireConnection;1972;1;1963;105
WireConnection;1972;3;1963;42
WireConnection;1972;4;1963;43
WireConnection;1972;6;1963;39
WireConnection;1972;7;1932;0
WireConnection;1972;8;1948;0
ASEEND*/
//CHKSM=70B9433857B643312F5441157DB67FE393AD03D7