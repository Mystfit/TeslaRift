using UnityEngine;
using System.Collections;

public class InstrumentGestureTool : BaseTool {
	
	GameObject m_heldObject;
	
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
	protected GestureState m_gestureState;
	public GestureState GetGestureState{ get { return m_gestureState; }}
	
	protected InstrumentAttachment.RadialType m_openRadialType;
	protected bool bOpenRadial = false;
	public bool IsRadialOpen{ get { return bOpenRadial; }}
	
	protected ParamAttachment m_selectedParam;
	protected InstrumentAttachment m_selectedInstrumentAttach;

	public override void Awake ()
	{
		base.Awake ();
	}
	
	public override void Init (ToolHand hand, ToolMode mode)
	{
		base.Init (hand, mode);
		
		m_selectedInstrumentAttach = m_heldObject.GetComponent<InstrumentAttachment>();
		m_gestureState = GestureState.INTERIOR_INITIALIZED;
		
		if(mode == BaseTool.ToolMode.PRIMARY)
			m_openRadialType = InstrumentAttachment.RadialType.PARAM;
		else if(mode == BaseTool.ToolMode.SECONDARY)
			m_openRadialType = InstrumentAttachment.RadialType.CLIP;
	}

	public override void Update ()
	{
		Debug.Log("Entering:" + m_gestureState);

		CheckProximityStatus();
		
		switch(m_gestureState){
			
		case GestureState.INTERIOR_INITIALIZED:
			break;
			
		case GestureState.INTERIOR:
			break;
			
		case GestureState.INTERIOR_TO_PROXIMITY:
			
			if(m_heldObject){
				//On first pass, open radial menu
				if(bOpenRadial)
					m_selectedInstrumentAttach.OpenRadial(m_openRadialType);
				
			}
			
			m_gestureState = GestureState.PROXIMITY;
			
			break;
			
		case GestureState.PROXIMITY:
			//Cast rays checking for selected panel
			CheckForSelection();
			break;
			
		case GestureState.PROXIMITY_TO_INTERIOR:
			m_gestureState = GestureState.INTERIOR;
			//Ready to send activate message on gesture release
			break;
			
		case GestureState.PROXIMITY_TO_EXTERIOR:
			m_gestureState = GestureState.EXTERIOR;
			//Ready to send queue message on gesture release
			break;
			
		case GestureState.EXTERIOR:
			break;
			
		case GestureState.EXTERIOR_TO_PROXIMITY:
			m_gestureState = GestureState.PROXIMITY;
			break;
		}
		
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
				if(m_gestureState == GestureState.INTERIOR || m_gestureState == GestureState.INTERIOR_INITIALIZED){
					//First gesture. Flag the radial menu to be opened.
					if(m_gestureState == GestureState.INTERIOR_INITIALIZED)
						bOpenRadial = true;
					m_gestureState = GestureState.INTERIOR_TO_PROXIMITY;
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
	
	/*
	 * Check for ray collisions with parameters
	 */
	public void CheckForSelection(){
		
		//Check for panel collisions
		RaycastHit hit;
		GameObject hand =  HydraController.Instance.GetHand(m_hand);
		int mask = ~LayerMask.NameToLayer("ParamSelectable");
		Vector3 dir = hand.transform.position - m_heldObject.transform.position;
		
		if(Physics.Raycast(m_heldObject.transform.position, dir, out hit, dir.magnitude*10.0f, mask )){
			
			//Toggle the panel and attach any generators if required
			ParamAttachment attach = hit.collider.gameObject.GetComponent<ParamAttachment>();
			
			if(attach != null){
				if(m_selectedParam != null)
					m_selectedParam.SetHovering(false);
				m_selectedParam = attach;
				m_selectedParam.SetHovering(true);
			}
		}
		
		Debug.DrawRay(m_heldObject.transform.position, dir, Color.red);
	}

	public override void TransitionIn ()
	{
		base.TransitionIn ();
		
		m_heldObject = HydraController.Instance.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR);
		m_gestureState = GestureState.INTERIOR;
		
		if(m_heldObject == null)
			ToolController.Instance.PopTool(m_hand);
	}
	
	public override void TransitionOut ()
	{
		base.TransitionOut ();
		
		if( m_selectedParam != null ){
			m_selectedParam.SetHovering(false);

			switch(m_gestureState){
			case GestureState.INTERIOR:
				InstrumentController.Instance.ResetInstrumentParameters( m_heldObject.GetComponent<InstrumentAttachment>().instrumentRef );
				m_selectedParam.ToggleSelected();	//Activate parameter
				break;
			case GestureState.PROXIMITY:			//Nothing
				break;
			case GestureState.EXTERIOR:				//Queue parameter
				m_selectedParam.ToggleSelected();
				break;
			}
		}
		
		if(m_selectedInstrumentAttach != null){
			m_selectedInstrumentAttach.CloseRadial(m_openRadialType);
		}

		
		m_heldObject = null;
	}
}
