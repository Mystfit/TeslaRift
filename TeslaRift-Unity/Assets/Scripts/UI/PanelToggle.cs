using UnityEngine;
using System.Collections;

public class PanelToggle : MonoBehaviour {
	
	private bool m_isToggled = false;
	
	public void Toggle(bool state){
		if(m_isToggled != state){
			if(state){
				m_isToggled = true;
				renderer.material.SetColor("_Color", Color.blue);
				transform.GetComponentInChildren<TextMesh>().color = Color.white;
			}else{
				m_isToggled = false;
				renderer.material.SetColor("_Color", Color.white);
				transform.GetComponentInChildren<TextMesh>().color = Color.black;
			}
		}
	}
	
	public void HoverToggle(bool state){
		if(state){
			renderer.material.SetColor("_Color", Color.red);
			transform.GetComponentInChildren<TextMesh>().color = Color.white;
		}else{
			if(m_isToggled)
				renderer.material.SetColor("_Color", Color.blue);
			else
				renderer.material.SetColor("_Color", Color.white);
			transform.GetComponentInChildren<TextMesh>().color = Color.black;
		}
	}
}
