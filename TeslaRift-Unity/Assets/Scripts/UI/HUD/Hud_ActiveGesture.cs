using UnityEngine;
using System.Collections;

public class Hud_ActiveGesture : MonoBehaviour {

	public GloveController m_targetGlove;
	protected TextMesh m_text;

	// Use this for initialization
	void Start () {
		m_text = GetComponent<TextMesh>();
	}
	
	// Update is called once per frame
	void Update () {
		if(m_targetGlove && m_text){
			m_text.text = m_targetGlove.activeGesture;
		}
	}
}
