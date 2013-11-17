using UnityEngine;
using System.Collections;

public class MusicControllerAttachment : MonoBehaviour {

	protected BufferAttachment m_clipBuffer;
	protected ParamSliderPanelAttachment m_paramControls;
	protected RBFControlAttachment m_rbfPanel;

	// Use this for initialization
	void Start () {
		m_clipBuffer = GetComponent<BufferAttachment>();
		m_paramControls = GetComponent<ParamSliderPanelAttachment>();
		m_rbfPanel = GetComponent<RBFControlAttachment>();
	}


	/*
	 * Update RBF using training point locations and slider values
	 */
	public void UpdateRBF(){
		//rbfPanel.SetTrainingPoints(paramControls.GetParametersFromSliders());
	}


	/*
	 * Getters
	 */
	public BufferAttachment clipBuffer { get { return m_clipBuffer; }}
	public ParamSliderPanelAttachment paramControls{ get { return m_paramControls; }}
	public RBFControlAttachment rbfPanel{ get { return m_rbfPanel; }}


}
