using UnityEngine;
using UI;
using MusicIO;
using System.Collections;

namespace VRControls
{
    public class StatePicker : Picker
    {
        public InstrumentDock m_instrumentDock;

        public override void Awake()
        {
            base.Awake();
            m_scroller.AddAcceptedDocktype(typeof(CubeButton));
            AddAcceptedDocktype(typeof(CubeButton));
        }
    }
}
