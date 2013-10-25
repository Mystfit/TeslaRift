using UnityEngine;
using System.Collections;
using MusicIO;

public class InstrumentGestureTool : BaseTool {
		
	GameObject m_heldObject;
	BaseAttachment<BaseMusicObject> m_attachment;
	
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
	
	public float m_betweenGestureDelay = 0.5f;
	protected float m_gestureTimer;
	protected GestureState m_gestureState;
	protected GestureState m_lastGestureState;
	public GestureState GetGestureState{ get { return m_gestureState; }}
	
	protected InstrumentAttachment m_selectedInstrumentAttach;

	public override void Awake ()
	{
		base.Awake ();
		m_gestureTimer = m_betweenGestureDelay;
	}
	
	public override void Init (ToolHand hand, ToolMode mode)
	{
		base.Init (hand, mode);		
	}

	public override void Update ()
	{
		Debug.Log("Entering:" + m_gestureState);

		CheckProximityStatus();
		
		switch(m_gestureState){

		case GestureState.INTERIOR:
			break;
			
		case GestureState.INTERIOR_TO_PROXIMITY:
			m_gestureTimer = m_betweenGestureDelay;
			m_gestureState = GestureState.PROXIMITY;
			m_lastGestureState = GestureState.INTERIOR_TO_PROXIMITY;
			break;
			
		case GestureState.PROXIMITY:
			//Cast rays checking for selected panel
			m_attachment.Gesture_IdleProximity();
			break;
			
		case GestureState.PROXIMITY_TO_INTERIOR:
			m_gestureTimer = m_betweenGestureDelay;
			m_gestureState = GestureState.INTERIOR;
			m_lastGestureState = GestureState.PROXIMITY_TO_INTERIOR;

			//Ready to send activate message on gesture release
			break;
			
		case GestureState.PROXIMITY_TO_EXTERIOR:
			m_gestureTimer = m_betweenGestureDelay;
			m_gestureState = GestureState.EXTERIOR;
			m_lastGestureState = GestureState.PROXIMITY_TO_EXTERIOR;
			//Ready to send queue message on gesture release
			break;
			
		case GestureState.EXTERIOR:
			break;
			
		case GestureState.EXTERIOR_TO_PROXIMITY:
			m_gestureTimer = m_betweenGestureDelay;
			m_gestureState = GestureState.PROXIMITY;
			m_lastGestureState = GestureState.EXTERIOR_TO_PROXIMITY;

			break;
		}
		
		m_gestureTimer -= Time.deltaTime;
		if(m_gestureTimer <= 0){
			m_gestureTimer = 0;
			m_lastGestureState = m_gestureState;
		}
		Debug.Log(m_gestureTimer);
		
		Debug.Log("Exiting:" + m_gestureState);

		base.Update ();
	}
	
	protected void CheckProximityStatus(){
		GameObject activeInterior = HydraController.Instance.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR);
		GameObject activeProximity = HydraController.Instance.HandTarget(m_hand, ProximityType.INSTRUMENT_PROXIMITY);
		
		if(activeProximity == m_heldObject){
			if(activeInterior == m_heldObject){
				//Inside interior
				if(m_gestureState == GestureState.PROXIMITY)
					m_gestureState = GestureState.PROXIMITY_TO_INTERIOR;
			} else {
				//Inside proximity
				if(m_gestureState == GestureState.INTERIOR){
					m_gestureState = GestureState.INTERIOR_TO_PROXIMITY;
					m_attachment.Gesture_First();
				} else if(m_gestureState == GestureState.EXTERIOR){
					m_gestureState = GestureState.EXTERIOR_TO_PROXIMITY;
				}
			}
		} else {
			//Outside proximity
			if(m_gestureState == GestureState.PROXIMITY)
				m_gestureState = GestureState.PROXIMITY_TO_EXTERIOR;
		}
	}
	

	public override void TransitionIn ()
	{
		base.TransitionIn ();
		
		m_heldObject = HydraController.Instance.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR);
		
		//Not holding anything? We can ditch this tool
		if(m_heldObject == null)
			ToolController.Instance.PopTool(m_hand);
		
		m_attachment = m_heldObject.GetComponent<BaseAttachment<BaseMusicObject> >();
		m_attachment.SetToolMode(m_mode);
		m_attachment.SetActiveHand(m_hand);
		m_gestureState = GestureState.INTERIOR;
	}
	
	public override void TransitionOut ()
	{
		base.TransitionOut ();
		
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
			
		//Moving gestures
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
	}
}
