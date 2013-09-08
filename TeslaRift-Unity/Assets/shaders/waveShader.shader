Shader "Custom/waveShader" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Scale("Wave scale", Float) = 1.0
		_Power("Wave Power", Float) = 1.0
		_Threshold("Colour threshold", Range(0.0, 1.0)) = 0.0
		_PointA("Pole1", Vector) = (0.0, 0.0, 0.0)
		_PointB("Pole2", Vector) = (0.0, 0.0, 0.0)
		_PointC("Pole3", Vector) = (0.0, 0.0, 0.0)
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf NoLighting

		sampler2D _MainTex;
		
		float _Scale;
		float _Power;
		float _Threshold;
		float4 _PointA;
		float4 _PointB;
		float4 _PointC;

		struct Input {
			float2 uv_MainTex;
		};
		
		void vert (inout appdata_full v) {
			float2 uv;
			//uv.x = v.texcoord.x;
			//uv.y = ( sin(v.texcoord.y) + 1.0) * 0.5;
            //v.texcoord.xy = uv;
        }
        
        fixed4 LightingNoLighting(SurfaceOutput s, fixed3 lightDir, fixed atten)
	    {
	        fixed4 c;
	        c.rgb = s.Albedo; 
	        c.a = s.Alpha;
	        return c;
	    }
        
        float dist (float2 a, float2 b){
        	float dX = a.x - b.x;
        	float dY = a.y - b.y;
        	return sqrt(dX * dX + dY * dY);
        }

		void surf (Input IN, inout SurfaceOutput o) {

			float2 uv = IN.uv_MainTex.xy;
			float sumDist = dist(_PointA.xy, uv) + dist(_PointB.xy, uv) + dist(_PointC.xy, uv);	
			
			float s = sin(sumDist * _Scale);
			s = pow(s, _Power * 10);
			
			float4 col = s;
			
			
			if(s > _Threshold){
				col.rgb = 1.0;
			}
			
			
			
					
			//half4 c = tex2D (_MainTex, IN.uv_MainTex);

			//float4 col = round( (sin(IN.uv_MainTex.y * _Scale) + 1) * 0.5);
			//float4 col = clampedCol;
			o.Albedo = col.rgb;
			//o.Alpha = col.r;
			//o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}
