using UnityEngine;
using UI;
using MusicIO;
using System.Collections;

namespace VRControls
{
    public class InstrumentPicker : Picker
    {
		public override void Awake()
        {
            base.Awake();
            AddAcceptedDocktype(typeof(InstrumentOrb));
		}
    }
}
