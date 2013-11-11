using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using RBF;

public class RBFControlAttachment : BaseAttachment {
	
	//DEBUG
	public Transform testhandOverride;
	
	protected Transform m_holdingTarget;
	public GameObject m_trainingPointPrefab;
	
	protected List<RBF.RBFTrainingPoint> m_trainingPoints;
	protected BufferFrame m_frame;

	void Start () {
		m_frame = GetComponent<BufferFrame>();
		m_trainingPoints = new List<RBFTrainingPoint>();
		
		CreateTrainingPoint();
		
		//DEBUG -- Should be set ONLY when dragging a training point around on the panel!
		SetDragSource(testhandOverride);
	}
	
	void Update () {
		
		// Test single training point
		if(m_holdingTarget != null){
			m_trainingPoints[0].MoveRelativeToContainer(m_holdingTarget);
			Debug.Log(m_trainingPoints[0].xNormalized + ", " + m_trainingPoints[0].yNormalized);
		}
	}
	
	
	/*
	 * Creates a new training point prefab on the panel
	 */
	public void CreateTrainingPoint(){
		GameObject trainingObj = Instantiate(m_trainingPointPrefab) as GameObject;
		RBFTrainingPoint training = trainingObj.GetComponent<RBFTrainingPoint>();
		training.SetParentContainer(transform, m_frame.width, m_frame.height);
		m_trainingPoints.Add(training);
	}
	
	
	/*
	 * Adds a global object for this panel to use as a drag position source
	 */
	public void SetDragSource(Transform target){
		m_holdingTarget = target;
	}
	
	/*
	 * Removes the drag source
	 */
	public void RemoveDragSource(){
		m_holdingTarget = null;
	}
	
	
	
}
