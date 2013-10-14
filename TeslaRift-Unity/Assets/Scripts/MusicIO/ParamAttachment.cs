using UnityEngine;
using System.Collections;

public class ParamAttachment : BaseAttachment {

	private BaseInstrumentParam m_paramRef;

	// Use this for initialization
	protected override void Start () {
		//transform.GetComponentInChildren<Renderer>().material.SetColor("_Color", Color.black);
		base.Start();
	}
	
	// Update is called once per frame
	void Update () {
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
	
	public void setSelected(bool state){ 
		m_selected = state; 
	}
	
	public void Init(BaseInstrumentParam param){
		m_paramRef = param;
	}
	
	public BaseInstrumentParam paramRef{ get {return m_paramRef; } }
	
}
