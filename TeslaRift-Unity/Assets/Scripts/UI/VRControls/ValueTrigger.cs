using UnityEngine;
using System;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using MusicIO;
using UI;

namespace VRControls
{
    public class ValueTrigger : BaseVRControl
    {
        public Color m_selectedColor;
        public Color m_defaultColor;

        protected Dictionary<InstrumentParameter, float> m_storedValues;
        public Dictionary<InstrumentParameter, float> storedValues { get { return m_storedValues; } }

        //Gui objects
        public TextMesh m_valueLabel;
        public Rotary m_rotary;
        public Scroller m_scroller;

        public override void Awake()
        {
            base.Awake();
            SetIsDraggable(true);
            m_storedValues = new Dictionary<InstrumentParameter, float>();
            SetOutlineMat(GetComponentInChildren<MeshRenderer>().material);

            //m_scroller = UIFactory.CreateMusicRefAttachment(typeof(Scroller)) as Scroller;
            //m_scroller.transform.position = transform.position;
            //m_scroller.transform.parent = transform;

            //m_scroller.AddAcceptedDocktype(typeof(Slider));
            //m_scroller.AddAcceptedDocktype(typeof(ValueTrigger));
            m_scroller.SetItemScale(UIFactory.sliderScale.x);

            AddAcceptedDocktype(typeof(Slider));
            AddAcceptedDocktype(typeof(ValueTrigger));

            Init(new InstrumentParameter("valuetrigger"));

            HideControls();
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            if (attach.musicRef != musicRef) {
                attach.SetCloneable(false);
                attach.SetIsDraggable(true);
                attach.SetToolmodeResponse(new BaseTool.ToolMode[] { BaseTool.ToolMode.GRABBING });
				attach.Freeze();
                attach.DockInto(m_scroller);
                if(m_scroller.DockedChildren.Contains(attach))
                    m_storedValues[attach.musicRef] = attach.musicRef.val;
                return true;
            }
            attach.SetFloating();
            return false;
        }

        public override void RemoveDockableAttachment(BaseVRControl attach)
        {
            base.RemoveDockableAttachment(attach);
            m_storedValues.Remove(attach.musicRef);
        }

        /*
         * Saves a value in this control to be fired later
         */
        public void StoreParameterValue(InstrumentParameter param) { StoreParameterValue(param, param.val); }
        public void StoreParameterValue(InstrumentParameter param, float val)
        {
            m_storedValues[param] = val;
        }

        public override void ShowControls()
        {
            base.ShowControls();
            //SetToolmodeResponse(new BaseTool.ToolMode[] { BaseTool.ToolMode.PRIMARY, BaseTool.ToolMode.GRABBING, BaseTool.ToolMode.HOVER });
            m_scroller.ShowControls();
            m_valueLabel.gameObject.SetActive(true);
            m_rotary.SetActive();
        }

        public override void HideControls()
        {
            base.HideControls();
            SetSelected(false);
            //SetToolmodeResponse(new BaseTool.ToolMode[0]);
            m_scroller.HideControls();
            m_valueLabel.gameObject.SetActive(false);
            m_rotary.SetInactive();
        }

        public override void SetSelected(bool state)
        {
            base.SetSelected(state);
            //if (selected)
            //    iTween.ColorTo(gameObject, iTween.Hash("color", m_selectedColor, "time", 0.2f));
            //else
            //    iTween.ColorTo(gameObject, iTween.Hash("color", m_defaultColor, "time", 0.2f));
        }


        /*
         * Fires stored values through attached parameters
         */
        public void FireValues()
        {
            foreach (KeyValuePair<InstrumentParameter, float> pair in m_storedValues)
                pair.Key.setVal(pair.Value);
        }


        /*
         * Gesture overrides
         */
        public override void Gesture_First()
        {
            if (m_mode == BaseTool.ToolMode.GRABBING)
                StartDragging(HydraController.Instance.GetHand(m_hand));
            if (m_mode == BaseTool.ToolMode.PRIMARY)
            {
                SetSelected(true);
                FireValues();
            }
            base.Gesture_First();
        }

        public override void Gesture_Exit()
        {
            base.Gesture_Exit();
            if (m_mode == BaseTool.ToolMode.GRABBING)
            {
                StopDragging();
            }
        }

        public override void Update()
        {
            base.Update();
            if (musicRef.isDirty)
            {
                FireValues();
                musicRef.setClean();
            }
        }
    }
}
