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
    public class MidiBankParameter : InstrumentParameter
    {
        protected string m_arg;
        public MidiBankParameter(string methodName, InstrumentHandle paramOwner, string argument, float min, float max)
            : base(methodName, paramOwner, min, max)
        {
            m_arg = argument;
            SetRemoteMethod(owner.owner.methods[methodName]);
        }

        public override void Send(bool force)
        {
            SetRemoteArg("channel", 0);
            SetRemoteArg("bankA", 0);
            SetRemoteArg(m_arg, scaledVal);
            base.Send(force);
        }
    }
}