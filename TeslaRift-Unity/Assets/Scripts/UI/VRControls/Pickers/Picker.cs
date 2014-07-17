using UnityEngine;
using UI;
using MusicIO;
using System;
using System.Collections;
using System.Collections.Generic;


namespace VRControls
{
    public class Picker : BaseVRControl
    {

        public enum PickerDockTypes
        {
            INSTRUMENTORB,
            CUBEBUTTON,
            CONTROLMATRIX,
            RBFSPHERE,
            VALUETRIGGER
        }

        protected Dictionary<PickerDockTypes, Type> m_typeMappings = new Dictionary<PickerDockTypes,Type>{
            {PickerDockTypes.INSTRUMENTORB, typeof(InstrumentOrb)},
            {PickerDockTypes.CUBEBUTTON, typeof(CubeButton)},
            {PickerDockTypes.CONTROLMATRIX, typeof(ControlMatrix)},
            {PickerDockTypes.RBFSPHERE, typeof(RBFSphere)},
            {PickerDockTypes.VALUETRIGGER, typeof(ValueTrigger)}
        };

        public PickerDockTypes[] m_acceptedDockTypes;


        public Scroller m_scroller;
        public Vector3 m_scrollerOffset;
        public Color m_defaultColor;
        public Color m_activeColor;
        public GameObject m_volumetric;
        public Vector3 m_volumetricStartScale;


        public override void Awake()
        {
            base.Awake();
            SetAsDock(true);

            foreach (PickerDockTypes t in m_acceptedDockTypes)
                AddAcceptedDocktype(m_typeMappings[t]);

            m_scroller.SetOffset(m_scrollerOffset);
            m_volumetricStartScale = m_volumetric.transform.localScale;
        }

        public override void AddAcceptedDocktype(System.Type type)
        {
            base.AddAcceptedDocktype(type);
            m_scroller.AddAcceptedDocktype(type);
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
            iTween.FadeTo(m_volumetric, iTween.Hash("alpha", 0.23f, "time", 0.2f, "easetype", "easeOutCubic"));
            iTween.ScaleTo(m_volumetric, iTween.Hash("scale", m_volumetricStartScale, "time", 0.2f, "easetype", "easeOutCubic"));
            m_scroller.ShowControls();
        }

        public override void HideControls()
        {
            base.HideControls();
            iTween.FadeTo(m_volumetric, iTween.Hash("alpha", 0.23f, "time", 0.2f, "easetype", "easeOutCubic"));
            iTween.ScaleTo(m_volumetric, iTween.Hash("scale", new Vector3(m_volumetricStartScale.x, 0.0f, m_volumetricStartScale.z), "time", 0.2f, "easetype", "easeOutCubic"));
            m_scroller.HideControls();
        }
    }
}
