using UnityEngine;
using System.Collections;

public class PhysGrabberTool : BaseTool {
	
	public GameObject m_heldObject = null;
	
	private Vector3 m_lastHeldPosition;
	private Vector3 m_deltaVelocity;
	
	public enum PhysDirection{ BLOW = 0, SUCK};
	
	private FixedJoint m_joint = null;
	
	public PhysGrabberTool() {
	}
	
	public override void Start(){
		base.Start();
		m_toolHandState = BaseTool.HandState.SEARCHING;
	}
	
	public override void Update(){
		CheckForSelection();
		base.Update();
	}
	
	public override void TransitionOut(){
		if(m_joint != null)
			Destroy(m_joint);
		
		FixedJoint[] jointList = this.GetComponents<FixedJoint>(); 
		for(int i = 0 ; i < jointList.Length; i++){
			DestroyImmediate( jointList[i] );
		}
			
		if(m_heldObject != null){
			m_heldObject.rigidbody.velocity = m_deltaVelocity * 50;	
			m_heldObject = null;
			m_toolHandState = BaseTool.HandState.RELEASING;
		}
	}
	
	
	public void ApplyForceToInstruments(PhysDirection physAction){
		
		GameObject[] instruments = GameObject.FindGameObjectsWithTag("Instrument");
		foreach( GameObject instr in instruments){
			Vector3 dir;
			float dist;
			
			if(physAction == PhysDirection.BLOW){
				dir = new Vector3(transform.rotation.eulerAngles.x, transform.rotation.eulerAngles.y - 90.0f, transform.rotation.eulerAngles.z).normalized;
				dist = Mathf.Abs((transform.position - instr.transform.position).magnitude);
				Debug.Log(dist);
				if(dist < 10.0f)
					instr.rigidbody.AddForce(dir * 20.0f);
			} else if(physAction == PhysDirection.SUCK){
				dir = transform.position - instr.transform.position;
				dist = Mathf.Abs(dir.magnitude);
				
				if(dist > 0.5f)
					instr.rigidbody.AddForce(dir * 20.0f);
			}
		}
	}
	
	public void CheckForSelection(){
		if(m_hydraRef != null){

			//Attach
			switch(m_toolHandState){
			case HandState.SEARCHING:
				if(m_hydraRef.HandTarget(m_hand)){
					if(m_hydraRef.HandTarget(m_hand) != m_heldObject){
						
						if(m_hydraRef.HandTarget(m_hand).CompareTag("Instrument")){
							
							m_heldObject = m_hydraRef.HandTarget(m_hand);
							
							//m_dragger = new GameObject("Rigidbody dragger");
							//Rigidbody body = m_dragger.AddComponent<Rigidbody>();
							//body.isKinematic = true;
							
							m_joint = gameObject.AddComponent<FixedJoint>();
							
							m_joint.connectedBody = m_heldObject.GetComponent<Rigidbody>();
							
							//joint.transform.position = m_heldObject.transform.position;
							
							//m_heldObject = m_hydraRef.HandTarget(m_hand);
							//m_heldObject.GetComponent<Rigidbody>().isKinematic = true;
							//m_heldObject.transform.parent = this.gameObject.transform;
							m_instrumentControlRef.SetLastSelectedGameInstrument(m_heldObject);
							m_toolHandState = BaseTool.HandState.HOLDING;
						}
					}
				}
				break;
			case HandState.RELEASING:	//Instrument floats in front of performer
				break;
			case HandState.HOLDING:
				if(m_joint && m_heldObject){
					m_deltaVelocity = m_heldObject.transform.position - m_lastHeldPosition;
					m_lastHeldPosition =  m_heldObject.transform.position;
				}
				break;
			}
		}

	}
}
