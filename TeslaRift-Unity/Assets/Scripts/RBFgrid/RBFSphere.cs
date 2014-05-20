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
        training.transform.position = transform.position;
        training.transform.localScale = transform.localScale;
        training.transform.parent = transform;

		m_trainingPoints.Add(training);
        ResetRBF();
		return training;
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
        base.Update();
    }
}
