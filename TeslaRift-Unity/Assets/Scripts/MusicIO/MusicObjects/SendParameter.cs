using UnityEngine;
using System.Collections;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace MusicIO
{
   /*
    *  SendParameter
    *  Send effect track volume
    */
    [JsonConverter(typeof(SendSerializer))]
    public class SendParameter : InstrumentParameter
    {
        public int sendIndex { get { return m_sendIndex; } }
        protected int m_sendIndex;

        public SendParameter(string name, InstrumentHandle paramOwner, int sendIndex)
            : base(name, paramOwner, 0.0f, 1.0f)
        {
            SetRemoteMethod(paramOwner.owner.methods["set_send"]);
            m_sendIndex = sendIndex;
        }

        public override void Send(bool force)
        {
            SetRemoteArg("trackindex", m_owner.trackIndex);
            SetRemoteArg("sendindex", m_sendIndex);
            SetRemoteArg("value", scaledVal);
            base.Send(force);
        }
    }

}