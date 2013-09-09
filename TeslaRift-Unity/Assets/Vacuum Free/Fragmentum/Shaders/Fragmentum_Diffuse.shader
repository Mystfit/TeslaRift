Shader "Vacuum/Fragmentum/Diffuse_Free" 
{
	Properties  
	{   
		_FragTex("Fragment Area(R)", 2D) = "white"{}	
		_FragTexStrength("Fragment Texture Strength", Range(0, 1)) = 0.5
		_FragPow("Fragment Area Pow", Range(1, 10)) = 1
		_DistanceToPlane("Distance To Plane", float) = 0
		      

		_DisAmount("Displace Amount", float) = 1	 
		_Lock("Displace lock", float) = 0
		_FragmentScale("Fragment Scale", float) = 1        
		 
				       
		_RotSpeed("Rotation Speed", float) = 1  
		_TimeOffset("Time Offset", float) = 0                   
					 
		_Color ("Main Color", Color) = (1,1,1,1)
		_MainTex ("Main Texture (RGB) Gloss (A)", 2D) = "" {}
		_Emission("Emission", Range(0, 3)) = 0 
	}   
	                        
	SubShader      
	{  
		Tags {"RenderType"="Opaque" "FragmentumTag"="Fragmentum_Diffuse"}
		LOD 300   
				                             
		Cull Off                     
		                
		CGPROGRAM 
		#pragma target 5.0 
		#pragma only_renderers d3d11
		#pragma surface surf Lambert vertex:vert addshadow fullforwardshadows nolightmap
		   
		//#pragma multi_compile V_FR_R_OFF V_FR_RA_ON V_FR_RO_ON V_FR_RC_ON
	    #pragma multi_compile V_FR_ACTIVATOR_NONE V_FR_ACTIVATOR_PLANE V_FR_ACTIVATOR_SPHERE
		//#pragma multi_compile V_FR_NOISE_ON V_FR_NOISE_OFF
		#pragma multi_compile V_FR_EDITOR_ON V_FR_EDITOR_OFF  
			       
		#include "../Fragmentum data/CGIncludes/FragmentumCG.cginc"  
		  

		ENDCG      
	}      

	CustomEditor "FragmentumMaterial_Editor"

}
                       