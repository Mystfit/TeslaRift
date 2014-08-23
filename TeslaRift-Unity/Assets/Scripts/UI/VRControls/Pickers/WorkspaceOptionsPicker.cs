using UnityEngine;
using UI;
using MusicIO;
using System.Collections;

namespace VRControls
{
    public class WorkspaceOptionsPicker : Picker
    {
        public override void Awake()
        {
            base.Awake();
            AddAcceptedDocktype(typeof(InstrumentOrb));
        }

        public override void Gesture_First()
        {
            if (m_scroller != null)
                ToggleControls();

            base.Gesture_First();
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            if (base.AddDockableAttachment(attach))
            {
                m_scroller.AddDockableAttachment(attach);
                return true;
            }
            return false;
        }

        public override void RemoveDockableAttachment(BaseVRControl attach)
        {
            base.RemoveDockableAttachment(attach);
            m_scroller.RemoveDockableAttachment(attach);
        }

        public override void ShowControls()
        {
            base.ShowControls();
            m_scroller.ShowControls();
        }

        public override void HideControls()
        {
            base.HideControls();
            m_scroller.HideControls();
        }
    }
}
