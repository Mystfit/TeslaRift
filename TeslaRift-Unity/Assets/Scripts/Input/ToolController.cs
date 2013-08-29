using UnityEngine;

using System.Collections;
using System.Collections.Generic;


public class ToolController : MonoBehaviour {
	
	protected BaseTool m_currentTool = null;
	protected ChoreographController m_choreoRef = null;
	protected InstrumentController m_instrumentControlRef = null;
	protected HydraController m_hydraRef = null;

	
	// Use this for initialization
	void Start () {
		
		m_choreoRef = this.gameObject.GetComponent<ChoreographController>();
		m_instrumentControlRef = this.gameObject.GetComponent<InstrumentController>();
		m_hydraRef = GameObject.Find("__HydraController").GetComponent<HydraController>();
	}
	
	//Manual tool addition. Testing only
	/*
	public void SetManualTool(GameObject target, ToolHand hand){
	
		InstrumentAttachment instrumentRef = target.GetComponent<InstrumentAttachment>();
		
		if(instrumentRef != null)
		{
			SingleModifierTool playingTool = new SingleModifierTool();
			playingTool.setInstrument( m_instrumentControlRef.GetInstrumentByName(instrumentRef.instrumentTarget ));
			playingTool.setTargets(m_instrumentControlRef.GetInstrumentByName(instrumentRef.instrumentTarget ).paramList);
			playingTool.playTestChord();
			pushTool(playingTool, hand);
		}	
	}
	
	public void StopTool(ToolHand hand){
		if(hand == ToolHand.LEFT){
			SingleModifierTool tempTool = m_LToolStack.Peek() as SingleModifierTool;
			tempTool.stopTestChord();
		} else if( hand == ToolController.ToolHand.RIGHT){
		}
	}*/

	
	public void PushTool(System.Type toolType, BaseTool.ToolHand hand){
		PopTool(hand);
		
		BaseTool activeAttachedTool =  m_hydraRef.GetHand(hand).AddComponent(toolType) as BaseTool;
		activeAttachedTool.Init(hand);
	}
	
	public void PopTool(BaseTool.ToolHand hand){
		BaseTool activeAttachedTool = m_hydraRef.GetHand(hand).GetComponent(typeof(BaseTool)) as BaseTool;
		
		if(activeAttachedTool != null)
			DestroyImmediate(activeAttachedTool);		//Should probably handle this in the transition
	}
	
	public BaseTool currentTool(BaseTool.ToolHand hand){
		return m_hydraRef.GetHand(hand).GetComponent<BaseTool>();
	}
	
	// Update is called once per frame
	void Update () {
	}
}
