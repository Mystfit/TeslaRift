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
	
	private GloveController m_leftGlove;
	private GloveController m_rightGlove;
	
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
		m_instance = this;
		
		m_leftGlove = m_leftHand.GetComponent<GloveController>();
		//m_rightGlove = m_rightHand.GetComponent<GloveController>();
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
		
		if(!targetList.Contains(proximityTarget))
			targetList.Add(proximityTarget);
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
			
		
		SetCommonTools(BaseTool.ToolHand.LEFT);
		SetIndividualToolsRight(BaseTool.ToolHand.LEFT);
	}
	
	
	/*
	 * Sets tools for specifically th right controler (currently the only one being used. Will be changed)
	 */
	public void SetIndividualToolsRight(BaseTool.ToolHand hand){
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
		}
	}
	
	
	/*
	 * Common tools for each hand
	 */
	public void SetCommonTools(BaseTool.ToolHand hand){
					
		//Physics selector
		//------------
		if(m_leftGlove.GetGestureDown("CLOSED_HAND") || Input.GetKeyDown(KeyCode.Space)){
			m_toolControlRef.PushTool(typeof(PhysGrabberTool), hand, BaseTool.ToolMode.PRIMARY);
		}
		
		//Physics pull
		//------------
		else if(m_leftGlove.GetGestureDown("PINKY") || Input.GetKeyDown(KeyCode.LeftShift)){
			m_toolControlRef.PushTool(typeof(PhysGrabberTool), hand, BaseTool.ToolMode.SECONDARY);
		}
		
		//Gesture Selector Primary
		//--------------------
		else if(m_leftGlove.GetGestureDown("INDEX_POINT") || Input.GetKeyDown(KeyCode.W)){
			m_toolControlRef.PushTool(typeof(InstrumentGestureTool), hand, BaseTool.ToolMode.PRIMARY);
		}
		
					//Gesture selector secondary
		//--------------------
		else if(m_leftGlove.GetGestureDown("INDEX_MIDDLE") || Input.GetKeyDown(KeyCode.E)){
			m_toolControlRef.PushTool(typeof(InstrumentGestureTool), hand, BaseTool.ToolMode.SECONDARY);	//Secondary mode does a full reset
		}
	
		//Normal reset
		//--------------------
		/*else if(m_leftGlove.GetGestureDown("INDEX_POINT") || Input.GetKeyDown(KeyCode.W)){
			m_toolControlRef.PushTool(typeof(ResetTool), hand);
		}
		
		
		//Full instrument reset
		//---------------------
		else if(Input.GetKeyDown(KeyCode.D)){  
			m_toolControlRef.PushTool(typeof(ResetTool), hand, BaseTool.ToolMode.SECONDARY);
		}*/
		
		//Return to idle
		//--------------
		
		bool openHand = m_leftGlove.GetGestureDown("OPEN_HAND");
		
		if(Input.GetKeyUp (KeyCode.Space) ||
			Input.GetKeyUp(KeyCode.W) ||
			Input.GetKeyUp(KeyCode.S) ||
			Input.GetKeyUp(KeyCode.E) ||
			openHand )
		{
			m_toolControlRef.PopTool(hand);
		}
	}
	
}
