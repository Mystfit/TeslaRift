using UnityEngine;
using System.Collections;

public class HandProximityTrigger : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	void OnTriggerEnter(Collider collider){
		if( collider.gameObject.layer == LayerMask.NameToLayer("SoundCollideable")){
			HydraController.Instance.AddInstrumentCollision(transform.parent.gameObject, collider.gameObject);
		}
	}
	
	void OnTriggerExit(Collider collider){
		if( collider.gameObject.layer == LayerMask.NameToLayer("SoundCollideable")){
			HydraController.Instance.RemoveInstrumentCollision(transform.parent.gameObject, collider.gameObject);
		}
	}
}
