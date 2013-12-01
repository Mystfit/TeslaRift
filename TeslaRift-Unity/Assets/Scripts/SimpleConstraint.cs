using UnityEngine;

using System.Collections;



public class SimpleConstraint : MonoBehaviour {
	
	
	
	Vector3 startPosition;
	
	Vector3 startRotation;
	
	
	
	public bool constrainX;
	
	public bool constrainY;
	
	public bool constrainZ;
	
	
	
	public bool constrainRotationX;
	
	public bool constrainRotationY;
	
	public bool constrainRotationZ;
	
	
	
	// Use this for initialization
	
	void Start () {
		
		startPosition = transform.position;
		
		startRotation = transform.eulerAngles;
		
	}
	
	
	
	// Update is called once per frame
	
	void Update () {
		
		
		
		Vector3 currentPosition = transform.position;
		
		Vector3 currentRotation = transform.eulerAngles;
		
		
		
		if (constrainX)
			
		{
			
			currentPosition = new Vector3(startPosition.x, currentPosition.y, currentPosition.z);
			
			rigidbody.velocity = new Vector3(0, rigidbody.velocity.y, rigidbody.velocity.z);
			
		}
		
		if (constrainY)
			
		{
			
			currentPosition = new Vector3(currentPosition.x, startPosition.y, currentPosition.z);
			
			rigidbody.velocity = new Vector3(rigidbody.velocity.x, 0, rigidbody.velocity.z);
			
		}
		
		if (constrainZ)
			
		{
			
			currentPosition = new Vector3(currentPosition.x, currentPosition.y, startPosition.z);
			
			rigidbody.velocity = new Vector3(rigidbody.velocity.x, rigidbody.velocity.y, 0);
			
		}
		
		
		
		transform.position = currentPosition;
		
		
		
		if (constrainRotationX)
			
		{
			
			currentRotation = new Vector3(startRotation.x, currentRotation.y, currentRotation.z);
			
			rigidbody.angularVelocity = 
				
				new Vector3(0, rigidbody.angularVelocity.y, rigidbody.angularVelocity.z);
			
		}
		
		if (constrainRotationY)
			
		{
			
			currentRotation = new Vector3(currentRotation.x, startRotation.y, currentRotation.z);
			
			rigidbody.angularVelocity = 
				
				new Vector3(rigidbody.angularVelocity.x, 0, rigidbody.angularVelocity.z);
			
		}
		
		if (constrainRotationZ)
			
		{
			
			currentRotation = new Vector3(currentRotation.x, currentRotation.y, startRotation.z);
			
			rigidbody.angularVelocity = 
				
				new Vector3(rigidbody.angularVelocity.x, rigidbody.angularVelocity.y, 0);
			
		}
		
		
		
		transform.eulerAngles = currentRotation;
		
	}
	
}