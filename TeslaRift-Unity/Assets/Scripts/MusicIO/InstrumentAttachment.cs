using UnityEngine;
using System.Collections;
using MusicIO;
	
public class InstrumentAttachment : BaseAttachment {
	
	//Debug clip changing
	public bool triggerClip;
	public int clipIndex;
	
	private BaseInstrument m_instrumentRef;
	public BaseInstrument instrumentRef{ get {return m_instrumentRef; } }
	
	//Radial menu references
	public GameObject m_clipRadial;
	public GameObject m_paramRadial;
	
	protected Quaternion m_dirToToolRotation;
	protected Vector3 m_dirToTool;
	
	//Selected references
	protected ParamAttachment m_selectedParam;

	protected ParameterType m_openRadialType;
	protected bool bOpenRadial = false;
	public bool IsRadialOpen{ get { return bOpenRadial; }}
	
	
	public override void Start () {
		base.Start();
	}
	
	
	public override void Init<T>(T instrument){		
		m_instrumentRef = (BaseInstrument)(object)instrument;
	}
	
	
	public override void Update () {
		//Debug tests for clip changing
		if(triggerClip == true){
			triggerClip = false;
			m_instrumentRef.addClipMessageToQueue(m_instrumentRef.GetClipByIndex(clipIndex).scene);
		}
		
		//Update vector between hand and target
		m_dirToTool = HydraController.Instance.GetHand(m_hand).transform.position - transform.position;
		m_dirToToolRotation = Quaternion.LookRotation(m_dirToTool, Vector3.up);

		
		base.Update();
	}
	
		
	public override void SetToolMode(BaseTool.ToolMode mode){
		if(mode == BaseTool.ToolMode.PRIMARY)
			m_openRadialType = BaseAttachment.ParameterType.CLIP;
		else
			m_openRadialType = BaseAttachment.ParameterType.PARAM;
		base.SetToolMode(mode);
	}
	
	
	public void AddRadial(GameObject radialMenu, ParameterType type){
		if(type == ParameterType.CLIP)
			m_clipRadial = radialMenu; 
		else if(type == ParameterType.PARAM)
			m_paramRadial = radialMenu; 
	}
	
	
	public void OpenRadial(ParameterType type, Quaternion rotation){
		if(type == ParameterType.CLIP){
			m_clipRadial.transform.rotation = rotation;
			m_clipRadial.SetActive(true);
			iTween.Stop(m_clipRadial);
			iTween.ScaleTo(m_clipRadial, iTween.Hash("scale", new Vector3(1.0f, 1.0f, 1.0f), "time", 0.4f, "easetype", "easeOutCubic"));
		} else if(type == ParameterType.PARAM){
			m_paramRadial.transform.rotation = rotation;
			m_paramRadial.SetActive(true);
			iTween.Stop(m_paramRadial);
			iTween.ScaleTo(m_paramRadial, iTween.Hash("scale", new Vector3(1.0f, 1.0f, 1.0f), "time", 0.4f, "easetype", "easeOutCubic"));
		}
	}
	
	public void CloseRadial(ParameterType type){
		if(type == ParameterType.CLIP){
			//m_clipRadial.SetActive(true);
			iTween.ScaleTo(m_clipRadial, iTween.Hash("scale", new Vector3(0.0f, 0.0f, 0.0f), "time", 0.4f, "easetype", "easeInCubic",  "delay", 2.0f));
		} else if(type == ParameterType.PARAM){
			//m_paramRadial.SetActive(true);
			iTween.ScaleTo(m_paramRadial, iTween.Hash("scale", new Vector3(.0f, .0f, 0.0f), "time", 0.4f, "easetype", "easeInCubic", "delay", 2.0f));
		}
	}
	
	
	/*
	 * Check for ray collisions with parameters
	 */
	public void CheckForSelection(){
		
		//Check for panel collisions
		RaycastHit hit;
		int mask = ~LayerMask.NameToLayer("ParamSelectable");
		
		if(Physics.Raycast(transform.position, m_dirToTool, out hit, m_dirToTool.magnitude*10.0f, mask )){
			
			//Toggle the panel and attach any generators if required
			ParamAttachment attach = hit.collider.gameObject.GetComponent<ParamAttachment>();
			
			if(attach != null){
				if(m_selectedParam != null)
					m_selectedParam.SetHovering(false);
				m_selectedParam = attach;
				m_selectedParam.SetHovering(true);
			}
		}
		
		Debug.DrawRay(transform.position, m_dirToTool, Color.red);
	}
	
	
	/*
	 *  Gesture handlers
	 */
	public override void Gesture_First ()
	{
		base.Gesture_First ();
		OpenRadial(m_openRadialType, m_dirToToolRotation);
	}
	
	public override void Gesture_IdleProximity ()
	{
		base.Gesture_IdleProximity ();
		CheckForSelection();
	}
	
	public override void Gesture_PullOutPushIn()
	{
		base.Gesture_PullOutPushIn ();
		InstrumentController.Instance.ResetInstrumentParameters( instrumentRef );
		if(m_selectedParam != null)
			m_selectedParam.ToggleSelected();	//Activate parameter
		
		CloseRadial(m_openRadialType);
		Gesture_Exit();
	}
	
	
	public override void Gesture_PullOut ()
	{
		base.Gesture_PullOut ();
		m_selectedParam.ToggleSelected();
		CloseRadial(m_openRadialType);
		Gesture_Exit();
	}
	
	
	public override void Gesture_Twist (float amount)
	{
		base.Gesture_Twist (amount);
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

