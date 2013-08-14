using UnityEngine;
using System.Collections;

public class ToolController : MonoBehaviour {
	
	protected BaseTool m_currentTool = null;
	protected HydraController m_hydraRef = null;
	protected ChoreographController m_choreoRef = null;
	
	public BaseTool currentTool{ get { return m_currentTool; } }

	// Use this for initialization
	void Start () {
		
		//Test tool
		//m_currentTool = new SingleModifierTool();
		m_choreoRef = this.gameObject.GetComponent<ChoreographController>();
		m_hydraRef = this.gameObject.GetComponent<HydraController>();
	}
	
	// Update is called once per frame
	void Update () {
		if(m_currentTool != null ) 
			m_currentTool.Update();
	}
}
