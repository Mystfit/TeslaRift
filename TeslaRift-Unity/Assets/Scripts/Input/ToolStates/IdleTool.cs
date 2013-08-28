using UnityEngine;
using System.Collections;

public class IdleTool : BaseTool {
	
	public GameObject m_heldObject = null;
	
	public IdleTool() {
	}
	
	public override void Update(){
		CheckForSelection();
	}

	
	public void CheckForSelection(){
		if(m_hydraRef != null){
			
			//Select instrument button
			//------------------------
			if(m_hydraRef.GetHandController(m_hand) != null){
				if(m_hydraRef.GetHandController(m_hand).GetButtonDown(SixenseButtons.TRIGGER)){
					m_toolHandState = BaseTool.HandState.SEARCHING;
				} else if(m_hydraRef.GetHandController(m_hand).GetButtonUp(SixenseButtons.TRIGGER)){
					m_toolHandState = BaseTool.HandState.RELEASING;	
				}
			}
		
			//Attach
			switch(m_toolHandState){
			case HandState.SEARCHING:
				if(m_hydraRef.HandTarget(m_hand)){
					if(m_hydraRef.HandTarget(m_hand) != m_heldObject){
						
						if(m_hydraRef.HandTarget(m_hand).CompareTag("Instrument")){
							m_heldObject = m_hydraRef.HandTarget(m_hand);
							m_heldObject.GetComponent<Rigidbody>().isKinematic = true;
							m_heldObject.transform.parent = this.gameObject.transform;
							m_toolHandState = BaseTool.HandState.HOLDING;
						}
					}
				}
				break;
			case HandState.RELEASING:	//Instrument floats in front of performer
				if(m_heldObject != null){
					m_heldObject.transform.parent = null;
					m_heldObject.GetComponent<Rigidbody>().isKinematic = false;
					m_heldObject = null;
				}
				break;
			case HandState.HOLDING:
				break;
			}
		}

	}
}
