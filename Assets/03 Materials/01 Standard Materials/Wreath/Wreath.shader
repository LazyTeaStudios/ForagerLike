Shader "UI/RadialFeatherBothEnds"
{
    Properties
    {
        [PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)

        _FillAmount ("Fill Amount", Range(0,1)) = 0.3333
        _Clockwise ("Clockwise", Float) = 1
        _Origin ("Origin (0=Top,1=Right,2=Bottom,3=Left)", Float) = 0

        _FeatherStart ("Feather Start (deg)", Range(0,45)) = 10
        _FeatherEnd ("Feather End (deg)", Range(0,45)) = 10

        _InnerRadius ("Inner Radius (0..1)", Range(0,1)) = 0
        _OuterRadius ("Outer Radius (0..1)", Range(0,1)) = 1
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
        ZTest [unity_GUIZTestMode]
        Blend SrcAlpha OneMinusSrcAlpha

        Pass
        {
            Name "UI"
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma target 2.0

            #include "UnityCG.cginc"
            #include "UnityUI.cginc"

            struct appdata_t
            {
                float4 vertex   : POSITION;
                float4 color    : COLOR;
                float2 texcoord : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex   : SV_POSITION;
                fixed4 color    : COLOR;
                float2 uv       : TEXCOORD0;
                float4 worldPos : TEXCOORD1;
            };

            sampler2D _MainTex;
            fixed4 _Color;

            float _FillAmount;
            float _Clockwise;
            float _Origin;

            float _FeatherStart;
            float _FeatherEnd;

            float _InnerRadius;
            float _OuterRadius;

            float4 _ClipRect;

            v2f vert(appdata_t v)
            {
                v2f o;
                o.worldPos = v.vertex;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.texcoord;
                o.color = v.color * _Color;
                return o;
            }

            float OriginOffset01(float origin)
            {
                // Convert Unity Image FillOrigin (Top/Right/Bottom/Left) into angle offset in [0..1)
                // We define angle 0 at "Right" (standard atan2), increasing CCW.
                // Unity origin "Top" should start at 90 degrees.
                if (origin < 0.5) return 0.25;     // Top = 90deg
                if (origin < 1.5) return 0.0;      // Right = 0deg
                if (origin < 2.5) return 0.75;     // Bottom = 270deg
                return 0.5;                        // Left = 180deg
            }

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 tex = tex2D(_MainTex, i.uv) * i.color;

                // UI clip (maskable support)
                #ifdef UNITY_UI_CLIP_RECT
                tex.a *= UnityGet2DClipping(i.worldPos.xy, _ClipRect);
                #endif

                // Polar coords in UV space (assumes sprite centered in rect)
                float2 p = i.uv * 2.0 - 1.0;
                float r = length(p);

                // Optional ring gating (keep 0/1 to ignore)
                float ring = smoothstep(_InnerRadius, _InnerRadius + 1e-4, r) * (1.0 - smoothstep(_OuterRadius, _OuterRadius + 1e-4, r));
                tex.a *= ring;

                // Angle in [0..1): atan2 gives [-pi..pi], map to [0..1)
                float ang = atan2(p.y, p.x);              // [-pi..pi]
                float ang01 = (ang / (2.0 * UNITY_PI));   // [-0.5..0.5]
                ang01 = frac(ang01 + 1.0);                // [0..1)

                float originOff = OriginOffset01(_Origin);

                // Compute progress along the arc starting from origin, going CW or CCW
                float rel = frac(ang01 - originOff + 1.0); // CCW distance from origin
                float prog = (_Clockwise > 0.5) ? frac(1.0 - rel) : rel;

                // Filled region test
                float inside = step(prog, _FillAmount);

                // Feather in degrees -> normalized arc fraction
                float fs = _FeatherStart / 360.0;
                float fe = _FeatherEnd / 360.0;

                // Start feather: fade-in near prog=0
                float aStart = (fs > 0.00001) ? smoothstep(0.0, fs, prog) : 1.0;

                // End feather: fade-out near prog=_FillAmount
                float distToEnd = _FillAmount - prog;
                float aEnd = (fe > 0.00001) ? smoothstep(0.0, fe, distToEnd) : 1.0;

                float feather = aStart * aEnd;

                tex.a *= inside * feather;

                return tex;
            }
            ENDCG
        }
    }
}
