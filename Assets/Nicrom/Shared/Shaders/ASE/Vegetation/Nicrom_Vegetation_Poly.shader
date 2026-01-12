// Made with Amplify Shader Editor v1.9.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Nicrom/ASE/Vegetation/Poly"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_OcclusionColor( "Occlusion Color", Color ) = ( 0.4672615, 0.6064689, 0.2345775, 1 )
		_OcclusionMinRadius( "Occlusion Min Radius", Range( 0, 3 ) ) = 0.1
		_OcclusionMaxRadius( "Occlusion Max Radius", Range( 0, 6 ) ) = 1
		[Toggle( _OCCLUSION_ON )] _Occlusion( "Occlusion", Float ) = 0
		_BaseColor( "Base Color", Color ) = ( 1, 1, 1, 1 )
		[NoScaleOffset][SingleLineTexture] _MainTex( "Albedo", 2D ) = "white" {}
		[Space] _Metallic( "Metallic", Range( 0, 1 ) ) = 0
		_Smoothness( "Smoothness", Range( 0, 1 ) ) = 0.2909241
		[Enum(None,0,UV1,1,UV2,2)] _LocalPivotSource( "Local Pivot Source", Float ) = 0
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

		Cull Back
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
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _OCCLUSION_ON


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
			float4 _OcclusionColor;
			float4 _BaseColor;
			half _GVBendingScale;
			float _OcclusionMinRadius;
			float _OcclusionMaxRadius;
			half _MMObjectHeightSource;
			half _MMObjectHeight;
			half _MMPhaseShiftScale;
			half _MMPhaseShiftSource;
			half _MMSineWaveLength;
			half _MMSpeed;
			half _MMAmplitude;
			half _MMAmplitudeOffset;
			half _GVAmplitudeScale;
			half _MMBending;
			float _Metallic;
			half _MMBendingOffset;
			half _MMDirectionShiftSpeed;
			float _MotionNoiseTiling;
			half _MMDirectionShiftOffset;
			half _MMDirectionShift;
			half _GVDirectionAngle;
			half _MMDirectionAngle;
			float _DM2ObjectRadius;
			float _DM2Speed;
			float _LocalPivotSource;
			float _DM2Amplitude;
			float _DM1FoliageLength;
			float _DM1Speed;
			float _GVTime;
			float _DM1Amplitude;
			half _MMDirectionShiftNoiseScale;
			float _Smoothness;
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
			sampler2D _MainTex;


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
			
			float3 LocalPivot4_g373( float Source, float3 None, float3 UV1, float3 UV2 )
			{
				if(Source ==0)
				    return None;
				else if(Source ==1)
				    return UV1;
				else
				    return UV2;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g377 = radians( ( 90.0 + ( input.texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g377 = (float3(cos( temp_output_23_0_g377 ) , 0.0 , sin( temp_output_23_0_g377 )));
				float3 DB_RotationAxis87_g375 = appendResult25_g377;
				float GV_AmplitudeScale175_g375 = _GVBendingScale;
				float lerpResult186_g375 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float DM_AmplitudeScale168_g375 = lerpResult186_g375;
				float DM1_Amplitude28_g375 = _DM1Amplitude;
				float3 objToWorld80_g385 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g375 = _GVTime;
				float lerpResult187_g375 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g375);
				float ApplicationIsPlaying241_g375 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g375 = lerp( _TimeParameters.x , lerpResult187_g375 , ApplicationIsPlaying241_g375);
				float DM_Time169_g375 = lerpResult256_g375;
				float Time90_g385 = DM_Time169_g375;
				float DM1_Speed29_g375 = _DM1Speed;
				float Speed45_g385 = DM1_Speed29_g375;
				float temp_output_244_0_g375 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g375 = lerp( temp_output_244_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult262_g375 = lerp( temp_output_244_0_g375 , lerpResult261_g375 , ApplicationIsPlaying241_g375);
				float DM_SpeedScale265_g375 = lerpResult262_g375;
				float SpeedScale95_g385 = DM_SpeedScale265_g375;
				float DM_PhaseShift91_g375 = input.ase_color.a;
				float PhaseShift48_g385 = DM_PhaseShift91_g375;
				float3 appendResult24_g377 = (float3(0.0 , input.texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g375 = appendResult24_g377;
				float3 PivotPosOnYAxis56_g385 = DM_PivotPosOnYAxis88_g375;
				float DM1_FoliageLength32_g375 = _DM1FoliageLength;
				float3 rotatedValue29_g385 = RotateAroundAxis( PivotPosOnYAxis56_g385, input.positionOS.xyz, DB_RotationAxis87_g375, radians( ( ( ( DM_AmplitudeScale168_g375 * DM1_Amplitude28_g375 ) * sin( ( ( ( objToWorld80_g385.x + objToWorld80_g385.z ) + ( ( Time90_g385 * ( Speed45_g385 * SpeedScale95_g385 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g385 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g385 ) / DM1_FoliageLength32_g375 ) ) ) );
				float DM1_MotionMask89_g375 = step( 1.5 , input.texcoord.y );
				float3 DM1_VertexOffset231_g375 = ( ( rotatedValue29_g385 - input.positionOS.xyz ) * DM1_MotionMask89_g375 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g375 = DM1_VertexOffset231_g375;
				#else
				float3 staticSwitch104_g375 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g375 = _DM2Amplitude;
				float Amplitude58_g386 = DM2_Amplitude30_g375;
				float Source4_g373 = _LocalPivotSource;
				float3 None4_g373 = float3( 0,0,0 );
				float3 appendResult7_g373 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 UV14_g373 = -appendResult7_g373;
				float3 appendResult8_g373 = (float3(input.texcoord2.x , 0.0 , input.texcoord2.y));
				float3 UV24_g373 = -appendResult8_g373;
				float3 localLocalPivot4_g373 = LocalPivot4_g373( Source4_g373 , None4_g373 , UV14_g373 , UV24_g373 );
				float3 LocalPivot159_g375 = localLocalPivot4_g373;
				float3 PivotPoint49_g386 = LocalPivot159_g375;
				float3 objToWorld53_g386 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g386, 1 ) ).xyz;
				float Time87_g386 = DM_Time169_g375;
				float SpeedScale93_g386 = DM_SpeedScale265_g375;
				float DM2_Speed31_g375 = _DM2Speed;
				float Speed41_g386 = DM2_Speed31_g375;
				float PhaseShift54_g386 = DM_PhaseShift91_g375;
				float3 break52_g386 = PivotPoint49_g386;
				float3 appendResult20_g386 = (float3(break52_g386.x , input.positionOS.xyz.y , break52_g386.z));
				float DM2_ObjectRadius33_g375 = _DM2ObjectRadius;
				float ObjectRadius60_g386 = DM2_ObjectRadius33_g375;
				float3 rotatedValue33_g386 = RotateAroundAxis( PivotPoint49_g386, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g375 * Amplitude58_g386 ) * sin( ( ( ( objToWorld53_g386.x + objToWorld53_g386.z ) + ( ( Time87_g386 * ( SpeedScale93_g386 * Speed41_g386 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g386 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g386 ) / ObjectRadius60_g386 ) ) ) );
				float DM2_MotionMask90_g375 = step( 1.5 , input.texcoord.x );
				float BendingMask62_g386 = DM2_MotionMask90_g375;
				float3 DM2_VertexOffset232_g375 = ( ( rotatedValue33_g386 - input.positionOS.xyz ) * BendingMask62_g386 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g375 = DM2_VertexOffset232_g375;
				#else
				float3 staticSwitch103_g375 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g375 = ( staticSwitch104_g375 + staticSwitch103_g375 );
				float lerpResult56_g383 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g375 = lerpResult56_g383;
				float MM_DirShift59_g375 = _MMDirectionShift;
				float MM_DirShiftOffset60_g375 = _MMDirectionShiftOffset;
				float3 objToWorld11_g380 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float2 appendResult10_g380 = (float2(objToWorld11_g380.x , objToWorld11_g380.z));
				float MotionNoiseTiling20_g375 = _MotionNoiseTiling;
				float4 temp_output_73_0_g375 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g380 * MotionNoiseTiling20_g375 ), 0, 0.0) );
				float4 StaticWorldNoise78_g375 = temp_output_73_0_g375;
				float4 StaticWorldNoise55_g379 = StaticWorldNoise78_g375;
				float3 objToWorld50_g379 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float lerpResult182_g375 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g375);
				float lerpResult246_g375 = lerp( _TimeParameters.x , lerpResult182_g375 , ApplicationIsPlaying241_g375);
				float MM_Time13_g375 = lerpResult246_g375;
				float Time76_g379 = MM_Time13_g375;
				float temp_output_243_0_g375 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g375 = lerp( temp_output_243_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult249_g375 = lerp( temp_output_243_0_g375 , lerpResult245_g375 , ApplicationIsPlaying241_g375);
				float MM_SpeedScale253_g375 = lerpResult249_g375;
				float SpeedScale_RA80_g379 = MM_SpeedScale253_g375;
				float MM_DirShiftSpeed56_g375 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g375 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g379 = radians( ( ( MM_DirAngle51_g375 + ( ( MM_DirShift59_g375 + ( MM_DirShiftOffset60_g375 * (StaticWorldNoise55_g379).x ) ) * sin( ( ( objToWorld50_g379.x + objToWorld50_g379.z ) + ( ( Time76_g379 * ( SpeedScale_RA80_g379 * MM_DirShiftSpeed56_g375 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g379).z * MM_DirShiftNoiseScale57_g375 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g379 = (float3(cos( temp_output_11_0_g379 ) , 0.0 , sin( temp_output_11_0_g379 )));
				float3 worldToObj35_g379 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g379, 1 ) ).xyz;
				float3 worldToObj36_g379 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g379 = normalize( (( worldToObj35_g379 - worldToObj36_g379 )).xyz );
				float3 MB_RotationAxis129_g375 = normalizeResult34_g379;
				float3 RotationAxis56_g378 = MB_RotationAxis129_g375;
				float4 StaticWorldNoise31_g384 = StaticWorldNoise78_g375;
				float MM_BendingOfset37_g375 = _MMBendingOffset;
				float MM_Bending35_g375 = _MMBending;
				float GV_BendingScale176_g375 = _GVAmplitudeScale;
				float lerpResult188_g375 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g375);
				float MM_BendingScale17_g375 = lerpResult188_g375;
				float MM_AmplitudeOffset52_g375 = _MMAmplitudeOffset;
				float MM_Amplitude66_g375 = _MMAmplitude;
				float lerpResult189_g375 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float MM_AmplitudeScale15_g375 = lerpResult189_g375;
				float3 objToWorld170_g384 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g384 = MM_Time13_g375;
				float MM_Speed53_g375 = _MMSpeed;
				float Speed125_g384 = MM_Speed53_g375;
				float SpeedScale_RotAng201_g384 = MM_SpeedScale253_g375;
				float MM_SineWaveLength58_g375 = _MMSineWaveLength;
				float WaveLength63_g384 = MM_SineWaveLength58_g375;
				float MM_PhaseShiftSource207_g375 = _MMPhaseShiftSource;
				float lerpResult154_g375 = lerp( input.ase_color.a , (StaticWorldNoise78_g375).g , MM_PhaseShiftSource207_g375);
				float MM_PhaseShiftScale39_g375 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g375 = ( lerpResult154_g375 * MM_PhaseShiftScale39_g375 );
				float PhaseShift127_g384 = MB_PhaseShift79_g375;
				float temp_output_20_0_g384 = sin( ( ( ( objToWorld170_g384.x + objToWorld170_g384.z ) + ( ( Time167_g384 * ( ( Speed125_g384 * SpeedScale_RotAng201_g384 ) * WaveLength63_g384 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g384 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g384 ) ) );
				float MM_MaxHeight55_g375 = _MMObjectHeight;
				float3 gammaToLinear56_g384 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g375 = _MMObjectHeightSource;
				float lerpResult57_g384 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g375 ) , (gammaToLinear56_g384).x , MM_ObjectHeightSource54_g375);
				float BendingMask189_g384 = lerpResult57_g384;
				float MB_RotationAngle130_g375 = radians( ( ( ( ( ( (StaticWorldNoise31_g384).y * MM_BendingOfset37_g375 ) + MM_Bending35_g375 ) * MM_BendingScale17_g375 ) + ( ( ( ( (StaticWorldNoise31_g384).x * MM_AmplitudeOffset52_g375 ) + MM_Amplitude66_g375 ) * MM_AmplitudeScale15_g375 ) * temp_output_20_0_g384 ) ) * BendingMask189_g384 ) );
				float RotationAngle54_g378 = MB_RotationAngle130_g375;
				float3 LocalPivotPos60_g378 = LocalPivot159_g375;
				float3 break62_g378 = LocalPivotPos60_g378;
				float VertexPos_Y67_g378 = input.positionOS.xyz.y;
				float3 appendResult45_g378 = (float3(break62_g378.x , VertexPos_Y67_g378 , break62_g378.z));
				float3 VertexPos66_g378 = input.positionOS.xyz;
				float3 rotatedValue30_g378 = RotateAroundAxis( appendResult45_g378, VertexPos66_g378, RotationAxis56_g378, RotationAngle54_g378 );
				float3 DetailMotionVO73_g378 = DM_VertexOffset128_g375;
				float3 rotatedValue34_g378 = RotateAroundAxis( LocalPivotPos60_g378, ( rotatedValue30_g378 + DetailMotionVO73_g378 ), RotationAxis56_g378, RotationAngle54_g378 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g375 = ( ( rotatedValue34_g378 - VertexPos66_g378 ) * step( 0.01 , VertexPos_Y67_g378 ) );
				#else
				float3 staticSwitch205_g375 = DM_VertexOffset128_g375;
				#endif
				
				float3 vertexToFrag6_g374 = input.positionOS.xyz;
				output.ase_texcoord8.xyz = vertexToFrag6_g374;
				float3 gammaToLinear7_g374 = FastSRGBToLinear( input.ase_color.rgb );
				float vertexToFrag12_g374 = (gammaToLinear7_g374).x;
				output.ase_texcoord7.z = vertexToFrag12_g374;
				
				output.ase_texcoord7.xy = input.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord7.w = 0;
				output.ase_texcoord8.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g375;

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

				float4 BaseColor10_g372 = _BaseColor;
				float2 uv_MainTex31_g372 = input.ase_texcoord7.xy;
				float4 Albedo_Ccclusion39_g374 = ( BaseColor10_g372 * tex2D( _MainTex, uv_MainTex31_g372 ) );
				float4 OcclusionColor21_g374 = _OcclusionColor;
				float3 vertexToFrag6_g374 = input.ase_texcoord8.xyz;
				float3 appendResult10_g374 = (float3(0.0 , vertexToFrag6_g374.y , 0.0));
				float OcclusionMaxRadius23_g374 = _OcclusionMaxRadius;
				float OcclusionMinRadius25_g374 = _OcclusionMinRadius;
				float vertexToFrag12_g374 = input.ase_texcoord7.z;
				float lerpResult15_g374 = lerp( OcclusionMaxRadius23_g374 , OcclusionMinRadius25_g374 , vertexToFrag12_g374);
				float OclusionMask219_g374 = ( 1.0 - saturate( ( distance( vertexToFrag6_g374 , appendResult10_g374 ) / lerpResult15_g374 ) ) );
				float4 lerpResult27_g374 = lerp( Albedo_Ccclusion39_g374 , OcclusionColor21_g374 , OclusionMask219_g374);
				float4 lerpResult31_g374 = lerp( Albedo_Ccclusion39_g374 , lerpResult27_g374 , step( 1.0 , input.ase_texcoord7.xy.x ));
				#ifdef _OCCLUSION_ON
				float4 staticSwitch32_g374 = lerpResult31_g374;
				#else
				float4 staticSwitch32_g374 = Albedo_Ccclusion39_g374;
				#endif
				

				float3 BaseColor = staticSwitch32_g374.rgb;
				float3 Normal = float3(0, 0, 1);
				float3 Specular = 0.5;
				float Metallic = _Metallic;
				float Smoothness = _Smoothness;
				float Occlusion = 1;
				float3 Emission = 0;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
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
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _OcclusionColor;
			float4 _BaseColor;
			half _GVBendingScale;
			float _OcclusionMinRadius;
			float _OcclusionMaxRadius;
			half _MMObjectHeightSource;
			half _MMObjectHeight;
			half _MMPhaseShiftScale;
			half _MMPhaseShiftSource;
			half _MMSineWaveLength;
			half _MMSpeed;
			half _MMAmplitude;
			half _MMAmplitudeOffset;
			half _GVAmplitudeScale;
			half _MMBending;
			float _Metallic;
			half _MMBendingOffset;
			half _MMDirectionShiftSpeed;
			float _MotionNoiseTiling;
			half _MMDirectionShiftOffset;
			half _MMDirectionShift;
			half _GVDirectionAngle;
			half _MMDirectionAngle;
			float _DM2ObjectRadius;
			float _DM2Speed;
			float _LocalPivotSource;
			float _DM2Amplitude;
			float _DM1FoliageLength;
			float _DM1Speed;
			float _GVTime;
			float _DM1Amplitude;
			half _MMDirectionShiftNoiseScale;
			float _Smoothness;
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
			
			float3 LocalPivot4_g373( float Source, float3 None, float3 UV1, float3 UV2 )
			{
				if(Source ==0)
				    return None;
				else if(Source ==1)
				    return UV1;
				else
				    return UV2;
			}
			

			PackedVaryings VertexFunction( Attributes input )
			{
				PackedVaryings output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float temp_output_23_0_g377 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g377 = (float3(cos( temp_output_23_0_g377 ) , 0.0 , sin( temp_output_23_0_g377 )));
				float3 DB_RotationAxis87_g375 = appendResult25_g377;
				float GV_AmplitudeScale175_g375 = _GVBendingScale;
				float lerpResult186_g375 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float DM_AmplitudeScale168_g375 = lerpResult186_g375;
				float DM1_Amplitude28_g375 = _DM1Amplitude;
				float3 objToWorld80_g385 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g375 = _GVTime;
				float lerpResult187_g375 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g375);
				float ApplicationIsPlaying241_g375 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g375 = lerp( _TimeParameters.x , lerpResult187_g375 , ApplicationIsPlaying241_g375);
				float DM_Time169_g375 = lerpResult256_g375;
				float Time90_g385 = DM_Time169_g375;
				float DM1_Speed29_g375 = _DM1Speed;
				float Speed45_g385 = DM1_Speed29_g375;
				float temp_output_244_0_g375 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g375 = lerp( temp_output_244_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult262_g375 = lerp( temp_output_244_0_g375 , lerpResult261_g375 , ApplicationIsPlaying241_g375);
				float DM_SpeedScale265_g375 = lerpResult262_g375;
				float SpeedScale95_g385 = DM_SpeedScale265_g375;
				float DM_PhaseShift91_g375 = input.ase_color.a;
				float PhaseShift48_g385 = DM_PhaseShift91_g375;
				float3 appendResult24_g377 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g375 = appendResult24_g377;
				float3 PivotPosOnYAxis56_g385 = DM_PivotPosOnYAxis88_g375;
				float DM1_FoliageLength32_g375 = _DM1FoliageLength;
				float3 rotatedValue29_g385 = RotateAroundAxis( PivotPosOnYAxis56_g385, input.positionOS.xyz, DB_RotationAxis87_g375, radians( ( ( ( DM_AmplitudeScale168_g375 * DM1_Amplitude28_g375 ) * sin( ( ( ( objToWorld80_g385.x + objToWorld80_g385.z ) + ( ( Time90_g385 * ( Speed45_g385 * SpeedScale95_g385 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g385 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g385 ) / DM1_FoliageLength32_g375 ) ) ) );
				float DM1_MotionMask89_g375 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g375 = ( ( rotatedValue29_g385 - input.positionOS.xyz ) * DM1_MotionMask89_g375 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g375 = DM1_VertexOffset231_g375;
				#else
				float3 staticSwitch104_g375 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g375 = _DM2Amplitude;
				float Amplitude58_g386 = DM2_Amplitude30_g375;
				float Source4_g373 = _LocalPivotSource;
				float3 None4_g373 = float3( 0,0,0 );
				float3 appendResult7_g373 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 UV14_g373 = -appendResult7_g373;
				float3 appendResult8_g373 = (float3(input.ase_texcoord2.x , 0.0 , input.ase_texcoord2.y));
				float3 UV24_g373 = -appendResult8_g373;
				float3 localLocalPivot4_g373 = LocalPivot4_g373( Source4_g373 , None4_g373 , UV14_g373 , UV24_g373 );
				float3 LocalPivot159_g375 = localLocalPivot4_g373;
				float3 PivotPoint49_g386 = LocalPivot159_g375;
				float3 objToWorld53_g386 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g386, 1 ) ).xyz;
				float Time87_g386 = DM_Time169_g375;
				float SpeedScale93_g386 = DM_SpeedScale265_g375;
				float DM2_Speed31_g375 = _DM2Speed;
				float Speed41_g386 = DM2_Speed31_g375;
				float PhaseShift54_g386 = DM_PhaseShift91_g375;
				float3 break52_g386 = PivotPoint49_g386;
				float3 appendResult20_g386 = (float3(break52_g386.x , input.positionOS.xyz.y , break52_g386.z));
				float DM2_ObjectRadius33_g375 = _DM2ObjectRadius;
				float ObjectRadius60_g386 = DM2_ObjectRadius33_g375;
				float3 rotatedValue33_g386 = RotateAroundAxis( PivotPoint49_g386, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g375 * Amplitude58_g386 ) * sin( ( ( ( objToWorld53_g386.x + objToWorld53_g386.z ) + ( ( Time87_g386 * ( SpeedScale93_g386 * Speed41_g386 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g386 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g386 ) / ObjectRadius60_g386 ) ) ) );
				float DM2_MotionMask90_g375 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g386 = DM2_MotionMask90_g375;
				float3 DM2_VertexOffset232_g375 = ( ( rotatedValue33_g386 - input.positionOS.xyz ) * BendingMask62_g386 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g375 = DM2_VertexOffset232_g375;
				#else
				float3 staticSwitch103_g375 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g375 = ( staticSwitch104_g375 + staticSwitch103_g375 );
				float lerpResult56_g383 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g375 = lerpResult56_g383;
				float MM_DirShift59_g375 = _MMDirectionShift;
				float MM_DirShiftOffset60_g375 = _MMDirectionShiftOffset;
				float3 objToWorld11_g380 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float2 appendResult10_g380 = (float2(objToWorld11_g380.x , objToWorld11_g380.z));
				float MotionNoiseTiling20_g375 = _MotionNoiseTiling;
				float4 temp_output_73_0_g375 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g380 * MotionNoiseTiling20_g375 ), 0, 0.0) );
				float4 StaticWorldNoise78_g375 = temp_output_73_0_g375;
				float4 StaticWorldNoise55_g379 = StaticWorldNoise78_g375;
				float3 objToWorld50_g379 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float lerpResult182_g375 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g375);
				float lerpResult246_g375 = lerp( _TimeParameters.x , lerpResult182_g375 , ApplicationIsPlaying241_g375);
				float MM_Time13_g375 = lerpResult246_g375;
				float Time76_g379 = MM_Time13_g375;
				float temp_output_243_0_g375 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g375 = lerp( temp_output_243_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult249_g375 = lerp( temp_output_243_0_g375 , lerpResult245_g375 , ApplicationIsPlaying241_g375);
				float MM_SpeedScale253_g375 = lerpResult249_g375;
				float SpeedScale_RA80_g379 = MM_SpeedScale253_g375;
				float MM_DirShiftSpeed56_g375 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g375 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g379 = radians( ( ( MM_DirAngle51_g375 + ( ( MM_DirShift59_g375 + ( MM_DirShiftOffset60_g375 * (StaticWorldNoise55_g379).x ) ) * sin( ( ( objToWorld50_g379.x + objToWorld50_g379.z ) + ( ( Time76_g379 * ( SpeedScale_RA80_g379 * MM_DirShiftSpeed56_g375 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g379).z * MM_DirShiftNoiseScale57_g375 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g379 = (float3(cos( temp_output_11_0_g379 ) , 0.0 , sin( temp_output_11_0_g379 )));
				float3 worldToObj35_g379 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g379, 1 ) ).xyz;
				float3 worldToObj36_g379 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g379 = normalize( (( worldToObj35_g379 - worldToObj36_g379 )).xyz );
				float3 MB_RotationAxis129_g375 = normalizeResult34_g379;
				float3 RotationAxis56_g378 = MB_RotationAxis129_g375;
				float4 StaticWorldNoise31_g384 = StaticWorldNoise78_g375;
				float MM_BendingOfset37_g375 = _MMBendingOffset;
				float MM_Bending35_g375 = _MMBending;
				float GV_BendingScale176_g375 = _GVAmplitudeScale;
				float lerpResult188_g375 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g375);
				float MM_BendingScale17_g375 = lerpResult188_g375;
				float MM_AmplitudeOffset52_g375 = _MMAmplitudeOffset;
				float MM_Amplitude66_g375 = _MMAmplitude;
				float lerpResult189_g375 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float MM_AmplitudeScale15_g375 = lerpResult189_g375;
				float3 objToWorld170_g384 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g384 = MM_Time13_g375;
				float MM_Speed53_g375 = _MMSpeed;
				float Speed125_g384 = MM_Speed53_g375;
				float SpeedScale_RotAng201_g384 = MM_SpeedScale253_g375;
				float MM_SineWaveLength58_g375 = _MMSineWaveLength;
				float WaveLength63_g384 = MM_SineWaveLength58_g375;
				float MM_PhaseShiftSource207_g375 = _MMPhaseShiftSource;
				float lerpResult154_g375 = lerp( input.ase_color.a , (StaticWorldNoise78_g375).g , MM_PhaseShiftSource207_g375);
				float MM_PhaseShiftScale39_g375 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g375 = ( lerpResult154_g375 * MM_PhaseShiftScale39_g375 );
				float PhaseShift127_g384 = MB_PhaseShift79_g375;
				float temp_output_20_0_g384 = sin( ( ( ( objToWorld170_g384.x + objToWorld170_g384.z ) + ( ( Time167_g384 * ( ( Speed125_g384 * SpeedScale_RotAng201_g384 ) * WaveLength63_g384 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g384 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g384 ) ) );
				float MM_MaxHeight55_g375 = _MMObjectHeight;
				float3 gammaToLinear56_g384 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g375 = _MMObjectHeightSource;
				float lerpResult57_g384 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g375 ) , (gammaToLinear56_g384).x , MM_ObjectHeightSource54_g375);
				float BendingMask189_g384 = lerpResult57_g384;
				float MB_RotationAngle130_g375 = radians( ( ( ( ( ( (StaticWorldNoise31_g384).y * MM_BendingOfset37_g375 ) + MM_Bending35_g375 ) * MM_BendingScale17_g375 ) + ( ( ( ( (StaticWorldNoise31_g384).x * MM_AmplitudeOffset52_g375 ) + MM_Amplitude66_g375 ) * MM_AmplitudeScale15_g375 ) * temp_output_20_0_g384 ) ) * BendingMask189_g384 ) );
				float RotationAngle54_g378 = MB_RotationAngle130_g375;
				float3 LocalPivotPos60_g378 = LocalPivot159_g375;
				float3 break62_g378 = LocalPivotPos60_g378;
				float VertexPos_Y67_g378 = input.positionOS.xyz.y;
				float3 appendResult45_g378 = (float3(break62_g378.x , VertexPos_Y67_g378 , break62_g378.z));
				float3 VertexPos66_g378 = input.positionOS.xyz;
				float3 rotatedValue30_g378 = RotateAroundAxis( appendResult45_g378, VertexPos66_g378, RotationAxis56_g378, RotationAngle54_g378 );
				float3 DetailMotionVO73_g378 = DM_VertexOffset128_g375;
				float3 rotatedValue34_g378 = RotateAroundAxis( LocalPivotPos60_g378, ( rotatedValue30_g378 + DetailMotionVO73_g378 ), RotationAxis56_g378, RotationAngle54_g378 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g375 = ( ( rotatedValue34_g378 - VertexPos66_g378 ) * step( 0.01 , VertexPos_Y67_g378 ) );
				#else
				float3 staticSwitch205_g375 = DM_VertexOffset128_g375;
				#endif
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g375;
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

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
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
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _OcclusionColor;
			float4 _BaseColor;
			half _GVBendingScale;
			float _OcclusionMinRadius;
			float _OcclusionMaxRadius;
			half _MMObjectHeightSource;
			half _MMObjectHeight;
			half _MMPhaseShiftScale;
			half _MMPhaseShiftSource;
			half _MMSineWaveLength;
			half _MMSpeed;
			half _MMAmplitude;
			half _MMAmplitudeOffset;
			half _GVAmplitudeScale;
			half _MMBending;
			float _Metallic;
			half _MMBendingOffset;
			half _MMDirectionShiftSpeed;
			float _MotionNoiseTiling;
			half _MMDirectionShiftOffset;
			half _MMDirectionShift;
			half _GVDirectionAngle;
			half _MMDirectionAngle;
			float _DM2ObjectRadius;
			float _DM2Speed;
			float _LocalPivotSource;
			float _DM2Amplitude;
			float _DM1FoliageLength;
			float _DM1Speed;
			float _GVTime;
			float _DM1Amplitude;
			half _MMDirectionShiftNoiseScale;
			float _Smoothness;
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
			
			float3 LocalPivot4_g373( float Source, float3 None, float3 UV1, float3 UV2 )
			{
				if(Source ==0)
				    return None;
				else if(Source ==1)
				    return UV1;
				else
				    return UV2;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g377 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g377 = (float3(cos( temp_output_23_0_g377 ) , 0.0 , sin( temp_output_23_0_g377 )));
				float3 DB_RotationAxis87_g375 = appendResult25_g377;
				float GV_AmplitudeScale175_g375 = _GVBendingScale;
				float lerpResult186_g375 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float DM_AmplitudeScale168_g375 = lerpResult186_g375;
				float DM1_Amplitude28_g375 = _DM1Amplitude;
				float3 objToWorld80_g385 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g375 = _GVTime;
				float lerpResult187_g375 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g375);
				float ApplicationIsPlaying241_g375 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g375 = lerp( _TimeParameters.x , lerpResult187_g375 , ApplicationIsPlaying241_g375);
				float DM_Time169_g375 = lerpResult256_g375;
				float Time90_g385 = DM_Time169_g375;
				float DM1_Speed29_g375 = _DM1Speed;
				float Speed45_g385 = DM1_Speed29_g375;
				float temp_output_244_0_g375 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g375 = lerp( temp_output_244_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult262_g375 = lerp( temp_output_244_0_g375 , lerpResult261_g375 , ApplicationIsPlaying241_g375);
				float DM_SpeedScale265_g375 = lerpResult262_g375;
				float SpeedScale95_g385 = DM_SpeedScale265_g375;
				float DM_PhaseShift91_g375 = input.ase_color.a;
				float PhaseShift48_g385 = DM_PhaseShift91_g375;
				float3 appendResult24_g377 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g375 = appendResult24_g377;
				float3 PivotPosOnYAxis56_g385 = DM_PivotPosOnYAxis88_g375;
				float DM1_FoliageLength32_g375 = _DM1FoliageLength;
				float3 rotatedValue29_g385 = RotateAroundAxis( PivotPosOnYAxis56_g385, input.positionOS.xyz, DB_RotationAxis87_g375, radians( ( ( ( DM_AmplitudeScale168_g375 * DM1_Amplitude28_g375 ) * sin( ( ( ( objToWorld80_g385.x + objToWorld80_g385.z ) + ( ( Time90_g385 * ( Speed45_g385 * SpeedScale95_g385 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g385 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g385 ) / DM1_FoliageLength32_g375 ) ) ) );
				float DM1_MotionMask89_g375 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g375 = ( ( rotatedValue29_g385 - input.positionOS.xyz ) * DM1_MotionMask89_g375 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g375 = DM1_VertexOffset231_g375;
				#else
				float3 staticSwitch104_g375 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g375 = _DM2Amplitude;
				float Amplitude58_g386 = DM2_Amplitude30_g375;
				float Source4_g373 = _LocalPivotSource;
				float3 None4_g373 = float3( 0,0,0 );
				float3 appendResult7_g373 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 UV14_g373 = -appendResult7_g373;
				float3 appendResult8_g373 = (float3(input.ase_texcoord2.x , 0.0 , input.ase_texcoord2.y));
				float3 UV24_g373 = -appendResult8_g373;
				float3 localLocalPivot4_g373 = LocalPivot4_g373( Source4_g373 , None4_g373 , UV14_g373 , UV24_g373 );
				float3 LocalPivot159_g375 = localLocalPivot4_g373;
				float3 PivotPoint49_g386 = LocalPivot159_g375;
				float3 objToWorld53_g386 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g386, 1 ) ).xyz;
				float Time87_g386 = DM_Time169_g375;
				float SpeedScale93_g386 = DM_SpeedScale265_g375;
				float DM2_Speed31_g375 = _DM2Speed;
				float Speed41_g386 = DM2_Speed31_g375;
				float PhaseShift54_g386 = DM_PhaseShift91_g375;
				float3 break52_g386 = PivotPoint49_g386;
				float3 appendResult20_g386 = (float3(break52_g386.x , input.positionOS.xyz.y , break52_g386.z));
				float DM2_ObjectRadius33_g375 = _DM2ObjectRadius;
				float ObjectRadius60_g386 = DM2_ObjectRadius33_g375;
				float3 rotatedValue33_g386 = RotateAroundAxis( PivotPoint49_g386, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g375 * Amplitude58_g386 ) * sin( ( ( ( objToWorld53_g386.x + objToWorld53_g386.z ) + ( ( Time87_g386 * ( SpeedScale93_g386 * Speed41_g386 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g386 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g386 ) / ObjectRadius60_g386 ) ) ) );
				float DM2_MotionMask90_g375 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g386 = DM2_MotionMask90_g375;
				float3 DM2_VertexOffset232_g375 = ( ( rotatedValue33_g386 - input.positionOS.xyz ) * BendingMask62_g386 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g375 = DM2_VertexOffset232_g375;
				#else
				float3 staticSwitch103_g375 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g375 = ( staticSwitch104_g375 + staticSwitch103_g375 );
				float lerpResult56_g383 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g375 = lerpResult56_g383;
				float MM_DirShift59_g375 = _MMDirectionShift;
				float MM_DirShiftOffset60_g375 = _MMDirectionShiftOffset;
				float3 objToWorld11_g380 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float2 appendResult10_g380 = (float2(objToWorld11_g380.x , objToWorld11_g380.z));
				float MotionNoiseTiling20_g375 = _MotionNoiseTiling;
				float4 temp_output_73_0_g375 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g380 * MotionNoiseTiling20_g375 ), 0, 0.0) );
				float4 StaticWorldNoise78_g375 = temp_output_73_0_g375;
				float4 StaticWorldNoise55_g379 = StaticWorldNoise78_g375;
				float3 objToWorld50_g379 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float lerpResult182_g375 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g375);
				float lerpResult246_g375 = lerp( _TimeParameters.x , lerpResult182_g375 , ApplicationIsPlaying241_g375);
				float MM_Time13_g375 = lerpResult246_g375;
				float Time76_g379 = MM_Time13_g375;
				float temp_output_243_0_g375 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g375 = lerp( temp_output_243_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult249_g375 = lerp( temp_output_243_0_g375 , lerpResult245_g375 , ApplicationIsPlaying241_g375);
				float MM_SpeedScale253_g375 = lerpResult249_g375;
				float SpeedScale_RA80_g379 = MM_SpeedScale253_g375;
				float MM_DirShiftSpeed56_g375 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g375 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g379 = radians( ( ( MM_DirAngle51_g375 + ( ( MM_DirShift59_g375 + ( MM_DirShiftOffset60_g375 * (StaticWorldNoise55_g379).x ) ) * sin( ( ( objToWorld50_g379.x + objToWorld50_g379.z ) + ( ( Time76_g379 * ( SpeedScale_RA80_g379 * MM_DirShiftSpeed56_g375 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g379).z * MM_DirShiftNoiseScale57_g375 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g379 = (float3(cos( temp_output_11_0_g379 ) , 0.0 , sin( temp_output_11_0_g379 )));
				float3 worldToObj35_g379 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g379, 1 ) ).xyz;
				float3 worldToObj36_g379 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g379 = normalize( (( worldToObj35_g379 - worldToObj36_g379 )).xyz );
				float3 MB_RotationAxis129_g375 = normalizeResult34_g379;
				float3 RotationAxis56_g378 = MB_RotationAxis129_g375;
				float4 StaticWorldNoise31_g384 = StaticWorldNoise78_g375;
				float MM_BendingOfset37_g375 = _MMBendingOffset;
				float MM_Bending35_g375 = _MMBending;
				float GV_BendingScale176_g375 = _GVAmplitudeScale;
				float lerpResult188_g375 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g375);
				float MM_BendingScale17_g375 = lerpResult188_g375;
				float MM_AmplitudeOffset52_g375 = _MMAmplitudeOffset;
				float MM_Amplitude66_g375 = _MMAmplitude;
				float lerpResult189_g375 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float MM_AmplitudeScale15_g375 = lerpResult189_g375;
				float3 objToWorld170_g384 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g384 = MM_Time13_g375;
				float MM_Speed53_g375 = _MMSpeed;
				float Speed125_g384 = MM_Speed53_g375;
				float SpeedScale_RotAng201_g384 = MM_SpeedScale253_g375;
				float MM_SineWaveLength58_g375 = _MMSineWaveLength;
				float WaveLength63_g384 = MM_SineWaveLength58_g375;
				float MM_PhaseShiftSource207_g375 = _MMPhaseShiftSource;
				float lerpResult154_g375 = lerp( input.ase_color.a , (StaticWorldNoise78_g375).g , MM_PhaseShiftSource207_g375);
				float MM_PhaseShiftScale39_g375 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g375 = ( lerpResult154_g375 * MM_PhaseShiftScale39_g375 );
				float PhaseShift127_g384 = MB_PhaseShift79_g375;
				float temp_output_20_0_g384 = sin( ( ( ( objToWorld170_g384.x + objToWorld170_g384.z ) + ( ( Time167_g384 * ( ( Speed125_g384 * SpeedScale_RotAng201_g384 ) * WaveLength63_g384 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g384 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g384 ) ) );
				float MM_MaxHeight55_g375 = _MMObjectHeight;
				float3 gammaToLinear56_g384 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g375 = _MMObjectHeightSource;
				float lerpResult57_g384 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g375 ) , (gammaToLinear56_g384).x , MM_ObjectHeightSource54_g375);
				float BendingMask189_g384 = lerpResult57_g384;
				float MB_RotationAngle130_g375 = radians( ( ( ( ( ( (StaticWorldNoise31_g384).y * MM_BendingOfset37_g375 ) + MM_Bending35_g375 ) * MM_BendingScale17_g375 ) + ( ( ( ( (StaticWorldNoise31_g384).x * MM_AmplitudeOffset52_g375 ) + MM_Amplitude66_g375 ) * MM_AmplitudeScale15_g375 ) * temp_output_20_0_g384 ) ) * BendingMask189_g384 ) );
				float RotationAngle54_g378 = MB_RotationAngle130_g375;
				float3 LocalPivotPos60_g378 = LocalPivot159_g375;
				float3 break62_g378 = LocalPivotPos60_g378;
				float VertexPos_Y67_g378 = input.positionOS.xyz.y;
				float3 appendResult45_g378 = (float3(break62_g378.x , VertexPos_Y67_g378 , break62_g378.z));
				float3 VertexPos66_g378 = input.positionOS.xyz;
				float3 rotatedValue30_g378 = RotateAroundAxis( appendResult45_g378, VertexPos66_g378, RotationAxis56_g378, RotationAngle54_g378 );
				float3 DetailMotionVO73_g378 = DM_VertexOffset128_g375;
				float3 rotatedValue34_g378 = RotateAroundAxis( LocalPivotPos60_g378, ( rotatedValue30_g378 + DetailMotionVO73_g378 ), RotationAxis56_g378, RotationAngle54_g378 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g375 = ( ( rotatedValue34_g378 - VertexPos66_g378 ) * step( 0.01 , VertexPos_Y67_g378 ) );
				#else
				float3 staticSwitch205_g375 = DM_VertexOffset128_g375;
				#endif
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g375;

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

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

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
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _OCCLUSION_ON


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
			float4 _OcclusionColor;
			float4 _BaseColor;
			half _GVBendingScale;
			float _OcclusionMinRadius;
			float _OcclusionMaxRadius;
			half _MMObjectHeightSource;
			half _MMObjectHeight;
			half _MMPhaseShiftScale;
			half _MMPhaseShiftSource;
			half _MMSineWaveLength;
			half _MMSpeed;
			half _MMAmplitude;
			half _MMAmplitudeOffset;
			half _GVAmplitudeScale;
			half _MMBending;
			float _Metallic;
			half _MMBendingOffset;
			half _MMDirectionShiftSpeed;
			float _MotionNoiseTiling;
			half _MMDirectionShiftOffset;
			half _MMDirectionShift;
			half _GVDirectionAngle;
			half _MMDirectionAngle;
			float _DM2ObjectRadius;
			float _DM2Speed;
			float _LocalPivotSource;
			float _DM2Amplitude;
			float _DM1FoliageLength;
			float _DM1Speed;
			float _GVTime;
			float _DM1Amplitude;
			half _MMDirectionShiftNoiseScale;
			float _Smoothness;
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
			sampler2D _MainTex;


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
			
			float3 LocalPivot4_g373( float Source, float3 None, float3 UV1, float3 UV2 )
			{
				if(Source ==0)
				    return None;
				else if(Source ==1)
				    return UV1;
				else
				    return UV2;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g377 = radians( ( 90.0 + ( input.texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g377 = (float3(cos( temp_output_23_0_g377 ) , 0.0 , sin( temp_output_23_0_g377 )));
				float3 DB_RotationAxis87_g375 = appendResult25_g377;
				float GV_AmplitudeScale175_g375 = _GVBendingScale;
				float lerpResult186_g375 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float DM_AmplitudeScale168_g375 = lerpResult186_g375;
				float DM1_Amplitude28_g375 = _DM1Amplitude;
				float3 objToWorld80_g385 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g375 = _GVTime;
				float lerpResult187_g375 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g375);
				float ApplicationIsPlaying241_g375 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g375 = lerp( _TimeParameters.x , lerpResult187_g375 , ApplicationIsPlaying241_g375);
				float DM_Time169_g375 = lerpResult256_g375;
				float Time90_g385 = DM_Time169_g375;
				float DM1_Speed29_g375 = _DM1Speed;
				float Speed45_g385 = DM1_Speed29_g375;
				float temp_output_244_0_g375 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g375 = lerp( temp_output_244_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult262_g375 = lerp( temp_output_244_0_g375 , lerpResult261_g375 , ApplicationIsPlaying241_g375);
				float DM_SpeedScale265_g375 = lerpResult262_g375;
				float SpeedScale95_g385 = DM_SpeedScale265_g375;
				float DM_PhaseShift91_g375 = input.ase_color.a;
				float PhaseShift48_g385 = DM_PhaseShift91_g375;
				float3 appendResult24_g377 = (float3(0.0 , input.texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g375 = appendResult24_g377;
				float3 PivotPosOnYAxis56_g385 = DM_PivotPosOnYAxis88_g375;
				float DM1_FoliageLength32_g375 = _DM1FoliageLength;
				float3 rotatedValue29_g385 = RotateAroundAxis( PivotPosOnYAxis56_g385, input.positionOS.xyz, DB_RotationAxis87_g375, radians( ( ( ( DM_AmplitudeScale168_g375 * DM1_Amplitude28_g375 ) * sin( ( ( ( objToWorld80_g385.x + objToWorld80_g385.z ) + ( ( Time90_g385 * ( Speed45_g385 * SpeedScale95_g385 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g385 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g385 ) / DM1_FoliageLength32_g375 ) ) ) );
				float DM1_MotionMask89_g375 = step( 1.5 , input.texcoord0.y );
				float3 DM1_VertexOffset231_g375 = ( ( rotatedValue29_g385 - input.positionOS.xyz ) * DM1_MotionMask89_g375 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g375 = DM1_VertexOffset231_g375;
				#else
				float3 staticSwitch104_g375 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g375 = _DM2Amplitude;
				float Amplitude58_g386 = DM2_Amplitude30_g375;
				float Source4_g373 = _LocalPivotSource;
				float3 None4_g373 = float3( 0,0,0 );
				float3 appendResult7_g373 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 UV14_g373 = -appendResult7_g373;
				float3 appendResult8_g373 = (float3(input.texcoord2.x , 0.0 , input.texcoord2.y));
				float3 UV24_g373 = -appendResult8_g373;
				float3 localLocalPivot4_g373 = LocalPivot4_g373( Source4_g373 , None4_g373 , UV14_g373 , UV24_g373 );
				float3 LocalPivot159_g375 = localLocalPivot4_g373;
				float3 PivotPoint49_g386 = LocalPivot159_g375;
				float3 objToWorld53_g386 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g386, 1 ) ).xyz;
				float Time87_g386 = DM_Time169_g375;
				float SpeedScale93_g386 = DM_SpeedScale265_g375;
				float DM2_Speed31_g375 = _DM2Speed;
				float Speed41_g386 = DM2_Speed31_g375;
				float PhaseShift54_g386 = DM_PhaseShift91_g375;
				float3 break52_g386 = PivotPoint49_g386;
				float3 appendResult20_g386 = (float3(break52_g386.x , input.positionOS.xyz.y , break52_g386.z));
				float DM2_ObjectRadius33_g375 = _DM2ObjectRadius;
				float ObjectRadius60_g386 = DM2_ObjectRadius33_g375;
				float3 rotatedValue33_g386 = RotateAroundAxis( PivotPoint49_g386, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g375 * Amplitude58_g386 ) * sin( ( ( ( objToWorld53_g386.x + objToWorld53_g386.z ) + ( ( Time87_g386 * ( SpeedScale93_g386 * Speed41_g386 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g386 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g386 ) / ObjectRadius60_g386 ) ) ) );
				float DM2_MotionMask90_g375 = step( 1.5 , input.texcoord0.x );
				float BendingMask62_g386 = DM2_MotionMask90_g375;
				float3 DM2_VertexOffset232_g375 = ( ( rotatedValue33_g386 - input.positionOS.xyz ) * BendingMask62_g386 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g375 = DM2_VertexOffset232_g375;
				#else
				float3 staticSwitch103_g375 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g375 = ( staticSwitch104_g375 + staticSwitch103_g375 );
				float lerpResult56_g383 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g375 = lerpResult56_g383;
				float MM_DirShift59_g375 = _MMDirectionShift;
				float MM_DirShiftOffset60_g375 = _MMDirectionShiftOffset;
				float3 objToWorld11_g380 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float2 appendResult10_g380 = (float2(objToWorld11_g380.x , objToWorld11_g380.z));
				float MotionNoiseTiling20_g375 = _MotionNoiseTiling;
				float4 temp_output_73_0_g375 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g380 * MotionNoiseTiling20_g375 ), 0, 0.0) );
				float4 StaticWorldNoise78_g375 = temp_output_73_0_g375;
				float4 StaticWorldNoise55_g379 = StaticWorldNoise78_g375;
				float3 objToWorld50_g379 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float lerpResult182_g375 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g375);
				float lerpResult246_g375 = lerp( _TimeParameters.x , lerpResult182_g375 , ApplicationIsPlaying241_g375);
				float MM_Time13_g375 = lerpResult246_g375;
				float Time76_g379 = MM_Time13_g375;
				float temp_output_243_0_g375 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g375 = lerp( temp_output_243_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult249_g375 = lerp( temp_output_243_0_g375 , lerpResult245_g375 , ApplicationIsPlaying241_g375);
				float MM_SpeedScale253_g375 = lerpResult249_g375;
				float SpeedScale_RA80_g379 = MM_SpeedScale253_g375;
				float MM_DirShiftSpeed56_g375 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g375 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g379 = radians( ( ( MM_DirAngle51_g375 + ( ( MM_DirShift59_g375 + ( MM_DirShiftOffset60_g375 * (StaticWorldNoise55_g379).x ) ) * sin( ( ( objToWorld50_g379.x + objToWorld50_g379.z ) + ( ( Time76_g379 * ( SpeedScale_RA80_g379 * MM_DirShiftSpeed56_g375 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g379).z * MM_DirShiftNoiseScale57_g375 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g379 = (float3(cos( temp_output_11_0_g379 ) , 0.0 , sin( temp_output_11_0_g379 )));
				float3 worldToObj35_g379 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g379, 1 ) ).xyz;
				float3 worldToObj36_g379 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g379 = normalize( (( worldToObj35_g379 - worldToObj36_g379 )).xyz );
				float3 MB_RotationAxis129_g375 = normalizeResult34_g379;
				float3 RotationAxis56_g378 = MB_RotationAxis129_g375;
				float4 StaticWorldNoise31_g384 = StaticWorldNoise78_g375;
				float MM_BendingOfset37_g375 = _MMBendingOffset;
				float MM_Bending35_g375 = _MMBending;
				float GV_BendingScale176_g375 = _GVAmplitudeScale;
				float lerpResult188_g375 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g375);
				float MM_BendingScale17_g375 = lerpResult188_g375;
				float MM_AmplitudeOffset52_g375 = _MMAmplitudeOffset;
				float MM_Amplitude66_g375 = _MMAmplitude;
				float lerpResult189_g375 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float MM_AmplitudeScale15_g375 = lerpResult189_g375;
				float3 objToWorld170_g384 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g384 = MM_Time13_g375;
				float MM_Speed53_g375 = _MMSpeed;
				float Speed125_g384 = MM_Speed53_g375;
				float SpeedScale_RotAng201_g384 = MM_SpeedScale253_g375;
				float MM_SineWaveLength58_g375 = _MMSineWaveLength;
				float WaveLength63_g384 = MM_SineWaveLength58_g375;
				float MM_PhaseShiftSource207_g375 = _MMPhaseShiftSource;
				float lerpResult154_g375 = lerp( input.ase_color.a , (StaticWorldNoise78_g375).g , MM_PhaseShiftSource207_g375);
				float MM_PhaseShiftScale39_g375 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g375 = ( lerpResult154_g375 * MM_PhaseShiftScale39_g375 );
				float PhaseShift127_g384 = MB_PhaseShift79_g375;
				float temp_output_20_0_g384 = sin( ( ( ( objToWorld170_g384.x + objToWorld170_g384.z ) + ( ( Time167_g384 * ( ( Speed125_g384 * SpeedScale_RotAng201_g384 ) * WaveLength63_g384 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g384 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g384 ) ) );
				float MM_MaxHeight55_g375 = _MMObjectHeight;
				float3 gammaToLinear56_g384 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g375 = _MMObjectHeightSource;
				float lerpResult57_g384 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g375 ) , (gammaToLinear56_g384).x , MM_ObjectHeightSource54_g375);
				float BendingMask189_g384 = lerpResult57_g384;
				float MB_RotationAngle130_g375 = radians( ( ( ( ( ( (StaticWorldNoise31_g384).y * MM_BendingOfset37_g375 ) + MM_Bending35_g375 ) * MM_BendingScale17_g375 ) + ( ( ( ( (StaticWorldNoise31_g384).x * MM_AmplitudeOffset52_g375 ) + MM_Amplitude66_g375 ) * MM_AmplitudeScale15_g375 ) * temp_output_20_0_g384 ) ) * BendingMask189_g384 ) );
				float RotationAngle54_g378 = MB_RotationAngle130_g375;
				float3 LocalPivotPos60_g378 = LocalPivot159_g375;
				float3 break62_g378 = LocalPivotPos60_g378;
				float VertexPos_Y67_g378 = input.positionOS.xyz.y;
				float3 appendResult45_g378 = (float3(break62_g378.x , VertexPos_Y67_g378 , break62_g378.z));
				float3 VertexPos66_g378 = input.positionOS.xyz;
				float3 rotatedValue30_g378 = RotateAroundAxis( appendResult45_g378, VertexPos66_g378, RotationAxis56_g378, RotationAngle54_g378 );
				float3 DetailMotionVO73_g378 = DM_VertexOffset128_g375;
				float3 rotatedValue34_g378 = RotateAroundAxis( LocalPivotPos60_g378, ( rotatedValue30_g378 + DetailMotionVO73_g378 ), RotationAxis56_g378, RotationAngle54_g378 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g375 = ( ( rotatedValue34_g378 - VertexPos66_g378 ) * step( 0.01 , VertexPos_Y67_g378 ) );
				#else
				float3 staticSwitch205_g375 = DM_VertexOffset128_g375;
				#endif
				
				float3 vertexToFrag6_g374 = input.positionOS.xyz;
				output.ase_texcoord4.xyz = vertexToFrag6_g374;
				float3 gammaToLinear7_g374 = FastSRGBToLinear( input.ase_color.rgb );
				float vertexToFrag12_g374 = (gammaToLinear7_g374).x;
				output.ase_texcoord3.z = vertexToFrag12_g374;
				
				output.ase_texcoord3.xy = input.texcoord0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.w = 0;
				output.ase_texcoord4.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g375;

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

				float4 BaseColor10_g372 = _BaseColor;
				float2 uv_MainTex31_g372 = input.ase_texcoord3.xy;
				float4 Albedo_Ccclusion39_g374 = ( BaseColor10_g372 * tex2D( _MainTex, uv_MainTex31_g372 ) );
				float4 OcclusionColor21_g374 = _OcclusionColor;
				float3 vertexToFrag6_g374 = input.ase_texcoord4.xyz;
				float3 appendResult10_g374 = (float3(0.0 , vertexToFrag6_g374.y , 0.0));
				float OcclusionMaxRadius23_g374 = _OcclusionMaxRadius;
				float OcclusionMinRadius25_g374 = _OcclusionMinRadius;
				float vertexToFrag12_g374 = input.ase_texcoord3.z;
				float lerpResult15_g374 = lerp( OcclusionMaxRadius23_g374 , OcclusionMinRadius25_g374 , vertexToFrag12_g374);
				float OclusionMask219_g374 = ( 1.0 - saturate( ( distance( vertexToFrag6_g374 , appendResult10_g374 ) / lerpResult15_g374 ) ) );
				float4 lerpResult27_g374 = lerp( Albedo_Ccclusion39_g374 , OcclusionColor21_g374 , OclusionMask219_g374);
				float4 lerpResult31_g374 = lerp( Albedo_Ccclusion39_g374 , lerpResult27_g374 , step( 1.0 , input.ase_texcoord3.xy.x ));
				#ifdef _OCCLUSION_ON
				float4 staticSwitch32_g374 = lerpResult31_g374;
				#else
				float4 staticSwitch32_g374 = Albedo_Ccclusion39_g374;
				#endif
				

				float3 BaseColor = staticSwitch32_g374.rgb;
				float3 Emission = 0;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

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
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _OCCLUSION_ON


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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _OcclusionColor;
			float4 _BaseColor;
			half _GVBendingScale;
			float _OcclusionMinRadius;
			float _OcclusionMaxRadius;
			half _MMObjectHeightSource;
			half _MMObjectHeight;
			half _MMPhaseShiftScale;
			half _MMPhaseShiftSource;
			half _MMSineWaveLength;
			half _MMSpeed;
			half _MMAmplitude;
			half _MMAmplitudeOffset;
			half _GVAmplitudeScale;
			half _MMBending;
			float _Metallic;
			half _MMBendingOffset;
			half _MMDirectionShiftSpeed;
			float _MotionNoiseTiling;
			half _MMDirectionShiftOffset;
			half _MMDirectionShift;
			half _GVDirectionAngle;
			half _MMDirectionAngle;
			float _DM2ObjectRadius;
			float _DM2Speed;
			float _LocalPivotSource;
			float _DM2Amplitude;
			float _DM1FoliageLength;
			float _DM1Speed;
			float _GVTime;
			float _DM1Amplitude;
			half _MMDirectionShiftNoiseScale;
			float _Smoothness;
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
			sampler2D _MainTex;


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
			
			float3 LocalPivot4_g373( float Source, float3 None, float3 UV1, float3 UV2 )
			{
				if(Source ==0)
				    return None;
				else if(Source ==1)
				    return UV1;
				else
				    return UV2;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_TRANSFER_INSTANCE_ID( input, output );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float temp_output_23_0_g377 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g377 = (float3(cos( temp_output_23_0_g377 ) , 0.0 , sin( temp_output_23_0_g377 )));
				float3 DB_RotationAxis87_g375 = appendResult25_g377;
				float GV_AmplitudeScale175_g375 = _GVBendingScale;
				float lerpResult186_g375 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float DM_AmplitudeScale168_g375 = lerpResult186_g375;
				float DM1_Amplitude28_g375 = _DM1Amplitude;
				float3 objToWorld80_g385 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g375 = _GVTime;
				float lerpResult187_g375 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g375);
				float ApplicationIsPlaying241_g375 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g375 = lerp( _TimeParameters.x , lerpResult187_g375 , ApplicationIsPlaying241_g375);
				float DM_Time169_g375 = lerpResult256_g375;
				float Time90_g385 = DM_Time169_g375;
				float DM1_Speed29_g375 = _DM1Speed;
				float Speed45_g385 = DM1_Speed29_g375;
				float temp_output_244_0_g375 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g375 = lerp( temp_output_244_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult262_g375 = lerp( temp_output_244_0_g375 , lerpResult261_g375 , ApplicationIsPlaying241_g375);
				float DM_SpeedScale265_g375 = lerpResult262_g375;
				float SpeedScale95_g385 = DM_SpeedScale265_g375;
				float DM_PhaseShift91_g375 = input.ase_color.a;
				float PhaseShift48_g385 = DM_PhaseShift91_g375;
				float3 appendResult24_g377 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g375 = appendResult24_g377;
				float3 PivotPosOnYAxis56_g385 = DM_PivotPosOnYAxis88_g375;
				float DM1_FoliageLength32_g375 = _DM1FoliageLength;
				float3 rotatedValue29_g385 = RotateAroundAxis( PivotPosOnYAxis56_g385, input.positionOS.xyz, DB_RotationAxis87_g375, radians( ( ( ( DM_AmplitudeScale168_g375 * DM1_Amplitude28_g375 ) * sin( ( ( ( objToWorld80_g385.x + objToWorld80_g385.z ) + ( ( Time90_g385 * ( Speed45_g385 * SpeedScale95_g385 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g385 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g385 ) / DM1_FoliageLength32_g375 ) ) ) );
				float DM1_MotionMask89_g375 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g375 = ( ( rotatedValue29_g385 - input.positionOS.xyz ) * DM1_MotionMask89_g375 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g375 = DM1_VertexOffset231_g375;
				#else
				float3 staticSwitch104_g375 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g375 = _DM2Amplitude;
				float Amplitude58_g386 = DM2_Amplitude30_g375;
				float Source4_g373 = _LocalPivotSource;
				float3 None4_g373 = float3( 0,0,0 );
				float3 appendResult7_g373 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 UV14_g373 = -appendResult7_g373;
				float3 appendResult8_g373 = (float3(input.ase_texcoord2.x , 0.0 , input.ase_texcoord2.y));
				float3 UV24_g373 = -appendResult8_g373;
				float3 localLocalPivot4_g373 = LocalPivot4_g373( Source4_g373 , None4_g373 , UV14_g373 , UV24_g373 );
				float3 LocalPivot159_g375 = localLocalPivot4_g373;
				float3 PivotPoint49_g386 = LocalPivot159_g375;
				float3 objToWorld53_g386 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g386, 1 ) ).xyz;
				float Time87_g386 = DM_Time169_g375;
				float SpeedScale93_g386 = DM_SpeedScale265_g375;
				float DM2_Speed31_g375 = _DM2Speed;
				float Speed41_g386 = DM2_Speed31_g375;
				float PhaseShift54_g386 = DM_PhaseShift91_g375;
				float3 break52_g386 = PivotPoint49_g386;
				float3 appendResult20_g386 = (float3(break52_g386.x , input.positionOS.xyz.y , break52_g386.z));
				float DM2_ObjectRadius33_g375 = _DM2ObjectRadius;
				float ObjectRadius60_g386 = DM2_ObjectRadius33_g375;
				float3 rotatedValue33_g386 = RotateAroundAxis( PivotPoint49_g386, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g375 * Amplitude58_g386 ) * sin( ( ( ( objToWorld53_g386.x + objToWorld53_g386.z ) + ( ( Time87_g386 * ( SpeedScale93_g386 * Speed41_g386 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g386 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g386 ) / ObjectRadius60_g386 ) ) ) );
				float DM2_MotionMask90_g375 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g386 = DM2_MotionMask90_g375;
				float3 DM2_VertexOffset232_g375 = ( ( rotatedValue33_g386 - input.positionOS.xyz ) * BendingMask62_g386 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g375 = DM2_VertexOffset232_g375;
				#else
				float3 staticSwitch103_g375 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g375 = ( staticSwitch104_g375 + staticSwitch103_g375 );
				float lerpResult56_g383 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g375 = lerpResult56_g383;
				float MM_DirShift59_g375 = _MMDirectionShift;
				float MM_DirShiftOffset60_g375 = _MMDirectionShiftOffset;
				float3 objToWorld11_g380 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float2 appendResult10_g380 = (float2(objToWorld11_g380.x , objToWorld11_g380.z));
				float MotionNoiseTiling20_g375 = _MotionNoiseTiling;
				float4 temp_output_73_0_g375 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g380 * MotionNoiseTiling20_g375 ), 0, 0.0) );
				float4 StaticWorldNoise78_g375 = temp_output_73_0_g375;
				float4 StaticWorldNoise55_g379 = StaticWorldNoise78_g375;
				float3 objToWorld50_g379 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float lerpResult182_g375 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g375);
				float lerpResult246_g375 = lerp( _TimeParameters.x , lerpResult182_g375 , ApplicationIsPlaying241_g375);
				float MM_Time13_g375 = lerpResult246_g375;
				float Time76_g379 = MM_Time13_g375;
				float temp_output_243_0_g375 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g375 = lerp( temp_output_243_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult249_g375 = lerp( temp_output_243_0_g375 , lerpResult245_g375 , ApplicationIsPlaying241_g375);
				float MM_SpeedScale253_g375 = lerpResult249_g375;
				float SpeedScale_RA80_g379 = MM_SpeedScale253_g375;
				float MM_DirShiftSpeed56_g375 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g375 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g379 = radians( ( ( MM_DirAngle51_g375 + ( ( MM_DirShift59_g375 + ( MM_DirShiftOffset60_g375 * (StaticWorldNoise55_g379).x ) ) * sin( ( ( objToWorld50_g379.x + objToWorld50_g379.z ) + ( ( Time76_g379 * ( SpeedScale_RA80_g379 * MM_DirShiftSpeed56_g375 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g379).z * MM_DirShiftNoiseScale57_g375 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g379 = (float3(cos( temp_output_11_0_g379 ) , 0.0 , sin( temp_output_11_0_g379 )));
				float3 worldToObj35_g379 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g379, 1 ) ).xyz;
				float3 worldToObj36_g379 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g379 = normalize( (( worldToObj35_g379 - worldToObj36_g379 )).xyz );
				float3 MB_RotationAxis129_g375 = normalizeResult34_g379;
				float3 RotationAxis56_g378 = MB_RotationAxis129_g375;
				float4 StaticWorldNoise31_g384 = StaticWorldNoise78_g375;
				float MM_BendingOfset37_g375 = _MMBendingOffset;
				float MM_Bending35_g375 = _MMBending;
				float GV_BendingScale176_g375 = _GVAmplitudeScale;
				float lerpResult188_g375 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g375);
				float MM_BendingScale17_g375 = lerpResult188_g375;
				float MM_AmplitudeOffset52_g375 = _MMAmplitudeOffset;
				float MM_Amplitude66_g375 = _MMAmplitude;
				float lerpResult189_g375 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float MM_AmplitudeScale15_g375 = lerpResult189_g375;
				float3 objToWorld170_g384 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g384 = MM_Time13_g375;
				float MM_Speed53_g375 = _MMSpeed;
				float Speed125_g384 = MM_Speed53_g375;
				float SpeedScale_RotAng201_g384 = MM_SpeedScale253_g375;
				float MM_SineWaveLength58_g375 = _MMSineWaveLength;
				float WaveLength63_g384 = MM_SineWaveLength58_g375;
				float MM_PhaseShiftSource207_g375 = _MMPhaseShiftSource;
				float lerpResult154_g375 = lerp( input.ase_color.a , (StaticWorldNoise78_g375).g , MM_PhaseShiftSource207_g375);
				float MM_PhaseShiftScale39_g375 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g375 = ( lerpResult154_g375 * MM_PhaseShiftScale39_g375 );
				float PhaseShift127_g384 = MB_PhaseShift79_g375;
				float temp_output_20_0_g384 = sin( ( ( ( objToWorld170_g384.x + objToWorld170_g384.z ) + ( ( Time167_g384 * ( ( Speed125_g384 * SpeedScale_RotAng201_g384 ) * WaveLength63_g384 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g384 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g384 ) ) );
				float MM_MaxHeight55_g375 = _MMObjectHeight;
				float3 gammaToLinear56_g384 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g375 = _MMObjectHeightSource;
				float lerpResult57_g384 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g375 ) , (gammaToLinear56_g384).x , MM_ObjectHeightSource54_g375);
				float BendingMask189_g384 = lerpResult57_g384;
				float MB_RotationAngle130_g375 = radians( ( ( ( ( ( (StaticWorldNoise31_g384).y * MM_BendingOfset37_g375 ) + MM_Bending35_g375 ) * MM_BendingScale17_g375 ) + ( ( ( ( (StaticWorldNoise31_g384).x * MM_AmplitudeOffset52_g375 ) + MM_Amplitude66_g375 ) * MM_AmplitudeScale15_g375 ) * temp_output_20_0_g384 ) ) * BendingMask189_g384 ) );
				float RotationAngle54_g378 = MB_RotationAngle130_g375;
				float3 LocalPivotPos60_g378 = LocalPivot159_g375;
				float3 break62_g378 = LocalPivotPos60_g378;
				float VertexPos_Y67_g378 = input.positionOS.xyz.y;
				float3 appendResult45_g378 = (float3(break62_g378.x , VertexPos_Y67_g378 , break62_g378.z));
				float3 VertexPos66_g378 = input.positionOS.xyz;
				float3 rotatedValue30_g378 = RotateAroundAxis( appendResult45_g378, VertexPos66_g378, RotationAxis56_g378, RotationAngle54_g378 );
				float3 DetailMotionVO73_g378 = DM_VertexOffset128_g375;
				float3 rotatedValue34_g378 = RotateAroundAxis( LocalPivotPos60_g378, ( rotatedValue30_g378 + DetailMotionVO73_g378 ), RotationAxis56_g378, RotationAngle54_g378 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g375 = ( ( rotatedValue34_g378 - VertexPos66_g378 ) * step( 0.01 , VertexPos_Y67_g378 ) );
				#else
				float3 staticSwitch205_g375 = DM_VertexOffset128_g375;
				#endif
				
				float3 vertexToFrag6_g374 = input.positionOS.xyz;
				output.ase_texcoord2.xyz = vertexToFrag6_g374;
				float3 gammaToLinear7_g374 = FastSRGBToLinear( input.ase_color.rgb );
				float vertexToFrag12_g374 = (gammaToLinear7_g374).x;
				output.ase_texcoord1.z = vertexToFrag12_g374;
				
				output.ase_texcoord1.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord1.w = 0;
				output.ase_texcoord2.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g375;

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

				float4 BaseColor10_g372 = _BaseColor;
				float2 uv_MainTex31_g372 = input.ase_texcoord1.xy;
				float4 Albedo_Ccclusion39_g374 = ( BaseColor10_g372 * tex2D( _MainTex, uv_MainTex31_g372 ) );
				float4 OcclusionColor21_g374 = _OcclusionColor;
				float3 vertexToFrag6_g374 = input.ase_texcoord2.xyz;
				float3 appendResult10_g374 = (float3(0.0 , vertexToFrag6_g374.y , 0.0));
				float OcclusionMaxRadius23_g374 = _OcclusionMaxRadius;
				float OcclusionMinRadius25_g374 = _OcclusionMinRadius;
				float vertexToFrag12_g374 = input.ase_texcoord1.z;
				float lerpResult15_g374 = lerp( OcclusionMaxRadius23_g374 , OcclusionMinRadius25_g374 , vertexToFrag12_g374);
				float OclusionMask219_g374 = ( 1.0 - saturate( ( distance( vertexToFrag6_g374 , appendResult10_g374 ) / lerpResult15_g374 ) ) );
				float4 lerpResult27_g374 = lerp( Albedo_Ccclusion39_g374 , OcclusionColor21_g374 , OclusionMask219_g374);
				float4 lerpResult31_g374 = lerp( Albedo_Ccclusion39_g374 , lerpResult27_g374 , step( 1.0 , input.ase_texcoord1.xy.x ));
				#ifdef _OCCLUSION_ON
				float4 staticSwitch32_g374 = lerpResult31_g374;
				#else
				float4 staticSwitch32_g374 = Albedo_Ccclusion39_g374;
				#endif
				

				float3 BaseColor = staticSwitch32_g374.rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

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
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				half4 tangentWS : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _OcclusionColor;
			float4 _BaseColor;
			half _GVBendingScale;
			float _OcclusionMinRadius;
			float _OcclusionMaxRadius;
			half _MMObjectHeightSource;
			half _MMObjectHeight;
			half _MMPhaseShiftScale;
			half _MMPhaseShiftSource;
			half _MMSineWaveLength;
			half _MMSpeed;
			half _MMAmplitude;
			half _MMAmplitudeOffset;
			half _GVAmplitudeScale;
			half _MMBending;
			float _Metallic;
			half _MMBendingOffset;
			half _MMDirectionShiftSpeed;
			float _MotionNoiseTiling;
			half _MMDirectionShiftOffset;
			half _MMDirectionShift;
			half _GVDirectionAngle;
			half _MMDirectionAngle;
			float _DM2ObjectRadius;
			float _DM2Speed;
			float _LocalPivotSource;
			float _DM2Amplitude;
			float _DM1FoliageLength;
			float _DM1Speed;
			float _GVTime;
			float _DM1Amplitude;
			half _MMDirectionShiftNoiseScale;
			float _Smoothness;
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
			
			float3 LocalPivot4_g373( float Source, float3 None, float3 UV1, float3 UV2 )
			{
				if(Source ==0)
				    return None;
				else if(Source ==1)
				    return UV1;
				else
				    return UV2;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g377 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g377 = (float3(cos( temp_output_23_0_g377 ) , 0.0 , sin( temp_output_23_0_g377 )));
				float3 DB_RotationAxis87_g375 = appendResult25_g377;
				float GV_AmplitudeScale175_g375 = _GVBendingScale;
				float lerpResult186_g375 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float DM_AmplitudeScale168_g375 = lerpResult186_g375;
				float DM1_Amplitude28_g375 = _DM1Amplitude;
				float3 objToWorld80_g385 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g375 = _GVTime;
				float lerpResult187_g375 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g375);
				float ApplicationIsPlaying241_g375 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g375 = lerp( _TimeParameters.x , lerpResult187_g375 , ApplicationIsPlaying241_g375);
				float DM_Time169_g375 = lerpResult256_g375;
				float Time90_g385 = DM_Time169_g375;
				float DM1_Speed29_g375 = _DM1Speed;
				float Speed45_g385 = DM1_Speed29_g375;
				float temp_output_244_0_g375 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g375 = lerp( temp_output_244_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult262_g375 = lerp( temp_output_244_0_g375 , lerpResult261_g375 , ApplicationIsPlaying241_g375);
				float DM_SpeedScale265_g375 = lerpResult262_g375;
				float SpeedScale95_g385 = DM_SpeedScale265_g375;
				float DM_PhaseShift91_g375 = input.ase_color.a;
				float PhaseShift48_g385 = DM_PhaseShift91_g375;
				float3 appendResult24_g377 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g375 = appendResult24_g377;
				float3 PivotPosOnYAxis56_g385 = DM_PivotPosOnYAxis88_g375;
				float DM1_FoliageLength32_g375 = _DM1FoliageLength;
				float3 rotatedValue29_g385 = RotateAroundAxis( PivotPosOnYAxis56_g385, input.positionOS.xyz, DB_RotationAxis87_g375, radians( ( ( ( DM_AmplitudeScale168_g375 * DM1_Amplitude28_g375 ) * sin( ( ( ( objToWorld80_g385.x + objToWorld80_g385.z ) + ( ( Time90_g385 * ( Speed45_g385 * SpeedScale95_g385 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g385 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g385 ) / DM1_FoliageLength32_g375 ) ) ) );
				float DM1_MotionMask89_g375 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g375 = ( ( rotatedValue29_g385 - input.positionOS.xyz ) * DM1_MotionMask89_g375 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g375 = DM1_VertexOffset231_g375;
				#else
				float3 staticSwitch104_g375 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g375 = _DM2Amplitude;
				float Amplitude58_g386 = DM2_Amplitude30_g375;
				float Source4_g373 = _LocalPivotSource;
				float3 None4_g373 = float3( 0,0,0 );
				float3 appendResult7_g373 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 UV14_g373 = -appendResult7_g373;
				float3 appendResult8_g373 = (float3(input.ase_texcoord2.x , 0.0 , input.ase_texcoord2.y));
				float3 UV24_g373 = -appendResult8_g373;
				float3 localLocalPivot4_g373 = LocalPivot4_g373( Source4_g373 , None4_g373 , UV14_g373 , UV24_g373 );
				float3 LocalPivot159_g375 = localLocalPivot4_g373;
				float3 PivotPoint49_g386 = LocalPivot159_g375;
				float3 objToWorld53_g386 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g386, 1 ) ).xyz;
				float Time87_g386 = DM_Time169_g375;
				float SpeedScale93_g386 = DM_SpeedScale265_g375;
				float DM2_Speed31_g375 = _DM2Speed;
				float Speed41_g386 = DM2_Speed31_g375;
				float PhaseShift54_g386 = DM_PhaseShift91_g375;
				float3 break52_g386 = PivotPoint49_g386;
				float3 appendResult20_g386 = (float3(break52_g386.x , input.positionOS.xyz.y , break52_g386.z));
				float DM2_ObjectRadius33_g375 = _DM2ObjectRadius;
				float ObjectRadius60_g386 = DM2_ObjectRadius33_g375;
				float3 rotatedValue33_g386 = RotateAroundAxis( PivotPoint49_g386, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g375 * Amplitude58_g386 ) * sin( ( ( ( objToWorld53_g386.x + objToWorld53_g386.z ) + ( ( Time87_g386 * ( SpeedScale93_g386 * Speed41_g386 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g386 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g386 ) / ObjectRadius60_g386 ) ) ) );
				float DM2_MotionMask90_g375 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g386 = DM2_MotionMask90_g375;
				float3 DM2_VertexOffset232_g375 = ( ( rotatedValue33_g386 - input.positionOS.xyz ) * BendingMask62_g386 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g375 = DM2_VertexOffset232_g375;
				#else
				float3 staticSwitch103_g375 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g375 = ( staticSwitch104_g375 + staticSwitch103_g375 );
				float lerpResult56_g383 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g375 = lerpResult56_g383;
				float MM_DirShift59_g375 = _MMDirectionShift;
				float MM_DirShiftOffset60_g375 = _MMDirectionShiftOffset;
				float3 objToWorld11_g380 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float2 appendResult10_g380 = (float2(objToWorld11_g380.x , objToWorld11_g380.z));
				float MotionNoiseTiling20_g375 = _MotionNoiseTiling;
				float4 temp_output_73_0_g375 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g380 * MotionNoiseTiling20_g375 ), 0, 0.0) );
				float4 StaticWorldNoise78_g375 = temp_output_73_0_g375;
				float4 StaticWorldNoise55_g379 = StaticWorldNoise78_g375;
				float3 objToWorld50_g379 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float lerpResult182_g375 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g375);
				float lerpResult246_g375 = lerp( _TimeParameters.x , lerpResult182_g375 , ApplicationIsPlaying241_g375);
				float MM_Time13_g375 = lerpResult246_g375;
				float Time76_g379 = MM_Time13_g375;
				float temp_output_243_0_g375 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g375 = lerp( temp_output_243_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult249_g375 = lerp( temp_output_243_0_g375 , lerpResult245_g375 , ApplicationIsPlaying241_g375);
				float MM_SpeedScale253_g375 = lerpResult249_g375;
				float SpeedScale_RA80_g379 = MM_SpeedScale253_g375;
				float MM_DirShiftSpeed56_g375 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g375 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g379 = radians( ( ( MM_DirAngle51_g375 + ( ( MM_DirShift59_g375 + ( MM_DirShiftOffset60_g375 * (StaticWorldNoise55_g379).x ) ) * sin( ( ( objToWorld50_g379.x + objToWorld50_g379.z ) + ( ( Time76_g379 * ( SpeedScale_RA80_g379 * MM_DirShiftSpeed56_g375 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g379).z * MM_DirShiftNoiseScale57_g375 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g379 = (float3(cos( temp_output_11_0_g379 ) , 0.0 , sin( temp_output_11_0_g379 )));
				float3 worldToObj35_g379 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g379, 1 ) ).xyz;
				float3 worldToObj36_g379 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g379 = normalize( (( worldToObj35_g379 - worldToObj36_g379 )).xyz );
				float3 MB_RotationAxis129_g375 = normalizeResult34_g379;
				float3 RotationAxis56_g378 = MB_RotationAxis129_g375;
				float4 StaticWorldNoise31_g384 = StaticWorldNoise78_g375;
				float MM_BendingOfset37_g375 = _MMBendingOffset;
				float MM_Bending35_g375 = _MMBending;
				float GV_BendingScale176_g375 = _GVAmplitudeScale;
				float lerpResult188_g375 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g375);
				float MM_BendingScale17_g375 = lerpResult188_g375;
				float MM_AmplitudeOffset52_g375 = _MMAmplitudeOffset;
				float MM_Amplitude66_g375 = _MMAmplitude;
				float lerpResult189_g375 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float MM_AmplitudeScale15_g375 = lerpResult189_g375;
				float3 objToWorld170_g384 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g384 = MM_Time13_g375;
				float MM_Speed53_g375 = _MMSpeed;
				float Speed125_g384 = MM_Speed53_g375;
				float SpeedScale_RotAng201_g384 = MM_SpeedScale253_g375;
				float MM_SineWaveLength58_g375 = _MMSineWaveLength;
				float WaveLength63_g384 = MM_SineWaveLength58_g375;
				float MM_PhaseShiftSource207_g375 = _MMPhaseShiftSource;
				float lerpResult154_g375 = lerp( input.ase_color.a , (StaticWorldNoise78_g375).g , MM_PhaseShiftSource207_g375);
				float MM_PhaseShiftScale39_g375 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g375 = ( lerpResult154_g375 * MM_PhaseShiftScale39_g375 );
				float PhaseShift127_g384 = MB_PhaseShift79_g375;
				float temp_output_20_0_g384 = sin( ( ( ( objToWorld170_g384.x + objToWorld170_g384.z ) + ( ( Time167_g384 * ( ( Speed125_g384 * SpeedScale_RotAng201_g384 ) * WaveLength63_g384 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g384 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g384 ) ) );
				float MM_MaxHeight55_g375 = _MMObjectHeight;
				float3 gammaToLinear56_g384 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g375 = _MMObjectHeightSource;
				float lerpResult57_g384 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g375 ) , (gammaToLinear56_g384).x , MM_ObjectHeightSource54_g375);
				float BendingMask189_g384 = lerpResult57_g384;
				float MB_RotationAngle130_g375 = radians( ( ( ( ( ( (StaticWorldNoise31_g384).y * MM_BendingOfset37_g375 ) + MM_Bending35_g375 ) * MM_BendingScale17_g375 ) + ( ( ( ( (StaticWorldNoise31_g384).x * MM_AmplitudeOffset52_g375 ) + MM_Amplitude66_g375 ) * MM_AmplitudeScale15_g375 ) * temp_output_20_0_g384 ) ) * BendingMask189_g384 ) );
				float RotationAngle54_g378 = MB_RotationAngle130_g375;
				float3 LocalPivotPos60_g378 = LocalPivot159_g375;
				float3 break62_g378 = LocalPivotPos60_g378;
				float VertexPos_Y67_g378 = input.positionOS.xyz.y;
				float3 appendResult45_g378 = (float3(break62_g378.x , VertexPos_Y67_g378 , break62_g378.z));
				float3 VertexPos66_g378 = input.positionOS.xyz;
				float3 rotatedValue30_g378 = RotateAroundAxis( appendResult45_g378, VertexPos66_g378, RotationAxis56_g378, RotationAngle54_g378 );
				float3 DetailMotionVO73_g378 = DM_VertexOffset128_g375;
				float3 rotatedValue34_g378 = RotateAroundAxis( LocalPivotPos60_g378, ( rotatedValue30_g378 + DetailMotionVO73_g378 ), RotationAxis56_g378, RotationAngle54_g378 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g375 = ( ( rotatedValue34_g378 - VertexPos66_g378 ) * step( 0.01 , VertexPos_Y67_g378 ) );
				#else
				float3 staticSwitch205_g375 = DM_VertexOffset128_g375;
				#endif
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g375;

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

				

				float3 Normal = float3(0, 0, 1);
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

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
			#define ASE_NEEDS_FRAG_TEXTURE_COORDINATES0
			#pragma shader_feature_local_vertex _MAINMOTION_ON
			#pragma shader_feature_local_vertex _DETAILMOTION1_ON
			#pragma shader_feature_local_vertex _DETAILMOTION2_ON
			#pragma shader_feature_local _OCCLUSION_ON


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
			float4 _OcclusionColor;
			float4 _BaseColor;
			half _GVBendingScale;
			float _OcclusionMinRadius;
			float _OcclusionMaxRadius;
			half _MMObjectHeightSource;
			half _MMObjectHeight;
			half _MMPhaseShiftScale;
			half _MMPhaseShiftSource;
			half _MMSineWaveLength;
			half _MMSpeed;
			half _MMAmplitude;
			half _MMAmplitudeOffset;
			half _GVAmplitudeScale;
			half _MMBending;
			float _Metallic;
			half _MMBendingOffset;
			half _MMDirectionShiftSpeed;
			float _MotionNoiseTiling;
			half _MMDirectionShiftOffset;
			half _MMDirectionShift;
			half _GVDirectionAngle;
			half _MMDirectionAngle;
			float _DM2ObjectRadius;
			float _DM2Speed;
			float _LocalPivotSource;
			float _DM2Amplitude;
			float _DM1FoliageLength;
			float _DM1Speed;
			float _GVTime;
			float _DM1Amplitude;
			half _MMDirectionShiftNoiseScale;
			float _Smoothness;
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
			sampler2D _MainTex;


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
			
			float3 LocalPivot4_g373( float Source, float3 None, float3 UV1, float3 UV2 )
			{
				if(Source ==0)
				    return None;
				else if(Source ==1)
				    return UV1;
				else
				    return UV2;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g377 = radians( ( 90.0 + ( input.texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g377 = (float3(cos( temp_output_23_0_g377 ) , 0.0 , sin( temp_output_23_0_g377 )));
				float3 DB_RotationAxis87_g375 = appendResult25_g377;
				float GV_AmplitudeScale175_g375 = _GVBendingScale;
				float lerpResult186_g375 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float DM_AmplitudeScale168_g375 = lerpResult186_g375;
				float DM1_Amplitude28_g375 = _DM1Amplitude;
				float3 objToWorld80_g385 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g375 = _GVTime;
				float lerpResult187_g375 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g375);
				float ApplicationIsPlaying241_g375 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g375 = lerp( _TimeParameters.x , lerpResult187_g375 , ApplicationIsPlaying241_g375);
				float DM_Time169_g375 = lerpResult256_g375;
				float Time90_g385 = DM_Time169_g375;
				float DM1_Speed29_g375 = _DM1Speed;
				float Speed45_g385 = DM1_Speed29_g375;
				float temp_output_244_0_g375 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g375 = lerp( temp_output_244_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult262_g375 = lerp( temp_output_244_0_g375 , lerpResult261_g375 , ApplicationIsPlaying241_g375);
				float DM_SpeedScale265_g375 = lerpResult262_g375;
				float SpeedScale95_g385 = DM_SpeedScale265_g375;
				float DM_PhaseShift91_g375 = input.ase_color.a;
				float PhaseShift48_g385 = DM_PhaseShift91_g375;
				float3 appendResult24_g377 = (float3(0.0 , input.texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g375 = appendResult24_g377;
				float3 PivotPosOnYAxis56_g385 = DM_PivotPosOnYAxis88_g375;
				float DM1_FoliageLength32_g375 = _DM1FoliageLength;
				float3 rotatedValue29_g385 = RotateAroundAxis( PivotPosOnYAxis56_g385, input.positionOS.xyz, DB_RotationAxis87_g375, radians( ( ( ( DM_AmplitudeScale168_g375 * DM1_Amplitude28_g375 ) * sin( ( ( ( objToWorld80_g385.x + objToWorld80_g385.z ) + ( ( Time90_g385 * ( Speed45_g385 * SpeedScale95_g385 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g385 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g385 ) / DM1_FoliageLength32_g375 ) ) ) );
				float DM1_MotionMask89_g375 = step( 1.5 , input.texcoord.y );
				float3 DM1_VertexOffset231_g375 = ( ( rotatedValue29_g385 - input.positionOS.xyz ) * DM1_MotionMask89_g375 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g375 = DM1_VertexOffset231_g375;
				#else
				float3 staticSwitch104_g375 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g375 = _DM2Amplitude;
				float Amplitude58_g386 = DM2_Amplitude30_g375;
				float Source4_g373 = _LocalPivotSource;
				float3 None4_g373 = float3( 0,0,0 );
				float3 appendResult7_g373 = (float3(input.texcoord1.x , 0.0 , input.texcoord1.y));
				float3 UV14_g373 = -appendResult7_g373;
				float3 appendResult8_g373 = (float3(input.texcoord2.x , 0.0 , input.texcoord2.y));
				float3 UV24_g373 = -appendResult8_g373;
				float3 localLocalPivot4_g373 = LocalPivot4_g373( Source4_g373 , None4_g373 , UV14_g373 , UV24_g373 );
				float3 LocalPivot159_g375 = localLocalPivot4_g373;
				float3 PivotPoint49_g386 = LocalPivot159_g375;
				float3 objToWorld53_g386 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g386, 1 ) ).xyz;
				float Time87_g386 = DM_Time169_g375;
				float SpeedScale93_g386 = DM_SpeedScale265_g375;
				float DM2_Speed31_g375 = _DM2Speed;
				float Speed41_g386 = DM2_Speed31_g375;
				float PhaseShift54_g386 = DM_PhaseShift91_g375;
				float3 break52_g386 = PivotPoint49_g386;
				float3 appendResult20_g386 = (float3(break52_g386.x , input.positionOS.xyz.y , break52_g386.z));
				float DM2_ObjectRadius33_g375 = _DM2ObjectRadius;
				float ObjectRadius60_g386 = DM2_ObjectRadius33_g375;
				float3 rotatedValue33_g386 = RotateAroundAxis( PivotPoint49_g386, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g375 * Amplitude58_g386 ) * sin( ( ( ( objToWorld53_g386.x + objToWorld53_g386.z ) + ( ( Time87_g386 * ( SpeedScale93_g386 * Speed41_g386 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g386 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g386 ) / ObjectRadius60_g386 ) ) ) );
				float DM2_MotionMask90_g375 = step( 1.5 , input.texcoord.x );
				float BendingMask62_g386 = DM2_MotionMask90_g375;
				float3 DM2_VertexOffset232_g375 = ( ( rotatedValue33_g386 - input.positionOS.xyz ) * BendingMask62_g386 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g375 = DM2_VertexOffset232_g375;
				#else
				float3 staticSwitch103_g375 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g375 = ( staticSwitch104_g375 + staticSwitch103_g375 );
				float lerpResult56_g383 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g375 = lerpResult56_g383;
				float MM_DirShift59_g375 = _MMDirectionShift;
				float MM_DirShiftOffset60_g375 = _MMDirectionShiftOffset;
				float3 objToWorld11_g380 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float2 appendResult10_g380 = (float2(objToWorld11_g380.x , objToWorld11_g380.z));
				float MotionNoiseTiling20_g375 = _MotionNoiseTiling;
				float4 temp_output_73_0_g375 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g380 * MotionNoiseTiling20_g375 ), 0, 0.0) );
				float4 StaticWorldNoise78_g375 = temp_output_73_0_g375;
				float4 StaticWorldNoise55_g379 = StaticWorldNoise78_g375;
				float3 objToWorld50_g379 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float lerpResult182_g375 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g375);
				float lerpResult246_g375 = lerp( _TimeParameters.x , lerpResult182_g375 , ApplicationIsPlaying241_g375);
				float MM_Time13_g375 = lerpResult246_g375;
				float Time76_g379 = MM_Time13_g375;
				float temp_output_243_0_g375 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g375 = lerp( temp_output_243_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult249_g375 = lerp( temp_output_243_0_g375 , lerpResult245_g375 , ApplicationIsPlaying241_g375);
				float MM_SpeedScale253_g375 = lerpResult249_g375;
				float SpeedScale_RA80_g379 = MM_SpeedScale253_g375;
				float MM_DirShiftSpeed56_g375 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g375 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g379 = radians( ( ( MM_DirAngle51_g375 + ( ( MM_DirShift59_g375 + ( MM_DirShiftOffset60_g375 * (StaticWorldNoise55_g379).x ) ) * sin( ( ( objToWorld50_g379.x + objToWorld50_g379.z ) + ( ( Time76_g379 * ( SpeedScale_RA80_g379 * MM_DirShiftSpeed56_g375 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g379).z * MM_DirShiftNoiseScale57_g375 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g379 = (float3(cos( temp_output_11_0_g379 ) , 0.0 , sin( temp_output_11_0_g379 )));
				float3 worldToObj35_g379 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g379, 1 ) ).xyz;
				float3 worldToObj36_g379 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g379 = normalize( (( worldToObj35_g379 - worldToObj36_g379 )).xyz );
				float3 MB_RotationAxis129_g375 = normalizeResult34_g379;
				float3 RotationAxis56_g378 = MB_RotationAxis129_g375;
				float4 StaticWorldNoise31_g384 = StaticWorldNoise78_g375;
				float MM_BendingOfset37_g375 = _MMBendingOffset;
				float MM_Bending35_g375 = _MMBending;
				float GV_BendingScale176_g375 = _GVAmplitudeScale;
				float lerpResult188_g375 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g375);
				float MM_BendingScale17_g375 = lerpResult188_g375;
				float MM_AmplitudeOffset52_g375 = _MMAmplitudeOffset;
				float MM_Amplitude66_g375 = _MMAmplitude;
				float lerpResult189_g375 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float MM_AmplitudeScale15_g375 = lerpResult189_g375;
				float3 objToWorld170_g384 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g384 = MM_Time13_g375;
				float MM_Speed53_g375 = _MMSpeed;
				float Speed125_g384 = MM_Speed53_g375;
				float SpeedScale_RotAng201_g384 = MM_SpeedScale253_g375;
				float MM_SineWaveLength58_g375 = _MMSineWaveLength;
				float WaveLength63_g384 = MM_SineWaveLength58_g375;
				float MM_PhaseShiftSource207_g375 = _MMPhaseShiftSource;
				float lerpResult154_g375 = lerp( input.ase_color.a , (StaticWorldNoise78_g375).g , MM_PhaseShiftSource207_g375);
				float MM_PhaseShiftScale39_g375 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g375 = ( lerpResult154_g375 * MM_PhaseShiftScale39_g375 );
				float PhaseShift127_g384 = MB_PhaseShift79_g375;
				float temp_output_20_0_g384 = sin( ( ( ( objToWorld170_g384.x + objToWorld170_g384.z ) + ( ( Time167_g384 * ( ( Speed125_g384 * SpeedScale_RotAng201_g384 ) * WaveLength63_g384 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g384 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g384 ) ) );
				float MM_MaxHeight55_g375 = _MMObjectHeight;
				float3 gammaToLinear56_g384 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g375 = _MMObjectHeightSource;
				float lerpResult57_g384 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g375 ) , (gammaToLinear56_g384).x , MM_ObjectHeightSource54_g375);
				float BendingMask189_g384 = lerpResult57_g384;
				float MB_RotationAngle130_g375 = radians( ( ( ( ( ( (StaticWorldNoise31_g384).y * MM_BendingOfset37_g375 ) + MM_Bending35_g375 ) * MM_BendingScale17_g375 ) + ( ( ( ( (StaticWorldNoise31_g384).x * MM_AmplitudeOffset52_g375 ) + MM_Amplitude66_g375 ) * MM_AmplitudeScale15_g375 ) * temp_output_20_0_g384 ) ) * BendingMask189_g384 ) );
				float RotationAngle54_g378 = MB_RotationAngle130_g375;
				float3 LocalPivotPos60_g378 = LocalPivot159_g375;
				float3 break62_g378 = LocalPivotPos60_g378;
				float VertexPos_Y67_g378 = input.positionOS.xyz.y;
				float3 appendResult45_g378 = (float3(break62_g378.x , VertexPos_Y67_g378 , break62_g378.z));
				float3 VertexPos66_g378 = input.positionOS.xyz;
				float3 rotatedValue30_g378 = RotateAroundAxis( appendResult45_g378, VertexPos66_g378, RotationAxis56_g378, RotationAngle54_g378 );
				float3 DetailMotionVO73_g378 = DM_VertexOffset128_g375;
				float3 rotatedValue34_g378 = RotateAroundAxis( LocalPivotPos60_g378, ( rotatedValue30_g378 + DetailMotionVO73_g378 ), RotationAxis56_g378, RotationAngle54_g378 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g375 = ( ( rotatedValue34_g378 - VertexPos66_g378 ) * step( 0.01 , VertexPos_Y67_g378 ) );
				#else
				float3 staticSwitch205_g375 = DM_VertexOffset128_g375;
				#endif
				
				float3 vertexToFrag6_g374 = input.positionOS.xyz;
				output.ase_texcoord8.xyz = vertexToFrag6_g374;
				float3 gammaToLinear7_g374 = FastSRGBToLinear( input.ase_color.rgb );
				float vertexToFrag12_g374 = (gammaToLinear7_g374).x;
				output.ase_texcoord7.z = vertexToFrag12_g374;
				
				output.ase_texcoord7.xy = input.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord7.w = 0;
				output.ase_texcoord8.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g375;

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

				float4 BaseColor10_g372 = _BaseColor;
				float2 uv_MainTex31_g372 = input.ase_texcoord7.xy;
				float4 Albedo_Ccclusion39_g374 = ( BaseColor10_g372 * tex2D( _MainTex, uv_MainTex31_g372 ) );
				float4 OcclusionColor21_g374 = _OcclusionColor;
				float3 vertexToFrag6_g374 = input.ase_texcoord8.xyz;
				float3 appendResult10_g374 = (float3(0.0 , vertexToFrag6_g374.y , 0.0));
				float OcclusionMaxRadius23_g374 = _OcclusionMaxRadius;
				float OcclusionMinRadius25_g374 = _OcclusionMinRadius;
				float vertexToFrag12_g374 = input.ase_texcoord7.z;
				float lerpResult15_g374 = lerp( OcclusionMaxRadius23_g374 , OcclusionMinRadius25_g374 , vertexToFrag12_g374);
				float OclusionMask219_g374 = ( 1.0 - saturate( ( distance( vertexToFrag6_g374 , appendResult10_g374 ) / lerpResult15_g374 ) ) );
				float4 lerpResult27_g374 = lerp( Albedo_Ccclusion39_g374 , OcclusionColor21_g374 , OclusionMask219_g374);
				float4 lerpResult31_g374 = lerp( Albedo_Ccclusion39_g374 , lerpResult27_g374 , step( 1.0 , input.ase_texcoord7.xy.x ));
				#ifdef _OCCLUSION_ON
				float4 staticSwitch32_g374 = lerpResult31_g374;
				#else
				float4 staticSwitch32_g374 = Albedo_Ccclusion39_g374;
				#endif
				

				float3 BaseColor = staticSwitch32_g374.rgb;
				float3 Normal = float3(0, 0, 1);
				float3 Specular = 0.5;
				float Metallic = _Metallic;
				float Smoothness = _Smoothness;
				float Occlusion = 1;
				float3 Emission = 0;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
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
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _OcclusionColor;
			float4 _BaseColor;
			half _GVBendingScale;
			float _OcclusionMinRadius;
			float _OcclusionMaxRadius;
			half _MMObjectHeightSource;
			half _MMObjectHeight;
			half _MMPhaseShiftScale;
			half _MMPhaseShiftSource;
			half _MMSineWaveLength;
			half _MMSpeed;
			half _MMAmplitude;
			half _MMAmplitudeOffset;
			half _GVAmplitudeScale;
			half _MMBending;
			float _Metallic;
			half _MMBendingOffset;
			half _MMDirectionShiftSpeed;
			float _MotionNoiseTiling;
			half _MMDirectionShiftOffset;
			half _MMDirectionShift;
			half _GVDirectionAngle;
			half _MMDirectionAngle;
			float _DM2ObjectRadius;
			float _DM2Speed;
			float _LocalPivotSource;
			float _DM2Amplitude;
			float _DM1FoliageLength;
			float _DM1Speed;
			float _GVTime;
			float _DM1Amplitude;
			half _MMDirectionShiftNoiseScale;
			float _Smoothness;
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
			
			float3 LocalPivot4_g373( float Source, float3 None, float3 UV1, float3 UV2 )
			{
				if(Source ==0)
				    return None;
				else if(Source ==1)
				    return UV1;
				else
				    return UV2;
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

				float temp_output_23_0_g377 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g377 = (float3(cos( temp_output_23_0_g377 ) , 0.0 , sin( temp_output_23_0_g377 )));
				float3 DB_RotationAxis87_g375 = appendResult25_g377;
				float GV_AmplitudeScale175_g375 = _GVBendingScale;
				float lerpResult186_g375 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float DM_AmplitudeScale168_g375 = lerpResult186_g375;
				float DM1_Amplitude28_g375 = _DM1Amplitude;
				float3 objToWorld80_g385 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g375 = _GVTime;
				float lerpResult187_g375 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g375);
				float ApplicationIsPlaying241_g375 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g375 = lerp( _TimeParameters.x , lerpResult187_g375 , ApplicationIsPlaying241_g375);
				float DM_Time169_g375 = lerpResult256_g375;
				float Time90_g385 = DM_Time169_g375;
				float DM1_Speed29_g375 = _DM1Speed;
				float Speed45_g385 = DM1_Speed29_g375;
				float temp_output_244_0_g375 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g375 = lerp( temp_output_244_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult262_g375 = lerp( temp_output_244_0_g375 , lerpResult261_g375 , ApplicationIsPlaying241_g375);
				float DM_SpeedScale265_g375 = lerpResult262_g375;
				float SpeedScale95_g385 = DM_SpeedScale265_g375;
				float DM_PhaseShift91_g375 = input.ase_color.a;
				float PhaseShift48_g385 = DM_PhaseShift91_g375;
				float3 appendResult24_g377 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g375 = appendResult24_g377;
				float3 PivotPosOnYAxis56_g385 = DM_PivotPosOnYAxis88_g375;
				float DM1_FoliageLength32_g375 = _DM1FoliageLength;
				float3 rotatedValue29_g385 = RotateAroundAxis( PivotPosOnYAxis56_g385, input.positionOS.xyz, DB_RotationAxis87_g375, radians( ( ( ( DM_AmplitudeScale168_g375 * DM1_Amplitude28_g375 ) * sin( ( ( ( objToWorld80_g385.x + objToWorld80_g385.z ) + ( ( Time90_g385 * ( Speed45_g385 * SpeedScale95_g385 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g385 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g385 ) / DM1_FoliageLength32_g375 ) ) ) );
				float DM1_MotionMask89_g375 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g375 = ( ( rotatedValue29_g385 - input.positionOS.xyz ) * DM1_MotionMask89_g375 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g375 = DM1_VertexOffset231_g375;
				#else
				float3 staticSwitch104_g375 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g375 = _DM2Amplitude;
				float Amplitude58_g386 = DM2_Amplitude30_g375;
				float Source4_g373 = _LocalPivotSource;
				float3 None4_g373 = float3( 0,0,0 );
				float3 appendResult7_g373 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 UV14_g373 = -appendResult7_g373;
				float3 appendResult8_g373 = (float3(input.ase_texcoord2.x , 0.0 , input.ase_texcoord2.y));
				float3 UV24_g373 = -appendResult8_g373;
				float3 localLocalPivot4_g373 = LocalPivot4_g373( Source4_g373 , None4_g373 , UV14_g373 , UV24_g373 );
				float3 LocalPivot159_g375 = localLocalPivot4_g373;
				float3 PivotPoint49_g386 = LocalPivot159_g375;
				float3 objToWorld53_g386 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g386, 1 ) ).xyz;
				float Time87_g386 = DM_Time169_g375;
				float SpeedScale93_g386 = DM_SpeedScale265_g375;
				float DM2_Speed31_g375 = _DM2Speed;
				float Speed41_g386 = DM2_Speed31_g375;
				float PhaseShift54_g386 = DM_PhaseShift91_g375;
				float3 break52_g386 = PivotPoint49_g386;
				float3 appendResult20_g386 = (float3(break52_g386.x , input.positionOS.xyz.y , break52_g386.z));
				float DM2_ObjectRadius33_g375 = _DM2ObjectRadius;
				float ObjectRadius60_g386 = DM2_ObjectRadius33_g375;
				float3 rotatedValue33_g386 = RotateAroundAxis( PivotPoint49_g386, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g375 * Amplitude58_g386 ) * sin( ( ( ( objToWorld53_g386.x + objToWorld53_g386.z ) + ( ( Time87_g386 * ( SpeedScale93_g386 * Speed41_g386 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g386 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g386 ) / ObjectRadius60_g386 ) ) ) );
				float DM2_MotionMask90_g375 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g386 = DM2_MotionMask90_g375;
				float3 DM2_VertexOffset232_g375 = ( ( rotatedValue33_g386 - input.positionOS.xyz ) * BendingMask62_g386 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g375 = DM2_VertexOffset232_g375;
				#else
				float3 staticSwitch103_g375 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g375 = ( staticSwitch104_g375 + staticSwitch103_g375 );
				float lerpResult56_g383 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g375 = lerpResult56_g383;
				float MM_DirShift59_g375 = _MMDirectionShift;
				float MM_DirShiftOffset60_g375 = _MMDirectionShiftOffset;
				float3 objToWorld11_g380 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float2 appendResult10_g380 = (float2(objToWorld11_g380.x , objToWorld11_g380.z));
				float MotionNoiseTiling20_g375 = _MotionNoiseTiling;
				float4 temp_output_73_0_g375 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g380 * MotionNoiseTiling20_g375 ), 0, 0.0) );
				float4 StaticWorldNoise78_g375 = temp_output_73_0_g375;
				float4 StaticWorldNoise55_g379 = StaticWorldNoise78_g375;
				float3 objToWorld50_g379 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float lerpResult182_g375 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g375);
				float lerpResult246_g375 = lerp( _TimeParameters.x , lerpResult182_g375 , ApplicationIsPlaying241_g375);
				float MM_Time13_g375 = lerpResult246_g375;
				float Time76_g379 = MM_Time13_g375;
				float temp_output_243_0_g375 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g375 = lerp( temp_output_243_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult249_g375 = lerp( temp_output_243_0_g375 , lerpResult245_g375 , ApplicationIsPlaying241_g375);
				float MM_SpeedScale253_g375 = lerpResult249_g375;
				float SpeedScale_RA80_g379 = MM_SpeedScale253_g375;
				float MM_DirShiftSpeed56_g375 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g375 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g379 = radians( ( ( MM_DirAngle51_g375 + ( ( MM_DirShift59_g375 + ( MM_DirShiftOffset60_g375 * (StaticWorldNoise55_g379).x ) ) * sin( ( ( objToWorld50_g379.x + objToWorld50_g379.z ) + ( ( Time76_g379 * ( SpeedScale_RA80_g379 * MM_DirShiftSpeed56_g375 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g379).z * MM_DirShiftNoiseScale57_g375 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g379 = (float3(cos( temp_output_11_0_g379 ) , 0.0 , sin( temp_output_11_0_g379 )));
				float3 worldToObj35_g379 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g379, 1 ) ).xyz;
				float3 worldToObj36_g379 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g379 = normalize( (( worldToObj35_g379 - worldToObj36_g379 )).xyz );
				float3 MB_RotationAxis129_g375 = normalizeResult34_g379;
				float3 RotationAxis56_g378 = MB_RotationAxis129_g375;
				float4 StaticWorldNoise31_g384 = StaticWorldNoise78_g375;
				float MM_BendingOfset37_g375 = _MMBendingOffset;
				float MM_Bending35_g375 = _MMBending;
				float GV_BendingScale176_g375 = _GVAmplitudeScale;
				float lerpResult188_g375 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g375);
				float MM_BendingScale17_g375 = lerpResult188_g375;
				float MM_AmplitudeOffset52_g375 = _MMAmplitudeOffset;
				float MM_Amplitude66_g375 = _MMAmplitude;
				float lerpResult189_g375 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float MM_AmplitudeScale15_g375 = lerpResult189_g375;
				float3 objToWorld170_g384 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g384 = MM_Time13_g375;
				float MM_Speed53_g375 = _MMSpeed;
				float Speed125_g384 = MM_Speed53_g375;
				float SpeedScale_RotAng201_g384 = MM_SpeedScale253_g375;
				float MM_SineWaveLength58_g375 = _MMSineWaveLength;
				float WaveLength63_g384 = MM_SineWaveLength58_g375;
				float MM_PhaseShiftSource207_g375 = _MMPhaseShiftSource;
				float lerpResult154_g375 = lerp( input.ase_color.a , (StaticWorldNoise78_g375).g , MM_PhaseShiftSource207_g375);
				float MM_PhaseShiftScale39_g375 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g375 = ( lerpResult154_g375 * MM_PhaseShiftScale39_g375 );
				float PhaseShift127_g384 = MB_PhaseShift79_g375;
				float temp_output_20_0_g384 = sin( ( ( ( objToWorld170_g384.x + objToWorld170_g384.z ) + ( ( Time167_g384 * ( ( Speed125_g384 * SpeedScale_RotAng201_g384 ) * WaveLength63_g384 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g384 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g384 ) ) );
				float MM_MaxHeight55_g375 = _MMObjectHeight;
				float3 gammaToLinear56_g384 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g375 = _MMObjectHeightSource;
				float lerpResult57_g384 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g375 ) , (gammaToLinear56_g384).x , MM_ObjectHeightSource54_g375);
				float BendingMask189_g384 = lerpResult57_g384;
				float MB_RotationAngle130_g375 = radians( ( ( ( ( ( (StaticWorldNoise31_g384).y * MM_BendingOfset37_g375 ) + MM_Bending35_g375 ) * MM_BendingScale17_g375 ) + ( ( ( ( (StaticWorldNoise31_g384).x * MM_AmplitudeOffset52_g375 ) + MM_Amplitude66_g375 ) * MM_AmplitudeScale15_g375 ) * temp_output_20_0_g384 ) ) * BendingMask189_g384 ) );
				float RotationAngle54_g378 = MB_RotationAngle130_g375;
				float3 LocalPivotPos60_g378 = LocalPivot159_g375;
				float3 break62_g378 = LocalPivotPos60_g378;
				float VertexPos_Y67_g378 = input.positionOS.xyz.y;
				float3 appendResult45_g378 = (float3(break62_g378.x , VertexPos_Y67_g378 , break62_g378.z));
				float3 VertexPos66_g378 = input.positionOS.xyz;
				float3 rotatedValue30_g378 = RotateAroundAxis( appendResult45_g378, VertexPos66_g378, RotationAxis56_g378, RotationAngle54_g378 );
				float3 DetailMotionVO73_g378 = DM_VertexOffset128_g375;
				float3 rotatedValue34_g378 = RotateAroundAxis( LocalPivotPos60_g378, ( rotatedValue30_g378 + DetailMotionVO73_g378 ), RotationAxis56_g378, RotationAngle54_g378 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g375 = ( ( rotatedValue34_g378 - VertexPos66_g378 ) * step( 0.01 , VertexPos_Y67_g378 ) );
				#else
				float3 staticSwitch205_g375 = DM_VertexOffset128_g375;
				#endif
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g375;

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

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

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
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float3 positionWS : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _OcclusionColor;
			float4 _BaseColor;
			half _GVBendingScale;
			float _OcclusionMinRadius;
			float _OcclusionMaxRadius;
			half _MMObjectHeightSource;
			half _MMObjectHeight;
			half _MMPhaseShiftScale;
			half _MMPhaseShiftSource;
			half _MMSineWaveLength;
			half _MMSpeed;
			half _MMAmplitude;
			half _MMAmplitudeOffset;
			half _GVAmplitudeScale;
			half _MMBending;
			float _Metallic;
			half _MMBendingOffset;
			half _MMDirectionShiftSpeed;
			float _MotionNoiseTiling;
			half _MMDirectionShiftOffset;
			half _MMDirectionShift;
			half _GVDirectionAngle;
			half _MMDirectionAngle;
			float _DM2ObjectRadius;
			float _DM2Speed;
			float _LocalPivotSource;
			float _DM2Amplitude;
			float _DM1FoliageLength;
			float _DM1Speed;
			float _GVTime;
			float _DM1Amplitude;
			half _MMDirectionShiftNoiseScale;
			float _Smoothness;
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
			
			float3 LocalPivot4_g373( float Source, float3 None, float3 UV1, float3 UV2 )
			{
				if(Source ==0)
				    return None;
				else if(Source ==1)
				    return UV1;
				else
				    return UV2;
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

				float temp_output_23_0_g377 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g377 = (float3(cos( temp_output_23_0_g377 ) , 0.0 , sin( temp_output_23_0_g377 )));
				float3 DB_RotationAxis87_g375 = appendResult25_g377;
				float GV_AmplitudeScale175_g375 = _GVBendingScale;
				float lerpResult186_g375 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float DM_AmplitudeScale168_g375 = lerpResult186_g375;
				float DM1_Amplitude28_g375 = _DM1Amplitude;
				float3 objToWorld80_g385 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g375 = _GVTime;
				float lerpResult187_g375 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g375);
				float ApplicationIsPlaying241_g375 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g375 = lerp( _TimeParameters.x , lerpResult187_g375 , ApplicationIsPlaying241_g375);
				float DM_Time169_g375 = lerpResult256_g375;
				float Time90_g385 = DM_Time169_g375;
				float DM1_Speed29_g375 = _DM1Speed;
				float Speed45_g385 = DM1_Speed29_g375;
				float temp_output_244_0_g375 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g375 = lerp( temp_output_244_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult262_g375 = lerp( temp_output_244_0_g375 , lerpResult261_g375 , ApplicationIsPlaying241_g375);
				float DM_SpeedScale265_g375 = lerpResult262_g375;
				float SpeedScale95_g385 = DM_SpeedScale265_g375;
				float DM_PhaseShift91_g375 = input.ase_color.a;
				float PhaseShift48_g385 = DM_PhaseShift91_g375;
				float3 appendResult24_g377 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g375 = appendResult24_g377;
				float3 PivotPosOnYAxis56_g385 = DM_PivotPosOnYAxis88_g375;
				float DM1_FoliageLength32_g375 = _DM1FoliageLength;
				float3 rotatedValue29_g385 = RotateAroundAxis( PivotPosOnYAxis56_g385, input.positionOS.xyz, DB_RotationAxis87_g375, radians( ( ( ( DM_AmplitudeScale168_g375 * DM1_Amplitude28_g375 ) * sin( ( ( ( objToWorld80_g385.x + objToWorld80_g385.z ) + ( ( Time90_g385 * ( Speed45_g385 * SpeedScale95_g385 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g385 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g385 ) / DM1_FoliageLength32_g375 ) ) ) );
				float DM1_MotionMask89_g375 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g375 = ( ( rotatedValue29_g385 - input.positionOS.xyz ) * DM1_MotionMask89_g375 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g375 = DM1_VertexOffset231_g375;
				#else
				float3 staticSwitch104_g375 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g375 = _DM2Amplitude;
				float Amplitude58_g386 = DM2_Amplitude30_g375;
				float Source4_g373 = _LocalPivotSource;
				float3 None4_g373 = float3( 0,0,0 );
				float3 appendResult7_g373 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 UV14_g373 = -appendResult7_g373;
				float3 appendResult8_g373 = (float3(input.ase_texcoord2.x , 0.0 , input.ase_texcoord2.y));
				float3 UV24_g373 = -appendResult8_g373;
				float3 localLocalPivot4_g373 = LocalPivot4_g373( Source4_g373 , None4_g373 , UV14_g373 , UV24_g373 );
				float3 LocalPivot159_g375 = localLocalPivot4_g373;
				float3 PivotPoint49_g386 = LocalPivot159_g375;
				float3 objToWorld53_g386 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g386, 1 ) ).xyz;
				float Time87_g386 = DM_Time169_g375;
				float SpeedScale93_g386 = DM_SpeedScale265_g375;
				float DM2_Speed31_g375 = _DM2Speed;
				float Speed41_g386 = DM2_Speed31_g375;
				float PhaseShift54_g386 = DM_PhaseShift91_g375;
				float3 break52_g386 = PivotPoint49_g386;
				float3 appendResult20_g386 = (float3(break52_g386.x , input.positionOS.xyz.y , break52_g386.z));
				float DM2_ObjectRadius33_g375 = _DM2ObjectRadius;
				float ObjectRadius60_g386 = DM2_ObjectRadius33_g375;
				float3 rotatedValue33_g386 = RotateAroundAxis( PivotPoint49_g386, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g375 * Amplitude58_g386 ) * sin( ( ( ( objToWorld53_g386.x + objToWorld53_g386.z ) + ( ( Time87_g386 * ( SpeedScale93_g386 * Speed41_g386 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g386 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g386 ) / ObjectRadius60_g386 ) ) ) );
				float DM2_MotionMask90_g375 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g386 = DM2_MotionMask90_g375;
				float3 DM2_VertexOffset232_g375 = ( ( rotatedValue33_g386 - input.positionOS.xyz ) * BendingMask62_g386 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g375 = DM2_VertexOffset232_g375;
				#else
				float3 staticSwitch103_g375 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g375 = ( staticSwitch104_g375 + staticSwitch103_g375 );
				float lerpResult56_g383 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g375 = lerpResult56_g383;
				float MM_DirShift59_g375 = _MMDirectionShift;
				float MM_DirShiftOffset60_g375 = _MMDirectionShiftOffset;
				float3 objToWorld11_g380 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float2 appendResult10_g380 = (float2(objToWorld11_g380.x , objToWorld11_g380.z));
				float MotionNoiseTiling20_g375 = _MotionNoiseTiling;
				float4 temp_output_73_0_g375 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g380 * MotionNoiseTiling20_g375 ), 0, 0.0) );
				float4 StaticWorldNoise78_g375 = temp_output_73_0_g375;
				float4 StaticWorldNoise55_g379 = StaticWorldNoise78_g375;
				float3 objToWorld50_g379 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float lerpResult182_g375 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g375);
				float lerpResult246_g375 = lerp( _TimeParameters.x , lerpResult182_g375 , ApplicationIsPlaying241_g375);
				float MM_Time13_g375 = lerpResult246_g375;
				float Time76_g379 = MM_Time13_g375;
				float temp_output_243_0_g375 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g375 = lerp( temp_output_243_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult249_g375 = lerp( temp_output_243_0_g375 , lerpResult245_g375 , ApplicationIsPlaying241_g375);
				float MM_SpeedScale253_g375 = lerpResult249_g375;
				float SpeedScale_RA80_g379 = MM_SpeedScale253_g375;
				float MM_DirShiftSpeed56_g375 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g375 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g379 = radians( ( ( MM_DirAngle51_g375 + ( ( MM_DirShift59_g375 + ( MM_DirShiftOffset60_g375 * (StaticWorldNoise55_g379).x ) ) * sin( ( ( objToWorld50_g379.x + objToWorld50_g379.z ) + ( ( Time76_g379 * ( SpeedScale_RA80_g379 * MM_DirShiftSpeed56_g375 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g379).z * MM_DirShiftNoiseScale57_g375 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g379 = (float3(cos( temp_output_11_0_g379 ) , 0.0 , sin( temp_output_11_0_g379 )));
				float3 worldToObj35_g379 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g379, 1 ) ).xyz;
				float3 worldToObj36_g379 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g379 = normalize( (( worldToObj35_g379 - worldToObj36_g379 )).xyz );
				float3 MB_RotationAxis129_g375 = normalizeResult34_g379;
				float3 RotationAxis56_g378 = MB_RotationAxis129_g375;
				float4 StaticWorldNoise31_g384 = StaticWorldNoise78_g375;
				float MM_BendingOfset37_g375 = _MMBendingOffset;
				float MM_Bending35_g375 = _MMBending;
				float GV_BendingScale176_g375 = _GVAmplitudeScale;
				float lerpResult188_g375 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g375);
				float MM_BendingScale17_g375 = lerpResult188_g375;
				float MM_AmplitudeOffset52_g375 = _MMAmplitudeOffset;
				float MM_Amplitude66_g375 = _MMAmplitude;
				float lerpResult189_g375 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float MM_AmplitudeScale15_g375 = lerpResult189_g375;
				float3 objToWorld170_g384 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g384 = MM_Time13_g375;
				float MM_Speed53_g375 = _MMSpeed;
				float Speed125_g384 = MM_Speed53_g375;
				float SpeedScale_RotAng201_g384 = MM_SpeedScale253_g375;
				float MM_SineWaveLength58_g375 = _MMSineWaveLength;
				float WaveLength63_g384 = MM_SineWaveLength58_g375;
				float MM_PhaseShiftSource207_g375 = _MMPhaseShiftSource;
				float lerpResult154_g375 = lerp( input.ase_color.a , (StaticWorldNoise78_g375).g , MM_PhaseShiftSource207_g375);
				float MM_PhaseShiftScale39_g375 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g375 = ( lerpResult154_g375 * MM_PhaseShiftScale39_g375 );
				float PhaseShift127_g384 = MB_PhaseShift79_g375;
				float temp_output_20_0_g384 = sin( ( ( ( objToWorld170_g384.x + objToWorld170_g384.z ) + ( ( Time167_g384 * ( ( Speed125_g384 * SpeedScale_RotAng201_g384 ) * WaveLength63_g384 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g384 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g384 ) ) );
				float MM_MaxHeight55_g375 = _MMObjectHeight;
				float3 gammaToLinear56_g384 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g375 = _MMObjectHeightSource;
				float lerpResult57_g384 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g375 ) , (gammaToLinear56_g384).x , MM_ObjectHeightSource54_g375);
				float BendingMask189_g384 = lerpResult57_g384;
				float MB_RotationAngle130_g375 = radians( ( ( ( ( ( (StaticWorldNoise31_g384).y * MM_BendingOfset37_g375 ) + MM_Bending35_g375 ) * MM_BendingScale17_g375 ) + ( ( ( ( (StaticWorldNoise31_g384).x * MM_AmplitudeOffset52_g375 ) + MM_Amplitude66_g375 ) * MM_AmplitudeScale15_g375 ) * temp_output_20_0_g384 ) ) * BendingMask189_g384 ) );
				float RotationAngle54_g378 = MB_RotationAngle130_g375;
				float3 LocalPivotPos60_g378 = LocalPivot159_g375;
				float3 break62_g378 = LocalPivotPos60_g378;
				float VertexPos_Y67_g378 = input.positionOS.xyz.y;
				float3 appendResult45_g378 = (float3(break62_g378.x , VertexPos_Y67_g378 , break62_g378.z));
				float3 VertexPos66_g378 = input.positionOS.xyz;
				float3 rotatedValue30_g378 = RotateAroundAxis( appendResult45_g378, VertexPos66_g378, RotationAxis56_g378, RotationAngle54_g378 );
				float3 DetailMotionVO73_g378 = DM_VertexOffset128_g375;
				float3 rotatedValue34_g378 = RotateAroundAxis( LocalPivotPos60_g378, ( rotatedValue30_g378 + DetailMotionVO73_g378 ), RotationAxis56_g378, RotationAngle54_g378 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g375 = ( ( rotatedValue34_g378 - VertexPos66_g378 ) * step( 0.01 , VertexPos_Y67_g378 ) );
				#else
				float3 staticSwitch205_g375 = DM_VertexOffset128_g375;
				#endif
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g375;

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

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

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
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 positionCSNoJitter : TEXCOORD0;
				float4 previousPositionCSNoJitter : TEXCOORD1;
				float3 positionWS : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _OcclusionColor;
			float4 _BaseColor;
			half _GVBendingScale;
			float _OcclusionMinRadius;
			float _OcclusionMaxRadius;
			half _MMObjectHeightSource;
			half _MMObjectHeight;
			half _MMPhaseShiftScale;
			half _MMPhaseShiftSource;
			half _MMSineWaveLength;
			half _MMSpeed;
			half _MMAmplitude;
			half _MMAmplitudeOffset;
			half _GVAmplitudeScale;
			half _MMBending;
			float _Metallic;
			half _MMBendingOffset;
			half _MMDirectionShiftSpeed;
			float _MotionNoiseTiling;
			half _MMDirectionShiftOffset;
			half _MMDirectionShift;
			half _GVDirectionAngle;
			half _MMDirectionAngle;
			float _DM2ObjectRadius;
			float _DM2Speed;
			float _LocalPivotSource;
			float _DM2Amplitude;
			float _DM1FoliageLength;
			float _DM1Speed;
			float _GVTime;
			float _DM1Amplitude;
			half _MMDirectionShiftNoiseScale;
			float _Smoothness;
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
			
			float3 LocalPivot4_g373( float Source, float3 None, float3 UV1, float3 UV2 )
			{
				if(Source ==0)
				    return None;
				else if(Source ==1)
				    return UV1;
				else
				    return UV2;
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float temp_output_23_0_g377 = radians( ( 90.0 + ( input.ase_texcoord2.x * 360.0 ) ) );
				float3 appendResult25_g377 = (float3(cos( temp_output_23_0_g377 ) , 0.0 , sin( temp_output_23_0_g377 )));
				float3 DB_RotationAxis87_g375 = appendResult25_g377;
				float GV_AmplitudeScale175_g375 = _GVBendingScale;
				float lerpResult186_g375 = lerp( 1.0 , Nicrom_DM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float DM_AmplitudeScale168_g375 = lerpResult186_g375;
				float DM1_Amplitude28_g375 = _DM1Amplitude;
				float3 objToWorld80_g385 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float GV_Time174_g375 = _GVTime;
				float lerpResult187_g375 = lerp( _TimeParameters.x , Nicrom_DM_Time_Vegetation , GV_Time174_g375);
				float ApplicationIsPlaying241_g375 = Nicrom_ApplicationIsPlaying;
				float lerpResult256_g375 = lerp( _TimeParameters.x , lerpResult187_g375 , ApplicationIsPlaying241_g375);
				float DM_Time169_g375 = lerpResult256_g375;
				float Time90_g385 = DM_Time169_g375;
				float DM1_Speed29_g375 = _DM1Speed;
				float Speed45_g385 = DM1_Speed29_g375;
				float temp_output_244_0_g375 = Nicrom_DM_SpeedScale_Vegetation;
				float lerpResult261_g375 = lerp( temp_output_244_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult262_g375 = lerp( temp_output_244_0_g375 , lerpResult261_g375 , ApplicationIsPlaying241_g375);
				float DM_SpeedScale265_g375 = lerpResult262_g375;
				float SpeedScale95_g385 = DM_SpeedScale265_g375;
				float DM_PhaseShift91_g375 = input.ase_color.a;
				float PhaseShift48_g385 = DM_PhaseShift91_g375;
				float3 appendResult24_g377 = (float3(0.0 , input.ase_texcoord2.y , 0.0));
				float3 DM_PivotPosOnYAxis88_g375 = appendResult24_g377;
				float3 PivotPosOnYAxis56_g385 = DM_PivotPosOnYAxis88_g375;
				float DM1_FoliageLength32_g375 = _DM1FoliageLength;
				float3 rotatedValue29_g385 = RotateAroundAxis( PivotPosOnYAxis56_g385, input.positionOS.xyz, DB_RotationAxis87_g375, radians( ( ( ( DM_AmplitudeScale168_g375 * DM1_Amplitude28_g375 ) * sin( ( ( ( objToWorld80_g385.x + objToWorld80_g385.z ) + ( ( Time90_g385 * ( Speed45_g385 * SpeedScale95_g385 ) ) + ( ( 2.0 * PI ) * PhaseShift48_g385 ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , PivotPosOnYAxis56_g385 ) / DM1_FoliageLength32_g375 ) ) ) );
				float DM1_MotionMask89_g375 = step( 1.5 , input.ase_texcoord.y );
				float3 DM1_VertexOffset231_g375 = ( ( rotatedValue29_g385 - input.positionOS.xyz ) * DM1_MotionMask89_g375 );
				#ifdef _DETAILMOTION1_ON
				float3 staticSwitch104_g375 = DM1_VertexOffset231_g375;
				#else
				float3 staticSwitch104_g375 = float3( 0, 0, 0 );
				#endif
				float DM2_Amplitude30_g375 = _DM2Amplitude;
				float Amplitude58_g386 = DM2_Amplitude30_g375;
				float Source4_g373 = _LocalPivotSource;
				float3 None4_g373 = float3( 0,0,0 );
				float3 appendResult7_g373 = (float3(input.ase_texcoord1.x , 0.0 , input.ase_texcoord1.y));
				float3 UV14_g373 = -appendResult7_g373;
				float3 appendResult8_g373 = (float3(input.ase_texcoord2.x , 0.0 , input.ase_texcoord2.y));
				float3 UV24_g373 = -appendResult8_g373;
				float3 localLocalPivot4_g373 = LocalPivot4_g373( Source4_g373 , None4_g373 , UV14_g373 , UV24_g373 );
				float3 LocalPivot159_g375 = localLocalPivot4_g373;
				float3 PivotPoint49_g386 = LocalPivot159_g375;
				float3 objToWorld53_g386 = mul( GetObjectToWorldMatrix(), float4( PivotPoint49_g386, 1 ) ).xyz;
				float Time87_g386 = DM_Time169_g375;
				float SpeedScale93_g386 = DM_SpeedScale265_g375;
				float DM2_Speed31_g375 = _DM2Speed;
				float Speed41_g386 = DM2_Speed31_g375;
				float PhaseShift54_g386 = DM_PhaseShift91_g375;
				float3 break52_g386 = PivotPoint49_g386;
				float3 appendResult20_g386 = (float3(break52_g386.x , input.positionOS.xyz.y , break52_g386.z));
				float DM2_ObjectRadius33_g375 = _DM2ObjectRadius;
				float ObjectRadius60_g386 = DM2_ObjectRadius33_g375;
				float3 rotatedValue33_g386 = RotateAroundAxis( PivotPoint49_g386, input.positionOS.xyz, float3( 0, 1, 0 ), radians( ( ( ( DM_AmplitudeScale168_g375 * Amplitude58_g386 ) * sin( ( ( ( objToWorld53_g386.x + objToWorld53_g386.z ) + ( ( Time87_g386 * ( SpeedScale93_g386 * Speed41_g386 ) ) + ( ( 2.0 * PI ) * ( 1.0 - PhaseShift54_g386 ) ) ) ) * ( 2.0 * PI ) ) ) ) * ( distance( input.positionOS.xyz , appendResult20_g386 ) / ObjectRadius60_g386 ) ) ) );
				float DM2_MotionMask90_g375 = step( 1.5 , input.ase_texcoord.x );
				float BendingMask62_g386 = DM2_MotionMask90_g375;
				float3 DM2_VertexOffset232_g375 = ( ( rotatedValue33_g386 - input.positionOS.xyz ) * BendingMask62_g386 );
				#ifdef _DETAILMOTION2_ON
				float3 staticSwitch103_g375 = DM2_VertexOffset232_g375;
				#else
				float3 staticSwitch103_g375 = float3( 0, 0, 0 );
				#endif
				float3 DM_VertexOffset128_g375 = ( staticSwitch104_g375 + staticSwitch103_g375 );
				float lerpResult56_g383 = lerp( _MMDirectionAngle , Nicrom_WindDirAngle , _GVDirectionAngle);
				float MM_DirAngle51_g375 = lerpResult56_g383;
				float MM_DirShift59_g375 = _MMDirectionShift;
				float MM_DirShiftOffset60_g375 = _MMDirectionShiftOffset;
				float3 objToWorld11_g380 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float2 appendResult10_g380 = (float2(objToWorld11_g380.x , objToWorld11_g380.z));
				float MotionNoiseTiling20_g375 = _MotionNoiseTiling;
				float4 temp_output_73_0_g375 = tex2Dlod( _MotionNoise, float4( ( appendResult10_g380 * MotionNoiseTiling20_g375 ), 0, 0.0) );
				float4 StaticWorldNoise78_g375 = temp_output_73_0_g375;
				float4 StaticWorldNoise55_g379 = StaticWorldNoise78_g375;
				float3 objToWorld50_g379 = mul( GetObjectToWorldMatrix(), float4( LocalPivot159_g375, 1 ) ).xyz;
				float lerpResult182_g375 = lerp( _TimeParameters.x , Nicrom_MM_Time_Vegetation , GV_Time174_g375);
				float lerpResult246_g375 = lerp( _TimeParameters.x , lerpResult182_g375 , ApplicationIsPlaying241_g375);
				float MM_Time13_g375 = lerpResult246_g375;
				float Time76_g379 = MM_Time13_g375;
				float temp_output_243_0_g375 = Nicrom_MM_SpeedScale_Vegetation;
				float lerpResult245_g375 = lerp( temp_output_243_0_g375 , 1.0 , GV_Time174_g375);
				float lerpResult249_g375 = lerp( temp_output_243_0_g375 , lerpResult245_g375 , ApplicationIsPlaying241_g375);
				float MM_SpeedScale253_g375 = lerpResult249_g375;
				float SpeedScale_RA80_g379 = MM_SpeedScale253_g375;
				float MM_DirShiftSpeed56_g375 = _MMDirectionShiftSpeed;
				float MM_DirShiftNoiseScale57_g375 = _MMDirectionShiftNoiseScale;
				float temp_output_11_0_g379 = radians( ( ( MM_DirAngle51_g375 + ( ( MM_DirShift59_g375 + ( MM_DirShiftOffset60_g375 * (StaticWorldNoise55_g379).x ) ) * sin( ( ( objToWorld50_g379.x + objToWorld50_g379.z ) + ( ( Time76_g379 * ( SpeedScale_RA80_g379 * MM_DirShiftSpeed56_g375 ) ) + ( ( 2.0 * PI ) * ( (StaticWorldNoise55_g379).z * MM_DirShiftNoiseScale57_g375 ) ) ) ) ) ) ) * -1.0 ) );
				float3 appendResult14_g379 = (float3(cos( temp_output_11_0_g379 ) , 0.0 , sin( temp_output_11_0_g379 )));
				float3 worldToObj35_g379 = mul( GetWorldToObjectMatrix(), float4( appendResult14_g379, 1 ) ).xyz;
				float3 worldToObj36_g379 = mul( GetWorldToObjectMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float3 normalizeResult34_g379 = normalize( (( worldToObj35_g379 - worldToObj36_g379 )).xyz );
				float3 MB_RotationAxis129_g375 = normalizeResult34_g379;
				float3 RotationAxis56_g378 = MB_RotationAxis129_g375;
				float4 StaticWorldNoise31_g384 = StaticWorldNoise78_g375;
				float MM_BendingOfset37_g375 = _MMBendingOffset;
				float MM_Bending35_g375 = _MMBending;
				float GV_BendingScale176_g375 = _GVAmplitudeScale;
				float lerpResult188_g375 = lerp( 1.0 , Nicrom_MM_BendScale_Vegetation , GV_BendingScale176_g375);
				float MM_BendingScale17_g375 = lerpResult188_g375;
				float MM_AmplitudeOffset52_g375 = _MMAmplitudeOffset;
				float MM_Amplitude66_g375 = _MMAmplitude;
				float lerpResult189_g375 = lerp( 1.0 , Nicrom_MM_AmpScale_Vegetation , GV_AmplitudeScale175_g375);
				float MM_AmplitudeScale15_g375 = lerpResult189_g375;
				float3 objToWorld170_g384 = mul( GetObjectToWorldMatrix(), float4( float3( 0,0,0 ), 1 ) ).xyz;
				float Time167_g384 = MM_Time13_g375;
				float MM_Speed53_g375 = _MMSpeed;
				float Speed125_g384 = MM_Speed53_g375;
				float SpeedScale_RotAng201_g384 = MM_SpeedScale253_g375;
				float MM_SineWaveLength58_g375 = _MMSineWaveLength;
				float WaveLength63_g384 = MM_SineWaveLength58_g375;
				float MM_PhaseShiftSource207_g375 = _MMPhaseShiftSource;
				float lerpResult154_g375 = lerp( input.ase_color.a , (StaticWorldNoise78_g375).g , MM_PhaseShiftSource207_g375);
				float MM_PhaseShiftScale39_g375 = _MMPhaseShiftScale;
				float MB_PhaseShift79_g375 = ( lerpResult154_g375 * MM_PhaseShiftScale39_g375 );
				float PhaseShift127_g384 = MB_PhaseShift79_g375;
				float temp_output_20_0_g384 = sin( ( ( ( objToWorld170_g384.x + objToWorld170_g384.z ) + ( ( Time167_g384 * ( ( Speed125_g384 * SpeedScale_RotAng201_g384 ) * WaveLength63_g384 ) ) + ( ( 2.0 * PI ) * PhaseShift127_g384 ) ) ) * ( ( 2.0 * PI ) / WaveLength63_g384 ) ) );
				float MM_MaxHeight55_g375 = _MMObjectHeight;
				float3 gammaToLinear56_g384 = FastSRGBToLinear( input.ase_color.rgb );
				float MM_ObjectHeightSource54_g375 = _MMObjectHeightSource;
				float lerpResult57_g384 = lerp( ( input.positionOS.xyz.y / MM_MaxHeight55_g375 ) , (gammaToLinear56_g384).x , MM_ObjectHeightSource54_g375);
				float BendingMask189_g384 = lerpResult57_g384;
				float MB_RotationAngle130_g375 = radians( ( ( ( ( ( (StaticWorldNoise31_g384).y * MM_BendingOfset37_g375 ) + MM_Bending35_g375 ) * MM_BendingScale17_g375 ) + ( ( ( ( (StaticWorldNoise31_g384).x * MM_AmplitudeOffset52_g375 ) + MM_Amplitude66_g375 ) * MM_AmplitudeScale15_g375 ) * temp_output_20_0_g384 ) ) * BendingMask189_g384 ) );
				float RotationAngle54_g378 = MB_RotationAngle130_g375;
				float3 LocalPivotPos60_g378 = LocalPivot159_g375;
				float3 break62_g378 = LocalPivotPos60_g378;
				float VertexPos_Y67_g378 = input.positionOS.xyz.y;
				float3 appendResult45_g378 = (float3(break62_g378.x , VertexPos_Y67_g378 , break62_g378.z));
				float3 VertexPos66_g378 = input.positionOS.xyz;
				float3 rotatedValue30_g378 = RotateAroundAxis( appendResult45_g378, VertexPos66_g378, RotationAxis56_g378, RotationAngle54_g378 );
				float3 DetailMotionVO73_g378 = DM_VertexOffset128_g375;
				float3 rotatedValue34_g378 = RotateAroundAxis( LocalPivotPos60_g378, ( rotatedValue30_g378 + DetailMotionVO73_g378 ), RotationAxis56_g378, RotationAngle54_g378 );
				#ifdef _MAINMOTION_ON
				float3 staticSwitch205_g375 = ( ( rotatedValue34_g378 - VertexPos66_g378 ) * step( 0.01 , VertexPos_Y67_g378 ) );
				#else
				float3 staticSwitch205_g375 = DM_VertexOffset128_g375;
				#endif
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch205_g375;

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

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

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
	
	CustomEditor "Nicrom.CMI_Vegetation_Poly"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}

/*ASEBEGIN
Version=19901
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2020;896,2080;Inherit;False;Nicrom - Vegetation - Motion - GP;-1;;302;2010567f31880844287a8b7519991b43;0;0;7;FLOAT;10;FLOAT;12;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;14;FLOAT;9
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2030;960,2304;Inherit;False;Nicrom - Pivot From UVs;10;;373;210e3b1b5c35d40419d216fdbaceef46;0;0;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2029;960,1792;Inherit;False;Nicrom - Vegetation - Poly - Main;5;;372;037c59b568e1a8c438a36ff9c8cad362;0;0;3;COLOR;0;FLOAT;50;FLOAT;51
Node;AmplifyShaderEditor.OneMinusNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1330;-19002.03,10716.32;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1328;-19355.95,10790.4;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2028;1312,1792;Inherit;False;Nicrom - Vegetation - Occlusion;0;;374;d7ca7ff6f9d074e4eb6a5f354d3fcdc9;0;1;38;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2031;1248,2080;Inherit;False;Nicrom - Motion;12;;375;ba60642b1d9af614f93c28cb2553ff1c;0;8;179;FLOAT;0;False;243;FLOAT;1;False;178;FLOAT;0;False;180;FLOAT;0;False;184;FLOAT;0;False;244;FLOAT;1;False;185;FLOAT;0;False;238;FLOAT3;0,0,0;False;2;FLOAT3;0;COLOR;215
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2032;1664,1792;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;6;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2033;1664,1792;Float;False;True;-1;3;Nicrom.CMI_Vegetation_Poly;0;12;Nicrom/ASE/Vegetation/Poly;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;48;Lighting Model;0;0;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Alpha Clipping;1;0;  Use Shadow Threshold;0;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,True,_TransStrength;0;  Normal Distortion;0.5,True,_TransNormal;0;  Scattering;2,True,_TransScattering;0;  Direct;0.9,True,_TransDirect;0;  Ambient;0.1,True,_TransAmbient;0;  Shadow;0.5,True,_TransShadow;0;Cast Shadows;1;0;Receive Shadows;1;0;Receive SSAO;1;0;Specular Highlights;1;0;Environment Reflections;1;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;  XR Motion Vectors;0;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;12;False;True;True;True;True;True;True;True;True;True;True;False;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2034;1664,1792;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2035;1664,1792;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2036;1664,1792;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2037;1664,1792;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2038;1664,1792;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2039;1664,1792;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2040;1664,1792;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2041;1664,1792;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2042;1664,1792;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;MotionVectors;0;10;MotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;2043;1664,1792;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;XRMotionVectors;0;11;XRMotionVectors;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;True;1;False;;255;False;;1;False;;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;1;LightMode=XRMotionVectors;False;False;0;;0;0;Standard;0;False;0
WireConnection;2028;38;2029;0
WireConnection;2031;179;2020;10
WireConnection;2031;243;2020;12
WireConnection;2031;178;2020;6
WireConnection;2031;180;2020;7
WireConnection;2031;184;2020;8
WireConnection;2031;244;2020;14
WireConnection;2031;185;2020;9
WireConnection;2031;238;2030;0
WireConnection;2033;0;2028;0
WireConnection;2033;3;2029;50
WireConnection;2033;4;2029;51
WireConnection;2033;8;2031;0
ASEEND*/
//CHKSM=A20FD0B12B7C482E022B623CF1CD850C7D00487E