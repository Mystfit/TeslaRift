using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class PointsOnSphere : MonoBehaviour {
	
	public GameObject prefab;
	public float scaling = 5.0f;
	public int numPoints = 8;
	
	private Vector3[] points;

	// Use this for initialization
	void Start () {
   		
	}
	
	// Update is called once per frame
	void Update () {
		for(int i = 0; i < this.transform.childCount; i++){
			Transform child = this.transform.GetChild(i);
			child.localPosition = points[i] * scaling;
		}
	}
	
	
}
