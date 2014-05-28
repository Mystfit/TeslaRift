using UnityEngine;
using System.Collections;

public class HandProximityTrigger : MonoBehaviour {
	
	public GameObject proximityRoot;
	public ProximityType proximityTarget;
	
	public void Init(ProximityType type){
		proximityTarget = type;
	}

    /*
     * Updates the collider of this collision trigger
     */
    public void UpdateCollider(Vector3 position, Vector3 size)
    {
        if (collider.GetType() == typeof(BoxCollider))
        {
            UpdateBoxCollider(position, size);
        }
        else
        {
            UpdateSphereCollider(position, size.x);
        }
    }

    public Vector3 GetSize()
    {
        if (collider.GetType() == typeof(SphereCollider))
            return collider.bounds.size;
        return collider.bounds.size; 
    }

	public void UpdateBoxCollider(Vector3 position, Vector3 size){
		BoxCollider box = collider as BoxCollider;
        box.size = size;
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
