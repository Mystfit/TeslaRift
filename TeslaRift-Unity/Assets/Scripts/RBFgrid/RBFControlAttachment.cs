using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using RBF;

public class RBFControlAttachment : BaseAttachment {
	
	public GameObject m_trainingPointPrefab;
	protected List<RBF.RBFTrainingPoint> m_trainingPoints;
	protected BufferFrame m_frame;
	
	//Dragging target and source
	protected RBF.RBFTrainingPoint m_dragTarget;
	protected Transform m_dragSource;

	void Start () {
		m_frame = GetComponent<BufferFrame>();
		m_trainingPoints = new List<RBFTrainingPoint>();
	}
	
	
	/*
	 * Creates a new training point prefab on the panel
	 */
	public void CreateTrainingPoint(Transform position){
		GameObject trainingObj = Instantiate(m_trainingPointPrefab) as GameObject;
		RBFTrainingPoint training = trainingObj.GetComponent<RBFTrainingPoint>();
		training.SetParentContainer(transform, m_frame.width, m_frame.height);
		training.MoveRelativeToContainer(position);
		m_trainingPoints.Add(training);
	}	
	
	public override void Gesture_ExitIdleExterior ()
	{
		CreateTrainingPoint( HydraController.Instance.GetHand(m_hand).transform );
	}
}
