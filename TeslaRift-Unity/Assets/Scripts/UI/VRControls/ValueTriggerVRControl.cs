using UnityEngine;
using System;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using MusicIO;
using UI;

namespace VRControls
{
    public class ValueTriggerVRControl : MusicVRControl<InstrumentParameter>
    {
        public Color m_selectedColor;
        public Color m_defaultColor;

        protected Dictionary<InstrumentParameter, float> m_storedValues;
        public Dictionary<InstrumentParameter, float> storedValues { get { return m_storedValues; } }


        public override void Awake()
        {
            base.Awake();
            SetIsDraggable(true);
            m_storedValues = new Dictionary<InstrumentParameter, float>();
            SetOutlineMat(renderer.material);
        }

        /*
         * Saves a value in this control to be fired later
         */
        public void StoreParameterValue(InstrumentParameter param) { StoreParameterValue(param, param.val); }
        public void StoreParameterValue(InstrumentParameter param, float val)
        {
            if (m_storedValues.Keys.Contains(param))
                storedValues[param] = val;
        }

        public override void ShowControls()
        {
            base.ShowControls();
            SetToolmodeResponse(new BaseTool.ToolMode[] { BaseTool.ToolMode.PRIMARY, BaseTool.ToolMode.GRABBING, BaseTool.ToolMode.HOVER });
        }

        public override void HideControls()
        {
            base.HideControls();
            SetSelected(false);
            SetToolmodeResponse(new BaseTool.ToolMode[0]);
        }

        public override void SetSelected(bool state)
        {
            base.SetSelected(state);
            if (selected)
                iTween.ColorTo(gameObject, iTween.Hash("color", m_selectedColor, "time", 0.2f));
            else
                iTween.ColorTo(gameObject, iTween.Hash("color", m_defaultColor, "time", 0.2f));
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
    }
}
