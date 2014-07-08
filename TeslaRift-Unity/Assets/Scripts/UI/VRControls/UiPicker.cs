using UnityEngine;
using UI;
using MusicIO;
using System.Collections;

namespace VRControls
{
    public class UiPicker : BaseVRControl
    {
        public Scroller m_scroller;
        public Vector3 m_scrollerOffset;
		public GameObject m_volumetric;
		protected Vector3 m_volumetricStartScale;

        public override void Awake()
        {
            base.Awake();

            m_scroller.SetOffset(m_scrollerOffset);
            m_scroller.AddAcceptedDocktype(typeof(ControlMatrix));
            m_scroller.AddAcceptedDocktype(typeof(RBFSphere));
            m_scroller.AddAcceptedDocktype(typeof(ValueTrigger));

            ControlMatrix matrix = UIFactory.CreateMusicRefAttachment(typeof(ControlMatrix)) as ControlMatrix;
            matrix.DockInto(m_scroller);
            matrix.SetCloneable(true);

            RBFSphere sphere = UIFactory.CreateMusicRefAttachment(typeof(RBFSphere)) as RBFSphere;
            sphere.DockInto(m_scroller);
            sphere.SetCloneable(true);

            ValueTrigger trigger = UIFactory.CreateMusicRefAttachment(typeof(ValueTrigger)) as ValueTrigger;
            trigger.DockInto(m_scroller);
            trigger.SetCloneable(true);

			m_volumetricStartScale = m_volumetric.transform.localScale;
        }

        public override void Gesture_First()
        {
            if (m_scroller != null)
                ToggleControls();

            base.Gesture_First();
        }

        public override void ShowControls()
        {
            base.ShowControls();
			iTween.FadeTo(m_volumetric, iTween.Hash("alpha", 0.23f, "time", 0.2f, "easetype", "easeOutCubic"));
			iTween.ScaleTo(m_volumetric, iTween.Hash("scale", m_volumetricStartScale, "time", 0.2f, "easetype", "easeOutCubic"));
            m_scroller.ShowControls();
        }

        public override void HideControls()
        {
            base.HideControls();
			iTween.FadeTo(m_volumetric, iTween.Hash("alpha", 0.0f, "time", 0.2f, "easetype", "easeOutCubic"));
			iTween.ScaleTo(m_volumetric, iTween.Hash("scale", new Vector3(m_volumetricStartScale.x, 0.0f, m_volumetricStartScale.z), "time", 0.2f, "easetype", "easeOutCubic"));
			m_scroller.HideControls();
        }
    }
}
