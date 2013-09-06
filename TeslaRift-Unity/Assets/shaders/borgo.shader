Shader "Custom/Borgo" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Resolution ("Resolution", Vector) = (512, 512, 0,0)
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert
		#pragma target 4.0
		
		sampler2D _MainTex;
		float4 _Resolution;
		
		struct Input {
			float2 uv_MainTex;
		};
		
		float f(float3 o){	
			float a=cos(o.x*8.)+sin(o.y*8.)+sin(o.z*1.)*12.5-(_Time.y*1.1);
			float b=length(sin(o.xy)+sin(o.yz)+sin(o.zx));
			o=float3(cos(a)+o.x,1.-sin(a)*o.y,sin(a)*o.z)*.5;
			return lerp(dot(cos(o)*cos(o),float3(1.75))-2.0,b,.5);
		}
		
		float3 s(float3 o,float3 d){
			float t=0.,a,b;
			for(int i=0;i<128;i++){
				if(f(o+d*t)<.1){
					a=t+1.0;
					b=t;
					for(int i=0; i<1;i++){
						t=a+b;
						if(f(o+d*t)<0.)
						b=t;
						else a=t;
					}
			
					return float3(lerp(float3(0.55,0.1,0.18),float3(0.1,0.15,0.2),float3(pow(t/64.,1.0))));
			
				}
				t+=1.;
			}
			return float3(0.1,0.25,0.23);
		}

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
			//o.Albedo = float3(s(float3(cos(1.6+cos(_Time.y*.1)),sin(.25+sin(_Time.y*.1)),-5.*sin(_Time.y*.01)*2.),normalize(float3((IN.uv_MainTex.xy-_Resolution.xy/2.)/_Resolution.x,1.0))));	
		}
		
		ENDCG
	} 
	FallBack "Diffuse"
}