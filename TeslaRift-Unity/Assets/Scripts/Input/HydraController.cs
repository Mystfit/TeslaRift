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
	public GameObject instrumentController;
	private InstrumentController m_instrumentControlRef;
	
	private ArduinoController m_gloveController;
	
	// Initialization
	//------------------
	void Start() {
		m_leftHandState = HydraStates.LEFT_IDLE;
		m_rightHandState = HydraStates.RIGHT_IDLE;
		
		//Controllers
		m_toolControlRef = this.GetComponent<ToolController>();
		m_instrumentControlRef = instrumentController.GetComponent<InstrumentController>();
		m_gloveController = this.GetComponent<ArduinoController>();
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
		if(!target.CompareTag("Instrument")
			&& !target.CompareTag("ParamPanel")
			&& !target.CompareTag("Generator"))
		{
			return;
		}

		
		if(hand == SixenseHands.LEFT){
			m_leftCollisionTarget = target;
		}else{
			m_rightCollisionTarget = target;
		}
	}
	
	public void UnTriggerCollision(GameObject target, SixenseHands hand){
		if(!target.CompareTag("Instrument") 
			&& !target.CompareTag("ParamPanel") 
			&& !target.CompareTag("Generator"))
		{
			return;
		}
		
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
			
		
		//SetCommonTools(m_leftHandController, BaseTool.ToolHand.LEFT);
		SetCommonTools(m_rightHandController, BaseTool.ToolHand.RIGHT);
		SetIndividualToolsLeft(m_leftHandController, BaseTool.ToolHand.LEFT);
		SetIndividualToolsRight(m_rightHandController, BaseTool.ToolHand.RIGHT);
	}
	
	//Arduino controlled glove
	public void SetIndividualToolsLeft(SixenseInput.Controller handControl, BaseTool.ToolHand hand){
		if(m_leftHandController != null)
		{
			//Arduino grabber
			//---------------
			if( m_gloveController.GetButtonDown(ArduinoController.GloveButton.ONE)) {
				m_toolControlRef.PushTool(typeof(PhysGrabberTool), hand);
			}
			
			//Arduino selector
			//----------------
			if( m_gloveController.GetButtonDown(ArduinoController.GloveButton.TWO)) {
				m_toolControlRef.PushTool(typeof(ParamSelectTool), hand);
			}
			
			//Arduino idle
			//------------
			if(m_gloveController.GetButtonUp(ArduinoController.GloveButton.TWO) ||
				m_gloveController.GetButtonUp(ArduinoController.GloveButton.ONE))
			{
				GameObject handObj = null;
				
				if(hand == BaseTool.ToolHand.LEFT)
					handObj = m_leftHand;
				else if(hand == BaseTool.ToolHand.RIGHT)
					handObj = m_rightHand;
				
				if(handObj != null){
					BaseTool tool = handObj.GetComponent(typeof(BaseTool)) as BaseTool;
					m_toolControlRef.PopTool(hand);
				}
			}
		}
	}
	
	public void SetIndividualToolsRight(SixenseInput.Controller handControl, BaseTool.ToolHand hand){
		if(m_rightHandController != null)
		{	
			//Hand calibration
			//----------------
			if(m_rightHandController.GetButton( SixenseButtons.START )){
				m_leftHand.GetComponent<HydraHand>().SetEnabled(false);
				m_rightHand.GetComponent<HydraHand>().SetEnabled(false);
			}
			
			if ( m_rightHandController.GetButtonUp( SixenseButtons.START )){
				m_leftHand.GetComponent<HydraHand>().ActivateHand(m_leftHandController);
				m_rightHand.GetComponent<HydraHand>().ActivateHand(m_rightHandController);
			} 
			
			else if(m_rightHandController.GetButton(SixenseButtons.START) && m_rightHandController.GetButtonUp(SixenseButtons.BUMPER)){
				gameObject.GetComponent<SixenseInput>().RebindHands();
			} 
			
			else if(m_rightHandController.GetButton(SixenseButtons.START) && m_rightHandController.GetButtonUp(SixenseButtons.FOUR)){
				GameObject.Find("OVRPlayerController").GetComponent<OVRMainMenu>().CalibrateMag();
			}
			
			
			//Param deselector
			//------------
			if(handControl.GetButtonDown(SixenseButtons.THREE)){
				if(m_toolControlRef.currentTool(hand) == null)
					m_toolControlRef.PushTool(typeof(ResetTool), hand);
				else
					Debug.Log("Existing tool still active");
				
			}
			
			//Physics pull
			//------------
			if(m_rightHandController.GetButton(SixenseButtons.TWO) && m_rightHandController.Trigger > 0.1f){
				if(m_toolControlRef.currentTool(BaseTool.ToolHand.RIGHT).GetType() == typeof(PhysGrabberTool)){
					PhysGrabberTool physTool = m_toolControlRef.currentTool(BaseTool.ToolHand.RIGHT) as PhysGrabberTool;
					physTool.ApplyForceToInstruments(PhysGrabberTool.PhysDirection.SUCK, m_rightHandController.Trigger);
				}
			}
		}
	}
	
	//Common tools between each hand
	//-------------------------------
	public void SetCommonTools(SixenseInput.Controller handControl, BaseTool.ToolHand hand){
		if(handControl != null){
			
			//Physics selector
			//------------
			if(handControl.GetButtonDown(SixenseButtons.TWO)){
				m_toolControlRef.PushTool(typeof(PhysGrabberTool), hand);
			}
			
			//Parameter deselector
			//--------------------
			if(handControl.GetButtonDown(SixenseButtons.BUMPER) && handControl.GetButton(SixenseButtons.FOUR)){
				Debug.Log("BANG");
				m_toolControlRef.PushTool(typeof(ParamSelectTool), hand, BaseTool.Mode.SECONDARY);	//Secondary mode does a full reset
			}
			
			//Full instrument reset
			//---------------------
			else if(handControl.GetButtonDown(SixenseButtons.BUMPER) && handControl.GetButton(SixenseButtons.THREE)){
				m_toolControlRef.PushTool(typeof(ResetTool), hand, BaseTool.Mode.SECONDARY);
			}
			
			//Parameter selector / Generator attachment
			//--------------------
			else if(handControl.GetButtonDown(SixenseButtons.BUMPER)){
				m_toolControlRef.PushTool(typeof(ParamSelectTool), hand);
			} 
			
			//Value modifier
			//--------------
			if(handControl.GetButtonDown(SixenseButtons.ONE)){
				if(m_toolControlRef.currentTool(hand) == null)
					m_toolControlRef.PushTool(typeof(SingleModifierTool), hand);
				else
					Debug.Log("Existing tool still active");
				
			}
			
			//Return to idle
			//--------------
			if(handControl.GetButtonUp(SixenseButtons.TWO) ||
				handControl.GetButtonUp(SixenseButtons.BUMPER) ||
				handControl.GetButtonUp(SixenseButtons.ONE) || 
				handControl.GetButtonUp(SixenseButtons.THREE) || 
				handControl.GetButtonUp(SixenseButtons.FOUR)) 
			{
				GameObject handObj = null;
				
				if(hand == BaseTool.ToolHand.LEFT)
					handObj = m_leftHand;
				else if(hand == BaseTool.ToolHand.RIGHT)
					handObj = m_rightHand;
				
				if(handControl.GetButton(SixenseButtons.TWO) || handControl.GetButton(SixenseButtons.BUMPER)){
					Debug.Log("Still in physics mode!");
				} else {
					if(handObj != null){
						BaseTool tool = handObj.GetComponent(typeof(BaseTool)) as BaseTool;
						m_toolControlRef.PopTool(hand);
					}
				}
			}
		}
	}
}
