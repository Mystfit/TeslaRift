using UnityEngine;
using System.Collections;

public class PhysGrabberTool : BaseTool {
	
	public GameObject m_heldObject = null;
	
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
		if(m_heldObject != null){
			m_heldObject.transform.parent = null;
			m_heldObject.GetComponent<Rigidbody>().isKinematic = false;
			m_heldObject = null;
			m_toolHandState = BaseTool.HandState.RELEASING;
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
							m_heldObject.GetComponent<Rigidbody>().isKinematic = true;
							m_heldObject.transform.parent = this.gameObject.transform;
							m_instrumentControlRef.SetLastSelectedGameInstrument(m_heldObject);
							m_toolHandState = BaseTool.HandState.HOLDING;
						}
					}
				}
				break;
			case HandState.RELEASING:	//Instrument floats in front of performer
				break;
			case HandState.HOLDING:
				break;
			}
		}

	}
}
