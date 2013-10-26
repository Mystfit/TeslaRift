using UnityEngine;
using System.Collections;

public class RotaryGenerator : MonoBehaviour {
	
	private GameObject m_fill;
	private BaseGenerator m_generator;

	void Start () {
		m_fill = transform.FindChild("rotaryFill").gameObject;
		m_generator = GetComponent<BaseGenerator>();
	}
	
	void Update () {
		if(m_fill != null && m_generator != null)
			m_fill.renderer.material.SetFloat("_Cutoff", 1.0f - m_generator.val);
	}
}
