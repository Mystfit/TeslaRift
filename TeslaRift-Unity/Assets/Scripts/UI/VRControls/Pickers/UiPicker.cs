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
            matrix.SetCloneable(true);

            RBFSphere sphere = UIFactory.CreateMusicRefAttachment(typeof(RBFSphere)) as RBFSphere;
            sphere.DockInto(m_scroller);
            sphere.SetCloneable(true);

            ValueTrigger trigger = UIFactory.CreateMusicRefAttachment(typeof(ValueTrigger)) as ValueTrigger;
            trigger.DockInto(m_scroller);
            trigger.SetCloneable(true);
        }
    }
}
