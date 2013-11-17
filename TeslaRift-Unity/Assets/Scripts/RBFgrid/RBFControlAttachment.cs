using UnityEngine;
using MusicIO;
using System.Collections;
using System.Collections.Generic;
using RBF;

public class RBFControlAttachment : BaseAttachment {

	//Owning group
	MusicControllerAttachment m_owner;

	//Training points
	public GameObject m_trainingPointPrefab;
	protected List<RBF.RBFTrainingPointAttachment> m_trainingPoints;
	RBFTrainingPointAttachment m_selectedTraining;

	//RBF
	protected RBFCore m_rbf;
	public float m_sigma = 2;

	//UI
	protected BufferFrame m_frame;
	
	//Dragging target and source
	protected RBF.RBFTrainingPointAttachment m_dragTarget;
	protected Transform m_dragSource;

	void Start () {
		m_frame = GetComponent<BufferFrame>();
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
	 * Creates a new training point prefab on the panel
	 */
	public void CreateTrainingPoint(Transform position){
		GameObject  trainingObj = Instantiate(m_trainingPointPrefab) as GameObject;
		RBFTrainingPointAttachment training = trainingObj.GetComponent<RBFTrainingPointAttachment>();
		training.SetParentContainer(transform, m_frame.width, m_frame.height);
		training.MoveRelativeToContainer(position);
		m_trainingPoints.Add(training);
	}	

	/*public void SetTrainingPoints(List<BaseInstrumentParam> paramList){

		m_rbf.reset(3, paramList.Count);



		double[] paramVals = new double[paramList.Count];
		for(int i = 0; i < paramList.Count; i++){
			paramVals[i] = paramList[i].musicRef.val;
		}

		double[] positionVals = new double[3];
		
		for(int i = 0; i < m_trainingPoints.Count; i++){
			RBFTrainingPointAttachment point = m_trainingPoints[i] as RBFTrainingPointAttachment;
			positionVals[0] = point.xNormalized;
			positionVals[1] = point.yNormalized;
			positionVals[2] = point.twist;

			point.paramValues

			m_rbf.addTrainingPoint(positionVals, paramVals);
		}
	}*/


	/*
	 * Gesture overrides
	 */
	public override void Gesture_First ()
	{
		//PRIMARY = Add new RBF training points
		if( mode == BaseTool.ToolMode.PRIMARY ){
			CreateTrainingPoint( HydraController.Instance.GetHand( m_hand ).transform );
		}
		/*
		//Secondary = Move training points
		} else if( mode == BaseTool.ToolMode.SECONDARY ){
			RBFTrainingPointAttachment attach = GetClosestTraining( HydraController.Instance.GetHand( m_hand ).transform );
			attach.SetDragSource( HydraController.Instance.GetHand( m_hand ).transform );
			attach.SetSelected(true);
			m_selectedTraining = attach;
		}
		*/

		base.Gesture_First ();
	}


	public override void Gesture_Exit ()
	{
		foreach(RBFTrainingPointAttachment attach in m_trainingPoints){
			attach.RemoveDragSource();
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
		m_rbf.calculateWeights();
	}
}
