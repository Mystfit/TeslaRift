// Davit Naskidashvili 2013

using UnityEngine;
using System.Collections;

public class Title : MonoBehaviour 
{

    ////////////////////////////////////////////////////////////////////
    //Variables                                                       //
    ////////////////////////////////////////////////////////////////////
    public AnimationCurve curveFragmentStrength = AnimationCurve.Linear(0, 1, 1, 1);
    public AnimationCurve curveFragmentArePow = AnimationCurve.Linear(0, 1, 1, 1);   

    float delta;

    Material mat;
    ////////////////////////////////////////////////////////////////////
    //Functions                                                       //
    ////////////////////////////////////////////////////////////////////
	// Use this for initialization
	void Start () 
    {
        mat = GetComponent<Fragmentum>().GetMaterial();

        delta = 0;
	}
	
	// Update is called once per frame
	void Update () 
    {
        delta += Time.deltaTime;

        mat.SetFloat("_FragTexStrength", curveFragmentStrength.Evaluate(delta));
        mat.SetFloat("_FragPow", curveFragmentArePow.Evaluate(delta));
	}
}
