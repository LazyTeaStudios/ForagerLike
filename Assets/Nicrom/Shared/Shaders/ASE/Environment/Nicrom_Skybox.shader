// Made with Amplify Shader Editor v1.9.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Nicrom/ASE/Skybox"
{
	Properties
	{
		[Toggle( _DEBUG_ON )] _Debug( "Debug", Float ) = 0
		[Enum(None,0,Sun Disk Mask 1,1,Sun Disk Mask 2,2,Stars Cubemap,3,Stars Mask,4,Moon Color,5,Moon Mask,6)] _Debug1( "Debug 1", Float ) = 0
		[Enum(None,0,Equator Final Mask,1,Equator Sun Mask,2,Equator Base Mask,3,Equator Glow Scale,4,Fog Mask,5)] _Debug2( "Debug 2", Float ) = 0
		[Enum(None,0,Clouds Mask,1,Cloud Layer 1,2,Cloud Layer 2,3,Cloud Layer 3,4)] _Debug3( "Debug 3", Float ) = 0
		_ZenithColor( "Zenith Color", Color ) = ( 0.3215686, 0.454902, 0.6901961 )
		_ZenithPower( "Zenith Power", Range( 0.001, 1 ) ) = 0.025
		_HorizonColor( "Horizon Color", Color ) = ( 0.4392157, 0.8, 1 )
		_HorizonScale( "Horizon Scale", Range( 0, 1 ) ) = 0.1
		_EquatorColor( "Equator Color", Color ) = ( 0.9098039, 0.972549, 1 )
		_EquatorPower( "Equator Power", Range( 0, 1 ) ) = 0.1
		_EquatorOpacity( "Equator Opacity", Range( 0, 1 ) ) = 0.2
		_EquatorOpacityAtNoon( "Equator Opacity At Noon", Range( 0, 1 ) ) = 0.2
		_EquatorMinRadius( "Equator Min Radius", Range( 0, 1 ) ) = 0
		_EquatorMaxRadius( "Equator Max Radius", Range( 0, 1 ) ) = 1
		_GroundColor( "Ground Color", Color ) = ( 0.6327875, 0.6537832, 0.6603774 )
		_GroundPower( "Ground Power", Range( 0.001, 1 ) ) = 0.025
		[Toggle( _SUN_ON )] _Sun( "Sun", Float ) = 1
		[HDR] _SunColor( "Sun Color", Color ) = ( 1, 1, 1 )
		_SunSize( "Sun Size", Range( 0, 1 ) ) = 0.1
		_SunSharpness( "Sun Sharpness", Range( 0, 1 ) ) = 0.96
		_SunBloom( "Sun Bloom ", Range( 0.001, 1 ) ) = 0.1
		_SunBloomBehindClouds( "Sun Bloom Behind Clouds", Range( 0, 1 ) ) = 0.01
		_SunBloomNearEquator( "Sun Bloom Near Equator", Range( 0, 1 ) ) = 0.9
		_SunEquatorFadeEnd( "Sun Equator Fade End", Range( 0, 1 ) ) = 0.01
		[Toggle( _MOON_ON )] _Moon( "Moon", Float ) = 0
		[SingleLineTexture] _MoonAlbedo( "Moon Albedo", 2D ) = "white" {}
		[HDR] _MoonColor( "Moon Color", Color ) = ( 1, 1, 1 )
		_MoonSize( "Moon Size", Range( 0.0001, 1 ) ) = 0.2
		_MoonPhase( "Moon Phase", Range( 0, 1 ) ) = 0
		_MoonPhaseRotation( "Moon Phase Rotation", Range( 0, 360 ) ) = 0
		_MoonOpacity( "Moon Opacity", Range( 0, 1 ) ) = 1
		_MoonEquatorFadeEnd( "Moon Equator Fade End", Range( 0, 1 ) ) = 0.015
		[Toggle( _STARS_ON )] _Stars( "Stars", Float ) = 0
		[HDR] _StarsColor( "Stars Color", Color ) = ( 1, 1, 1 )
		_StarsOpacity( "Stars Opacity", Range( 0, 1 ) ) = 0.8
		_StarsHorizonFadeMin( "Stars Horizon Fade Min", Range( 0, 1 ) ) = 0
		_StarsHorizonFadeMax( "Stars Horizon Fade Max", Range( 0, 1 ) ) = 0.15
		_StarsRotationX( "Stars Rotation X", Range( 0, 360 ) ) = 0
		_StarsRotationY( "Stars Rotation Y", Range( 0, 360 ) ) = 0
		[SingleLineTexture] _StarsCubemap( "Stars Cubemap", CUBE ) = "white" {}
		[Toggle( _CLOUDS_ON )] _Clouds( "Clouds", Float ) = 1
		[HDR] _CloudsColor( "Clouds Color", Color ) = ( 0.8941177, 0.9686275, 1 )
		_CloudsOpacity( "Clouds Opacity", Range( 0, 1 ) ) = 0.3
		_CloudsCoverage( "Clouds Coverage", Range( 0, 1 ) ) = 0.4
		_CloudsSharpnessMin( "Clouds Sharpness Min", Range( 0, 1 ) ) = 0.45
		_CloudsSharpnessMax( "Clouds Sharpness Max", Range( 0, 1 ) ) = 0.85
		_CloudsHorizonFadeScale( "Clouds Horizon Fade Scale", Range( 0, 1 ) ) = 0.8
		_CloudsHorizonFadeHeight( "Clouds Horizon Fade Height", Range( 0, 1 ) ) = 0.1
		[KeywordEnum( Two,Three )] _CloudLayers( "Cloud Layers", Float ) = 0
		[SingleLineTexture] _CL1NoiseTexture( "CL1 Noise Texture", 2D ) = "white" {}
		_CL1SphericalUVs( "CL1 Spherical UVs", Range( 0, 1 ) ) = 0.15
		_CL1Opacity( "CL1 Opacity", Range( 0, 1 ) ) = 1
		_CL1Speed( "CL1 Speed", Range( 0, 1 ) ) = 0.2
		[Toggle] _CL1Sharpness( "CL1 Sharpness", Float ) = 0
		_CL1SharpMin( "CL1 Sharp Min", Range( 0, 1 ) ) = 0
		_CL1SharpMax( "CL1 Sharp Max", Range( 0, 1 ) ) = 1
		_CL1RemapMin( "CL1 Remap Min", Range( -1, 1 ) ) = 0
		_CL1RemapMax( "CL1 Remap Max", Range( -1, 1 ) ) = 1
		_CL1Scale( "CL1 Scale", Range( 0, 1 ) ) = 0.2
		_CL1RotationAngle( "CL1 Rotation Angle", Range( 0, 360 ) ) = 0
		_CL1TilingOffset( "CL1 Tiling & Offset", Vector ) = ( 1, 1, 0.2, 0.1 )
		[SingleLineTexture] _CL2NoiseTexture( "CL2 Noise Texture", 2D ) = "white" {}
		_CL2SphericalUVs( "CL2 Spherical UVs", Range( 0, 1 ) ) = 0.1
		_CL2Opacity( "CL2 Opacity", Range( 0, 1 ) ) = 1
		_CL2Speed( "CL2 Speed", Range( 0, 1 ) ) = 0.1
		[Toggle] _CL2Sharpness( "CL2 Sharpness", Float ) = 0
		_CL2SharpMin( "CL2 Sharp Min", Range( 0, 1 ) ) = 0
		_CL2SharpMax( "CL2 Sharp Max", Range( 0, 1 ) ) = 1
		_CL2RemapMin( "CL2 Remap Min", Range( -1, 1 ) ) = 0
		_CL2RemapMax( "CL2 Remap Max", Range( -1, 1 ) ) = 1
		_CL2Scale( "CL2 Scale", Range( 0, 1 ) ) = 0.2
		_CL2RotationAngle( "CL2 Rotation Angle", Range( 0, 360 ) ) = 0
		_CL2TilingOffset( "CL2 Tiling & Offset", Vector ) = ( 1, 1, 0, 0 )
		[SingleLineTexture] _CL3NoiseTexture( "CL3 Noise Texture", 2D ) = "white" {}
		_CL3SphericalUVs( "CL3 Spherical UVs", Range( 0, 1 ) ) = 0.14
		_CL3Opacity( "CL3 Opacity", Range( 0, 1 ) ) = 1
		_CL3Speed( "CL3 Speed", Range( 0, 1 ) ) = 0.09
		[Toggle] _CL3Sharpness( "CL3 Sharpness", Float ) = 0
		_CL3SharpMin( "CL3 Sharp Min", Range( 0, 1 ) ) = 0
		_CL3SharpMax( "CL3 Sharp Max", Range( 0, 1 ) ) = 1
		_CL3RemapMin( "CL3 Remap Min", Range( -1, 1 ) ) = 0
		_CL3RemapMax( "CL3 Remap Max", Range( -1, 1 ) ) = 1
		_CL3Scale( "CL3 Scale", Range( 0, 1 ) ) = 0.2
		_CL3RotationAngle( "CL3 Rotation Angle", Range( 0, 360 ) ) = 0
		_CL3TilingOffset( "CL3 Tiling & Offset", Vector ) = ( 0.5, 0.5, 0, 0 )
		[Toggle( _FOG_ON )] _Fog( "Fog", Float ) = 0
		_FogOpacity( "Fog Opacity", Range( 0, 1 ) ) = 1
		_FogStartNH( "Fog Start NH", Range( 0, 1 ) ) = 0
		_FogEndNH( "Fog End NH", Range( 0, 1 ) ) = 0.3
		_FogStartSH( "Fog Start SH", Range( 0, 1 ) ) = 0.1
		_FogEndSH( "Fog End SH", Range( 0, 1 ) ) = 0.3

	}

	SubShader
	{
		

		Tags { "RenderType"="Opaque" }

	LOD 0

		

		Blend Off
		AlphaToMask Off
		Cull Back
		ColorMask RGBA
		ZWrite Off
		ZTest LEqual
		Offset 0 , 0
		

		CGINCLUDE
			#pragma target 3.5

			float4 ComputeClipSpacePosition( float2 screenPosNorm, float deviceDepth )
			{
				float4 positionCS = float4( screenPosNorm * 2.0 - 1.0, deviceDepth, 1.0 );
			#if UNITY_UV_STARTS_AT_TOP
				positionCS.y = -positionCS.y;
			#endif
				return positionCS;
			}
		ENDCG

		
		Pass
		{
			Name "Unlit"

			CGPROGRAM
				#define ASE_VERSION 19901

				#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
					#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
				#endif
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_instancing
				#include "UnityCG.cginc"

				#include "Lighting.cginc"
				#include "AutoLight.cginc"
				#include "UnityStandardBRDF.cginc"
				#include "UnityShaderVariables.cginc"
				#pragma shader_feature_local _DEBUG_ON
				#pragma shader_feature _FOG_ON
				#pragma shader_feature_local _MOON_ON
				#pragma shader_feature_local _STARS_ON
				#pragma shader_feature_local _CLOUDS_ON
				#pragma shader_feature_local _CLOUDLAYERS_TWO _CLOUDLAYERS_THREE
				#pragma shader_feature_local _SUN_ON


				struct appdata
				{
					float4 vertex : POSITION;
					
					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct v2f
				{
					float4 pos : SV_POSITION;
					float4 ase_texcoord : TEXCOORD0;
					UNITY_VERTEX_INPUT_INSTANCE_ID
					UNITY_VERTEX_OUTPUT_STEREO
				};

				uniform float3 _ZenithColor;
				uniform float3 _GroundColor;
				uniform float3 _HorizonColor;
				uniform float _ZenithPower;
				uniform float _GroundPower;
				uniform float _HorizonScale;
				uniform float3 _EquatorColor;
				uniform float _EquatorPower;
				uniform float _EquatorMinRadius;
				uniform float _EquatorMaxRadius;
				uniform float _EquatorOpacity;
				uniform float _EquatorOpacityAtNoon;
				uniform float3 _StarsColor;
				uniform samplerCUBE _StarsCubemap;
				uniform float _StarsRotationY;
				uniform float _StarsRotationX;
				uniform float3 Nicrom_SunRotationAxis;
				uniform float Nicrom_SunRotationAngle;
				uniform float _StarsOpacity;
				uniform float _StarsHorizonFadeMin;
				uniform float _StarsHorizonFadeMax;
				uniform float3 Nicrom_Skybox_MoonDir;
				uniform float _MoonSize;
				uniform float3 _MoonColor;
				uniform sampler2D _MoonAlbedo;
				uniform float _MoonPhaseRotation;
				uniform float _MoonPhase;
				uniform float _MoonOpacity;
				uniform float _MoonEquatorFadeEnd;
				uniform float3 _CloudsColor;
				uniform float _CloudsHorizonFadeHeight;
				uniform float _CloudsHorizonFadeScale;
				uniform float _CloudsSharpnessMin;
				uniform float _CloudsSharpnessMax;
				uniform sampler2D _CL1NoiseTexture;
				uniform float2 Nicrom_Skybox_CL1_DirVector;
				uniform float2 Nicrom_Clouds_UVOffset1;
				uniform half Nicrom_ApplicationIsPlaying;
				uniform float _CL1Speed;
				uniform float Nicrom_Skybox_CL1_SpeedScale;
				uniform float4 _CL1TilingOffset;
				uniform float _CL1SphericalUVs;
				uniform float _CL1Scale;
				uniform float _CL1RotationAngle;
				uniform float _CL1SharpMin;
				uniform float _CL1SharpMax;
				uniform float _CL1Sharpness;
				uniform float _CL1RemapMin;
				uniform float _CL1RemapMax;
				uniform float _CL1Opacity;
				uniform sampler2D _CL2NoiseTexture;
				uniform float2 Nicrom_Skybox_CL2_DirVector;
				uniform float2 Nicrom_Clouds_UVOffset2;
				uniform float _CL2Speed;
				uniform float Nicrom_Skybox_CL2_SpeedScale;
				uniform float4 _CL2TilingOffset;
				uniform float _CL2SphericalUVs;
				uniform float _CL2Scale;
				uniform float _CL2RotationAngle;
				uniform float _CL2SharpMin;
				uniform float _CL2SharpMax;
				uniform float _CL2Sharpness;
				uniform float _CL2RemapMin;
				uniform float _CL2RemapMax;
				uniform float _CL2Opacity;
				uniform sampler2D _CL3NoiseTexture;
				uniform float2 Nicrom_Skybox_CL3_DirVector;
				uniform float2 Nicrom_Clouds_UVOffset3;
				uniform float _CL3Speed;
				uniform float Nicrom_Skybox_CL3_SpeedScale;
				uniform float4 _CL3TilingOffset;
				uniform float _CL3SphericalUVs;
				uniform float _CL3Scale;
				uniform float _CL3RotationAngle;
				uniform float _CL3SharpMin;
				uniform float _CL3SharpMax;
				uniform float _CL3Sharpness;
				uniform float _CL3RemapMin;
				uniform float _CL3RemapMax;
				uniform float _CL3Opacity;
				uniform float _CloudsCoverage;
				uniform float _CloudsOpacity;
				uniform float _SunBloomNearEquator;
				uniform float _SunBloomBehindClouds;
				uniform float _SunSize;
				uniform float _SunSharpness;
				uniform float _SunEquatorFadeEnd;
				uniform float _SunBloom;
				uniform float3 _SunColor;
				uniform float _FogStartNH;
				uniform float _FogEndNH;
				uniform float _FogStartSH;
				uniform float _FogEndSH;
				uniform half _FogOpacity;
				uniform float _Debug3;
				uniform float _Debug2;
				uniform float _Debug1;


				//This is a late directive
				
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
				
				float4 Debug1395_g103( float Debug_Target, float4 Albedo, float SunDiskMask1, float SunDiskMask2, float4 StarsCubemap, float4 StarsMask, float4 MoonColor, float MoonMask )
				{
					if(Debug_Target ==0)
					    return Albedo;
					else if(Debug_Target ==1)
					    return SunDiskMask1;
					else if(Debug_Target ==2)
					    return SunDiskMask2;
					else if(Debug_Target ==3)
					    return StarsCubemap;
					else if (Debug_Target ==4)
					    return StarsMask;
					else if (Debug_Target ==5)
					    return MoonColor;
					else
					    return MoonMask;
				}
				
				float4 Debug2640_g103( float Debug_Target, float4 Albedo, float EquatorFinalMask, float EquatorSunMask, float EquatorBaseMask, float EquatorGlowScale, float FogMask )
				{
					if(Debug_Target ==0)
					    return Albedo;
					else if(Debug_Target ==1)
					    return EquatorFinalMask;
					else if (Debug_Target ==2)
					    return EquatorSunMask;
					else  if (Debug_Target ==3)
					    return EquatorBaseMask;
					else  if (Debug_Target ==4)
					    return EquatorGlowScale;
					else
					    return FogMask;
				}
				
				float4 Debug3601_g103( float Debug_Target, float4 Albedo, float CloudsMask, float CloudLayer1, float CloudLayer2, float CloudLayer3 )
				{
					if(Debug_Target ==0)
					    return Albedo;
					else if(Debug_Target ==1)
					    return CloudsMask;
					else if (Debug_Target ==2)
					    return CloudLayer1;
					else if (Debug_Target ==3)
					    return CloudLayer2;
					else
					    return CloudLayer3;
				}
				

				v2f vert ( appdata v )
				{
					v2f o;
					UNITY_SETUP_INSTANCE_ID( v );
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
					UNITY_TRANSFER_INSTANCE_ID( v, o );

					float3 ase_positionWS = mul( unity_ObjectToWorld, float4( ( v.vertex ).xyz, 1 ) ).xyz;
					o.ase_texcoord.xyz = ase_positionWS;
					
					
					//setting value to unused interpolator channels and avoid initialization warnings
					o.ase_texcoord.w = 0;

					float3 vertexValue = float3( 0, 0, 0 );
					#if ASE_ABSOLUTE_VERTEX_POS
						vertexValue = v.vertex.xyz;
					#endif
					vertexValue = vertexValue;
					#if ASE_ABSOLUTE_VERTEX_POS
						v.vertex.xyz = vertexValue;
					#else
						v.vertex.xyz += vertexValue;
					#endif

					o.pos = UnityObjectToClipPos( v.vertex );
					return o;
				}

				half4 frag( v2f IN  ) : SV_Target
				{
					UNITY_SETUP_INSTANCE_ID( IN );
					UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );
					half4 finalColor;

					float4 ScreenPosNorm = float4( IN.pos.xy * ( _ScreenParams.zw - 1.0 ), IN.pos.zw );
					float4 ClipPos = ComputeClipSpacePosition( ScreenPosNorm.xy, IN.pos.z ) * IN.pos.w;
					float4 ScreenPos = ComputeScreenPos( ClipPos );

					float3 ZenithColor_MP84_g104 = _ZenithColor;
					float3 Ground_Color110_g104 = _GroundColor;
					float3 ase_positionWS = IN.ase_texcoord.xyz;
					float3 normalizeResult409_g103 = normalize( ase_positionWS );
					float3 WP_Normalized1410_g103 = normalizeResult409_g103;
					float PolesMask595_g103 = step( (WP_Normalized1410_g103).y , 0.0 );
					float PoleMask_SkyColor123_g104 = PolesMask595_g103;
					float3 lerpResult115_g104 = lerp( ZenithColor_MP84_g104 , Ground_Color110_g104 , PoleMask_SkyColor123_g104);
					float3 HorizonColor_MP82_g104 = _HorizonColor;
					float3 Normalized_WP_Sky112_g104 = WP_Normalized1410_g103;
					float dotResult71_g104 = dot( Normalized_WP_Sky112_g104 , float3( 0,1,0 ) );
					float ZenithPower_MP91_g104 = _ZenithPower;
					float GroundPower_MP127_g104 = _GroundPower;
					float lerpResult125_g104 = lerp( ZenithPower_MP91_g104 , GroundPower_MP127_g104 , PoleMask_SkyColor123_g104);
					float HorizonScale_MP92_g104 = _HorizonScale;
					float3 lerpResult78_g104 = lerp( lerpResult115_g104 , HorizonColor_MP82_g104 , saturate( ( pow( ( 1.0 - abs( dotResult71_g104 ) ) , ( lerpResult125_g104 * 100.0 ) ) * ( HorizonScale_MP92_g104 * 10.0 ) ) ));
					float3 SkyGradient331_g103 = lerpResult78_g104;
					float3 EquatorColor312_g103 = _EquatorColor;
					float dotResult56_g104 = dot( Normalized_WP_Sky112_g104 , float3( 0,1,0 ) );
					float EquatorPower_MP14_g104 = _EquatorPower;
					float temp_output_61_0_g104 = saturate( pow( ( 1.0 - abs( dotResult56_g104 ) ) , ( EquatorPower_MP14_g104 * 100.0 ) ) );
					float EquatorBaseMask103_g104 = temp_output_61_0_g104;
					float3 worldSpaceLightDir = Unity_SafeNormalize( UnityWorldSpaceLightDir( ase_positionWS ) );
					float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - ase_positionWS );
					float3 ase_viewDirWS = normalize( ase_viewVectorWS );
					float dotResult40_g104 = dot( -worldSpaceLightDir , ase_viewDirWS );
					float EquatorMinRadius_MP13_g104 = _EquatorMinRadius;
					float temp_output_135_0_g104 = ( EquatorMinRadius_MP13_g104 * 10.0 );
					float EquatorMaxRadius_MP25_g104 = _EquatorMaxRadius;
					float temp_output_137_0_g104 = ( 10.0 * EquatorMaxRadius_MP25_g104 );
					float temp_output_35_0_g104 = min( temp_output_135_0_g104 , temp_output_137_0_g104 );
					float temp_output_34_0_g104 = max( temp_output_135_0_g104 , temp_output_137_0_g104 );
					float clampResult47_g104 = clamp(  (0.0 + ( dotResult40_g104 - ( 1.0 - ( temp_output_35_0_g104 * temp_output_35_0_g104 ) ) ) * ( 1.0 - 0.0 ) / ( ( 1.0 - ( temp_output_34_0_g104 * temp_output_34_0_g104 ) ) - ( 1.0 - ( temp_output_35_0_g104 * temp_output_35_0_g104 ) ) ) ) , 0.0 , 1.0 );
					float EquatorOpacityAtSunset_MP10_g104 = _EquatorOpacity;
					float dotResult46_g104 = dot( worldSpaceLightDir , float3( 0,-1,0 ) );
					float clampResult48_g104 = clamp( dotResult46_g104 , 0.0 , 1.0 );
					float temp_output_53_0_g104 = saturate( ( pow( ( 1.0 - clampResult47_g104 ) , 5.0 ) * EquatorOpacityAtSunset_MP10_g104 * ( 1.0 - clampResult48_g104 ) ) );
					float EquatorSunMask102_g104 = temp_output_53_0_g104;
					float dotResult148_g104 = dot( worldSpaceLightDir , float3( 0,1,0 ) );
					float EquatorOpacityAtNoon_MP145_g104 = _EquatorOpacityAtNoon;
					float temp_output_154_0_g104 =  (EquatorOpacityAtNoon_MP145_g104 + ( saturate( pow( ( 1.0 - abs( dotResult148_g104 ) ) , 4.14 ) ) - 0.0 ) * ( 1.0 - EquatorOpacityAtNoon_MP145_g104 ) / ( 1.0 - 0.0 ) );
					float EquatorGlowScale156_g104 = temp_output_154_0_g104;
					float EquatorFinalMask_Skybox314_g103 = saturate( ( EquatorBaseMask103_g104 * EquatorSunMask102_g104 * EquatorGlowScale156_g104 ) );
					float3 lerpResult343_g103 = lerp( SkyGradient331_g103 , EquatorColor312_g103 , EquatorFinalMask_Skybox314_g103);
					float3 StarsColor536_g103 = _StarsColor;
					float3 SunRotationAxis29_g124 = Nicrom_SunRotationAxis;
					float SunRotationAngle30_g124 = Nicrom_SunRotationAngle;
					float3 WP_Normalized_Stars33_g124 = WP_Normalized1410_g103;
					float3 rotatedValue26_g124 = RotateAroundAxis( float3( 0,0,0 ), WP_Normalized_Stars33_g124, SunRotationAxis29_g124, radians( SunRotationAngle30_g124 ) );
					float3 rotatedValue40_g124 = RotateAroundAxis( float3( 0,0,0 ), rotatedValue26_g124, float3( 0,1,0 ), radians( _StarsRotationX ) );
					float3 rotatedValue45_g124 = RotateAroundAxis( float3( 0,0,0 ), rotatedValue40_g124, float3( 1,0,0 ), radians( _StarsRotationY ) );
					float4 texCUBENode27_g124 = texCUBE( _StarsCubemap, rotatedValue45_g124 );
					float3 StarsCubemap31_g124 = texCUBENode27_g124.rgb;
					float StarsOpacity28_g124 = _StarsOpacity;
					float3 lerpResult17_g124 = lerp( float3( 0,0,0 ) , StarsCubemap31_g124 , StarsOpacity28_g124);
					float StarsHorizonFadeMin7_g124 = _StarsHorizonFadeMin;
					float StarsHorizonFadeMax9_g124 = _StarsHorizonFadeMax;
					float smoothstepResult15_g124 = smoothstep( StarsHorizonFadeMin7_g124 , StarsHorizonFadeMax9_g124 , (WP_Normalized_Stars33_g124).y);
					float3 lerpResult21_g124 = lerp( float3( 0,0,0 ) , lerpResult17_g124 , smoothstepResult15_g124);
					float3 StarsMask407_g103 = lerpResult21_g124;
					float3 MoonDir_GP160_g123 = Nicrom_Skybox_MoonDir;
					float3 normalizeResult92_g123 = normalize( cross( MoonDir_GP160_g123 , float3( 0,-1,0 ) ) );
					float dotResult89_g123 = dot( MoonDir_GP160_g123 , float3( 0,-1,0 ) );
					float3 Moon_WP_Normalized5_g123 = WP_Normalized1410_g103;
					float3 rotatedValue93_g123 = RotateAroundAxis( float3( 0,0,0 ), Moon_WP_Normalized5_g123, normalizeResult92_g123, acos( dotResult89_g123 ) );
					float2 Moon_UVs194_g123 = (rotatedValue93_g123).xz;
					float MoonSize31_g123 = _MoonSize;
					float smoothstepResult29_g123 = smoothstep( 0.001 , 0.0 , ( length( Moon_UVs194_g123 ) - MoonSize31_g123 ));
					float MoonMask1105_g123 = step( 0.0 , (rotatedValue93_g123).y );
					float Moon_StarsMask685_g103 = ( smoothstepResult29_g123 * MoonMask1105_g123 );
					float3 lerpResult682_g103 = lerp( StarsMask407_g103 , float3( 0,0,0 ) , Moon_StarsMask685_g103);
					#ifdef _MOON_ON
					float3 staticSwitch696_g103 = lerpResult682_g103;
					#else
					float3 staticSwitch696_g103 = StarsMask407_g103;
					#endif
					float3 lerpResult392_g103 = lerp( lerpResult343_g103 , StarsColor536_g103 , staticSwitch696_g103);
					#ifdef _STARS_ON
					float3 staticSwitch394_g103 = lerpResult392_g103;
					#else
					float3 staticSwitch394_g103 = lerpResult343_g103;
					#endif
					float3 MoonColor170_g123 = _MoonColor;
					float2 Moon_UVs2162_g123 = ( Moon_UVs194_g123 / MoonSize31_g123 );
					float4 MoonColor673_g103 = ( float4( MoonColor170_g123 , 0.0 ) * tex2D( _MoonAlbedo, ( ( Moon_UVs2162_g123 / float2( 2.03,2.03 ) ) + float2( 0.5,0.5 ) ) ) );
					float3 appendResult146_g123 = (float3(Moon_UVs2162_g123 , pow( saturate( ( 1.0 - length( Moon_UVs2162_g123 ) ) ) , 0.5 )));
					float3 normalizeResult147_g123 = normalize( appendResult146_g123 );
					float MoonPhaseRotation166_g123 = _MoonPhaseRotation;
					float temp_output_153_0_g123 = radians( MoonPhaseRotation166_g123 );
					float3 appendResult156_g123 = (float3(cos( temp_output_153_0_g123 ) , sin( temp_output_153_0_g123 ) , 0.0));
					float MoonPhase168_g123 = _MoonPhase;
					float3 rotatedValue43_g123 = RotateAroundAxis( float3( 0,0,0 ), float3( 0,0,1 ), normalize( appendResult156_g123 ), ( MoonPhase168_g123 * 6.28318548202515 ) );
					float dotResult141_g123 = dot( normalizeResult147_g123 , rotatedValue43_g123 );
					float MoonOpacity174_g123 = _MoonOpacity;
					float lerpResult118_g123 = lerp( 0.0 , ( smoothstepResult29_g123 * saturate( dotResult141_g123 ) ) , MoonOpacity174_g123);
					float MoonEquatorFade176_g123 = _MoonEquatorFadeEnd;
					float smoothstepResult127_g123 = smoothstep( 0.0 , MoonEquatorFade176_g123 , (Moon_WP_Normalized5_g123).y);
					float Moon_SkyMask676_g103 = ( ( lerpResult118_g123 * MoonMask1105_g123 ) * smoothstepResult127_g123 );
					float4 lerpResult677_g103 = lerp( float4( staticSwitch394_g103 , 0.0 ) , MoonColor673_g103 , Moon_SkyMask676_g103);
					#ifdef _MOON_ON
					float4 staticSwitch695_g103 = lerpResult677_g103;
					#else
					float4 staticSwitch695_g103 = float4( staticSwitch394_g103 , 0.0 );
					#endif
					float3 CloudsColor_MP330_g103 = _CloudsColor;
					float3 temp_output_268_0_g105 = WP_Normalized1410_g103;
					float3 WP_Normalized142_g105 = temp_output_268_0_g105;
					float CloudsHorizonFadeHeight46_g105 = _CloudsHorizonFadeHeight;
					float CloudsHorizonFadeScale45_g105 = _CloudsHorizonFadeScale;
					float CloudsHorizonFadeMask139_g105 = saturate( ( ( (WP_Normalized142_g105).y - CloudsHorizonFadeHeight46_g105 ) * ( ( 1.0 - CloudsHorizonFadeScale45_g105 ) * 10.0 ) ) );
					float CloudsSharpnessMin56_g105 = _CloudsSharpnessMin;
					float CloudsSharpnessMax55_g105 = _CloudsSharpnessMax;
					float2 CL1_DirVector_GV414_g105 = Nicrom_Skybox_CL1_DirVector;
					float2 CL1_UVOffset_GV11_g105 = Nicrom_Clouds_UVOffset1;
					float ApplicationIsPlaying429_g105 = Nicrom_ApplicationIsPlaying;
					float2 lerpResult427_g105 = lerp( ( _Time.y * CL1_DirVector_GV414_g105 ) , CL1_UVOffset_GV11_g105 , ApplicationIsPlaying429_g105);
					float CL1_Speed37_g105 = _CL1Speed;
					float CL1_SpeedScale_GV420_g105 = Nicrom_Skybox_CL1_SpeedScale;
					float lerpResult447_g105 = lerp( CL1_SpeedScale_GV420_g105 , 1.0 , ApplicationIsPlaying429_g105);
					float2 WP_Normalized_XZ178_g105 = (temp_output_268_0_g105).xz;
					float2 appendResult35_g105 = (float2(_CL1TilingOffset.x , _CL1TilingOffset.y));
					float2 CL1_Tiling_MP40_g105 = appendResult35_g105;
					float WP_Normalized_Y179_g105 = (temp_output_268_0_g105).y;
					float CL1_HorizonBend185_g105 = _CL1SphericalUVs;
					float CL1_Scale31_g105 = _CL1Scale;
					float2 appendResult39_g105 = (float2(_CL1TilingOffset.z , _CL1TilingOffset.w));
					float2 CL1_Offset_MP43_g105 = appendResult39_g105;
					float2 Cloud1UVs141_g105 = ( ( lerpResult427_g105 * ( CL1_Speed37_g105 * 0.1 * lerpResult447_g105 ) ) + ( ( WP_Normalized_XZ178_g105 / CL1_Tiling_MP40_g105 ) / ( ( WP_Normalized_Y179_g105 + CL1_HorizonBend185_g105 ) / CL1_Scale31_g105 ) ) + CL1_Offset_MP43_g105 );
					float CL1_RotationAngle307_g105 = _CL1RotationAngle;
					float cos303_g105 = cos( radians( CL1_RotationAngle307_g105 ) );
					float sin303_g105 = sin( radians( CL1_RotationAngle307_g105 ) );
					float2 rotator303_g105 = mul( Cloud1UVs141_g105 - float2( 0,0 ) , float2x2( cos303_g105 , -sin303_g105 , sin303_g105 , cos303_g105 )) + float2( 0,0 );
					float CL1_Noise_Tex377_g105 = tex2D( _CL1NoiseTexture, rotator303_g105 ).r;
					float CL1_SharpMin227_g105 = _CL1SharpMin;
					float CL1_SharpMax229_g105 = _CL1SharpMax;
					float smoothstepResult247_g105 = smoothstep( CL1_SharpMin227_g105 , CL1_SharpMax229_g105 , CL1_Noise_Tex377_g105);
					float CL1_Sharpness372_g105 = _CL1Sharpness;
					float lerpResult407_g105 = lerp( CL1_Noise_Tex377_g105 , smoothstepResult247_g105 , CL1_Sharpness372_g105);
					float CL1_RemapMin362_g105 = _CL1RemapMin;
					float CL1_RemapMax361_g105 = _CL1RemapMax;
					float CL1_Opacity225_g105 = _CL1Opacity;
					float PolesMask_Clouds289_g105 = ( 1.0 - PolesMask595_g103 );
					float temp_output_282_0_g105 = (  (CL1_RemapMin362_g105 + ( lerpResult407_g105 - 0.0 ) * ( CL1_RemapMax361_g105 - CL1_RemapMin362_g105 ) / ( 1.0 - 0.0 ) ) * CL1_Opacity225_g105 * PolesMask_Clouds289_g105 );
					float CL1_Noise244_g105 = temp_output_282_0_g105;
					float2 CL2_DirVector_GV417_g105 = Nicrom_Skybox_CL2_DirVector;
					float2 CL2_UVOffset_GV12_g105 = Nicrom_Clouds_UVOffset2;
					float2 lerpResult436_g105 = lerp( ( _Time.y * CL2_DirVector_GV417_g105 ) , CL2_UVOffset_GV12_g105 , ApplicationIsPlaying429_g105);
					float CL2_Speed38_g105 = _CL2Speed;
					float CL2_SpeedScale_GV423_g105 = Nicrom_Skybox_CL2_SpeedScale;
					float lerpResult449_g105 = lerp( CL2_SpeedScale_GV423_g105 , 1.0 , ApplicationIsPlaying429_g105);
					float2 appendResult36_g105 = (float2(_CL2TilingOffset.x , _CL2TilingOffset.y));
					float2 CL2_Tiling_MP41_g105 = appendResult36_g105;
					float CL2_HorizonBend203_g105 = _CL2SphericalUVs;
					float CL2_Scale_MP32_g105 = _CL2Scale;
					float2 appendResult42_g105 = (float2(_CL2TilingOffset.z , _CL2TilingOffset.w));
					float2 CL2_Offset_MP44_g105 = appendResult42_g105;
					float2 Cloud2UVs130_g105 = ( ( lerpResult436_g105 * ( CL2_Speed38_g105 * 0.1 * lerpResult449_g105 ) ) + ( ( WP_Normalized_XZ178_g105 / CL2_Tiling_MP41_g105 ) / ( ( WP_Normalized_Y179_g105 + CL2_HorizonBend203_g105 ) / CL2_Scale_MP32_g105 ) ) + CL2_Offset_MP44_g105 );
					float CL2_RotationAngle308_g105 = _CL2RotationAngle;
					float cos315_g105 = cos( radians( CL2_RotationAngle308_g105 ) );
					float sin315_g105 = sin( radians( CL2_RotationAngle308_g105 ) );
					float2 rotator315_g105 = mul( Cloud2UVs130_g105 - float2( 0,0 ) , float2x2( cos315_g105 , -sin315_g105 , sin315_g105 , cos315_g105 )) + float2( 0,0 );
					float CL2_Noise_Tex378_g105 = tex2D( _CL2NoiseTexture, rotator315_g105 ).r;
					float CL2_SharpMin234_g105 = _CL2SharpMin;
					float CL2_SharpMax236_g105 = _CL2SharpMax;
					float smoothstepResult252_g105 = smoothstep( CL2_SharpMin234_g105 , CL2_SharpMax236_g105 , CL2_Noise_Tex378_g105);
					float CL2_Sharpness374_g105 = _CL2Sharpness;
					float lerpResult409_g105 = lerp( CL2_Noise_Tex378_g105 , smoothstepResult252_g105 , CL2_Sharpness374_g105);
					float CL2_RemapMin364_g105 = _CL2RemapMin;
					float CL2_RemapMax366_g105 = _CL2RemapMax;
					float CL2_Opacity232_g105 = _CL2Opacity;
					float temp_output_283_0_g105 = (  (CL2_RemapMin364_g105 + ( lerpResult409_g105 - 0.0 ) * ( CL2_RemapMax366_g105 - CL2_RemapMin364_g105 ) / ( 1.0 - 0.0 ) ) * CL2_Opacity232_g105 * PolesMask_Clouds289_g105 );
					float CL2_Noise245_g105 = temp_output_283_0_g105;
					float CloudsMask_2L349_g105 = ( ( CL1_Noise244_g105 + CL2_Noise245_g105 ) / 2.0 );
					float2 CL3_DirVector_GV418_g105 = Nicrom_Skybox_CL3_DirVector;
					float2 CL3_UVOffset_GV13_g105 = Nicrom_Clouds_UVOffset3;
					float2 lerpResult444_g105 = lerp( ( _Time.y * CL3_DirVector_GV418_g105 ) , CL3_UVOffset_GV13_g105 , ApplicationIsPlaying429_g105);
					float CL3_Speed18_g105 = _CL3Speed;
					float CL3_SpeedScale_GV424_g105 = Nicrom_Skybox_CL3_SpeedScale;
					float lerpResult451_g105 = lerp( CL3_SpeedScale_GV424_g105 , 1.0 , ApplicationIsPlaying429_g105);
					float2 appendResult17_g105 = (float2(_CL3TilingOffset.x , _CL3TilingOffset.y));
					float2 CL3_Tiling_MP20_g105 = appendResult17_g105;
					float CL3_HorizonBend205_g105 = _CL3SphericalUVs;
					float CL3_Scale_MP15_g105 = _CL3Scale;
					float2 appendResult19_g105 = (float2(_CL3TilingOffset.z , _CL3TilingOffset.w));
					float2 CL3_Offset_MP21_g105 = appendResult19_g105;
					float2 Cloud3_UVs131_g105 = ( ( lerpResult444_g105 * ( CL3_Speed18_g105 * 0.1 * lerpResult451_g105 ) ) + ( ( WP_Normalized_XZ178_g105 / CL3_Tiling_MP20_g105 ) / ( ( WP_Normalized_Y179_g105 + CL3_HorizonBend205_g105 ) / CL3_Scale_MP15_g105 ) ) + CL3_Offset_MP21_g105 );
					float CL3_RotationAngle311_g105 = _CL3RotationAngle;
					float cos318_g105 = cos( radians( CL3_RotationAngle311_g105 ) );
					float sin318_g105 = sin( radians( CL3_RotationAngle311_g105 ) );
					float2 rotator318_g105 = mul( Cloud3_UVs131_g105 - float2( 0,0 ) , float2x2( cos318_g105 , -sin318_g105 , sin318_g105 , cos318_g105 )) + float2( 0,0 );
					float CL3_Noise_Tex379_g105 = tex2D( _CL3NoiseTexture, rotator318_g105 ).r;
					float CL3_SharpMin241_g105 = _CL3SharpMin;
					float CL3_SharpMax243_g105 = _CL3SharpMax;
					float smoothstepResult255_g105 = smoothstep( CL3_SharpMin241_g105 , CL3_SharpMax243_g105 , CL3_Noise_Tex379_g105);
					float CL3_Sharpness376_g105 = _CL3Sharpness;
					float lerpResult412_g105 = lerp( CL3_Noise_Tex379_g105 , smoothstepResult255_g105 , CL3_Sharpness376_g105);
					float CL3_RemapMin368_g105 = _CL3RemapMin;
					float CL3_RemapMax370_g105 = _CL3RemapMax;
					float CL3_Opacity239_g105 = _CL3Opacity;
					#if defined( _CLOUDLAYERS_TWO )
					float staticSwitch279_g105 = 0.0;
					#elif defined( _CLOUDLAYERS_THREE )
					float staticSwitch279_g105 = (  (CL3_RemapMin368_g105 + ( lerpResult412_g105 - 0.0 ) * ( CL3_RemapMax370_g105 - CL3_RemapMin368_g105 ) / ( 1.0 - 0.0 ) ) * CL3_Opacity239_g105 * PolesMask_Clouds289_g105 );
					#else
					float staticSwitch279_g105 = 0.0;
					#endif
					float CL3_Noise246_g105 = staticSwitch279_g105;
					float CloudsMask_3L350_g105 = ( ( CL1_Noise244_g105 + CL2_Noise245_g105 + CL3_Noise246_g105 ) / 3.0 );
					#if defined( _CLOUDLAYERS_TWO )
					float staticSwitch269_g105 = CloudsMask_2L349_g105;
					#elif defined( _CLOUDLAYERS_THREE )
					float staticSwitch269_g105 = CloudsMask_3L350_g105;
					#else
					float staticSwitch269_g105 = CloudsMask_2L349_g105;
					#endif
					float CloudCoverage_MP49_g105 = ( 1.0 - _CloudsCoverage );
					float smoothstepResult85_g105 = smoothstep( CloudsSharpnessMin56_g105 , CloudsSharpnessMax55_g105 , ( staticSwitch269_g105 +  (-1.0 + ( ( 1.0 - CloudCoverage_MP49_g105 ) - 0.0 ) * ( 1.0 - -1.0 ) / ( 1.0 - 0.0 ) ) ));
					float CloudsOpacity_MP50_g105 = _CloudsOpacity;
					#ifdef _CLOUDS_ON
					float staticSwitch69_g105 = saturate( ( saturate( ( CloudsHorizonFadeMask139_g105 * smoothstepResult85_g105 ) ) * CloudsOpacity_MP50_g105 ) );
					#else
					float staticSwitch69_g105 = 0.0;
					#endif
					float CloudsMask_Final255_g103 = staticSwitch69_g105;
					float4 lerpResult339_g103 = lerp( staticSwitch695_g103 , float4( CloudsColor_MP330_g103 , 0.0 ) , CloudsMask_Final255_g103);
					float4 Sky550_g103 = lerpResult339_g103;
					float temp_output_2_0_g110 = EquatorFinalMask_Skybox314_g103;
					float temp_output_3_0_g110 = ( 1.0 - temp_output_2_0_g110 );
					float3 appendResult7_g110 = (float3(temp_output_3_0_g110 , temp_output_3_0_g110 , temp_output_3_0_g110));
					float SunBloomNearEquator_MP299_g103 = _SunBloomNearEquator;
					float3 temp_cast_4 = (( ( 1.0 - SunBloomNearEquator_MP299_g103 ) * 100.0 )).xxx;
					float SunBloomBehindClouds_MP28_g117 = _SunBloomBehindClouds;
					float SunDiskSize_MP23_g117 = _SunSize;
					float SunDiskSize50_g117 = ( 1.0 - ( SunDiskSize_MP23_g117 * 0.01 ) );
					float SunDiskSharpness_MP24_g117 = _SunSharpness;
					float temp_output_42_0_g117 = ( SunDiskSize50_g117 * ( 1.0 - ( 0.99 + ( 0.01 * SunDiskSharpness_MP24_g117 ) ) ) );
					float dotResult56_g117 = dot( -worldSpaceLightDir , ase_viewDirWS );
					float temp_output_44_0_g117 = saturate( dotResult56_g117 );
					float dotResult48_g117 = dot( temp_output_44_0_g117 , temp_output_44_0_g117 );
					float smoothstepResult49_g117 = smoothstep( ( SunDiskSize50_g117 - temp_output_42_0_g117 ) , ( temp_output_42_0_g117 + SunDiskSize50_g117 ) , dotResult48_g117);
					float3 normalizeResult69_g117 = normalize( ase_positionWS );
					float smoothstepResult67_g117 = smoothstep( 0.0 , _SunEquatorFadeEnd , (normalizeResult69_g117).y);
					float temp_output_59_0_g117 = saturate( ( smoothstepResult49_g117 * smoothstepResult67_g117 ) );
					float SunDiskMask58_g117 = temp_output_59_0_g117;
					#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
					float4 ase_lightColor = 0;
					#else //aselc
					float4 ase_lightColor = _LightColor0;
					#endif //aselc
					float temp_output_6_0_g117 = ( SunDiskMask58_g117 * ase_lightColor.a );
					float SunBloom_PM27_g117 = _SunBloom;
					float lerpResult18_g117 = lerp( ( ( SunBloomBehindClouds_MP28_g117 * 1000.0 ) * temp_output_6_0_g117 ) , ( temp_output_6_0_g117 * ( SunBloom_PM27_g117 * 1000.0 ) ) , ( 1.0 - CloudsMask_Final255_g103 ));
					float SunDiskMaskWithGlow323_g103 = ( lerpResult18_g117 * SunDiskMask58_g117 );
					float3 SunColor_MP320_g103 = _SunColor;
					#ifdef _SUN_ON
					float3 staticSwitch345_g103 = ( pow( ( ( EquatorColor312_g103 * temp_output_2_0_g110 ) + appendResult7_g110 ) , temp_cast_4 ) * ( SunDiskMaskWithGlow323_g103 * SunColor_MP320_g103 ) );
					#else
					float3 staticSwitch345_g103 = float3( 0,0,0 );
					#endif
					float3 Sun548_g103 = staticSwitch345_g103;
					float4 temp_output_346_0_g103 = ( Sky550_g103 + float4( Sun548_g103 , 0.0 ) );
					float FogStartNH15_g109 = _FogStartNH;
					float FogEndNH16_g109 = _FogEndNH;
					float3 WP_Normalized_Fog37_g109 = WP_Normalized1410_g103;
					float temp_output_21_0_g109 = abs( (WP_Normalized_Fog37_g109).y );
					float smoothstepResult18_g109 = smoothstep( FogStartNH15_g109 , FogEndNH16_g109 , temp_output_21_0_g109);
					float FogStartSH13_g109 = _FogStartSH;
					float FogEndSH14_g109 = _FogEndSH;
					float smoothstepResult24_g109 = smoothstep( FogStartSH13_g109 , FogEndSH14_g109 , temp_output_21_0_g109);
					float lerpResult30_g109 = lerp( smoothstepResult18_g109 , smoothstepResult24_g109 , step( (WP_Normalized_Fog37_g109).y , 0.0 ));
					float FogOpacity_MP3_g109 = _FogOpacity;
					float lerpResult32_g109 = lerp( 0.0 , ( 1.0 - lerpResult30_g109 ) , FogOpacity_MP3_g109);
					float FogMask338_g103 = lerpResult32_g109;
					float4 lerpResult349_g103 = lerp( temp_output_346_0_g103 , unity_FogColor , FogMask338_g103);
					#ifdef _FOG_ON
					float4 staticSwitch350_g103 = lerpResult349_g103;
					#else
					float4 staticSwitch350_g103 = temp_output_346_0_g103;
					#endif
					float4 Albedo545_g103 = staticSwitch350_g103;
					float Debug_Target601_g103 = _Debug3;
					float Debug_Target640_g103 = _Debug2;
					float Debug_Target395_g103 = _Debug1;
					float4 Albedo395_g103 = Albedo545_g103;
					float SunDiskMask247_g103 = temp_output_59_0_g117;
					#ifdef _SUN_ON
					float staticSwitch648_g103 = SunDiskMask247_g103;
					#else
					float staticSwitch648_g103 = 0.0;
					#endif
					float SunDiskMask1395_g103 = staticSwitch648_g103;
					#ifdef _SUN_ON
					float staticSwitch647_g103 = SunDiskMaskWithGlow323_g103;
					#else
					float staticSwitch647_g103 = 0.0;
					#endif
					float SunDiskMask2395_g103 = staticSwitch647_g103;
					float4 StarsCubemap369_g103 = texCUBENode27_g124;
					#ifdef _STARS_ON
					float4 staticSwitch653_g103 = StarsCubemap369_g103;
					#else
					float4 staticSwitch653_g103 = float4( 0,0,0,0 );
					#endif
					float4 StarsCubemap395_g103 = staticSwitch653_g103;
					float3 temp_cast_9 = (0.0).xxx;
					#ifdef _STARS_ON
					float3 staticSwitch654_g103 = StarsMask407_g103;
					#else
					float3 staticSwitch654_g103 = temp_cast_9;
					#endif
					float4 StarsMask395_g103 = float4( staticSwitch654_g103 , 0.0 );
					float4 MoonColor395_g103 = MoonColor673_g103;
					float MoonMask395_g103 = Moon_SkyMask676_g103;
					float4 localDebug1395_g103 = Debug1395_g103( Debug_Target395_g103 , Albedo395_g103 , SunDiskMask1395_g103 , SunDiskMask2395_g103 , StarsCubemap395_g103 , StarsMask395_g103 , MoonColor395_g103 , MoonMask395_g103 );
					float4 Debug1_Output603_g103 = localDebug1395_g103;
					float4 Albedo640_g103 = Debug1_Output603_g103;
					float EquatorFinalMask640_g103 = EquatorFinalMask_Skybox314_g103;
					float EquatorSunMask_Skybox622_g103 = temp_output_53_0_g104;
					float EquatorSunMask640_g103 = EquatorSunMask_Skybox622_g103;
					float EquatorBaseMask_Skybox639_g103 = temp_output_61_0_g104;
					float EquatorBaseMask640_g103 = EquatorBaseMask_Skybox639_g103;
					float EquatorGlowScale_Skybox660_g103 = temp_output_154_0_g104;
					float EquatorGlowScale640_g103 = EquatorGlowScale_Skybox660_g103;
					#ifdef _FOG_ON
					float staticSwitch712_g103 = FogMask338_g103;
					#else
					float staticSwitch712_g103 = 0.0;
					#endif
					float FogMask640_g103 = staticSwitch712_g103;
					float4 localDebug2640_g103 = Debug2640_g103( Debug_Target640_g103 , Albedo640_g103 , EquatorFinalMask640_g103 , EquatorSunMask640_g103 , EquatorBaseMask640_g103 , EquatorGlowScale640_g103 , FogMask640_g103 );
					float4 Debug2_Output644_g103 = localDebug2640_g103;
					float4 Albedo601_g103 = Debug2_Output644_g103;
					float CloudsMask601_g103 = CloudsMask_Final255_g103;
					#ifdef _CLOUDS_ON
					float staticSwitch357_g105 = temp_output_282_0_g105;
					#else
					float staticSwitch357_g105 = 0.0;
					#endif
					float CL1_Skybox568_g103 = staticSwitch357_g105;
					float CloudLayer1601_g103 = CL1_Skybox568_g103;
					#ifdef _CLOUDS_ON
					float staticSwitch355_g105 = temp_output_283_0_g105;
					#else
					float staticSwitch355_g105 = 0.0;
					#endif
					float CL2_Skybox569_g103 = staticSwitch355_g105;
					float CloudLayer2601_g103 = CL2_Skybox569_g103;
					#ifdef _CLOUDS_ON
					float staticSwitch353_g105 = staticSwitch279_g105;
					#else
					float staticSwitch353_g105 = 0.0;
					#endif
					float CL3_Skybox570_g103 = staticSwitch353_g105;
					float CloudLayer3601_g103 = CL3_Skybox570_g103;
					float4 localDebug3601_g103 = Debug3601_g103( Debug_Target601_g103 , Albedo601_g103 , CloudsMask601_g103 , CloudLayer1601_g103 , CloudLayer2601_g103 , CloudLayer3601_g103 );
					float4 Debug3_Output587_g103 = localDebug3601_g103;
					#ifdef _DEBUG_ON
					float4 staticSwitch588_g103 = Debug3_Output587_g103;
					#else
					float4 staticSwitch588_g103 = Albedo545_g103;
					#endif
					

					finalColor = staticSwitch588_g103;

					return finalColor;
				}
			ENDCG
		}
	}
	CustomEditor "Nicrom.CMI_Skybox"
	
	Fallback Off
}
/*ASEBEGIN
Version=19901
Node;AmplifyShaderEditor.FunctionNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;1623;5248,-1024;Inherit;False;Nicrom - Skybox;0;;103;7e0aa1151e6cbc24db69a0215c2cdbec;0;0;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode, AmplifyShaderEditor, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null;39;5568,-1024;Float;False;True;-1;2;Nicrom.CMI_Skybox;0;5;Nicrom/ASE/Skybox;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;False;True;0;1;False;;1;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;True;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;RenderType=Opaque=RenderType;True;3;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
WireConnection;39;0;1623;0
ASEEND*/
//CHKSM=D36A736CDF1A7387683E2469478B27667DEDC142