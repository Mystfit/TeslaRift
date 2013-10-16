using UnityEngine;
using System.Collections;

public class PanelToggle : MonoBehaviour {
	
	public void Toggle(bool state){
		if(state){
			renderer.material.SetColor("_Color", Color.blue);
			transform.GetComponentInChildren<TextMesh>().color = Color.white;
		}else{
			renderer.material.SetColor("_Color", Color.white);
			transform.GetComponentInChildren<TextMesh>().color = Color.black;
		}
	}
}
