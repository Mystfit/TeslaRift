using UnityEngine;
using System.Collections;

public class ToolController : MonoBehaviour {
	
	protected BaseTool m_currentTool = null;
	protected HydraController m_hydra = null;

	// Use this for initialization
	void Start () {
		m_currentTool = new ManualTool();
		m_hydra = this.gameObject.GetComponent<HydraController>();
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
