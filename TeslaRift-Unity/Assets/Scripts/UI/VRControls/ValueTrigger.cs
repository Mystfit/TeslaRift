using UnityEngine;
using System;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using MusicIO;
using Newtonsoft.Json;
using UI;

namespace VRControls
{
    [JsonConverter(typeof(ValueTriggerSerializer))]
    public class ValueTrigger : BaseVRControl
    {
        public Color m_selectedColor;
        public Color m_defaultColor;

        protected Dictionary<BaseVRControl, float> m_storedValues;
        public Dictionary<BaseVRControl, float> storedValues { get { return m_storedValues; } }

        //Gui objects
        public Scroller m_scroller;

        public override void Awake()
        {
            base.Awake();
            SetIsDraggable(true);
            SetIsDockable(true);
            AddAcceptedDocktype(typeof(Slider));
            AddAcceptedDocktype(typeof(ClipCube));
			m_scroller.AddAcceptedDocktype(typeof(ClipCube));

			if(m_storedValues == null)
                m_storedValues = new Dictionary<BaseVRControl, float>();

            SetOutlineMat(GetComponentInChildren<MeshRenderer>().material);

            Init(new InstrumentParameter("valuetrigger"));
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
			if(base.AddDockableAttachment(attach)){
	            if (attach.musicRef != musicRef) {
	                attach.SetCloneable(false);
	                attach.SetIsDraggable(true);
	                attach.SetIsSaveable(false);
	                attach.SetToolmodeResponse(new BaseTool.ToolMode[] { BaseTool.ToolMode.GRABBING });
					attach.Freeze();
	                m_scroller.AddDockableAttachment(attach);
	                if(m_scroller.DockedChildren.Contains(attach))
	                    m_storedValues[attach] = attach.musicRef.val;
	                return true;
	            }
			}
            return false;
        }

        public override void RemoveDockableAttachment(BaseVRControl attach)
        {
            base.RemoveDockableAttachment(attach);
            m_scroller.RemoveDockableAttachment(attach);
            m_storedValues.Remove(attach);
        }

        public override void DockInto(BaseVRControl attach)
        {
            base.DockInto(attach);
        }

        /*
         * Make sure to mark this editor object as permanent
         */
        public override void Undock()
        {
            base.Undock();
            SetAsDock(true);
            SetTransient(false);
        }

        /*
         * Saves a value in this control to be fired later
         */
        public void StoreParameterValue(BaseVRControl control) { StoreParameterValue(control, control.musicRef.val); }
        public void StoreParameterValue(BaseVRControl control, float val)
        {
			if(m_storedValues == null)
				m_storedValues = new Dictionary<BaseVRControl, float>();
            m_storedValues[control] = val;
        }

        public override void ShowControls()
        {
            base.ShowControls();
            m_scroller.ShowControls();
        }

        public override void HideControls()
        {
            base.HideControls();
            SetSelected(false);
            m_scroller.HideControls();
        }


        /*
         * Fires stored values through attached parameters
         */
        public override void Fire()
        {
            foreach (KeyValuePair<BaseVRControl, float> pair in m_storedValues)
                pair.Key.musicRef.setVal(pair.Value);
        }


        /*
         * Gesture overrides
         */
        public override void Gesture_First()
        {
            base.Gesture_First();
            if (mode == BaseTool.ToolMode.PRIMARY)
            {
                SetSelected(true);
                Fire();
            }
        }

        public override void Gesture_Exit()
        {
            base.Gesture_Exit();
            if (mode == BaseTool.ToolMode.GRABBING)
            {
                //StopDragging();
            }
        }

        public override void Update()
        {
            base.Update();
            if (musicRef.isDirty)
            {
                Fire();
                musicRef.setClean();
            }
        }
    }
}
