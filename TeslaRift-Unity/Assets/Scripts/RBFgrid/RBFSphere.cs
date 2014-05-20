using UnityEngine;
using MusicIO;
using System.Collections;
using System.Collections.Generic;
using RBF;
using UI;

public class RBFSphere : UIAttachment {

	//Training points
    public List<RBF.RBFSphereTraining> points { get { return m_trainingPoints; } }
	protected List<RBF.RBFSphereTraining> m_trainingPoints;
    public RbfPlugAttachment[] m_plugs;
    public bool m_toggleCreateRbfTraining;
	public bool m_toggleResetRbf;
    public RBFSphereTraining m_selectedTraining;

	//RBF
	protected RBFCore m_rbf;
	public float m_sigma = 2;
    protected int m_numInputs = 5;

	public override void Awake () {
		base.Awake();
		m_trainingPoints = new List<RBFSphereTraining>();
		m_rbf = new RBFCore(1,1);
		m_rbf.setSigma(m_sigma);
	}

	/*
	 * Creates a training point at a position or transform location
	 */
	public RBFSphereTraining CreateTrainingPoint(){
		RBFSphereTraining training = UI.UIFactory.CreateRBFSphereTraining();
        training.owner = this;
        training.transform.position = transform.position;
        training.transform.localScale = transform.localScale;
        training.transform.parent = transform;

		foreach(RbfPlugAttachment plug in m_plugs)
			training.StorePlugValue(plug);

		m_trainingPoints.Add(training);
        ResetRBF();
		return training;
	}

    public void SetSelectedtraining(RBFSphereTraining training)
    {
        m_selectedTraining = training;
        foreach(KeyValuePair<RbfPlugAttachment, double> pair in training.plugValues ){
            pair.Key.SetVal((float)pair.Value);
        }
    }

	/*
	 * Resets the RBF if we change the number of parameters
	 */
	public void ResetRBF(){
		m_rbf.reset(m_numInputs, m_plugs.Length);
		m_rbf.setSigma(m_sigma);
		foreach(RBFSphereTraining point in m_trainingPoints){
           
            int index = 0;
            double[] values = new double[point.plugValues.Count];
            foreach (KeyValuePair<RbfPlugAttachment, double> val in point.plugValues)
                values[index++] = val.Value;

            double[] positionVals = new double[m_numInputs];
            Quaternion angle = point.angle;
			positionVals[0] = angle.x;
			positionVals[1] = angle.y;
            positionVals[2] = angle.z;
            positionVals[3] = angle.w;
            positionVals[4] = point.distance;

			m_rbf.addTrainingPoint(positionVals, values);
		}

		m_rbf.calculateWeights();
	}

    public override void Update()
    {
        if (m_toggleCreateRbfTraining)
        {
            m_toggleCreateRbfTraining = false;
            CreateTrainingPoint();
        }

		if(m_toggleResetRbf){
			m_toggleResetRbf = false;
			ResetRBF();
		}

        foreach(RbfPlugAttachment plug in m_plugs){
            if(plug.isDirty){
                if (m_selectedTraining)
                {
                    m_selectedTraining.StorePlugValue(plug);
                }
            }
        }

        base.Update();
    }

    public override void Gesture_IdleInterior()
    {
        if (m_mode == BaseTool.ToolMode.PRIMARY)
        {
            Vector3 handPosition = transform.InverseTransformPoint(HydraController.Instance.GetHand(m_hand).transform.position);
            Quaternion handAngle = Quaternion.LookRotation(handPosition);
            float distance = Vector3.Distance(transform.position, handPosition);
            double[] input = new double[5] { handAngle.x, handAngle.y, handAngle.z, handAngle.w, distance };
            double[] output = m_rbf.calculateOutput(input);

			string outStr = "";
			for(int i = 0; i < output.Length; i++){
				outStr += output[i].ToString() + " ";
			}
			Debug.Log(outStr);

            int index = 0;
            foreach (RbfPlugAttachment plug in m_plugs)
                plug.setSliderVals((float)output[index++]);
        }
        base.Gesture_IdleInterior();
    }
}
