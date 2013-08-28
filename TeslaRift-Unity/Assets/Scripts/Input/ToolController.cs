using UnityEngine;

using System.Collections;
using System.Collections.Generic;


public class ToolController : MonoBehaviour {
	
	protected BaseTool m_currentTool = null;
	protected ChoreographController m_choreoRef = null;
	protected InstrumentController m_instrumentControlRef = null;
	protected HydraController m_hydraRef = null;
	
	
	//Tool stacks
	protected Stack<BaseTool> m_LToolStack;
	protected Stack<BaseTool> m_RToolStack;
	protected Stack<BaseTool> m_GlobalToolStack;

	
	
	// Use this for initialization
	void Start () {
		
		m_choreoRef = this.gameObject.GetComponent<ChoreographController>();
		m_instrumentControlRef = this.gameObject.GetComponent<InstrumentController>();
		m_hydraRef = GameObject.Find("__HydraController").GetComponent<HydraController>();
		
		//Tool stacks
		m_LToolStack = new Stack<BaseTool>();
		m_RToolStack = new Stack<BaseTool>();

		pushTool(typeof(IdleTool), BaseTool.ToolHand.LEFT);
		pushTool(typeof(IdleTool), BaseTool.ToolHand.RIGHT);

		

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

	
	public void pushTool(System.Type toolType, BaseTool.ToolHand hand){
		
		BaseTool activeAttachedTool = m_hydraRef.GetHand(hand).GetComponent<BaseTool>();
		
		if(activeAttachedTool != null)
			DestroyImmediate(activeAttachedTool);		//Should probably handle this in the transition
		
		activeAttachedTool =  m_hydraRef.GetHand(hand).AddComponent(toolType) as BaseTool;
		//activeAttachedTool = m_hydraRef.GetHand(hand).GetComponent(toolType) 
		activeAttachedTool.Init(hand);

		if(hand == BaseTool.ToolHand.LEFT){
			m_LToolStack.Push(activeAttachedTool);
		}else if(hand == BaseTool.ToolHand.RIGHT){
			m_RToolStack.Push(activeAttachedTool);
		}else if(hand == BaseTool.ToolHand.BOTH){
			m_LToolStack.Push(activeAttachedTool);
			m_RToolStack.Push(activeAttachedTool);
		}
	}
	
	/*
	public BaseTool popTool(BaseTool.ToolHand hand){
		BaseTool result = null;
		if(hand == BaseTool.ToolHand.LEFT)
			result = m_LToolStack.Pop();
		else if(hand == BaseTool.ToolHand.RIGHT)
			result = m_RToolStack.Pop();
		return result;
	}*/
	
	public BaseTool currentTool(BaseTool.ToolHand hand){
		switch(hand){
			case BaseTool.ToolHand.BOTH:
				return m_GlobalToolStack.Peek();
			case BaseTool.ToolHand.LEFT:
				return m_LToolStack.Peek();
			case BaseTool.ToolHand.RIGHT:
				return m_RToolStack.Peek();
			default:
				return null;
		}
	}
	
	// Update is called once per frame
	void Update () {
		m_LToolStack.Peek().Update();
		m_RToolStack.Peek().Update();
	}
}
