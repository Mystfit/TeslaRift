using UnityEngine;
using RBF;
using System.Collections;
using System.Collections.Generic;

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
		base.Update();
	}
	
	
	/*
	 * Tool enter state
	 */
	public override void TransitionIn ()
	{
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
		if(m_heldObject != null){
			switch(m_heldType){
			case InteractableTypes.INSTRUMENT:
				BaseAttachment attach = m_heldObject.GetComponent<BaseAttachment>();

				//If we're a dockable object, we need to find something to slot into.
				if(attach.IsDockable){
					GameObject[] docks = GameObject.FindGameObjectsWithTag("ParentIsADock");
					BaseAttachment closestValidDock = null;
					float closestDist = 0.0f;

					foreach(GameObject dockTag in docks){
						BaseAttachment dockAttach = dockTag.transform.parent.GetComponent<BaseAttachment>();		

						if(dockAttach.DockAcceptsType(attach.GetType())){
							if(closestValidDock == null){
								closestDist = Vector3.Distance( dockAttach.transform.position, attach.transform.position);
								closestValidDock = dockAttach;
							}
							float dist = Vector3.Distance( dockAttach.transform.position, attach.transform.position);
							if( dist < closestDist ){
								closestValidDock = dockAttach;
								closestDist = dist;
							}
						}
					}

					attach.DockInto(closestValidDock);	
				}
				break;
			case InteractableTypes.RBFPOINT:
				RBF.RBFTrainingPointAttachment m_selectedTrainingPoint = m_heldObject.GetComponent<RBF.RBFTrainingPointAttachment>();
				if(m_selectedTrainingPoint != null){
					m_selectedTrainingPoint.SetInactive();
					m_selectedTrainingPoint.rbfOwner.owner.UpdateRBF();
				}
				break;
			}

			m_heldObject.rigidbody.velocity = m_deltaVelocity * 50;	
			m_heldObject = null;
		}

		m_toolHandState = BaseTool.HandState.RELEASING;
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

							BaseAttachment attach = m_heldObject.GetComponent<InstrumentAttachment>();
							attach.Undock();
							//pop the instrument off the carousel
							//InstrumentController.Instance.Carousel.HoldInstrument(attach);
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
