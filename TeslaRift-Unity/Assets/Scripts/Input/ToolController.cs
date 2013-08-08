using UnityEngine;
using System.Collections;

public class ToolController : MonoBehaviour {
	
	protected BaseTool m_currentTool = null;
	protected HydraController m_hydra = null;
	protected ChoreographController m_choreo = null;
	
	public BaseTool currentTool{ get { return m_currentTool; } }

	// Use this for initialization
	void Start () {
		
		//Test tool
		m_currentTool = new SingleModifierTool();
		m_choreo = this.gameObject.GetComponent<ChoreographController>();
		m_hydra = this.gameObject.GetComponent<HydraController>();
	}
	
	// Update is called once per frame
	void Update () {
		
		//TEMP -- Manually set target list of tool
		if(m_currentTool != null)
		{
			if(m_choreo.m_testInstrument != null && m_currentTool.targets == null)
				m_currentTool.setTargets( m_choreo.m_testInstrument.paramList );
		}
		
		m_currentTool.update();
	}
}
