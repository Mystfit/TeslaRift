using UnityEngine;
using System.Collections;

public class ResetTool : BaseTool {
	
	public GameObject m_heldObject;
	
	protected bool m_resetAll = false;

	public ResetTool() {
	}
	
	public override void Init(ToolHand hand, ToolMode mode){
		base.Init(hand, mode);
		if(mode == BaseTool.ToolMode.SECONDARY)
			SetResetAll();
	}
		
	
	public override void Awake(){
		base.Awake();
		m_toolHandState = BaseTool.HandState.SEARCHING;
	}
	
	public void SetResetAll(){
		m_resetAll = true;
	}
	
	public override void Update(){
		CheckForSelection();
		base.Update();
	}
	
	public override void TransitionOut(){
		if(m_heldObject != null){
			m_heldObject = null;
			m_toolHandState = BaseTool.HandState.RELEASING;
		}
	}

	public void CheckForSelection(){
		if(m_hydraRef != null){

			//Attach
			switch(m_toolHandState){
			case HandState.SEARCHING:
				if(m_hydraRef.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR)){
					if(m_hydraRef.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR) != m_heldObject){
						if(m_hydraRef.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR).CompareTag("Instrument")){
							m_heldObject = m_hydraRef.HandTarget(m_hand, ProximityType.INSTRUMENT_INTERIOR);
							
							//Either reset all the parameters or params + generators depending on the tool mode
							if(m_resetAll)
								m_heldObject.GetComponent<InstrumentAttachment>().ResetInstrument();
							else
								m_heldObject.GetComponent<InstrumentAttachment>().ResetParameters();
							
							m_toolHandState = BaseTool.HandState.HOLDING;
						}
					}
				}
				break;
			case HandState.RELEASING:	//Instrument floats in front of performer
				break;
			case HandState.HOLDING:
				break;
			}
		}

	}
}
