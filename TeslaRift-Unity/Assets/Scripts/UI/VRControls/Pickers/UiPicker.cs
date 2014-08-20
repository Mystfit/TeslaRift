using UnityEngine;
using UI;
using MusicIO;
using System.Collections;

namespace VRControls
{
    public class UiPicker : Picker
    {
        public override void Awake()
        {
            base.Awake();
            ControlMatrix matrix = UIFactory.CreateMusicRefAttachment(typeof(ControlMatrix)) as ControlMatrix;
            matrix.DockInto(m_scroller);
            matrix.SetAsTemplate(true);
            matrix.SetCloneable(true);

            RBFSphere sphere = UIFactory.CreateMusicRefAttachment(typeof(RBFSphere)) as RBFSphere;
            sphere.DockInto(m_scroller);
            sphere.SetAsTemplate(true);
            sphere.SetCloneable(true);

            ValueTrigger trigger = UIFactory.CreateMusicRefAttachment(typeof(ValueTrigger)) as ValueTrigger;
            trigger.DockInto(m_scroller);
            trigger.SetAsTemplate(true);
            trigger.SetCloneable(true);

            RBFPlug plug = UIFactory.CreateMusicRefAttachment(typeof(RBFPlug)) as RBFPlug;
            plug.DockInto(m_scroller);
            plug.SetAsTemplate(true);
            plug.SetCloneable(true);
        }
    }
}
