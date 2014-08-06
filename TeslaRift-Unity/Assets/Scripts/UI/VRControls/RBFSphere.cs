using UnityEngine;
using MusicIO;
using System.Collections;
using System.Collections.Generic;
using RBF;
using UI;

namespace VRControls
{
    public class RBFSphere : BaseVRControl
    {
        //Plug arrangement
        public int m_numStartPlugs;
        public float m_sphereRadius;
        public float m_arcSize;
        public float m_minAngle;
        public float m_plugYOffset;
		public bool m_togglePlacement;

        //Training points
        public bool m_toggleResetRbf;
        public ValueTrigger m_selectedTraining;

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
            SetSoloChildControlsVisible(true);
            AddAcceptedDocktype(typeof(ValueTrigger));
            AddAcceptedDocktype(typeof(RBFPlug));


			for(int p = 0; p < m_numStartPlugs; p++){
                RBFPlug plug = UIFactory.CreateMusicRefAttachment(typeof(RBFPlug)) as RBFPlug;
                plug.DockInto(this);
			}

            PlacePlugs();


            //Dock existing children in at runtime
            for (int i = 0; i < transform.childCount; i++)
            {
				Debug.Log("Child: " + (i+1) + " of " + transform.childCount + ". Name: " + transform.GetChild(i).name);
                BaseVRControl attach = transform.GetChild(i).GetComponent<BaseVRControl>();
                if (attach != null){
					Debug.Log ("-- Has attachment. ID: " + attach.id);
					if(!ChildControls.Contains(attach))
                    	attach.DockInto(this);
					else
					   Debug.Log ("-- Adding " + attach + " twice at runtime! WHY?!" );

				} else {
					Debug.Log ("No attachment found.");
				}
            }

			
			EnableControls();
            ShowControls();
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            if (base.AddDockableAttachment(attach))
            {
                attach.SetCloneable(false);

                if (attach.GetType() == typeof(RBFPlug))
                {
                    AddChildControl(attach);
                }
                else if (attach.GetType() == typeof(ValueTrigger))
                {
                    ValueTrigger rbfAttach = attach as ValueTrigger;
                    rbfAttach.SetToolmodeResponse(new BaseTool.ToolMode[]{
                        BaseTool.ToolMode.PRIMARY, 
                        BaseTool.ToolMode.GRABBING
                    });

                    foreach (RBFPlug plug in ChildControls)
                        rbfAttach.StoreParameterValue(plug.musicRef);

                    rbfAttach.SetSelected(true);
                }
                
                return true;
            }
            return false;
        }

        public override void RemoveDockableAttachment(BaseVRControl attach)
        {
            base.RemoveDockableAttachment(attach);

            if (attach.GetType() == typeof(RBFPlug))
            {
                RemoveChildControl(attach);
            }
            else if (attach.GetType() == typeof(ValueTrigger))
            {
                ValueTrigger rbfAttach = attach as ValueTrigger;
                rbfAttach.SetToolmodeResponse(new BaseTool.ToolMode[]{
                    BaseTool.ToolMode.GRABBING
                });
            }
        }

        public override void Undock()
        {
            base.Undock();
            SetAsDock(true);
            SetTransient(false);
        }

        public override void ShowControls()
        {
            base.ShowControls();
            if (m_selectedTraining != null)
                m_selectedTraining.SetSelected(true);

            foreach (BaseVRControl attach in DockedChildren)
                attach.ShowControls();
			foreach (BaseVRControl attach in ChildControls)
				attach.ShowControls();

            SetToolmodeResponse(new BaseTool.ToolMode[] { BaseTool.ToolMode.GRABBING });
        }

        public override void HideControls()
        {
            base.HideControls();
            SetToolmodeResponse(new BaseTool.ToolMode[] { BaseTool.ToolMode.SECONDARY });
            ResetRBF();
            foreach (ValueTrigger attach in m_childDockables)
                attach.HideControls();
            foreach (RBFPlug plug in ChildControls)
                plug.HideControls();
        }

        public override void ChildAttachmentSelected(BaseVRControl attach)
        {
            base.ChildAttachmentSelected(attach);

            if (m_selectedTraining != null)
                m_selectedTraining.SetSelected(false);

            m_selectedTraining = attach as ValueTrigger;

            foreach (RBFPlug plug in ChildControls)
                plug.SetPlugVal(m_selectedTraining.storedValues[plug.musicRef], true);
        }

        /*
         * Resets the RBF if we change the number of parameters
         */
        public void ResetRBF()
        {
            m_rbf.reset(m_numInputs, ChildControls.Count);
            m_rbf.setSigma(m_sigma);
            foreach (ValueTrigger point in m_childDockables)
            {
                int index = 0;
                double[] values = new double[point.storedValues.Count];
                foreach (KeyValuePair<InstrumentParameter, float> val in point.storedValues)
                    values[index++] = (double)val.Value;

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

			if(m_togglePlacement){
				m_togglePlacement = false;
				PlacePlugs();
			}

            base.Update();
        }

        public void UpdatePlugValues(RBFPlug plug)
        {
            if (m_selectedTraining)
                m_selectedTraining.StoreParameterValue(plug.musicRef);
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
                foreach (RBFPlug plug in ChildControls)
                    plug.SetPlugVal((float)output[index++]);
            }
            base.Gesture_IdleInterior();
        }


        /* 
         * Places plugs evenly spaced around circumference
         */
        public void PlacePlugs()
        {
			for(int i = 0; i < ChildControls.Count; i++){

	            Vector3[] points = GeometryUtils.BuildArcPositions(m_sphereRadius, m_arcSize, ChildControls.Count, m_minAngle, Mathf.PI*0.5f, true);

                //Bit of fudging to get the upwards facing rotation for the plugs
                points[i].z = points[i].y;
                points[i].y = m_plugYOffset;
                Vector3 lookRot = Quaternion.LookRotation(points[i]).eulerAngles;
                points[i].y = -m_plugYOffset;

                iTween.MoveTo(ChildControls[i].gameObject, iTween.Hash("position", points[i], "time", 0.5f, "islocal", true));
                iTween.RotateTo(ChildControls[i].gameObject, iTween.Hash("rotation", lookRot, "time", 0.5f, "islocal", true));

                //ChildControls[i].transform.localPosition = points[i];

			}
        }
    }
}