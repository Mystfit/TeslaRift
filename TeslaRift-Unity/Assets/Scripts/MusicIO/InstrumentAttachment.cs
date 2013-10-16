using UnityEngine;
using System.Collections;

public class InstrumentAttachment : BaseAttachment {
	
	//Debug clip changing
	public bool triggerClip;
	public int clipIndex;
	
	private BaseInstrument m_instrumentRef;
	
	
	protected override void Start () {
		base.Start();
	}
	
	void Update () {
		//Debug tests for clip changing
		if(triggerClip == true){
			triggerClip = false;
			m_instrumentRef.addClipMessageToQueue(m_instrumentRef.GetClipByIndex(clipIndex).scene);
		}
	}
	
	public override void SetSelected (bool state)
	{
		base.SetSelected (state);
	}
	
	public void Init(BaseInstrument instrument){
		m_instrumentRef = instrument;
	}
	
	public void ResetParameters(){
		PanelToggle[] panelList = transform.GetComponentsInChildren<PanelToggle>();
		foreach(PanelToggle panel in panelList)
			panel.Toggle(false);
		
		m_instrumentControlRef.ResetInstrumentParameters(m_instrumentRef);
	}
	
	public void ResetInstrument(){
		PanelToggle[] panelList = transform.GetComponentsInChildren<PanelToggle>();
		
		
		foreach(PanelToggle panel in panelList){
			//Turn text off
			panel.Toggle(false);
			
			//Turn lines off
			GeneratorLine[] lines = panel.gameObject.GetComponents<GeneratorLine>();
			foreach(GeneratorLine line in lines)
				line.Remove();
		}

		m_instrumentControlRef.ResetInstrument(m_instrumentRef);
	}
	
	public BaseInstrument instrumentRef{ get {return m_instrumentRef; } }
}
