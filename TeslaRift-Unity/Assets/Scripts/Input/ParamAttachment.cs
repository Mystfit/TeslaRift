using UnityEngine;
using System.Collections;

public class ParamAttachment : BaseAttachment {

	private BaseInstrumentParam m_paramRef;
	private GameObject m_innerRotaryFill;
	private GameObject m_innerRotaryOutline;
	private GameObject m_outerRotaryFill;
	private GameObject m_outerRotaryOutline;
	private TextMesh m_panelLabel;

	

	// Use this for initialization
	protected override void Awake () {
		//transform.GetComponentInChildren<Renderer>().material.SetColor("_Color", Color.black);
		m_innerRotaryFill = transform.FindChild("rotaryDialValue").FindChild("rotaryFill").gameObject;
		m_outerRotaryFill = transform.FindChild("rotaryDialScaler").FindChild("rotaryFill").gameObject;
		m_innerRotaryOutline = transform.FindChild("rotaryDialValue").FindChild("rotaryOutline").gameObject;
		m_outerRotaryOutline = transform.FindChild("rotaryDialScaler").FindChild("rotaryOutline").gameObject;
		
		m_panelLabel = transform.GetComponentInChildren<TextMesh>();
		m_panelLabel.renderer.material.SetColor("_Color", Color.black);
		m_panelLabel.color = Color.black;
		
		base.Awake();
	}
	
	public void Init(BaseInstrumentParam param){
		m_paramRef = param;
		if(paramRef.darkColor != null && paramRef.lightColor != null){
			//Debug.Log ( paramRef.darkColor);
			//m_innerRotaryFill.renderer.material.SetColor("_Emission", paramRef.darkColor);
			//m_outerRotaryFill.renderer.material.SetColor("_Emission", paramRef.lightColor);
		}
	}
	
	// Update is called once per frame
	void Update () {
		m_innerRotaryOutline.renderer.material.SetColor("_Color", paramRef.lightColor);
		m_outerRotaryOutline.renderer.material.SetColor("_Color", paramRef.darkColor);
		m_innerRotaryFill.renderer.material.SetColor("_Emission", paramRef.lightColor);
		m_outerRotaryFill.renderer.material.SetColor("_Emission", paramRef.darkColor);
		
		m_innerRotaryFill.renderer.material.SetFloat("_Cutoff", 1.0f - paramRef.val);
		m_outerRotaryFill.renderer.material.SetFloat("_Cutoff", 1.0f - paramRef.scale);
	}
	
	public override void ToggleSelected(){
		SetSelected(!m_selected);
	}
	
	public void AddGenerator(BaseGenerator gen){
		m_paramRef.attachGenerator(gen);
	}
	
	public BaseInstrumentParam paramRef{ get {return m_paramRef; } }

	
	public void DisconnectGenerators(){
		m_paramRef.removeGenerators();
	}
		
	public override void SetSelected (bool state)
	{
		Debug.Log("TOGGLE STATE" + state);
		if(state){
			m_instrumentControlRef.SelectParameter(m_paramRef);
			if(m_panelLabel){
				m_panelLabel.gameObject.renderer.material.SetColor("_Color", Color.red);
				m_panelLabel.color = Color.red;
				m_panelLabel.fontStyle = FontStyle.Bold;
			}
		} else{
			m_instrumentControlRef.DeselectParameter(m_paramRef);
			if(m_panelLabel != null){
				m_panelLabel.renderer.material.SetColor("_Color", Color.black);
				m_panelLabel.color = Color.black;
				m_panelLabel.fontStyle = FontStyle.Normal;	
			}
		}
		
		base.SetSelected (state);
	}
	
	public void setSelected(bool state){ 
		m_selected = state; 
	}
		
	public void Toggle(bool state){
		
	}
}
