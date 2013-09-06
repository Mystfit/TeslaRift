using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class CurveTest : MonoBehaviour {
	
	Vector3[] sourcePoints;
	Vector3[] destPoints;

	// Use this for initialization
	void Start () {
		sourcePoints = new Vector3[5];
		sourcePoints[0] = new Vector3(0.0f, 5.0f, 0.0f);
		sourcePoints[1] = new Vector3(5.0f, 0.0f, 10.0f);
		sourcePoints[2] = new Vector3(0.0f, -5.0f, 20.0f);
		sourcePoints[3] = new Vector3(-5.0f, 0.0f, 30.0f);
		sourcePoints[4] = new Vector3(0.0f, 5.0f, 40.0f);
								
		Utils.CatmullRom(sourcePoints, out destPoints, 5);
		
		
	}
	
	// Update is called once per frame
	void Update () {
		for(int i = 1; i < destPoints.Length; i++){
			Debug.DrawLine(destPoints[i], destPoints[i-1], Color.red);
		}
	}
}
