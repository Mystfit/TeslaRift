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
            m_hideControlsWhenLeaving = false;
            AddAcceptedDocktype(typeof(InstrumentOrb));
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            InstrumentOrb instrument = attach as InstrumentOrb;

            if (!DockContainsInstrument(instrument.instrumentRef))
            {
                if (base.AddDockableAttachment(instrument))
                {
                    instrument.SetFacingPerformer(true);
                    instrument.SetToolmodeResponse(new BaseTool.ToolMode[]{
                        BaseTool.ToolMode.PRIMARY, 
                        BaseTool.ToolMode.GRABBING,
                        BaseTool.ToolMode.HOVER,
                        BaseTool.ToolMode.SECONDARY
                    });
                    return true;
                }
                    
            }
            return false;
        }

        public override void RemoveDockableAttachment(BaseVRControl attach)
        {
            base.RemoveDockableAttachment(attach);
            SetFacingPerformer(false);
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