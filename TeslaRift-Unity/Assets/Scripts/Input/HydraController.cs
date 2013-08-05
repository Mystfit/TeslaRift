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
	
	// Initialization
	//------------------
	void Start() {
		m_leftHand = GameObject.Find("hand_left");
		m_rightHand = GameObject.Find("hand_right");
		m_leftHandState = HydraStates.LEFT_IDLE;
		m_rightHandState = HydraStates.RIGHT_IDLE;
	}
	
	
	//Collision Handlers
	//-------------------
	void CollidedWith(HandCollisionParams collisionParams){
		
		if(collisionParams.hand == SixenseHands.LEFT)
			m_leftCollisionTarget = collisionParams.target;
		else
			m_rightCollisionTarget = collisionParams.target;
		
		Debug.Log(String.Format("{0} HIT HAND {1}", collisionParams.target, collisionParams.hand));
	}
	
	void UnCollidedWith(HandCollisionParams collisionParams){
		
		if(collisionParams.hand == SixenseHands.LEFT)
			m_leftCollisionTarget = null;
		else
			m_rightCollisionTarget = null;
		
		Debug.Log(String.Format("{0} LEFT HAND {1}", collisionParams.target, collisionParams.hand));
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
		
		//All OSC specific stuff to be moved into the tool/instrument controllers!
		float[] testNote = {0.0f, 0.0f};
		float range = 400.0f;
		
		if(m_leftHandController != null){
//			
//			float L_YDist = m_leftHandController.Position.y;
//			
//			if(m_leftHandController.GetButton(SixenseButtons.BUMPER)){
//				
//				testNote[0] = (Math.Min( Math.Max(L_YDist, 0.0f), range)) / range;
//				testNote[1] = 0.8f;
//				
//				List<float> testNoteParams = new List<float>(testNote);
//				OSCHandler.Instance.SendMessageToClient("Live", "/tesla/noteOn", 1);
//				OSCHandler.Instance.SendMessageToClient("Live", "/tesla/noteparams", testNoteParams);
//				OSCHandler.Instance.SendMessageToClient("Live", "/tesla/noteOn", 0);
//
//			} else {
//				OSCHandler.Instance.SendMessageToClient("Live", "/tesla/noteOn", 0);				
//			}
			float L_XDist = m_leftHandController.Position.x;
			float L_YDist = m_leftHandController.Position.y;
			
			if(m_leftHandController.GetButton(SixenseButtons.BUMPER)){
				testNote[0] = (Math.Min( Math.Max(L_XDist, -range), -range)) / range;
				testNote[1] = (Math.Min( Math.Max(L_YDist, 0.0f), range)) / range;
	
				List<float> testNoteParams = new List<float>(testNote);
				OSCHandler.Instance.SendMessageToClient("Live", "/tesla/kaossPad", testNoteParams);
				OSCHandler.Instance.SendMessageToClient("Live", "/tesla/kaossOn", 1.0);
			} else {
				OSCHandler.Instance.SendMessageToClient("Live", "/tesla/kaossOn", 0.0);
			}
		}
		
		if(m_rightHandController != null){
			float R_XDist = m_rightHandController.Position.x;
			float R_YDist = m_rightHandController.Position.y;
			
			if(m_rightHandController.GetButton(SixenseButtons.BUMPER)){
				testNote[1] = (Math.Min( Math.Max(R_XDist, 0.0f), range)) / range;
				testNote[0] = (Math.Min( Math.Max(R_YDist, 0.0f), range)) / range;
					
				Debug.Log(String.Format("{0}, {1}",testNote[0], testNote[1]));

				List<float> testNoteParams = new List<float>(testNote);
				OSCHandler.Instance.SendMessageToClient("Live", "/tesla/kpPad", testNoteParams);
				OSCHandler.Instance.SendMessageToClient("Live", "/tesla/kpOn", 1.0);
			} else {
				OSCHandler.Instance.SendMessageToClient("Live", "/tesla/kpOn", 0.0);
			}
		}
	}
}
