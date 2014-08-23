using UnityEngine;
using UI;
using MusicIO;
using System.Collections;
using System.Collections.Generic;

namespace VRControls
{
    public class InstrumentDock : RadialDock
    {
        public override void Awake()
        {
            base.Awake();
            AddAcceptedDocktype(typeof(InstrumentOrb));
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            InstrumentOrb instrument = attach as InstrumentOrb;

            if (!DockContainsInstrument(instrument.instrumentRef))
            {
                if (base.AddDockableAttachment(instrument))
                    return true;
            }
            return false;
        }

        public bool DockContainsInstrument(InstrumentHandle musicRef)
        {
            if (DockedChildren != null)
            {
                foreach (InstrumentOrb attach in DockedChildren)
                {
                    if (attach.instrumentRef != null)
                    {
                        if (attach.instrumentRef == musicRef)
                            return true;
                    }
                }
            }
            return false;
        }
    }
}