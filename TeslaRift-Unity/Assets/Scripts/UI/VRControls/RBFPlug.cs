using UnityEngine;
using MusicIO;
using UI;
using System.Collections;

namespace VRControls
{
    public class RBFPlug : BaseVRControl
    {
        public RBFSphere m_rbfSphere;
        public Rotary m_rotary;
        public Scroller m_paramscroller;
        public Color m_performColor;
        public Color m_editColor;

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
                m_rbfSphere.UpdatePlugValues(this);
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

        public override void HideControls()
        {
            //Perform mode
            base.HideControls();
            m_cap.renderer.materials[0].SetColor("_Color", m_performColor);
            //iTween.ColorTo(m_cap, iTween.Hash("color", m_performColor, "time", 0.2f, "includechildren", false));
        }

        public override void ShowControls()
        {
            //Edit mode
            base.ShowControls();
            m_cap.renderer.materials[0].SetColor("_Color", m_editColor);
            //iTween.ColorTo(m_cap, iTween.Hash("color", m_editColor, "time", 0.2f, "includechildren", false));
        }

        public override void Gesture_First()
        {
            base.Gesture_First();
            if (m_mode == BaseTool.ToolMode.PRIMARY)
                m_paramscroller.ToggleControls();

            if (m_mode == BaseTool.ToolMode.GRABBING)
            {
                m_lastPlugDragPos = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(m_hand)).z;
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
            if (m_mode == BaseTool.ToolMode.GRABBING)
            {
                if (m_originalPosSet)
                {
                    Vector3 pos = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(m_hand));
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
                    if (attach.HasMusicRef)
                    {
                        attach.musicRef.setVal(value);
                    }
                }
            }
        }
    }
}
