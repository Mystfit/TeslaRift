using UnityEngine;
using ZST;
using System.Collections;
using System.Collections.Generic;


namespace MusicIO
{

    //**
    //  Instrument Params class
    // 
    // - Definition of one parameter for an external instrument
    //
    //**
    public class InstrumentParameter : BaseMusicObject {
        
        protected float m_fValue = 0.0f;
        protected float m_valMin = 0.0f;
        protected float m_valMax = 1.0f;
        protected float m_overrideValue = 0.0f;
        protected Instrument m_owner = null;
        protected bool m_enabled = true;
        protected bool m_isMidiNoteParam = false;

        //Initialization
        public InstrumentParameter(string name, Instrument instrumentOwner, ZstMethod remoteAction, float min, float max)
            : base(name, remoteAction)
        {
            m_owner = instrumentOwner;
            m_valMin = min;
            m_valMax = max;
        }

        public Instrument owner{ get { return m_owner; } }
        public float val { get { return m_fValue; } }
        public float scaledVal{ get { return Utils.Remap(m_fValue, 0.0f, 1.0f, m_valMin, m_valMax); }}
        public int category { get { return (m_owner.isEffect) ? 1 : 0;  } }

        public void setScaledVal(float value) { setScaledVal(value, false); }
        public void setScaledVal(float value, bool silent) { setVal(Utils.Remap(value, m_valMin, m_valMax, 0.0f, 1.0f), silent); }

        public virtual void setVal(float value){ setVal(value, false); }
        public virtual void setVal(float value, bool silent){ 
            if(!silent)
                m_isDirty = true;
            m_fValue = value; 
        }
        public void setOverrideVal(float val){
            m_isDirty = true;
            m_overrideValue = val;
        }
        public bool enabled{ get { return m_enabled; } }
        public virtual void setEnabled(bool value){ 
            m_enabled = value;
        }
    }
}