using UnityEngine;
using RBF;
using MusicIO;
using System.Collections;
using System.Collections.Generic;

public class MusicControllerAttachment : MonoBehaviour {

	public enum ControlState{
		EDIT = 0,
		PERFORM
	}
	protected ControlState m_controlState;
	public ControlState controlState{ get { return m_controlState; }}
	public bool toggleControlState;

	public ClipBufferAttachment m_clipBuffer;
	public ParamSliderPanelAttachment m_paramControls;
	public RBFControlAttachment m_rbfPanel;

	// Use this for initialization
	void Start () {
		m_clipBuffer.Init(this);
		m_paramControls.Init(this);
		m_rbfPanel.Init(this);

		InstrumentController.Instance.SelectMusicController(this);

		//Event listener delegate for updating training points with slider values upon change
		m_paramControls.SliderUpdate += OnSlidersUpdated;

		SwitchControlState(ControlState.PERFORM);
	}

	void Update(){
		if(toggleControlState){
			toggleControlState = false;
			ToggleControlState();
		}
	}


	/*
	 * Toggles between performance and edit modes
	 */	
	public void ToggleControlState(){
		if(m_controlState == ControlState.EDIT)
			SwitchControlState(ControlState.PERFORM);
		else if(m_controlState == ControlState.PERFORM)
			SwitchControlState(ControlState.EDIT);
	}

	public void SwitchControlState(ControlState state){
		if(state == ControlState.EDIT){
			m_controlState = ControlState.EDIT;
			m_rbfPanel.SetBackground( new Color(1.0f,1.0f,0.0f,0.5f) );
		} else if( state == ControlState.PERFORM){
			m_controlState = ControlState.PERFORM;
			m_rbfPanel.SetBackground(new Color(0.0f,1.0f,1.0f,0.5f));
		}
	}


	/*
	 * Listener delegate to update RBF values when sliders change
	 */
	protected void OnSlidersUpdated(){
		UpdateTrainingPoint(m_rbfPanel.SelectedTrainingPoint);
	}


	/*
	 * Update RBF using training point locations and slider values
	 */
	public void UpdateRBF(){
		m_rbfPanel.UpdateWeights();
	}


	/*
	 * Updates the stored parameter values for an RBF point
	 */
	public void UpdateTrainingPoint(BaseAttachment attach){
		if(attach != null){
			RBFTrainingPointAttachment pointAttach = attach as RBFTrainingPointAttachment;
			List<BaseInstrumentParam> paramList = m_paramControls.GetParametersFromSliders();
			pointAttach.SetParameters( paramList );
			m_rbfPanel.ResetRBF( paramList.Count );
		}
	} 


	/*
	 * Sets slider values to the stored values inside a training point
	 */
	public void UpdateSlidersFromTrainingPoint(RBFTrainingPointAttachment point){
		m_paramControls.SetSliderValues( point.paramValues );
	}


	/*
	 * Updates sliders from RBF output values
	 */
	public void UpdateSlidersFromRBF(Dictionary<BaseInstrumentParam,float> paramValues){
		m_paramControls.SetSliderValues( paramValues );
	}


	/*
	 * Getters
	 */
	public ClipBufferAttachment clipBuffer { get { return m_clipBuffer; }}
	public ParamSliderPanelAttachment paramControls{ get { return m_paramControls; }}
	public RBFControlAttachment rbfPanel{ get { return m_rbfPanel; }}


}
