using UnityEngine;
using System.Collections;

public class InstrumentAttachment : BaseAttachment {
	
	private BaseInstrument m_instrumentRef;

	// Use this for initialization
	protected override void Awake () {
		base.Awake();
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public override void SetSelected (bool state)
	{
		base.SetSelected (state);
	}
	
	public void Init(BaseInstrument instrument){
		m_instrumentRef = instrument;
	}
	
	public void ResetParameters(){
		ParamAttachment[] panelList = transform.GetComponentsInChildren<ParamAttachment>();
		foreach(ParamAttachment panel in panelList)
			panel.SetSelected(false);
		
		m_instrumentControlRef.ResetInstrumentParameters(m_instrumentRef);
	}
	
	public void ResetInstrument(){
		ParamAttachment[] panelList = transform.GetComponentsInChildren<ParamAttachment>();
		
		foreach(ParamAttachment panel in panelList){
			//Turn text off
			panel.SetSelected(false);
			
			//Turn lines off
			GeneratorLine[] lines = panel.gameObject.GetComponents<GeneratorLine>();
			foreach(GeneratorLine line in lines)
				line.Remove();
		}

		m_instrumentControlRef.ResetInstrument(m_instrumentRef);
	}
	
	public BaseInstrument instrumentRef{ get {return m_instrumentRef; } }
	
	
}
