using UnityEngine;
using System;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using MusicIO;
using UI;

namespace RBF{
	
	public class RBFSphereTraining : UIAttachment {

        public RBFSphere owner { 
            get { return m_owner; }
            set { m_owner = value; }
        }
        protected RBFSphere m_owner;

        public Quaternion angle{ get{return Quaternion.LookRotation(transform.localPosition); }}
        public float distance{ get { return Vector3.Distance(Vector3.zero, transform.localPosition); }}

        public Dictionary<RbfPlugAttachment, double> plugValues { get { return m_outputValues; } }
        protected Dictionary<RbfPlugAttachment, double> m_outputValues;

        public void SetPlugValue(RbfPlugAttachment plug, double value)
        {
            if(m_outputValues.Keys.Contains(plug)){
                m_outputValues[plug] = value;
            }
        }

        public override void Awake()
        {
            base.Awake();
            m_outputValues = new Dictionary<RbfPlugAttachment, double>();
        }

        
	}
}
