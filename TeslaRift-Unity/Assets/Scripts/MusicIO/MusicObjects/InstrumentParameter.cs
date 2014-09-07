using UnityEngine;
using ZST;
using System.Collections;
using System.Collections.Generic;
using Newtonsoft.Json;


namespace MusicIO
{

    //**
    //  InstrumentHandle Param class
    // 
    // - Definition of one parameter for an external instrument
    //
    //**
	[JsonConverter(typeof(InstrumentParameterSerializer))]
	public class InstrumentParameter
    {
        /*
         * Value properties
         */
        protected float m_fValue = 0.0f;
        protected float m_valMin = 0.0f;
        protected float m_valMax = 1.0f;

        public float min { get { return m_valMin; } }
        public float max { get { return m_valMax; } }

        /*
         * Owning instrument
         */
        public InstrumentHandle owner { get { return m_owner; } }
        protected InstrumentHandle m_owner = null;

        /*
         * Remote showtime method called by this paramter
         */
        protected ZstMethod m_remoteMethod;
        protected void SetRemoteMethod(ZstMethod method) { m_remoteMethod = method; }
        public ZstMethod remoteMethod { get { return m_remoteMethod; } }

        /*
         * Arguments for remote method
         */
        protected Dictionary<string, object> m_remoteMethodArgs;
        public void SetRemoteArg(string key, object val)
        {
            if (m_remoteMethod != null)
            {
                if (m_remoteMethod.args.ContainsKey(key))
                    m_remoteMethod.args[key] = val;
                else
                    throw new KeyNotFoundException();
            }
            else
            {
                throw new UnassignedReferenceException();
            }
        }

        /*
         * Name
         */
        protected string m_name;
        public string name { get { return m_name; } }



        //Initialization
        public InstrumentParameter(string name)
        {
            m_owner = null;
            m_valMin = 0.0f;
            m_valMax = 1.0f;
            m_remoteMethod = null;
            m_name = name;
        }

        public InstrumentParameter(string name, InstrumentHandle instrumentOwner, float min, float max)
        {
            m_owner = instrumentOwner;
            m_valMin = min;
            m_valMax = max;
            m_name = name;
        }

        /*
         * Value getters
         */
        public float val { get { return m_fValue; } }
        public float scaledVal
        {
            get
            {
                float mappedVal = Utils.Remap(m_fValue, 0.0f, 1.0f, m_valMin, m_valMax);
                return (isValueRounded) ? Mathf.Round(mappedVal) : mappedVal;
            }
        }
        public int category
        {
            get
            {
                if (m_owner != null)
                    return (m_owner.isEffect) ? 1 : 0;
                return 0;
            }
        }

        /*
         * Value setters
         */
        public void setScaledVal(float value) { setScaledVal(value, false); }
        public void setScaledVal(float value, bool silent) { setVal(Utils.Remap(value, m_valMin, m_valMax, 0.0f, 1.0f), silent); }

        public virtual void setVal(float value) { setVal(value, false); }
        public virtual void setVal(float value, bool silent)
        {
            if (!silent)
                m_isDirty = true;

            m_fValue = value;
            InstrumentController.Instance.AddToQueue(this);
        }

        /*
         * Clamped attribute state
         */
        public bool isValueRounded { get { return m_valueIsRounded; } }
        public void SetValueRounded(bool state) { m_valueIsRounded = state; }
        protected bool m_valueIsRounded;


        /*
         * Value update state
         */
        protected bool m_isDirty = false;
        public bool isDirty { get { return m_isDirty; } }
        public void setClean() { m_isDirty = false; }


        /*
         * Remote value sending
         */
        public void Send() { Send(false); }
        public virtual void Send(bool force)
        {
            if (isDirty || force)
            {
                if (m_remoteMethod != null && !GlobalConfig.Instance.UseMastersInput)
                    MusicNode.Instance.node.updateRemoteMethod(m_remoteMethod, m_remoteMethod.args);
                setClean();
            } 
        }
    }
}