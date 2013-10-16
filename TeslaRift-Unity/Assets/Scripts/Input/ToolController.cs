using UnityEngine;

using System.Collections;
using System.Collections.Generic;


public class ToolController : MonoBehaviour {
	
	protected static ToolController m_instance;
	public static ToolController Instance{ get { return m_instance; }}
	
	protected BaseTool m_currentTool = null;
	protected ChoreographController m_choreoRef = null;
	protected InstrumentController m_instrumentControlRef = null;
	protected HydraController m_hydraRef = null;
	
	private BaseGenerator m_selectedGenerator;	//Selected generators are kept in the controller to pass to the
												//appropriate select tools

	
	void Awake () {
		m_instance = this;
		m_choreoRef = this.gameObject.GetComponent<ChoreographController>();
		m_instrumentControlRef = this.gameObject.GetComponent<InstrumentController>();
		m_hydraRef = GameObject.Find("__HydraController").GetComponent<HydraController>();
	}
	
	//Tool creation
	//-------------
	public void PushTool(System.Type toolType, BaseTool.ToolHand hand){
		PushTool(toolType, hand, BaseTool.Mode.PRIMARY);
	}

	public void PushTool(System.Type toolType, BaseTool.ToolHand hand, BaseTool.Mode mode){
		
		PopTool(hand);
		
		BaseTool activeAttachedTool =  m_hydraRef.GetHand(hand).AddComponent(toolType) as BaseTool;
		
		//Mode specific cases
		//-------------------
	
		//Pass selected generators to the param select tool
		if(activeAttachedTool.GetType() == typeof(ParamSelectTool)){
			ParamSelectTool tool = activeAttachedTool as ParamSelectTool;
			tool.SetSelectedGenerator(m_selectedGenerator);
			if(mode == BaseTool.Mode.SECONDARY)
			{	
				tool.SetDisconnectGenerators(true);
			}
		}
		
		if(activeAttachedTool.GetType() == typeof(ResetTool)){
			ResetTool tool = activeAttachedTool as ResetTool;
			if(mode == BaseTool.Mode.SECONDARY)
			{	
				tool.SetResetAll();
			}
		}
		
		activeAttachedTool.Init(hand);
	}
	
	public void PopTool(BaseTool.ToolHand hand){
		BaseTool activeAttachedTool = m_hydraRef.GetHand(hand).GetComponent(typeof(BaseTool)) as BaseTool;
		if(activeAttachedTool)
			activeAttachedTool.TransitionOut();
		
		if(activeAttachedTool != null)
			Destroy(activeAttachedTool);		//Should probably handle this in the transition
	}
	
	public BaseTool currentTool(BaseTool.ToolHand hand){
		return m_hydraRef.GetHand(hand).GetComponent<BaseTool>();
	}
	
	public void SetSelectedGenerator(BaseGenerator gen){
		m_selectedGenerator = gen;
	}
	
	public BaseGenerator GetSelectedGenerator(){
		return m_selectedGenerator;
	}
	
	// Update is called once per frame
	void Update () {
	}
}
