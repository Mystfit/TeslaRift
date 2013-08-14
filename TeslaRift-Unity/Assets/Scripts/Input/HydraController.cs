using UnityEngine;
using System.Text;
using System.Collections;
using System;
using System.Collections.Generic;

public enum HydraStates
{
	LEFT_IDLE = 0,
	LEFT_HOLDING,
	
	RIGHT_IDLE,
	RIGHT_HOLDING
}

public class HydraController : MonoBehaviour {
	
	//Member variables
	//-----------------------
	private SixenseInput.Controller m_leftHandController;
	private SixenseInput.Controller m_rightHandController;
	private GameObject m_leftHand;
	private GameObject m_rightHand;
	
	private GameObject m_leftCollisionTarget = null;
	private GameObject m_rightCollisionTarget = null;
	
	private HydraStates m_leftHandState;
	private HydraStates m_rightHandState;
	
	private ChoreographController m_choreoControlRef;
	private ToolController m_toolControlRef;
	private InstrumentController m_instrumentControlRef;
	
	// Initialization
	//------------------
	void Start() {
		m_leftHand = GameObject.Find("hand_left");
		m_rightHand = GameObject.Find("hand_right");
		m_leftHandState = HydraStates.LEFT_IDLE;
		m_rightHandState = HydraStates.RIGHT_IDLE;
		
		//Controllers
		m_choreoControlRef = GameObject.Find("__PerformanceControllers").GetComponent<ChoreographController>();
		m_toolControlRef = GameObject.Find ("__PerformanceControllers").GetComponent<ToolController>();
		m_instrumentControlRef = GameObject.Find ("__PerformanceControllers").GetComponent<InstrumentController>();
	}
	
	
	//Collision Handlers
	//-------------------
	public void TriggerCollision(GameObject target, SixenseHands hand){
		if(target.tag != "SoundObj")
			return;
		
		if(hand == SixenseHands.LEFT)
			m_leftCollisionTarget = target;
		else
			m_rightCollisionTarget = target;
		
		Debug.Log(String.Format("{0} HIT HAND {1}", target, hand));
	}
	
	public void UnTriggerCollision(GameObject target, SixenseHands hand){
		if(target.tag != "SoundObj")
			return;
		
		if(hand == SixenseHands.LEFT)
			m_leftCollisionTarget = null;
		else
			m_rightCollisionTarget = null;
		
		Debug.Log(String.Format("{0} LEFT HAND {1}", target, hand));
		
	}
	
	
	// Updaters
	//-----------------------
	void Update () {
		if(m_leftHandController == null)
			m_leftHandController = SixenseInput.GetController( SixenseHands.LEFT );
				
		if(m_rightHandController == null)
			m_rightHandController = SixenseInput.GetController( SixenseHands.RIGHT );
			
		HandleTestGrabInput();
		HandleTestButtonInput();
		HandleTestKeyboardInput();
	}
	
	
	
	
	
	//Input handlers
	//------------------------
	void HandleTestGrabInput(){
		
		if(m_leftHandController != null){
				
			//Attach
			if(m_leftCollisionTarget && m_leftHandController.GetButton(SixenseButtons.TRIGGER)){
				m_leftCollisionTarget.GetComponent<Rigidbody>().isKinematic = true;
				m_leftCollisionTarget.transform.parent = m_leftHand.transform;
				m_leftHandState = HydraStates.LEFT_HOLDING;
			}
			
			//Release
			if(!m_leftHandController.GetButton(SixenseButtons.TRIGGER) && m_leftHandState == HydraStates.LEFT_HOLDING && m_leftCollisionTarget){
				m_leftCollisionTarget.GetComponent<Rigidbody>().isKinematic = false;
				m_leftCollisionTarget.transform.parent = null;
				m_leftHandState = HydraStates.LEFT_IDLE; 
			}
		}
		
		if(m_rightHandController != null){
			//Attach 
			if(m_rightCollisionTarget && m_rightHandController.GetButton(SixenseButtons.TRIGGER)){
				m_rightCollisionTarget.GetComponent<Rigidbody>().isKinematic = true;
				m_rightCollisionTarget.transform.parent = m_rightHand.transform;
				m_leftHandState = HydraStates.RIGHT_HOLDING; 
			}
		
			//Release
			if(!m_rightHandController.GetButton(SixenseButtons.TRIGGER) && m_rightHandState == HydraStates.RIGHT_HOLDING && m_rightCollisionTarget){
				m_rightCollisionTarget.GetComponent<Rigidbody>().isKinematic = false;
				m_rightCollisionTarget.transform.parent = null;
				m_leftHandState = HydraStates.RIGHT_IDLE; 
			}
		}
	}
	
	void HandleTestButtonInput(){
		
		float range = 400.0f;

		if(m_leftHandController != null){
			
			float L_YDist = m_leftHandController.Position.y;
			
			if(m_leftHandController.GetButtonDown(SixenseButtons.BUMPER)){
				m_choreoControlRef.playTestChord();
				
				
			} else if(m_leftHandController.GetButtonUp(SixenseButtons.BUMPER)) {
				m_choreoControlRef.stopTestChord();
			}
		}
		
		if(m_rightHandController != null){
			float R_XDist = m_rightHandController.Position.x;
			float R_YDist = m_rightHandController.Position.y;
			
			if(m_rightHandController.GetButton(SixenseButtons.BUMPER)){
				
				if(m_rightHandController.GetButton(SixenseButtons.BUMPER)){
					//m_choreoControl.m_testInstrument.addMessageToQueue("gate", (Math.Min( Math.Max(R_YDist, 0.0f), range)) / range);
					this.GetComponent<InstrumentController>().SelectedInstrument.getParamByName("gate").setVal((Math.Min( Math.Max(R_YDist, 0.0f), range)) / range);
				}
			}
		}
	}
	
	public void HandleTestKeyboardInput(){
		if(Input.GetKeyDown(KeyCode.UpArrow)){
			m_choreoControlRef.playTestChord();
		}
		
		if(Input.GetKeyUp(KeyCode.UpArrow)){
			m_choreoControlRef.stopTestChord();
		}
	}
}
