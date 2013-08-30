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
	public GameObject m_leftHand;
	public GameObject m_rightHand;
	
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
		m_leftHandState = HydraStates.LEFT_IDLE;
		m_rightHandState = HydraStates.RIGHT_IDLE;
		
		//Controllers
		m_choreoControlRef = GameObject.Find("__PerformanceControllers").GetComponent<ChoreographController>();
		m_toolControlRef = GameObject.Find ("__PerformanceControllers").GetComponent<ToolController>();
		m_instrumentControlRef = GameObject.Find ("__PerformanceControllers").GetComponent<InstrumentController>();
	}
	
	public SixenseInput.Controller GetHandController(BaseTool.ToolHand hand){
		if(hand == BaseTool.ToolHand.LEFT)
			return m_leftHandController;
		return m_rightHandController;
	}
	
	public GameObject HandTarget(BaseTool.ToolHand hand){
		if(hand == BaseTool.ToolHand.LEFT)
			return m_leftCollisionTarget;
		return m_rightCollisionTarget;
	}
	
	public GameObject GetHand(BaseTool.ToolHand hand){
		if(hand == BaseTool.ToolHand.LEFT)
			return m_leftHand;
		else
			return m_rightHand;
	}
	
	
	//Collision Handlers
	//-------------------
	public void TriggerCollision(GameObject target, SixenseHands hand){
		if(!target.CompareTag("Instrument") && !target.CompareTag("ParamPanel"))
			return;
		
		if(hand == SixenseHands.LEFT){
			m_leftCollisionTarget = target;
		}else{
			m_rightCollisionTarget = target;
		}
	}
	
	public void UnTriggerCollision(GameObject target, SixenseHands hand){
		if(!target.CompareTag("Instrument") && !target.CompareTag("ParamPanel"))
			return;
		
		if(hand == SixenseHands.LEFT)
			m_leftCollisionTarget = null;
		else
			m_rightCollisionTarget = null;
				
	}
	
	
	// Updaters
	//-----------------------
	void Update () {
		if(m_leftHandController == null)
			m_leftHandController = SixenseInput.GetController( SixenseHands.LEFT );
				
		if(m_rightHandController == null)
			m_rightHandController = SixenseInput.GetController( SixenseHands.RIGHT );
			
		//HandleTestGrabInput();
		
		SetCommonTools(m_leftHandController, BaseTool.ToolHand.LEFT);
		SetCommonTools(m_rightHandController, BaseTool.ToolHand.RIGHT);
		
		SetIndividualToolsLeft();
		SetIndividualToolsRight();
	}
	
	public void SetIndividualToolsLeft(){
	}
	
	public void SetIndividualToolsRight(){
		if(m_rightHandController != null)
		{
			if(m_rightHandController.GetButtonDown(SixenseButtons.FOUR)){
				m_instrumentControlRef.PrimeTesla();
			}
		}
	}
	
	//Common tools between each hand
	//-------------------------------
	public void SetCommonTools(SixenseInput.Controller handControl, BaseTool.ToolHand hand){
		if(handControl != null){
			//Left hand
			if(handControl.GetButtonDown(SixenseButtons.TRIGGER)){
				m_toolControlRef.PushTool(typeof(PhysGrabberTool), hand);
			}
			
			if(handControl.GetButtonDown(SixenseButtons.BUMPER)){
				m_toolControlRef.PushTool(typeof(ParamSelectTool), hand);
			}

			if(handControl.GetButtonDown(SixenseButtons.ONE)){
				m_toolControlRef.PushTool(typeof(SingleModifierTool), hand);
			}
			
			//Back to idle on tool release
			if(handControl.GetButtonUp(SixenseButtons.TRIGGER) ||
				handControl.GetButtonUp(SixenseButtons.BUMPER) ||
				handControl.GetButtonUp(SixenseButtons.ONE))
			{
				GameObject handObj = null;
				
				if(hand == BaseTool.ToolHand.LEFT)
					handObj = m_leftHand;
				else if(hand == BaseTool.ToolHand.RIGHT)
					handObj = m_rightHand;
				
				if(handObj != null){
					BaseTool tool = handObj.GetComponent(typeof(BaseTool)) as BaseTool;
					if(tool != null)
						tool.TransitionOut();
					
					m_toolControlRef.PopTool(hand);
				}
			}
		}
	}
	
	
	
	
	
	
	//Input handlers
	//------------------------
	void HandleTestGrabInput(){
		
		if(m_leftHandController != null){
				
			
			
			//Release
			if(!m_leftHandController.GetButton(SixenseButtons.TRIGGER) && m_leftHandState == HydraStates.LEFT_HOLDING && m_leftCollisionTarget){
				m_leftCollisionTarget.GetComponent<Rigidbody>().isKinematic = false;
				m_leftCollisionTarget.transform.parent = null;
				m_leftHandState = HydraStates.LEFT_IDLE; 
				//m_toolControlRef.StopTool(ToolController.ToolHand.LEFT);
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
			float L_XDist = m_leftHandController.Position.x;
			float L_YDist = m_leftHandController.Position.y;
			
			if(m_leftHandController.GetButton(SixenseButtons.BUMPER)){
				Debug.Log((Math.Min( Math.Max(L_YDist, 0.0f), range)) / range);
				//GameObject.Find("__PerformanceControllers").GetComponent<ChoreographController>().m_pitchBendRate = (Math.Min( Math.Max(L_YDist, 0.0f), range)) / range;
				//this.GetComponent<InstrumentController>().SelectedInstrument.getParamByName("gate").setVal((Math.Min( Math.Max(R_YDist, 0.0f), range)) / range);
			} else {
				//GameObject.Find("__PerformanceControllers").GetComponent<ChoreographController>().m_pitchBendRate = 0.5f;
			}
		}
		
		if(m_rightHandController != null){
			float R_XDist = m_rightHandController.Position.x;
			float R_YDist = m_rightHandController.Position.y;
			
			if(m_rightHandController.GetButton(SixenseButtons.BUMPER)){
				Debug.Log((Math.Min( Math.Max(R_YDist, 0.0f), range)) / range);
				//this.GetComponent<ChoreographController>().m_pitchBendRate = (Math.Min( Math.Max(R_YDist, 0.0f), range)) / range;
				//this.GetComponent<InstrumentController>().SelectedInstrument.getParamByName("gate").setVal((Math.Min( Math.Max(R_YDist, 0.0f), range)) / range);
			} else {
				//this.GetComponent<ChoreographController>().m_pitchBendRate = 0.5f;
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
