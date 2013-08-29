using UnityEngine;
using System.Collections;

public class ParamAttachment : BaseAttachment {

	private BaseInstrumentParam m_paramRef;

	// Use this for initialization
	protected override void Start () {
		base.Start();
	}
	
	// Update is called once per frame
	void Update () {
	}
	
	public override void ToggleSelected(){
		SetSelected(!m_selected);
	}
		
	public override void SetSelected (bool state)
	{
		base.SetSelected (state);
		
		if(state)
			m_instrumentControlRef.SelectParameter(m_paramRef);
		else
			m_instrumentControlRef.DeselectParameter(m_paramRef);
		
		//Debug colours
		if(state)
			this.renderer.material.SetColor("_Color", Color.blue);
		else
			this.renderer.material.SetColor("_Color", Color.white);

	}
	
	public void setSelected(bool state){ m_selected = state; }
	
	public void Init(BaseInstrumentParam param){
		m_paramRef = param;
	}
	
	public BaseInstrumentParam paramRef{ get {return m_paramRef; } }
	
}
