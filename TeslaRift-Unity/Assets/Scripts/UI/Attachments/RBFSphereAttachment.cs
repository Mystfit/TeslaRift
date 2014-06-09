using UnityEngine;
using MusicIO;
using System.Collections;
using System.Collections.Generic;
using RBF;
using UI;

public class RBFSphereAttachment : BaseAttachment {

	//Training points
    public RBFPlugAttachment[] m_plugs;
	public bool m_toggleResetRbf;
    public RBFTrainingAttachment m_selectedTraining;
        
	//RBF
	protected RBFCore m_rbf;
	public float m_sigma = 2;
    protected int m_numInputs = 5;

	public override void Awake () {
		base.Awake();
		m_rbf = new RBFCore(1,1);
		m_rbf.setSigma(m_sigma);

		//m_plugs = GetComponentsInChildren<RBFPlugAttachment>();

		SetAsDock(true);
        AddAcceptedDocktype(typeof(RBFTrainingAttachment));
        EnableControls();
        ShowControls();
	}

	/*
	 * Creates a training point at a position or transform location
	 */
    //public RBFTrainingAttachment CreateTrainingPoint(){
    //    RBFTrainingAttachment training = UI.UIFactory.CreateRBFSphereTraining();
    //    training.owner = this;
    //    training.transform.position = transform.position;
    //    training.transform.localScale = transform.localScale;
    //    training.transform.parent = transform;

    //    foreach(RBFPlugAttachment plug in m_plugs)
    //        training.StorePlugValue(plug);

    //    m_trainingPoints.Add(training);
    //    ResetRBF();
    //    return training;
    //}

    public override bool AddDockableAttachment(BaseAttachment attach)
    {
        if (base.AddDockableAttachment(attach))
        {
            attach.rigidbody.isKinematic = true;

            RBFTrainingAttachment rbfAttach = attach as RBFTrainingAttachment;
            rbfAttach.owner = this;
            rbfAttach.SetToolmodeResponse(new BaseTool.ToolMode[]{
				BaseTool.ToolMode.PRIMARY, 
				BaseTool.ToolMode.GRABBING
			});
            rbfAttach.SetCloneable(false);
            rbfAttach.SetIsDraggable(true);
            rbfAttach.SetIsDockable(true);

            foreach (RBFPlugAttachment plug in m_plugs)
                rbfAttach.StorePlugValue(plug);

            SetSelectedtraining(rbfAttach);
            return true;
        }
        return false;
    }

    public override void RemoveDockableAttachment(BaseAttachment attach)
    {
        base.RemoveDockableAttachment(attach);

        RBFTrainingAttachment rbfAttach = attach as RBFTrainingAttachment;
        rbfAttach.SetToolmodeResponse(new BaseTool.ToolMode[]{
			BaseTool.ToolMode.GRABBING
		});

        foreach (RBFPlugAttachment plug in m_plugs)
            rbfAttach.RemovePlugValue(plug);

        attach.rigidbody.isKinematic = false;
    }


    public void SetSelectedtraining(RBFTrainingAttachment training)
    {
        if(m_selectedTraining != null){
            m_selectedTraining.SetSelected(false);
        }
        m_selectedTraining = training;
        m_selectedTraining.SetSelected(true);

		foreach(RBFPlugAttachment plug in m_plugs ){
			plug.SetVal((float)training.plugValues[plug], true);
        }
    }

    public override void ShowControls()
    {
        base.ShowControls();
        SetToolmodeResponse(new BaseTool.ToolMode[0]);
        foreach (RBFTrainingAttachment attach in m_childDockables)
            attach.ShowControls();
        foreach (RBFPlugAttachment plug in m_plugs)
            plug.ShowControls();
    }

    public override void HideControls()
    {
        base.HideControls();
        SetToolmodeResponse(new BaseTool.ToolMode[] { BaseTool.ToolMode.PRIMARY });
        ResetRBF();
        foreach (RBFTrainingAttachment attach in m_childDockables)
            attach.HideControls();
        foreach (RBFPlugAttachment plug in m_plugs)
            plug.HideControls();
    }

	/*
	 * Resets the RBF if we change the number of parameters
	 */
	public void ResetRBF(){
		m_rbf.reset(m_numInputs, m_plugs.Length);
		m_rbf.setSigma(m_sigma);
		foreach(RBFTrainingAttachment point in m_childDockables){
           
            int index = 0;
            double[] values = new double[point.plugValues.Count];
            foreach (KeyValuePair<RBFPlugAttachment, double> val in point.plugValues)
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
		if(m_toggleResetRbf){
			m_toggleResetRbf = false;
			ResetRBF();
		}

        base.Update();
    }

    public void UpdatePlugValues(RBFPlugAttachment plug)
    {
        if (m_selectedTraining)
        {
            m_selectedTraining.StorePlugValue(plug);
        }
    }

    public override void Gesture_IdleInterior()
    {
        if (m_mode == BaseTool.ToolMode.PRIMARY)
        {
            //Set rbf value from hand position inside sphere
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
            foreach (RBFPlugAttachment plug in m_plugs)
                plug.SetSliderVals((float)output[index++]);
        }
        base.Gesture_IdleInterior();
    }
}
