using UnityEngine;
using UI;
using MusicIO;
using System.Collections;

namespace VRControls
{
    public class StatePicker : Picker
    {
        public EditorWorkspace m_editorWorkspace;

        public override void Awake()
        {
            base.Awake();
            m_scroller.AddAcceptedDocktype(typeof(CubeButton));
            AddAcceptedDocktype(typeof(CubeButton));
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            if (attach.GetType() == typeof(ControlLayout))
            {
                ControlLayout layout = attach as ControlLayout;
                layout.Init(m_editorWorkspace);
            }
            return base.AddDockableAttachment(attach);
        }
    }
}
