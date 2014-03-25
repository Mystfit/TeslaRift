using UnityEngine;
using RBF;
using System.Collections;

public class PhysGrabberTool : BaseTool {
	
	public GameObject m_heldObject = null;
	public string m_heldType;
	public BaseGenerator m_selectedGenerator = null;
	public RBF.RBFTrainingPointAttachment m_selectedTrainingPoint = null;
	
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
	
	
	/*
	 * Tool enter state
	 */
	public override void TransitionIn ()
	{
		if( ToolController.Instance.SelectedGenerator != null ){
			ToolController.Instance.SetSelectedGenerator(null);
			GeneratorLine[] lines = gameObject.GetComponents<GeneratorLine>();
			foreach(GeneratorLine line in lines)
				line.Remove();
			Debug.Log("Resetting generator selection" + m_selectedGenerator);
		}
	}

	
	/*
	 * Tool exit state
	 */
	public override void TransitionOut(){
		if(m_joint != null)
			Destroy(m_joint);
		
		FixedJoint[] jointList = this.GetComponents<FixedJoint>(); 
		for(int i = 0 ; i < jointList.Length; i++){
			DestroyImmediate( jointList[i] );
		}
		
		//Handle releasing of held objects
		switch(m_heldType){
		case InteractableTypes.INSTRUMENT:
			if(m_heldObject != null){
				m_heldObject.rigidbody.velocity = m_deltaVelocity * 50;	
				m_heldObject = null;
			}
			break;
		case InteractableTypes.GENERATOR:
			if(m_selectedGenerator != null){
				GeneratorLine[] lines = gameObject.GetComponents<GeneratorLine>();
				foreach(GeneratorLine line in lines)
					line.Remove();
				//m_toolControlRef.SetSelectedGenerator(null);
			}
			break;
		case InteractableTypes.RBFPOINT:
			if(m_heldObject != null){
				RBF.RBFTrainingPointAttachment m_selectedTrainingPoint = m_heldObject.GetComponent<RBF.RBFTrainingPointAttachment>();
				if(m_selectedTrainingPoint != null){
					m_selectedTrainingPoint.SetInactive();
					m_selectedTrainingPoint.rbfOwner.owner.UpdateRBF();
				}
			}
			break;
		}
	
		m_toolHandState = BaseTool.HandState.RELEASING;
	}
	
	
	/*
	 * Moves all instruments towards or away from the tool
	 */
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
	
	
	/*
	 * Checks for collision with appropriate obejcts
	 */
	public void CheckForSelection(){
		if(m_hydraRef != null){

			//Attach
			switch(m_toolHandState){
			case HandState.SEARCHING:
				GameObject handTarget = m_hydraRef.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR,  mode);
				if(handTarget != null){
					if(handTarget != m_heldObject){
						
						GameObject closestObject = handTarget;
						
						if(handTarget.CompareTag(InteractableTypes.INSTRUMENT)){
							m_heldObject = closestObject;
							m_heldType = InteractableTypes.INSTRUMENT;
							m_joint = gameObject.AddComponent<FixedJoint>();
							m_joint.connectedBody = m_heldObject.GetComponent<Rigidbody>();
							m_instrumentControlRef.SetLastSelectedGameInstrument(m_heldObject);
							m_toolHandState = BaseTool.HandState.HOLDING;

							//pop the instrument off the carousel
							InstrumentController.Instance.Carousel.HoldInstrument(m_heldObject.GetComponent<InstrumentAttachment>());
						} else if(handTarget.CompareTag(InteractableTypes.MUSICGROUP)){
							m_heldObject = closestObject;
							m_heldType = InteractableTypes.MUSICGROUP;
							m_joint = gameObject.AddComponent<FixedJoint>();
							m_joint.connectedBody = m_heldObject.GetComponent<Rigidbody>();
							//m_instrumentControlRef.SetLastSelectedGameInstrument(m_heldObject);
							m_toolHandState = BaseTool.HandState.HOLDING;
						}

						else if(handTarget.CompareTag(InteractableTypes.RBFPOINT)){
							m_heldObject = closestObject;
							m_heldType = InteractableTypes.RBFPOINT;
							RBFTrainingPointAttachment m_selectedTrainingPoint = m_heldObject.GetComponent<RBFTrainingPointAttachment>();
							m_selectedTrainingPoint.SetActive(transform);
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
				if(m_toolControlRef.SelectedGenerator != null){		//Remove selected generator if holding
				}
				break;
			}
		}

	}
}
