using UnityEngine;
using System.Collections;

public class PhysGrabberTool : BaseTool {
	
	public GameObject m_heldObject = null;
	public BaseGenerator m_selectedGenerator = null;
	
	private Vector3 m_lastHeldPosition;
	private Vector3 m_deltaVelocity;
	
	public enum PhysDirection{ BLOW = 0, SUCK};
	
	private FixedJoint m_joint = null;
	
	public PhysGrabberTool() {
	}
	
	public override void Awake(){
		base.Awake(); 
		m_toolHandState = BaseTool.HandState.SEARCHING;
	}
	
	public override void Update(){
		CheckForSelection();
		
		if(m_mode == BaseTool.ToolMode.SECONDARY){
			ApplyForceToInstruments(PhysDirection.SUCK, 0.4f);
		}
		
		base.Update();
	}
	
	public override void TransitionIn ()
	{
		Debug.Log(this.m_toolControlRef);
		if( m_toolControlRef.SelectedGenerator != null ){
			m_toolControlRef.SetSelectedGenerator(null);
			GeneratorLine[] lines = gameObject.GetComponents<GeneratorLine>();
			foreach(GeneratorLine line in lines)
				line.Remove();
			Debug.Log("Resetting generator selection" + m_selectedGenerator);
		}
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
		
		if(m_selectedGenerator != null){
			GeneratorLine[] lines = gameObject.GetComponents<GeneratorLine>();
			foreach(GeneratorLine line in lines)
				line.Remove();
			//m_toolControlRef.SetSelectedGenerator(null);
		}
	}
	
	public void ApplyForceToInstruments(PhysDirection physAction, float strength){
		
		GameObject[] instruments = GameObject.FindGameObjectsWithTag("Instrument");
		foreach( GameObject instr in instruments){
			Vector3 dir;
			float dist;
			
			if(physAction == PhysDirection.BLOW){
				dir = new Vector3(transform.rotation.eulerAngles.x, transform.rotation.eulerAngles.y - 90.0f, transform.rotation.eulerAngles.z).normalized;
				dist = Mathf.Abs((transform.position - instr.transform.position).magnitude);
				Debug.Log(dist);
				if(dist < 10.0f)
					instr.rigidbody.AddForce(dir * 20.0f * strength);
			} else if(physAction == PhysDirection.SUCK){
				dir = transform.position - instr.transform.position;
				dist = Mathf.Abs(dir.magnitude);
				
				if(dist > 0.5f)
					instr.rigidbody.AddForce(dir * 20.0f * strength);
			}
		}
	}
	
	public void CheckForSelection(){
		if(m_hydraRef != null){

			//Attach
			switch(m_toolHandState){
			case HandState.SEARCHING:
				if(m_hydraRef.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR)){
					if(m_hydraRef.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR) != m_heldObject){
						
						if(m_hydraRef.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR).CompareTag("Instrument")){
							m_heldObject = m_hydraRef.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR);
							m_joint = gameObject.AddComponent<FixedJoint>();
							m_joint.connectedBody = m_heldObject.GetComponent<Rigidbody>();
							m_instrumentControlRef.SetLastSelectedGameInstrument(m_heldObject);
							m_toolHandState = BaseTool.HandState.HOLDING;
						}
						
						else if(m_hydraRef.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR).CompareTag("Generator")){
							if(m_toolControlRef.SelectedGenerator == null){		//Only one attached generator at a time
								m_heldObject = m_hydraRef.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR);
								m_selectedGenerator = m_heldObject.GetComponent<BaseGenerator>();
								m_toolControlRef.SetSelectedGenerator(m_selectedGenerator);
								m_toolHandState = BaseTool.HandState.HOLDING;
								
								//Create a line between the hand and the generator
								GeneratorLine line = gameObject.AddComponent<GeneratorLine>();
								line.CreateConnection(m_selectedGenerator.transform, transform);
								Debug.Log("Selecting generator " + m_selectedGenerator);
							}
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
				if(m_toolControlRef.SelectedGenerator != null){		//Remove selected generator if holding
				}
				break;
			}
		}

	}
}
