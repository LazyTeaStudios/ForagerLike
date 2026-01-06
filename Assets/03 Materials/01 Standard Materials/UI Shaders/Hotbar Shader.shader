Shader "Custom/SpriteRipple"
{
    Properties
    {
        [PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)

        _RippleStrength ("Ripple Strength (UV)", Range(0, 0.05)) = 0.01
        _RippleFrequency ("Ripple Frequency", Range(0.0, 50.0)) = 12.0
        _RippleSpeed ("Ripple Speed", Range(0.0, 10.0)) = 1.5
        _RippleDirection ("Ripple Direction (XY)", Vector) = (1,1,0,0)

        // Optional: animate ripple from a point (0-1 sprite UV space)
        _Center ("Ripple Center (UV)", Vector) = (0.5,0.5,0,0)
        _UseRadial ("Use Radial Ripples (0/1)", Range(0,1)) = 0
        _RadialWaves ("Radial Waves", Range(1,40)) = 10
    }

    SubShader
    {
        Tags
        {
            "Queue"="Transparent"
            "IgnoreProjector"="True"
            "RenderType"="Transparent"
            "PreviewType"="Plane"
            "CanUseSpriteAtlas"="True"
        }

        Cull Off
        Lighting Off
        ZWrite Off
        Blend One OneMinusSrcAlpha

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            sampler2D _MainTex;
            float4 _MainTex_ST;
            fixed4 _Color;

            float _RippleStrength;
            float _RippleFrequency;
            float _RippleSpeed;
            float4 _RippleDirection;

            float4 _Center;
            float _UseRadial;
            float _RadialWaves;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv     : TEXCOORD0;
                fixed4 color  : COLOR;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv     : TEXCOORD0;
                fixed4 color  : COLOR;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                o.color = v.color * _Color;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // Time
                float t = _Time.y * _RippleSpeed;

                // Normalize direction; avoid zero-length
                float2 dir = _RippleDirection.xy;
                dir = (dot(dir, dir) < 1e-5) ? float2(1, 0) : normalize(dir);

                float2 uv = i.uv;

                // Two ripple modes:
                // 1) Directional (default): sine along a direction
                // 2) Radial: concentric circles from _Center
                float wave;
                float2 offset;

                if (_UseRadial > 0.5)
                {
                    float2 toCenter = uv - _Center.xy;
                    float dist = length(toCenter);
                    // radial sine wave
                    wave = sin((dist * _RadialWaves * 6.2831853) - (t * _RippleFrequency));
                    // push outwards (or inwards) from center
                    float2 radialDir = (dist < 1e-5) ? float2(0,0) : (toCenter / dist);
                    offset = radialDir * wave * _RippleStrength;
                }
                else
                {
                    // directional sine wave sampled along dir
                    wave = sin((dot(uv, dir) * _RippleFrequency) + t);
                    // offset perpendicular to dir for a nicer “rippling” look
                    float2 perp = float2(-dir.y, dir.x);
                    offset = perp * wave * _RippleStrength;
                }

                fixed4 c = tex2D(_MainTex, uv + offset) * i.color;

                // Premultiply alpha handling (Sprite default style)
                c.rgb *= c.a;
                return c;
            }
            ENDCG
        }
    }
}
