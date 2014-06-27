using UnityEngine;
using System.Collections;
using System.Collections.Generic;


namespace MusicIO
{

   /*
    *  SendParameter
    *  Send effect track volume
    */
    public class SendParameter : InstrumentParameter
    {
        public int sendIndex { get { return m_sendIndex; } }
        protected int m_sendIndex;

        public SendParameter(string name, Instrument paramOwner, int sendIndex)
            : base(name, paramOwner, paramOwner.owner.methods["set_send"], 0.0f, 1.0f)
        {
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