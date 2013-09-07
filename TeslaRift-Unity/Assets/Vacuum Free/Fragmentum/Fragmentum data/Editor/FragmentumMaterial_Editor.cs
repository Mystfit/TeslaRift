using UnityEngine;
using System.Collections;
using UnityEditor;
using System.Linq;

public class FragmentumMaterial_Editor : MaterialEditor
{
    Material targetMaterial;    
    string[] keyWords;

    static bool bFParameters = true;
    static bool bVParameters = true;

    bool hasMixedValue;

    public override void OnInspectorGUI()
    {
        if (isVisible == false)
            return;
        
        targetMaterial = target as Material;
        keyWords = targetMaterial.shaderKeywords;

        float controlSize = 64;
        EditorGUIUtility.LookLikeControls(Screen.width - controlSize - 20);

        bFParameters = EditorGUILayout.Foldout(bFParameters, "Fragmentum Parameters");
        if (bFParameters)
        {
            GUILayout.Space(5);
            /////////////////////////////////////////////////////////////////////////////////
            SetTexture("_FragTex", TextureProperty("_FragTex", "   Fragment Texture(R)", ShaderUtil.ShaderPropertyTexDim.TexDim2D));
            EditorGUILayout.BeginHorizontal();
            SetFloat("_FragTexStrength", RangeProperty("_FragTexStrength", "   Fragment Texture Strength  [" + GetFloat("_FragTexStrength", out hasMixedValue).ToString("F3") + "]", 0.0f, 1.0f));
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal();
            SetFloat("_FragPow", RangeProperty("_FragPow", "   Fragment Area Pow             [" + GetFloat("_FragPow", out hasMixedValue).ToString("F3") + "]", 1.0f, 10.0f));
            EditorGUILayout.EndHorizontal();


            SetFloat("_DisAmount", FloatProperty("_DisAmount", "   Displace Amount"));


            SetFloat("_FragmentScale", FloatProperty("_FragmentScale", "   Fragment Scale"));


            //Lock
            if (keyWords.Contains("V_FR_ACTIVATOR_NONE") == false)
            {
                bool bLock = false;
                if (targetMaterial.GetFloat("_Lock") == 1)
                    bLock = true;

                bLock = EditorGUILayout.Toggle("   Lock Displace", bLock);

                targetMaterial.SetFloat("_Lock", bLock ? 1 : 0);

                if (keyWords.Contains("V_FR_ACTIVATOR_PLANE"))
                {
                    SetFloat("_DistanceToPlane", FloatProperty("_DistanceToPlane", "   Distance To Activator"));
                }
            }


            //Rotation
                //Removed

            if (targetMaterial.GetTag("FragmentumTag", false).Contains("_DIS"))
            {
                SetTexture("_DissolveTex", TextureProperty("_DissolveTex", "   Dissolve Texture(R)", ShaderUtil.ShaderPropertyTexDim.TexDim2D));
                 

                EditorGUILayout.BeginHorizontal();
                SetFloat("_DissolveAmount", RangeProperty("_DissolveAmount", "   Dissolve Amount                 [" + GetFloat("_DissolveAmount", out hasMixedValue).ToString("F3") + "]", 0.0f, 1.0f));
                EditorGUILayout.EndHorizontal();
            }

            GUILayout.Space(6);


            //Noise    
                //Removed
           

            //Additional force
            //Removed
            


            //CS0414: disable
            if (hasMixedValue){}
        }

        CommonParameters();

    }

    void CommonParameters()
    {
        GUILayout.Space(5);
        bVParameters = EditorGUILayout.Foldout(bVParameters, "Visual Parameters");
        if(bVParameters)
        {
            GUILayout.Space(5);

            SetColor("_Color", ColorProperty("_Color", "   Main Color"));
            SetTexture("_MainTex", TextureProperty("_MainTex", "   Main Texture(RGB) Gloss(A)", ShaderUtil.ShaderPropertyTexDim.TexDim2D));

            string tag = targetMaterial.GetTag("FragmentumTag", false);
            if (tag.Contains("Reflect"))
            {
                Draw_DR();
            }

            if (tag.Contains("BumpSecular"))
            {
                Draw_BS();
            }
                

            EditorGUILayout.BeginHorizontal();
            SetFloat("_Emission", RangeProperty("_Emission", "Emission", 0.0f, 3.0f));
            EditorGUILayout.EndHorizontal();
        }        
                
    }

    void Draw_DR()
    { 
        SetColor("_ReflectColor", ColorProperty("_ReflectColor", "   Reflection Color(RGB) Strength(A)"));
        SetTexture("_Cube", TextureProperty("_Cube", "   Reflection Cubemap", ShaderUtil.ShaderPropertyTexDim.TexDimCUBE));
    }

    void Draw_BS()
    {
        SetColor("_SpecColor", ColorProperty("_SpecColor", "   Specular Color(RGB) Intensity(A)"));

        EditorGUILayout.BeginHorizontal();
        SetFloat("_Shininess", RangeProperty("_Shininess", "   Shininess", 0.03f, 1.0f));
        EditorGUILayout.EndHorizontal();

        SetTexture("_BumpMap", TextureProperty("_BumpMap", "   NormalMap", ShaderUtil.ShaderPropertyTexDim.TexDim2D));

    } 
}
