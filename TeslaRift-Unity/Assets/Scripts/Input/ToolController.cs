using UnityEngine;

using System.Collections;
using System.Collections.Generic;


public class ToolController : MonoBehaviour {
	
	protected BaseTool m_currentTool = null;
	protected HydraController m_hydraRef = null;
	protected ChoreographController m_choreoRef = null;
	
	public enum ToolHand {BOTH = 0, LEFT, RIGHT };
	
	
	//Tool stacks
	protected Stack<BaseTool> m_LToolStack;
	protected Stack<BaseTool> m_RHandToolStack;
	protected Stack<BaseTool> m_GlobalToolStack;

	
	
	// Use this for initialization
	void Start () {
		
		//Tool stacks
		m_LToolStack = new Stack<BaseTool>();
		m_RHandToolStack = new Stack<BaseTool>();
		m_GlobalToolStack = new Stack<BaseTool>();
		
		//Test tool
		m_currentTool = new IdleTool();
		m_choreoRef = this.gameObject.GetComponent<ChoreographController>();
		m_hydraRef = this.gameObject.GetComponent<HydraController>();
	}
	
	public BaseTool currentTool(ToolHand hand){
		switch(hand){
			case ToolHand.BOTH:
				return m_GlobalToolStack.Peek();
			case ToolHand.LEFT:
				return m_LToolStack.Peek();
			case ToolHand.RIGHT:
				return m_RHandToolStack.Peek();
			default:
				return null;
		}
		
	}
	
	
	// Update is called once per frame
	void Update () {
		if(m_currentTool != null ) 
			m_currentTool.Update();
	}
	
	
	
}
