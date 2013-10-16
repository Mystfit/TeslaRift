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
	
	private static HydraController m_instance;
	
	//Member variables
	//-----------------------
	private SixenseInput.Controller m_leftHandController;
	private SixenseInput.Controller m_rightHandController;
	public GameObject m_leftHand;
	public GameObject m_rightHand;
	
	private GameObject m_leftCollisionTarget = null;
	private GameObject m_rightCollisionTarget = null;
	private List<GameObject> m_leftCollisionTargets;
	private List<GameObject> m_rightCollisionTargets;
	
	private HydraStates m_leftHandState;
	private HydraStates m_rightHandState;
	
	private ToolController m_toolControlRef;
	public GameObject instrumentController;
	private InstrumentController m_instrumentControlRef;
	
	private ArduinoController m_gloveController;
	
	public static HydraController Instance{ get { return m_instance; }}
	
	// Initialization
	//------------------
	void Awake() {
		m_leftHandState = HydraStates.LEFT_IDLE;
		m_rightHandState = HydraStates.RIGHT_IDLE;
		
		m_leftCollisionTargets = new List<GameObject>();
		m_rightCollisionTargets = new List<GameObject>();
		
		//Controllers
		m_toolControlRef = this.GetComponent<ToolController>();
		m_instrumentControlRef = instrumentController.GetComponent<InstrumentController>();
		m_gloveController = this.GetComponent<ArduinoController>();
		m_instance = this;
	}
	
	public SixenseInput.Controller GetHandController(BaseTool.ToolHand hand){
		if(hand == BaseTool.ToolHand.LEFT)
			return m_leftHandController;
		return m_rightHandController;
	}
	
	public GameObject HandTarget(BaseTool.ToolHand hand){
		/*if(hand == BaseTool.ToolHand.LEFT)
			return m_leftCollisionTarget;
		return m_rightCollisionTarget;*/
		
		List<GameObject> targetList = null;
		GameObject targetHand = null;
		
		if(hand == BaseTool.ToolHand.LEFT){
			targetList = m_leftCollisionTargets;
			targetHand = m_leftHand;
		} else if(hand == BaseTool.ToolHand.RIGHT){
			targetList = m_rightCollisionTargets;
			targetHand = m_rightHand;
		}
		
		float closestDistance = -1.0f;
		GameObject closestObject = null;
		
		if(targetList != null && targetHand != null){
			foreach(GameObject obj in targetList){
				float dist = Vector3.Distance(obj.transform.position, targetHand.transform.position);
				if(dist < closestDistance || closestDistance < 0){
					closestDistance = dist;
					closestObject = obj;
				}
			}
		}
		return closestObject;
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
	
	public void AddInstrumentCollision(GameObject instrument, GameObject handObj){
		SixenseHands hand = handObj.GetComponent<HydraHand>().Hand;
		Debug.Log ("Proximity check");
		
		if(hand == SixenseHands.LEFT){
			if(!m_leftCollisionTargets.Contains(instrument)){
				m_leftCollisionTargets.Add(instrument);
				Debug.Log ("Proximity trigger: " + instrument.name);
			}
		} else if(hand == SixenseHands.RIGHT){
			if(!m_rightCollisionTargets.Contains(instrument)){
				m_rightCollisionTargets.Add(instrument);
				Debug.Log ("Proximity trigger: " + instrument.name);
			}
		}
	}
	
	public void RemoveInstrumentCollision(GameObject instrument, GameObject handObj){
		SixenseHands hand = handObj.GetComponent<HydraHand>().Hand;
		
		if(hand == SixenseHands.LEFT){
			m_leftCollisionTargets.Remove(instrument);
		} else if(hand == SixenseHands.RIGHT){
			m_rightCollisionTargets.Remove(instrument);
		}
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
