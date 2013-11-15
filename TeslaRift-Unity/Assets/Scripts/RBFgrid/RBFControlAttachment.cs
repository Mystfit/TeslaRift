using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using RBF;

public class RBFControlAttachment : BaseAttachment {
	
	public GameObject m_trainingPointPrefab;
	protected List<RBF.RBFTrainingPointAttachment> m_trainingPoints;
	RBFTrainingPointAttachment m_selectedTraining;
	protected BufferFrame m_frame;
	
	//Dragging target and source
	protected RBF.RBFTrainingPointAttachment m_dragTarget;
	protected Transform m_dragSource;

	void Start () {
		m_frame = GetComponent<BufferFrame>();
		m_trainingPoints = new List<RBFTrainingPointAttachment>();
	}
	
	
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
}
