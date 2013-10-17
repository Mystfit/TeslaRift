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

public enum ProximityType{ 
	INSTRUMENT_INTERIOR = 0,
	INSTRUMENT_PROXIMITY,
	GENERATOR
}

public class HydraController : MonoBehaviour {
	
	private static HydraController m_instance;
	public static HydraController Instance{ get { return m_instance; }}

	//Member variables
	//-----------------------
	private SixenseInput.Controller m_leftHandController;
	private SixenseInput.Controller m_rightHandController;
	public GameObject m_leftHand;
	public GameObject m_rightHand;
	
	//Collision lists
	//---------------
	private List<GameObject> m_leftInstrumentProximity;
	private List<GameObject> m_rightInstrumentProximity;
	private List<GameObject> m_leftInstrumentInterior;
	private List<GameObject> m_rightInstrumentInterior;
	
	private ToolController m_toolControlRef;
	public GameObject instrumentController;
	private InstrumentController m_instrumentControlRef;
	
	private ArduinoController m_gloveController;
	
	// Initialization
	//------------------
	void Awake() {
		//Collision lists
		m_leftInstrumentProximity = new List<GameObject>();
		m_rightInstrumentProximity = new List<GameObject>();
		m_leftInstrumentInterior = new List<GameObject>();
		m_rightInstrumentInterior = new List<GameObject>();
		
		//Controllers
		m_toolControlRef = ToolController.Instance;
		m_instrumentControlRef = InstrumentController.Instance;
		m_gloveController = this.GetComponent<ArduinoController>();
		m_instance = this;
	}
	
	
	/*
	 * Returns left/right hand controllers
	 */
	public SixenseInput.Controller GetHandController(BaseTool.ToolHand hand){
		if(hand == BaseTool.ToolHand.LEFT)
			return m_leftHandController;
		return m_rightHandController;
	}
	
	
	/*
	 * Gets the left/right hand gameObject
	 */
	public GameObject GetHand(BaseTool.ToolHand hand){
		if(hand == BaseTool.ToolHand.LEFT)
			return m_leftHand;
		else
			return m_rightHand;
	}
	
	
	/*
	 * Returns the the closest object to the hand in a specific proximity list
	 */
	public GameObject HandTarget(BaseTool.ToolHand hand, ProximityType proximityTarget){
		return GetClosestObjectInList( GetCollisionList(proximityTarget, BaseTool.ToolHandToSixenseHand(hand) ), GetHand(hand) );
	}
	
	
	/*
	 * Finds the nearest GameObject to a list of GameObjects
	 */
	public GameObject GetClosestObjectInList(List<GameObject> targetList, GameObject target){
		float closestDistance = -1.0f;
		GameObject closestObject = null;
		
		if(targetList != null && target != null){
			foreach(GameObject obj in targetList){
				float dist = Vector3.Distance(obj.transform.position, target.transform.position);
				if(dist < closestDistance || closestDistance < 0){
					closestDistance = dist;
					closestObject = obj;
				}
			}
		}
		
		return closestObject;
	}
	
	
	
	/*
	 * Adds a proximity target to a list of active colliders with a hand 
	 */
	public void AddCollision(GameObject proximityTarget, SixenseHands hand, ProximityType proximityType){		
		List<GameObject> targetList = GetCollisionList(proximityType, hand);
		
		if(!targetList.Contains(proximityTarget)){
			targetList.Add(proximityTarget);
			//Debug.Log ("Proximity trigger: " + proximityTarget.name + " Proximity type:"  + proximityType);
		}
	}
	
	
	/*
	 * Removes a proximity target from a list of active colliders with a hand 
	 */
	public void RemoveCollision(GameObject proximityTarget, SixenseHands hand, ProximityType proximityType){		
		List<GameObject> targetList = GetCollisionList(proximityType, hand);
		targetList.Remove(proximityTarget);
	}
	
	
	/*
	 * Gets a secific proximity collider list
	 */
	public List<GameObject> GetCollisionList(ProximityType proximityType, SixenseHands hand){
		
		List<GameObject> targetList = null;
		
		switch(proximityType){
			case ProximityType.INSTRUMENT_INTERIOR:
				if(hand == SixenseHands.LEFT)
					targetList = m_leftInstrumentInterior;
				else if(hand == SixenseHands.RIGHT)
					targetList = m_rightInstrumentInterior;
				break;
			case ProximityType.INSTRUMENT_PROXIMITY:
				if(hand == SixenseHands.LEFT)
					targetList = m_leftInstrumentProximity;
				else if(hand == SixenseHands.RIGHT)
					targetList = m_rightInstrumentProximity;
				break;
			case ProximityType.GENERATOR:
				break;
		}
	
		return targetList;
	}
	
	
	
	/*
	 * Updaters
	 */
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
				m_toolControlRef.PushTool(typeof(InstrumentGestureTool), hand, BaseTool.ToolMode.SECONDARY);	//Secondary mode does a full reset
			}
			
			//Full instrument reset
			//---------------------
			else if(handControl.GetButtonDown(SixenseButtons.BUMPER) && handControl.GetButton(SixenseButtons.THREE)){
				m_toolControlRef.PushTool(typeof(ResetTool), hand, BaseTool.ToolMode.SECONDARY);
			}
			
			//Parameter selector / Generator attachment
			//--------------------
			else if(handControl.GetButtonDown(SixenseButtons.BUMPER)){
				m_toolControlRef.PushTool(typeof(InstrumentGestureTool), hand);
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
