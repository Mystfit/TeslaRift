using UnityEngine;
using MusicIO;
using System.Collections;
using System.Collections.Generic;
using RBF;
using UI;

public class RBFControlAttachment : UIAttachment {

	//Owning group
	MusicControllerAttachment m_owner;

	//Training points
	protected List<RBF.RBFTrainingPointAttachment> m_trainingPoints;
	RBFTrainingPointAttachment m_selectedTraining;

	//RBF
	protected RBFCore m_rbf;
	public float m_sigma = 2;

	//UI
	protected UIFrame m_frame;
	
	//Dragging target and source
	protected RBF.RBFTrainingPointAttachment m_dragTarget;
	protected Transform m_dragSource;

	public override void Awake () {
		m_frame = GetComponent<UIFrame>();
		m_trainingPoints = new List<RBFTrainingPointAttachment>();
		m_rbf = new RBFCore(1,1);
		m_rbf.setSigma(m_sigma);
	}


	/*
	 * Set owner
	 */
	public void Init(MusicControllerAttachment owner){
		m_owner = owner;
	}
	public MusicControllerAttachment owner{ get { return m_owner; }}


	/*
	 * Creates a training point at a position or transform location
	 */
	public RBFTrainingPointAttachment CreateTrainingPoint(float x, float y, float twist){
		RBFTrainingPointAttachment training = UI.UIFactory.CreateRBFTraining();
		training.SetParentContainer(this, m_frame.width, m_frame.height);
		training.MoveRelativeToLocal(x, y);
		m_trainingPoints.Add(training);
		
		return training;
	}


	/*
	 * Creates a new training point (transform overload)
	 */
	public RBFTrainingPointAttachment CreateTrainingPoint(Transform t){
		RBFTrainingPointAttachment training = UI.UIFactory.CreateRBFTraining();
		training.SetParentContainer(this, m_frame.width, m_frame.height);
		training.MoveRelativeToContainer(t);
		m_trainingPoints.Add(training);
		
		return training;
	}	


	/*
	 * Gesture overrides
	 */
	public override void Gesture_First ()
	{
		switch(owner.controlState){
		case MusicControllerAttachment.ControlState.EDIT:
			//PRIMARY = Add new RBF training points
			if( mode == BaseTool.ToolMode.PRIMARY ){
				m_owner.UpdateTrainingPoint( CreateTrainingPoint( HydraController.Instance.GetHand( m_hand ).transform ) );
			}
			break;
		case MusicControllerAttachment.ControlState.PERFORM:
			break;
		}
		base.Gesture_First ();
	}

	public override void Gesture_IdleInterior (){
		switch(owner.controlState){
		case MusicControllerAttachment.ControlState.EDIT:
			break;
		case MusicControllerAttachment.ControlState.PERFORM:
			if( mode == BaseTool.ToolMode.SECONDARY ){
				m_frame.GetAnchorOffset(m_frame.width, m_frame.height, m_frame.m_anchorPoint);
				Vector3 pos = BaseTool.HandToObjectSpace( HydraController.Instance.GetHand( m_hand ).transform, transform);
				
//				Vector3 clampedPos = new Vector3(
//					Mathf.Clamp(pos.x, m_frame.width*-0.5f, m_frame.height*0.5f ), 
//					Mathf.Clamp(pos.y, m_frame.width*-0.5f, m_frame.height*0.5f ), 0.0f
//					);	
				Vector3 clampedPos = new Vector3(
					pos.x, pos.y, 0.0f);	
				
				double[] positionVals = new double[3]{clampedPos.x, clampedPos.y, 0.0f};
				double[] paramOutput = m_rbf.calculateOutput(positionVals);
				
				int outputIndex = 0;
				List<BaseInstrumentParam> paramList = m_owner.paramControls.GetParametersFromSliders();
				Dictionary<BaseInstrumentParam,float> sliderResults = new Dictionary<BaseInstrumentParam, float>();
				foreach(BaseInstrumentParam param in paramList){
					if(outputIndex < paramList.Count)
						sliderResults[param] = (float)paramOutput[outputIndex++];
				}
				
				m_owner.UpdateSlidersFromRBF(sliderResults);
			}
			break; 
		}
		
		base.Gesture_IdleInterior ();
	}


	public override void Gesture_Exit ()
	{
		foreach(RBFTrainingPointAttachment attach in m_trainingPoints){
			attach.SetInactive();
			attach.SetSelected(false);
		}
		base.Gesture_Exit ();
	}


	/*
	 * Gets the closest training point in world space to a target transform
	 */
	public RBFTrainingPointAttachment GetClosestTraining( Transform point ){

		RBFTrainingPointAttachment closestPoint = null;

		if(m_trainingPoints.Count > 0){
			float closestDist = -1.0f;

			closestPoint = m_trainingPoints[0];
			
			foreach(RBFTrainingPointAttachment attach in m_trainingPoints){

				float dist =  Vector3.Distance( attach.transform.position, point.position );

				if(closestDist < 0)
					closestDist = dist;

				if(dist < closestDist){
					closestPoint = attach;
					closestDist = dist;
				}
			}
		}

		return closestPoint;
	}


	/*
	 * Update the RBF weights
	 */
	public void UpdateWeights(){
		//int numParams = owner.paramControls.GetParametersFromSliders().Count;
		//if(numParams != m_rbf.numOutputs || m_trainingPoints.Count != m_rbf.trainingPoints.Count)
		//ResetRBF(numParams);
		m_rbf.calculateWeights();
	}


	/*
	 * Resets the RBF if we change the number of parameters
	 */
	public void ResetRBF(int numParams){
		m_rbf.reset(3, numParams);
		m_rbf.setSigma(m_sigma);
		foreach(RBFTrainingPointAttachment point in m_trainingPoints){

			double[] positionVals = new double[3];
			double[] paramVals = new double[ point.paramValues.Count ];

			positionVals[0] = point.xNormalized;
			positionVals[1] = point.yNormalized;
			positionVals[2] = point.twist;

			int index = 0;

			foreach( KeyValuePair<BaseInstrumentParam,float> pair in point.paramValues)
				paramVals[index++] = pair.Value;

			m_rbf.addTrainingPoint(positionVals, paramVals);
		}

		UpdateWeights();
	}


	/*
	 * Sets the active training point
	 */
	public void SetActiveTrainingPoint(RBFTrainingPointAttachment attach){
		m_selectedTraining = attach;
	}

	public RBFTrainingPointAttachment SelectedTrainingPoint{ get { return m_selectedTraining; }}
	public List<RBF.RBFTrainingPointAttachment> points{ get { return  m_trainingPoints; }}


	/*
	 * Sets the background colour of the frame
	 */
	public void SetBackground(Color color){
		m_frame.AnimateBackgroundColor(color);
	}
}
