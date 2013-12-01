using UnityEngine;
using System.Collections;

public class TestObjectSpace : MonoBehaviour {
	
	public Transform m_target;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		Debug.Log(transform.InverseTransformPoint(m_target.position));
	}
}
