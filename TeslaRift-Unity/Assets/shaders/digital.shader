Shader "Custom/digital" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}

	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert
		#pragma target 5.0
		

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};
		
		
		
		
		// by srtuss, 2013
		// was trying to find some sort of "mechanical" fracal for texture/heightmap
		// generation, but then i ended up with this.
		
		// rotate position around axis
		float2 rotate(float2 p, float a)
		{
			return float2(p.x * cos(a) - p.y * sin(a), p.x * sin(a) + p.y * cos(a));
		}
		
		// 1D random numbers
		float rand(float n)
		{
		    return frac(sin(n) * 43758.5453123);
		}
		
		// 2D random numbers
		float2 rand2(in float2 p)
		{
			return frac(float2(sin(p.x * 591.32 + p.y * 154.077), cos(p.x * 391.32 + p.y * 49.077)));
		}
		
		// 1D noise
		float noise1(float p)
		{
			float fl = floor(p);
			float fc = frac(p);
			return lerp(rand(fl), rand(fl + 1.0), fc);
		}
		
		// voronoi distance noise, based on iq's articles
		float voronoi(in float2 x)
		{
		
			float2 p = floor(x);
			float2 f = frac(x);
			
			float2 res = float2(8.0);
			for(int j = -1; j <= 1; j ++)
			{
				for(int i = -1; i <= 1; i ++)
				{
					float2 b = float2(i, j);
					float2 r = float2(b) - f + rand2(p + b);
					
					// chebyshev distance, one of many ways to do this
					float d = max(abs(r.x), abs(r.y));
					
					if(d < res.x)
					{
						res.y = res.x;
						res.x = d;
					}
					else if(d < res.y)
					{
						res.y = d;
					}
				}
			}
			
			return res.y - res.x;
		}
				
		
		

		void surf (Input IN, inout SurfaceOutput o) {
			//half4 c = tex2D (_MainTex, IN.uv_MainTex);
			//o.Albedo = c.rgb;
			//o.Alpha = c.a;
			
			float2 uv = IN.uv_MainTex;
			uv = (uv - 0.5) * 2.0;
			float2 suv = uv;
			//uv.x *= iResolution.x / iResolution.y;
			
			
			float v = 0.0;
			
			// that looks highly interesting:
			//v = 1.0 - length(uv) * 1.3;
			
			
			// a bit of camera movement
			//uv *= 0.6 + sin(_Time.y * 0.1) * 0.4;
			//uv = rotate(uv, sin(_Time.y * 0.3) * 1.0);
			//uv += _Time.y * 0.4;
			
			
			// add some noise octaves
			float a = 0.6, f = 1.0;
			
			for(int i = 0; i < 3; i ++) // 4 octaves also look nice, its getting a bit slow though
			{	
				float v1 = voronoi(uv * f + 5.0);
				float v2 = 0.0;
				
				// make the moving electrons-effect for higher octaves
				if(i > 0)
				{
					// of course everything based on voronoi
					v2 = voronoi(uv * f * 0.5 + 50.0 + _Time.y);
					
					float va = 0.0, vb = 0.0;
					va = 1.0 - smoothstep(0.0, 0.1, v1);
					vb = 1.0 - smoothstep(0.0, 0.08, v2);
					v += a * pow(va * (0.5 + vb), 2.0);
				}
				
				// make sharp edges
				v1 = 1.0 - smoothstep(0.0, 0.3, v1);
				
				// noise is used as intensity map
				v2 = a * (noise1(v1 * 5.5 + 0.1));
				
				// octave 0's intensity changes a bit
				if(i == 0)
					v += v2 *  noise1(_Time.y * 2.0) * 0.8 + 0.4;
				else
					v += v2;
				
				f *= 3.0;
				a *= 0.7;
			}
			
			// slight vignetting
			v *= exp(-0.6 * length(suv)) * 1.2;
			
			// use texture channel0 for color? why not.
			float3 cexp = tex2D(_MainTex, uv * 0.001).xyz * 3.0 + tex2D(_MainTex, uv * 0.01).xyz;//float3(1.0, 2.0, 4.0);
			cexp *= 1.4;
			
			// old blueish color set
			//float3 cexp = float3(6.0, 4.0, 2.0);
			
			half4 col = (float3(pow(v, cexp.x), pow(v, cexp.y), pow(v, cexp.z)) * 2.0, 1.0);
			
			
			half4 c = tex2D(_MainTex, uv);	
			o.Albedo = c.rgb;
			o.Alpha = c.a;
			
			//o.Albedo = col.rgb;
			
			
		}
		ENDCG
	} 
	FallBack "Diffuse"
}