using UnityEngine;
using UI;
using MusicIO;
using System.Collections;

namespace VRControls
{
    public class ControlsPicker : BaseVRControl
    {

        public Scroller m_instrumentScroller;
        public Scroller m_editorsScroller;
        public Scroller m_activeScroller;

        public Vector3 m_instrumentScrollerOffset;
        public Vector3 m_editorsScrollerOffset;

        public Color m_defaultColor;
        public Color m_activeColor;

        public GameObject m_instrumentVolumetric;
        public GameObject m_editorsVolumetric;

        public Vector3 m_volumetricStartScale;

        public override void Awake()
        {
            base.Awake();
            //Setup instrument scroller
            m_instrumentScroller.SetOffset(m_instrumentScrollerOffset);
            m_instrumentScroller.AddAcceptedDocktype(typeof(InstrumentOrb));

            m_volumetricStartScale = m_instrumentVolumetric.transform.localScale;


            //Setup ui scroller
            m_editorsScroller.SetOffset(m_editorsScrollerOffset);
            m_editorsScroller.AddAcceptedDocktype(typeof(ControlMatrix));
            m_editorsScroller.AddAcceptedDocktype(typeof(RBFSphere));
            m_editorsScroller.AddAcceptedDocktype(typeof(ValueTrigger));

            ControlMatrix matrix = UIFactory.CreateMusicRefAttachment(typeof(ControlMatrix)) as ControlMatrix;
            matrix.DockInto(m_editorsScroller);
            matrix.SetCloneable(true);

            RBFSphere sphere = UIFactory.CreateMusicRefAttachment(typeof(RBFSphere)) as RBFSphere;
            sphere.DockInto(m_editorsScroller);
            sphere.SetCloneable(true);

            ValueTrigger trigger = UIFactory.CreateMusicRefAttachment(typeof(ValueTrigger)) as ValueTrigger;
            trigger.DockInto(m_editorsScroller);
            trigger.SetCloneable(true);
        }

        public override void Gesture_First()
        {
            ToggleControls();
            base.Gesture_First();
        }

        public override void Update()
        {
            base.Update();
            Vector3 facingDir = HydraController.Instance.GetHand(m_hand).transform.up;
            if (facingDir.y >= 0.0f && m_activeScroller != m_instrumentScroller)
            {
                ToggleInstrumentPickerControls();
            }
            if (facingDir.y < 0.0f && m_activeScroller != m_editorsScroller)
            {
                ToggleEditorsPickerControls();
            }
        }

        public void ToggleInstrumentPickerControls()
        {
            if (m_activeScroller != null)
            {
                m_activeScroller.HideControls();
                iTween.FadeTo(m_instrumentVolumetric, iTween.Hash("alpha", 0.23f, "time", 0.2f, "easetype", "easeOutCubic"));
                iTween.ScaleTo(m_instrumentVolumetric, iTween.Hash("scale", m_volumetricStartScale, "time", 0.2f, "easetype", "easeOutCubic"));
                iTween.FadeTo(m_editorsVolumetric, iTween.Hash("alpha", 0.23f, "time", 0.2f, "easetype", "easeOutCubic"));
                iTween.ScaleTo(m_editorsVolumetric, iTween.Hash("scale", new Vector3(m_volumetricStartScale.x, 0.0f, m_volumetricStartScale.z), "time", 0.2f, "easetype", "easeOutCubic"));
            }
            m_instrumentScroller.ShowControls();
            m_activeScroller = m_instrumentScroller;
        }

        public void ToggleEditorsPickerControls()
        {
            if (m_activeScroller != null)
            {
                m_activeScroller.HideControls();
                iTween.FadeTo(m_editorsVolumetric, iTween.Hash("alpha", 0.23f, "time", 0.2f, "easetype", "easeOutCubic"));
                iTween.ScaleTo(m_editorsVolumetric, iTween.Hash("scale", m_volumetricStartScale, "time", 0.2f, "easetype", "easeOutCubic"));
                iTween.FadeTo(m_instrumentVolumetric, iTween.Hash("alpha", 0.23f, "time", 0.2f, "easetype", "easeOutCubic"));
                iTween.ScaleTo(m_instrumentVolumetric, iTween.Hash("scale", new Vector3(m_volumetricStartScale.x, 0.0f, m_volumetricStartScale.z), "time", 0.2f, "easetype", "easeOutCubic"));
            }
            m_editorsScroller.ShowControls();
            m_activeScroller = m_editorsScroller;
        }
    }
}
