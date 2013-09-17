using UnityEngine;
using System.Collections;

public class RotaryGenerator : MonoBehaviour {
	
	private GameObject m_fill;
	private BaseGenerator m_generator;

	// Use this for initialization
	void Start () {
		m_fill = transform.FindChild("rotaryFill").gameObject;
		m_generator = GetComponent<BaseGenerator>();
	}
	
	// Update is called once per frame
	void Update () {
		m_fill.renderer.material.SetFloat("_Cutoff", 1.0f - m_generator.val);
	}
}
