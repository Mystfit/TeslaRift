Shader "Custom/PerspectiveWarpShader" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_BL("Bottom Left", Vector) = (0.0, 0.0, 0.0)
		_BR("Bottom Right", Vector) = (1.0, 0.0, 0.0)
		_TL("Top Left", Vector) = (0.0, 1.0, 0.0)
		_TR("Top Right", Vector) = (1.0, 1.0, 0.0)
	}
	SubShader {
        Pass {

			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			 
			float4 _BL;
			float4 _BR;
			float4 _TL;
			float4 _TR;
			sampler2D _MainTex; 

			// vertex input: position, UV
			struct appdata {
				float4 vertex : POSITION;
				float4 texcoord : TEXCOORD0;
			};

			struct v2f {
				float4 pos : SV_POSITION;
				float4 uv : TEXCOORD0;
			};
        
			v2f vert (appdata v) {
				v2f o;
				o.pos = mul( UNITY_MATRIX_MVP, v.vertex );
				o.uv = float4( v.texcoord.xy, 0, 0 );
				return o;
			}
        
			half4 frag( v2f i ) : COLOR {
				

				float4 vertStart = lerp(_BL, _BR, i.uv.x);
				float4 vertEnd = lerp(_TL, _TR, i.uv.x);
				float4 horizStart = lerp(_BL, _TL, i.uv.y);
				float4 horizEnd = lerp(_BR, _TR, i.uv.y);

				// Get A,B,C of horizontal line - points : ps1 to pe1
				float A1 = horizEnd.y-horizStart.y;
				float B1 = horizStart.x-horizEnd.x;
				float C1 = A1*horizStart.x+B1*horizStart.y;
 
				// Get A,B,C of second line - points : ps2 to pe2
				float A2 = vertEnd.y-vertStart.y;
				float B2 = vertStart.x-vertEnd.x;
				float C2 = A2*vertStart.x+B2*vertStart.y;

				float delta = A1*B2 - A2*B1;

				float2 intersect = float2((B2*C1 - B1*C2)/delta, (A1*C2 - A2*C1)/delta);
				half4 c = tex2D (_MainTex, intersect.xy);
				
				return c;
			}
			ENDCG

        }
    }
	FallBack "Diffuse"
}
