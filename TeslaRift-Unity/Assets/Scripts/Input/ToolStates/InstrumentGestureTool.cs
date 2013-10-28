using UnityEngine;
using System.Collections;
using System.Collections.Generic;

using MusicIO;

public class InstrumentGestureTool : BaseTool {
	
	/*
	 * Object we are interacting with
	 */
	protected GameObject m_heldObject;
	protected BaseAttachment m_attachment;
	
	/*
	 * Current position of tool relative to held object
	 */
	public enum GestureState{
		INTERIOR_INITIALIZED = 0,
		INTERIOR,
		INTERIOR_TO_PROXIMITY,
		PROXIMITY,
		PROXIMITY_TO_INTERIOR,
		PROXIMITY_TO_EXTERIOR,
		EXTERIOR,
		EXTERIOR_TO_PROXIMITY
	}
	
	/*
	 * Gesture state and timers
	 */
	public float m_betweenGestureDelay = 0.5f;
	protected float m_gestureTimer;
	protected GestureState m_gestureState;
	protected GestureState m_lastGestureState;
	public GestureState GetGestureState{ get { return m_gestureState; }}
	
	
	public override void Awake ()
	{
		base.Awake ();
		m_gestureTimer = m_betweenGestureDelay;
	}
	

	public override void Update ()
	{
		CheckProximityStatus();
		base.Update ();
	}
	
	
	/*
	 * Checks for position of tool relative to interacting object. 
	 */
	protected void CheckProximityStatus(){
		
		//Closest proximity triggers
		//--------------------------
		GameObject activeInterior = HydraController.Instance.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR);
		GameObject activeProximity = HydraController.Instance.HandTarget(m_hand, ProximityType.INSTRUMENT_PROXIMITY);
		
		//Set proximity state based on last state and current position
		//--------------------------
		if(activeProximity == m_heldObject){
			if(activeInterior == m_heldObject){
				//Inside interior
				if(m_gestureState == GestureState.PROXIMITY)
					m_gestureState = GestureState.PROXIMITY_TO_INTERIOR;
			} else {
				//Inside proximity
				if(m_gestureState == GestureState.INTERIOR)
					m_gestureState = GestureState.INTERIOR_TO_PROXIMITY;
				else if(m_gestureState == GestureState.EXTERIOR)
					m_gestureState = GestureState.EXTERIOR_TO_PROXIMITY;
			}
		} else {
			//Outside exterior
			if(m_gestureState == GestureState.PROXIMITY)
				m_gestureState = GestureState.PROXIMITY_TO_EXTERIOR;
		}
		
		//Trigger gesture actions for the held attachment
		//--------------------------
		switch(m_gestureState){

		case GestureState.INTERIOR:
			m_attachment.Gesture_IdleInterior();
			
			if(m_attachment.IsFirstGesture)
				m_attachment.Gesture_First();

			break;
			
		case GestureState.INTERIOR_TO_PROXIMITY:
			m_gestureTimer = m_betweenGestureDelay;
			m_gestureState = GestureState.PROXIMITY;
			m_lastGestureState = GestureState.INTERIOR_TO_PROXIMITY;
			break;
			
		case GestureState.PROXIMITY:
			m_attachment.Gesture_IdleProximity();
			
			if(m_attachment.IsFirstGesture)
				m_attachment.Gesture_First();
			
			break;
			
		case GestureState.PROXIMITY_TO_INTERIOR:
			m_gestureTimer = m_betweenGestureDelay;
			m_gestureState = GestureState.INTERIOR;
			m_lastGestureState = GestureState.PROXIMITY_TO_INTERIOR;
			break;
			
		case GestureState.PROXIMITY_TO_EXTERIOR:
			m_gestureTimer = m_betweenGestureDelay;
			m_gestureState = GestureState.EXTERIOR;
			m_lastGestureState = GestureState.PROXIMITY_TO_EXTERIOR;
			break;
			
		case GestureState.EXTERIOR:
			m_attachment.Gesture_IdleExterior();
			break;
			
		case GestureState.EXTERIOR_TO_PROXIMITY:
			m_gestureTimer = m_betweenGestureDelay;
			m_gestureState = GestureState.PROXIMITY;
			m_lastGestureState = GestureState.EXTERIOR_TO_PROXIMITY;

			break;
		}
		Debug.Log ("Gesture timer:" + m_gestureTimer);
		Debug.Log("Current: " + m_gestureState + " Last: " + m_lastGestureState + " Interior: " + activeInterior + " Proximity: " + activeProximity  );
		
		m_gestureTimer -= Time.deltaTime;
		if(m_gestureTimer <= 0){
			m_gestureTimer = 0;
			m_lastGestureState = m_gestureState;
		}	
	}
	
	
	/*
	 * Tool enter state
	 */
	public override void TransitionIn ()
	{
		m_heldObject = HydraController.Instance.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR);

		//Not holding anything? We can ditch this tool
		if(m_heldObject == null){
			ToolController.Instance.PopTool(m_hand);
		} else {
			m_attachment = m_heldObject.GetComponent<BaseAttachment>();
			
			m_gestureState = GestureState.INTERIOR;
			m_attachment.SetToolMode( m_mode);
			m_attachment.SetActiveHand( m_hand);
		}
	}
	
	
	/*
	 * Tool exit state
	 */
	public override void TransitionOut ()
	{		
		//Trigger gesture actions upon tool exit
		//--------------------------
		switch(m_lastGestureState){
			
		//Idle gestures
		case GestureState.INTERIOR:
			m_attachment.Gesture_ExitIdleInterior();
			break;
		case GestureState.PROXIMITY:			
			m_attachment.Gesture_ExitIdleProximity();
			break;
		case GestureState.EXTERIOR:				
			m_attachment.Gesture_ExitIdleExterior();
			break;
			
		case GestureState.EXTERIOR_TO_PROXIMITY:
			break;
		case GestureState.INTERIOR_TO_PROXIMITY:
			break;
		case GestureState.PROXIMITY_TO_EXTERIOR:
			m_attachment.Gesture_PullOut();
			break;
		case GestureState.PROXIMITY_TO_INTERIOR:
			m_attachment.Gesture_PushIn();
			break;
		}
		
		m_heldObject = null;
	
		if(m_attachment != null)
			m_attachment.Gesture_Exit();
	}
}
