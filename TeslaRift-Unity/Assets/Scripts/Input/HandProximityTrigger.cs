using UnityEngine;
using System.Collections;
using VRControls;

public class HandProximityTrigger : MonoBehaviour {
    
    public BaseVRControl proximityRoot;
    public ProximityType proximityTarget;
    public bool isActive = true;

    public void Awake()
    {
        proximityRoot = transform.parent.parent.GetComponent<BaseVRControl>();
        if (proximityRoot == null)
            Debug.LogError("Proximity trigger can't find VRControl component in parent! Parent:" + transform.parent.parent.gameObject.name);
    }
    
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
        if (isActive)
        {
            if(collider.gameObject.layer == LayerMask.NameToLayer("SoundCollideable")){
                SixenseHands hand = collider.gameObject.GetComponent<HydraHand>().Hand;
                HydraController.Instance.AddCollision(proximityRoot, hand, proximityTarget);
            }
        }
    }
    
    void OnTriggerExit(Collider collider){
        if (isActive){
            if(collider.gameObject.layer == LayerMask.NameToLayer("SoundCollideable")){
                SixenseHands hand = collider.gameObject.GetComponent<HydraHand>().Hand;
                HydraController.Instance.RemoveCollision(proximityRoot, hand, proximityTarget);
            }
        }
    }
}
