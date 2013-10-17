using UnityEngine;
using System.Collections;

public class InstrumentAttachment : BaseAttachment {
	
	//Debug clip changing
	public bool triggerClip;
	public int clipIndex;
	
	private BaseInstrument m_instrumentRef;
	public BaseInstrument instrumentRef{ get {return m_instrumentRef; } }
	
	//Radial menu references
	public GameObject m_clipRadial;
	public GameObject m_paramRadial;
	
	public enum RadialType {
		CLIP = 0,
		PARAM,
		CLOSED
	}

	
	protected override void Start () {
		base.Start();
	}
	
	
	public void Init(BaseInstrument instrument){
		m_instrumentRef = instrument;
	}
	
	
	void Update () {
		//Debug tests for clip changing
		if(triggerClip == true){
			triggerClip = false;
			m_instrumentRef.addClipMessageToQueue(m_instrumentRef.GetClipByIndex(clipIndex).scene);
		}
	}
	
	public void AddRadial(GameObject radialMenu, RadialType type){
		if(type == RadialType.CLIP)
			m_clipRadial = radialMenu; 
		else if(type == RadialType.PARAM)
			m_paramRadial = radialMenu; 
	}
	
	
	public void OpenRadial(RadialType type){
		if(type == RadialType.CLIP){
			m_clipRadial.SetActive(true);
			iTween.Stop(m_clipRadial);
			iTween.ScaleTo(m_clipRadial, iTween.Hash("scale", new Vector3(1.0f, 1.0f, 1.0f), "time", 0.4f, "easetype", "easeOutCubic"));
		} else if(type == RadialType.PARAM){
			m_paramRadial.SetActive(true);
			iTween.Stop(m_paramRadial);
			iTween.ScaleTo(m_paramRadial, iTween.Hash("scale", new Vector3(1.0f, 1.0f, 1.0f), "time", 0.4f, "easetype", "easeOutCubic"));
		}
	}
	
	public void CloseRadial(RadialType type){
		if(type == RadialType.CLIP){
			//m_clipRadial.SetActive(true);
			iTween.ScaleTo(m_clipRadial, iTween.Hash("scale", new Vector3(0.0f, 0.0f, 0.0f), "time", 0.4f, "easetype", "easeInCubic",  "delay", 2.0f));
		} else if(type == RadialType.PARAM){
			//m_paramRadial.SetActive(true);
			iTween.ScaleTo(m_paramRadial, iTween.Hash("scale", new Vector3(.0f, .0f, 0.0f), "time", 0.4f, "easetype", "easeInCubic", "delay", 2.0f));
		}
	}

	
	
	/*
	 * Deselcts all selected parameters on instrument
	 */
	public void ResetParameters(){
		PanelToggle[] panelList = transform.GetComponentsInChildren<PanelToggle>();
		foreach(PanelToggle panel in panelList)
			panel.Toggle(false);
		
		m_instrumentControlRef.ResetInstrumentParameters(m_instrumentRef);
	}
	
	
	/*
	 * Deselects all parameters on instrument and disconnects all attached generators
	 */
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
}
