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
    public class KaossTriggerParameter : InstrumentParameter
    {
        public static int ON = 1;
        public static int OFF = 0;

        public KaossTriggerParameter(string name, ZstMethod method)
            : base(name, null, 0, 1)
        {
            SetRemoteMethod(method);
        }

        public override void Send(bool force)
        {
            SetRemoteArg("trigger", scaledVal);
            base.Send(force);
        }
    }
}