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
	
	private ToolController m_toolControlRef;
	private InstrumentController m_instrumentControlRef;
	
	// Initialization
	//------------------
	void Start() {
		m_leftHandState = HydraStates.LEFT_IDLE;
		m_rightHandState = HydraStates.RIGHT_IDLE;
		
		//Controllers
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
		if(m_leftHandController != null)
		{
			if(m_leftHandController.GetButtonDown(SixenseButtons.TWO)){
				m_instrumentControlRef.DeselectAllParameters();
			}
			
			if(m_leftHandController.GetButton(SixenseButtons.BUMPER) && m_leftHandController.GetButton(SixenseButtons.TRIGGER)){
			
				if(m_toolControlRef.currentTool(BaseTool.ToolHand.LEFT).GetType() == typeof(PhysGrabberTool)){
					PhysGrabberTool physTool = m_toolControlRef.currentTool(BaseTool.ToolHand.LEFT) as PhysGrabberTool;
					physTool.ApplyForceToInstruments(PhysGrabberTool.PhysDirection.BLOW);
				}
			}
		}
	}
	
	public void SetIndividualToolsRight(){
		if(m_rightHandController != null)
		{
			if(m_rightHandController.GetButtonDown(SixenseButtons.TWO)){
				m_instrumentControlRef.PrimeTesla();
			}
			
			if(m_rightHandController.GetButton(SixenseButtons.BUMPER) && m_rightHandController.GetButton(SixenseButtons.TRIGGER)){
			
				if(m_toolControlRef.currentTool(BaseTool.ToolHand.RIGHT).GetType() == typeof(PhysGrabberTool)){
					PhysGrabberTool physTool = m_toolControlRef.currentTool(BaseTool.ToolHand.RIGHT) as PhysGrabberTool;
					physTool.ApplyForceToInstruments(PhysGrabberTool.PhysDirection.SUCK);
				}
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
			
			if(handControl.GetButtonDown(SixenseButtons.BUMPER) && !handControl.GetButton(SixenseButtons.TRIGGER)){
				if(m_toolControlRef.currentTool(hand) == null)
					m_toolControlRef.PushTool(typeof(ParamSelectTool), hand);
				else
					Debug.Log("Existing tool still active");
			}

			if(handControl.GetButtonDown(SixenseButtons.ONE)){
				if(m_toolControlRef.currentTool(hand) == null)
					m_toolControlRef.PushTool(typeof(SingleModifierTool), hand);
				else
					Debug.Log("Existing tool still active");
				
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
				
				if(handControl.GetButton(SixenseButtons.TRIGGER) || handControl.GetButton(SixenseButtons.BUMPER)){
					Debug.Log("Still in physics mode!");
				} else {
					if(handObj != null){
						BaseTool tool = handObj.GetComponent(typeof(BaseTool)) as BaseTool;
						if(tool != null)
							tool.TransitionOut();
						
						m_toolControlRef.PopTool(hand);
					}
				}
			}
		}
	}
}
