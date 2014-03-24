using UnityEngine;
using System.Collections;

public class HandProximityTrigger : MonoBehaviour {
	
	public GameObject proximityRoot;
	public ProximityType proximityTarget;

	public void Init(ProximityType type){
		proximityTarget = type;
	}
	
	// Use this for initialization
	void Awake () {
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	public void UpdateBoxCollider(Vector3 position, float width, float height, float depth){
		BoxCollider box = collider as BoxCollider;
		box.size = new Vector3(width, height, depth);
		box.center = position;
	}

	public void UpdateSphereCollider(Vector3 position, float radius){
		SphereCollider sphere = collider as SphereCollider;
		sphere.radius = radius;
		sphere.center = position;
	}

	
	void OnTriggerEnter(Collider collider){
		if(collider.gameObject.layer == LayerMask.NameToLayer("SoundCollideable")){
			SixenseHands hand = collider.gameObject.GetComponent<HydraHand>().Hand;
			HydraController.Instance.AddCollision(proximityRoot, hand, proximityTarget);
		}
	}
	
	void OnTriggerExit(Collider collider){
		if(collider.gameObject.layer == LayerMask.NameToLayer("SoundCollideable")){
			SixenseHands hand = collider.gameObject.GetComponent<HydraHand>().Hand;
			HydraController.Instance.RemoveCollision(proximityRoot, hand, proximityTarget);
		}
	}
}
