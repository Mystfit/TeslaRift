using UnityEngine;

using System.Collections;
using System.Collections.Generic;


public class ToolController : MonoBehaviour {
	
	protected static ToolController m_instance;
	public static ToolController Instance{ get { return m_instance; }}
	
	protected BaseTool m_currentTool = null;
	protected InstrumentController m_instrumentControlRef = null;
	protected HydraController m_hydraRef = null;
	
	private BaseGenerator m_selectedGenerator;
	public BaseGenerator SelectedGenerator{ get { return m_selectedGenerator; }}
	public void SetSelectedGenerator(BaseGenerator gen){ m_selectedGenerator = gen; }

	
	void Awake () {
		m_instance = this;
		m_instrumentControlRef = this.gameObject.GetComponent<InstrumentController>();
		m_hydraRef = GameObject.Find("__HydraController").GetComponent<HydraController>();
	}
	
	//Tool creation
	//-------------
	public void PushTool(System.Type toolType, BaseTool.ToolHand hand){
		PushTool(toolType, hand, BaseTool.ToolMode.PRIMARY);
	}

	public void PushTool(System.Type toolType, BaseTool.ToolHand hand, BaseTool.ToolMode mode){
		PopTool(hand);
		BaseTool activeAttachedTool =  m_hydraRef.GetHand(hand).AddComponent(toolType) as BaseTool;
		activeAttachedTool.Init(hand, mode);
	}
	
	public void PopTool(BaseTool.ToolHand hand){
		BaseTool activeAttachedTool = m_hydraRef.GetHand(hand).GetComponent(typeof(BaseTool)) as BaseTool;
		if(activeAttachedTool != null){
			activeAttachedTool.TransitionOut();
			Destroy(activeAttachedTool);		//Should probably handle this in the transition
		}
	}
	
	public BaseTool currentTool(BaseTool.ToolHand hand){
		return m_hydraRef.GetHand(hand).GetComponent<BaseTool>();
	}
	
	// Update is called once per frame
	void Update () {
	}
}
