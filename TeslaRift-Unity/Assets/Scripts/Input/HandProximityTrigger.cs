﻿using UnityEngine;
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

	public void UpdateCollider(Vector3 position, float width, float height, float depth){
		transform.localScale = new Vector3(width*2, height*2, depth*2);
		transform.localPosition = position;
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