Shader "Custom/Overlay" {

    Properties {

        _Color ("Color Tint", Color) = (1,1,1,1)

        _MainTex ("SelfIllum Color (RGB) Alpha (A)", 2D) = "white"

    }

    Category {

       Lighting On

       ZWrite Off

       Cull Back

       Blend SrcAlpha OneMinusSrcAlpha

       Tags {Queue=Overlay}

       SubShader {

            Material {

               Emission [_Color]

            }

            Pass {
			   ZTest Always
               SetTexture [_MainTex] {

                      Combine Texture * Primary, Texture * Primary

                }

            }

        } 

    }

}