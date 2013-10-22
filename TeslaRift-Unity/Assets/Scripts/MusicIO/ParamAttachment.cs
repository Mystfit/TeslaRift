using UnityEngine;
using System.Collections;
using MusicIO;

public class ParamAttachment : BaseAttachment {

	private BaseInstrumentParam m_paramRef;
	
	public bool isHovering = false;

	public override void Start () {
		base.Start();
	}
	
	public override void Update () {
		if(!m_paramRef.enabled)
			SetSelected(false);
		base.Update();
	}
	
	public override void ToggleSelected(){
		SetSelected(!m_selected);
	}
	
	public void AddGenerator(BaseGenerator gen){
		m_paramRef.attachGenerator(gen);
	}
	
	public void DisconnectGenerators(){
		m_paramRef.removeGenerators();
	}
		
	public override void SetSelected (bool state)
	{
		base.SetSelected (state);
		
		if(state)
			m_instrumentControlRef.SelectParameter(m_paramRef);
		else
			m_instrumentControlRef.DeselectParameter(m_paramRef);
		
		if(state)
			gameObject.GetComponent<PanelToggle>().Toggle(true);
		else
			gameObject.GetComponent<PanelToggle>().Toggle(false);
	}
	
	public void SetHovering(bool state){
		if(state)
			gameObject.GetComponent<PanelToggle>().HoverToggle(true);
		else
			gameObject.GetComponent<PanelToggle>().HoverToggle(false);
	}
	
	public void setSelected(bool state){ 
		m_selected = state; 
	}
	
	public override void Init<T>(T param){
		m_paramRef = (BaseInstrumentParam)(object)param;
	}
	
	public BaseInstrumentParam paramRef{ get {return m_paramRef; } }
	
}
