using UnityEngine;
using System.Collections;

public class PanelToggle : MonoBehaviour {
	
	GameObject m_panel;
	
	// Use this for initialization
	void Start () {
		m_panel = transform.FindChild("paramLabel").gameObject;
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public void Toggle(bool state){
		if(m_panel){
			if(state)
				m_panel.renderer.material.SetColor("_Color", Color.red);
			else
				m_panel.renderer.material.SetColor("_Color", Color.black);
		}
	}
}
