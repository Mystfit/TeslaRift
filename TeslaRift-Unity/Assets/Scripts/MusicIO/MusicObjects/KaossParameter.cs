using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Newtonsoft.Json;
using ZST;

namespace MusicIO
{
    /*
     *  DeviceParameter
     *  Any parameter on an instrument device
     */
    public class KaossParameter : InstrumentParameter
    {
        protected string m_arg;
        public KaossParameter(string methodName, InstrumentHandle paramOwner, string argument, float min, float max)
            : base(methodName, paramOwner, min, max)
        {
            m_arg = argument;
            SetRemoteMethod(owner.owner.methods[methodName]);
        }

        public override void Send(bool force)
        {
            SetRemoteArg(m_arg, scaledVal);
            base.Send(force);
        }
    }
}