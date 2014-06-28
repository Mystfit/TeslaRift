using UnityEngine;
using MusicIO;
using System.Collections;
using System.Collections.Generic;
using RBF;
using UI;

namespace VRControls
{
    public class RBFSphereVRControl : BaseVRControl
    {
        //Training points
        public RBFPlugVRControl[] m_plugs;
        public bool m_toggleResetRbf;
        public ValueTriggerVRControl m_selectedTraining;

        //RBF
        protected RBFCore m_rbf;
        public float m_sigma = 2;
        protected int m_numInputs = 5;

        public override void Awake()
        {
            base.Awake();
            m_rbf = new RBFCore(1, 1);
            m_rbf.setSigma(m_sigma);

            SetIsDraggable(true);
            SetAsDock(true);
            AddAcceptedDocktype(typeof(ValueTriggerVRControl));
            EnableControls();
            ShowControls();
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            if (base.AddDockableAttachment(attach))
            {
                attach.rigidbody.isKinematic = true;

                ValueTriggerVRControl rbfAttach = attach as ValueTriggerVRControl;
                rbfAttach.SetToolmodeResponse(new BaseTool.ToolMode[]{
                    BaseTool.ToolMode.PRIMARY, 
                    BaseTool.ToolMode.GRABBING
                });
                rbfAttach.SetCloneable(false);
                rbfAttach.SetIsDraggable(true);
                rbfAttach.SetIsDockable(true);

                foreach (RBFPlugVRControl plug in m_plugs)
                    rbfAttach.StoreParameterValue(plug.musicRef);

                SetSelectedtraining(rbfAttach);
                return true;
            }
            return false;
        }

        public override void RemoveDockableAttachment(BaseVRControl attach)
        {
            base.RemoveDockableAttachment(attach);

            ValueTriggerVRControl rbfAttach = attach as ValueTriggerVRControl;
            rbfAttach.SetToolmodeResponse(new BaseTool.ToolMode[]{
                BaseTool.ToolMode.GRABBING
            });

            attach.rigidbody.isKinematic = false;
        }


        public void SetSelectedtraining(ValueTriggerVRControl training)
        {
            if (m_selectedTraining != null)
            {
                m_selectedTraining.SetSelected(false);
            }
            m_selectedTraining = training;
            m_selectedTraining.SetSelected(true);

            foreach (RBFPlugVRControl plug in m_plugs)
            {
                plug.SetVal((float)training.plugValues[plug], true);
            }
        }

        public override void ShowControls()
        {
            base.ShowControls();
            if (m_selectedTraining != null)
                m_selectedTraining.SetSelected(true);

            foreach (ValueTriggerVRControl attach in m_childDockables)
                attach.ShowControls();
            foreach (RBFPlugVRControl plug in m_plugs)
                plug.ShowControls();

            SetToolmodeResponse(new BaseTool.ToolMode[] { BaseTool.ToolMode.GRABBING });
        }

        public override void HideControls()
        {
            base.HideControls();
            SetToolmodeResponse(new BaseTool.ToolMode[] { BaseTool.ToolMode.SECONDARY });
            ResetRBF();
            foreach (ValueTriggerVRControl attach in m_childDockables)
                attach.HideControls();
            foreach (RBFPlugVRControl plug in m_plugs)
                plug.HideControls();
        }

        public override void ChildAttachmentSelected(BaseVRControl attach)
        {
            base.ChildAttachmentSelected(attach);
            m_selectedTraining = attach as ValueTriggerVRControl;
        }

        /*
         * Resets the RBF if we change the number of parameters
         */
        public void ResetRBF()
        {
            m_rbf.reset(m_numInputs, m_plugs.Length);
            m_rbf.setSigma(m_sigma);
            foreach (ValueTriggerVRControl point in m_childDockables)
            {

                int index = 0;
                double[] values = new double[point.plugValues.Count];
                foreach (KeyValuePair<RBFPlugVRControl, double> val in point.plugValues)
                    values[index++] = val.Value;

                double[] positionVals = new double[m_numInputs];
                Quaternion angle = Quaternion.LookRotation(point.transform.localPosition);

                positionVals[0] = angle.x;
                positionVals[1] = angle.y;
                positionVals[2] = angle.z;
                positionVals[3] = angle.w;
                positionVals[4] = Vector3.Distance(Vector3.zero, point.transform.localPosition);

                m_rbf.addTrainingPoint(positionVals, values);
            }

            if (m_childDockables.Count > 0)
                m_rbf.calculateWeights();
        }

        public override void Update()
        {
            if (m_toggleResetRbf)
            {
                m_toggleResetRbf = false;
                ResetRBF();
            }

            base.Update();
        }

        public void UpdatePlugValues(RBFPlugVRControl plug)
        {
            if (m_selectedTraining)
            {
                m_selectedTraining.StorePlugValue(plug);
            }
        }

        public override void Gesture_First()
        {
            base.Gesture_First();
            if (mode == BaseTool.ToolMode.GRABBING)
                StartDragging(HydraController.Instance.GetHand(m_hand));
        }

        public override void Gesture_IdleInterior()
        {
            if (m_mode == BaseTool.ToolMode.SECONDARY)
            {
                //Set rbf value from hand position inside sphere
                Vector3 handPosition = transform.InverseTransformPoint(HydraController.Instance.GetHand(m_hand).transform.position);
                Quaternion handAngle = Quaternion.LookRotation(handPosition);
                float distance = Vector3.Distance(transform.position, handPosition);
                double[] input = new double[5] { handAngle.x, handAngle.y, handAngle.z, handAngle.w, distance };
                double[] output = m_rbf.calculateOutput(input);

                string outStr = "";
                for (int i = 0; i < output.Length; i++)
                {
                    outStr += output[i].ToString() + " ";
                }
                Debug.Log(outStr);

                int index = 0;
                foreach (RBFPlugVRControl plug in m_plugs)
                    plug.SetVal((float)output[index++]);
            }
            base.Gesture_IdleInterior();
        }
    }
}