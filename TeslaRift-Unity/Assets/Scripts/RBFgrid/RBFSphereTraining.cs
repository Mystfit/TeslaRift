using UnityEngine;
using System;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using MusicIO;
using UI;

namespace RBF{
	
	public class RBFSphereTraining : BaseAttachment {

        public RBFSphere owner { 
            get { return m_owner; }
            set { m_owner = value; }
        }
        protected RBFSphere m_owner;

        public Quaternion angle{ get{return Quaternion.LookRotation(transform.localPosition); }}
        public float distance{ get { return Vector3.Distance(Vector3.zero, transform.localPosition); }}

        public Dictionary<RbfPlugAttachment, double> plugValues { get { return m_outputValues; } }
        protected Dictionary<RbfPlugAttachment, double> m_outputValues;

        public void StorePlugValue(RbfPlugAttachment plug)
        {
            m_outputValues[plug] = plug.val;
        }

        public override void Awake()
        {
            SetIsDraggable(true);
            m_outputValues = new Dictionary<RbfPlugAttachment, double>();
            base.Awake();
        }

        public override void Gesture_First()
        {
            if(m_mode == BaseTool.ToolMode.GRABBING){
                m_owner.SetSelectedtraining(this);
				StartDragging(HydraController.Instance.GetHand(m_hand));
            }
            base.Gesture_First();
        }

		public override void Gesture_Exit ()
		{
			base.Gesture_Exit ();
			if(m_mode == BaseTool.ToolMode.GRABBING){
				StopDragging();
			}
		}
	}
}
