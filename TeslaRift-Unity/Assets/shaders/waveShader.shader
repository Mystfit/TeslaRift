Shader "Custom/waveShader" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Scale("Wave scale", Float) = 1.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;
		
		float _Scale;

		struct Input {
			float2 uv_MainTex;
		};
		
		void vert (inout appdata_full v) {
			float2 uv;
			uv.x = v.texcoord.x;
			uv.y = ( sin(v.texcoord.y) + 1.0) * 0.5;
            v.texcoord.xy = uv;
        }

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex, IN.uv_MainTex);

			float4 col = round( (sin(IN.uv_MainTex.y * _Scale) * sin(IN.uv_MainTex.x * _Scale) + 1) * 0.5);
			//float4 col = clampedCol;
			o.Albedo = col.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
