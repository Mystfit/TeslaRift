using UnityEngine;
using System.Collections;

public class IdleTool : BaseTool {
	
	public IdleTool() {
	}
	
	public override void Update(){
		CheckForSelection();
	}
	
	protected void CheckForSelection(){
		/*
			if(m_leftHandController.GetButtonDown(SixenseButtons.TWO)){
				if(m_leftCollisionTarget != null){
					InstrumentAttachment instrument = m_leftCollisionTarget.GetComponent<InstrumentAttachment>();	
					m_instrumentControlRef.SelectInstrument(instrument.instrumentTarget);
				}
			}
			
			if(m_leftHandController.GetButtonUp(SixenseButtons.TWO)){
				//this.GetComponent<InstrumentController>().SelectInstrument(null);
			}
		*/
	}
}
