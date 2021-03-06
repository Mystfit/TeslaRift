﻿using UnityEngine;
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
			RBFPLUG,
            VALUETRIGGER,
            CONTROLLAYOUT
        }

        protected Dictionary<PickerDockTypes, Type> m_typeMappings = new Dictionary<PickerDockTypes,Type>{
            {PickerDockTypes.INSTRUMENTORB, typeof(InstrumentOrb)},
            {PickerDockTypes.CUBEBUTTON, typeof(CubeButton)},
            {PickerDockTypes.CONTROLMATRIX, typeof(ControlMatrix)},
            {PickerDockTypes.RBFSPHERE, typeof(RBFSphere)},
			{PickerDockTypes.RBFPLUG, typeof(RBFPlug)},
            {PickerDockTypes.VALUETRIGGER, typeof(ValueTrigger)},
            {PickerDockTypes.CONTROLLAYOUT, typeof(ControlLayout)}
        };

        public PickerDockTypes[] m_acceptedDockTypes;


        public Scroller m_scroller;
        public Vector3 m_scrollerOffset;
        public Color m_defaultColor;
        public Color m_activeColor;
        public GameObject m_model;

        public override void Awake()
        {
            base.Awake();
            SetAsDock(true);

            foreach (PickerDockTypes t in m_acceptedDockTypes)
                AddAcceptedDocktype(m_typeMappings[t]);

            m_scroller.SetOffset(m_scrollerOffset);
        }

        public override void AddAcceptedDocktype(System.Type type)
        {
            base.AddAcceptedDocktype(type);
            m_scroller.AddAcceptedDocktype(type);
        }

        public override void StartHover()
        {
            base.StartHover();
            if (m_scroller != null && !controlsVisible && typeof(RadialDock).IsAssignableFrom(DockedInto.GetType()))
                ShowControls();
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
            if (controlsEnabled)
                m_scroller.ShowControls();
        }

        public override void HideControls()
        {
            base.HideControls();
            if (controlsEnabled)
                m_scroller.HideControls();
        }

        public override void SetUIContextToEditor()
        {
            EnableControls();
            if (m_model != null)
            {
                m_model.renderer.material.SetColor("_Color", m_defaultColor);
                m_model.renderer.material.SetColor("_Emission", m_defaultColor);
            }
        }

        public override void SetUIContextToPerformer()
        {
            HideControls();
            DisableControls();
            if (m_model != null)
            {
                m_model.renderer.material.SetColor("_Color", new Color(0.5f,0.5f,0.5f,1.0f));
                m_model.renderer.material.SetColor("_Emission", new Color(0.5f, 0.5f, 0.5f, 1.0f));
            }
        }
    }
}
