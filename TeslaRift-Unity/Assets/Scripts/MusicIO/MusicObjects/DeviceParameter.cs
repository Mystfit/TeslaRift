using UnityEngine;
using System.Collections;
using System.Collections.Generic;


namespace MusicIO
{   
    /*
     *  DeviceParameter
     *  Any parameter on an instrument device
     */
    public class DeviceParameter : InstrumentParameter
    {
        public string deviceName;

        protected int m_deviceIndex;
        public int deviceIndex { get { return m_deviceIndex; } }

        protected int m_parameterIndex;
        public int parameterIndex { get { return m_parameterIndex; } }

        public DeviceParameter(string name, InstrumentHandle paramOwner, int deviceindex, int paramindex, float min, float max)
            : base(name, paramOwner, min, max)
        {
            SetRemoteMethod(paramOwner.owner.methods["set_value"]);
            m_deviceIndex = deviceindex;
            m_parameterIndex = paramindex;
        }

        public override void Send(bool force)
        {
            SetRemoteArg("trackindex", owner.trackIndex);
            SetRemoteArg("deviceindex", m_deviceIndex);
            SetRemoteArg("parameterindex", m_parameterIndex);
            SetRemoteArg("category", category);
            SetRemoteArg("value", scaledVal);
            base.Send(force);
        }
    }
}