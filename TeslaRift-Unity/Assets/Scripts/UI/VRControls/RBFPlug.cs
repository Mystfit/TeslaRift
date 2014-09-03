using UnityEngine;
using MusicIO;
using UI;
using System.Collections;

namespace VRControls
{
    public class RBFPlug : BaseVRControl
    {
        private RBFSphere m_rbfSphere;
        public Rotary m_rotary;
        public Scroller m_paramscroller;
        public Color m_performColor;
        public Color m_editColor;

        public void SetSphere(RBFSphere sphere)
        {
            m_rbfSphere = sphere;
        }

        //Plug values
        public void SetPlugVal(float val)
        {
            SetPlugVal(val, false);
        }
        public void SetPlugVal(float val, bool silent)
        {
            musicRef.setVal(Mathf.Clamp(val, 0.0f, 1.0f));
            m_rotary.setVal(musicRef.val);
            if (!silent)
                if(m_rbfSphere != null) m_rbfSphere.UpdatePlugValues();
            if (m_plugTop != null)
                m_plugTop.localPosition = new Vector3(0.0f, 0.0f, musicRef.val * m_maxPlugDragDistance);
            if (m_plugInner != null)
                m_plugInner.localScale = new Vector3(m_innerPlugScale.x, m_innerPlugScale.y, musicRef.val * m_innerPlugScale.z);
            if (m_plugExterior != null)
                m_plugExterior.localScale = new Vector3(m_exteriorPlugScale.x, m_exteriorPlugScale.y, musicRef.val * m_exteriorPlugScale.z);

            SetSliderVals(musicRef.val);
        }

        //Plug drag/rotate values
        protected float m_lastAngle;
        protected float m_lastPlugDragPos;
        protected bool m_originalPosSet;
        public float m_maxPlugDragDistance = 1.0f;
        protected Vector3 m_innerPlugScale;
        protected Vector3 m_exteriorPlugScale;

        //Plug drag objects
        public Transform m_plugInner;
        public Transform m_plugTop;
        public Transform m_plugExterior;
        public GameObject m_cap;

        public bool isDirty;
        public void setClean() { isDirty = false; }
        public void setDirty() { isDirty = true; }


        // Use this for initialization
        public override void Awake()
        {
            base.Awake();
            AddAcceptedDocktype(typeof(Slider));
            SetAsDock(true);
            m_paramscroller.SetItemScale(UIFactory.sliderScale.x);

            Init(new InstrumentParameter("plug"));

            m_innerPlugScale = m_plugInner.localScale;
            m_exteriorPlugScale = m_plugExterior.localScale;
            HideControls();
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            Slider slider = attach as Slider;
            slider.SetCloneable(false);
            slider.SetIsDraggable(true);
            slider.SetToolmodeResponse(new BaseTool.ToolMode[] { BaseTool.ToolMode.GRABBING });
            slider.DockInto(m_paramscroller);
            return true;
        }

        public override void RemoveDockableAttachment(BaseVRControl attach)
        {
            base.RemoveDockableAttachment(attach);
            m_paramscroller.RemoveDockableAttachment(attach);
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

        public override void SetUIContextToPerformer()
        {
            base.SetUIContextToPerformer();
            m_cap.renderer.materials[0].SetColor("_Color", m_performColor);
        }

        public override void SetUIContextToEditor()
        {
            base.SetUIContextToEditor();
            m_cap.renderer.materials[0].SetColor("_Color", m_editColor);
        }

        public override void Gesture_First()
        {
            base.Gesture_First();

            BaseTool.ToolMode contextMode = BaseTool.ToolMode.GRABBING;

            if (uiContext == UIController.UIContext.EDITING)
            {
                contextMode = BaseTool.ToolMode.PRIMARY;
            }
            else if (uiContext == UIController.UIContext.PERFORMING)
            {
                contextMode = BaseTool.ToolMode.GRABBING;
            }

            if (mode == contextMode)
            {
                m_lastPlugDragPos = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(MajorHand)).z;
                m_originalPosSet = true;
            }
        }

        public override void Gesture_Exit()
        {
            m_lastAngle = 0.0f;
            m_lastPlugDragPos = 0.0f;
            m_originalPosSet = false;
            base.Gesture_Exit();
        }

        public override void Gesture_IdleInterior()
        {

            BaseTool.ToolMode contextMode = BaseTool.ToolMode.GRABBING;

            if (uiContext == UIController.UIContext.EDITING)
            {
                contextMode = BaseTool.ToolMode.PRIMARY;
            }
            else if (uiContext == UIController.UIContext.PERFORMING)
            {
                contextMode = BaseTool.ToolMode.GRABBING;
            }
                

            if (mode == contextMode)
            {
                if (m_originalPosSet)
                {
                    Vector3 pos = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(MajorHand));
                    float delta = m_lastPlugDragPos - pos.z;

                    float newVal = musicRef.val - (delta / m_maxPlugDragDistance);
                    SetPlugVal(Utils.Clamp(newVal, 0.0f, 1.0f));
                    m_lastPlugDragPos = pos.z;
                }
            }

            base.Gesture_IdleInterior();
        }

        public void SetSliderVals(float value)
        {
            if (m_paramscroller.DockedChildren != null)
            {
                foreach (Slider attach in m_paramscroller.DockedChildren)
                {
                    if (attach.musicRef != null)
                    {
                        attach.musicRef.setVal(value);
                    }
                }
            }
        }
    }
}
