using UnityEngine;
using UI;
using System.Collections;
using MusicIO;
using Newtonsoft.Json;

namespace VRControls
{
    [JsonConverter(typeof(BaseVRControlSerializer))]
    public class InstrumentOrb : BaseVRControl
    {

        protected Scroller m_parameterScroller;
        protected Scroller m_clipScroller;
        protected GameObject m_dividingQuad;
        protected GameObject m_rotator;
        protected UIFrame m_frame;
        protected bool m_canShowLabel = false;
        protected bool m_firstDock = true;

        public GameObject m_modelFrame;
        public GameObject m_modelInterior;
        public GameObject m_modelExterior;

        public float m_dividerWidth = 0.005f;
        public float m_controlsMirrorOffset = 0.05f;
        public float m_controlsYOffset = 0.05f;
        public float m_itemSpacing = 0.1f;

		public InstrumentHandle instrumentRef { get { return m_instrumentRef; } }
        protected InstrumentHandle m_instrumentRef;

        //Meter value
        protected float m_displayedMeter;
        public float m_meterDecay = 0.05f;
        public bool m_useMeterDecay;


        public override void Awake()
        {
            base.Awake();

            AddAcceptedDocktype(typeof(Slider));
            AddAcceptedDocktype(typeof(ClipCube));

            //Since instrument attachments are created at runtime, we need to set the filter here
            SetToolmodeResponse(new BaseTool.ToolMode[]{
                BaseTool.ToolMode.GRABBING,
                BaseTool.ToolMode.HOVER
            });

            //Set the collision state
            SetCollideable(true);
            SetIsDockable(true);
            SetIsDraggable(true);
            SetCloneable(true);
            SetOutlineMat(m_modelFrame.renderer.material);

            m_frame = transform.Find("frame").GetComponent<UIFrame>();                
        }


        /*
         * Initialization
         */
        public void Init(InstrumentHandle managedReference)
        {
            if (managedReference != null)
            {
                m_instrumentRef = managedReference;
                InitInstrumentControls();
            }
            else
            {
                throw new UnassignedReferenceException();
            }
        }

        public void InitInstrumentControls()
        {
            BaseTool.ToolMode[] defaultToolResponse = new BaseTool.ToolMode[]{
                BaseTool.ToolMode.GRABBING, 
                BaseTool.ToolMode.PRIMARY,
            };


            if (m_instrumentRef != null)
            {
                //Set name
                gameObject.name = instrumentRef.name;

                //Set color
                m_modelFrame.renderer.material.SetColor("_Color", m_instrumentRef.color);

                m_modelExterior.renderer.material.SetColor("_Color", m_instrumentRef.color * new Color(1.0f, 1.0f, 1.0f, 0.35f));
                m_modelExterior.renderer.material.SetColor("_Emission", m_instrumentRef.color);

                m_modelInterior.renderer.material.SetColor("_Color", m_instrumentRef.color * new Color(1.4f, 1.4f, 1.4f, 1.0f));

                m_rotator = new GameObject("rotator");
                m_rotator.transform.parent = transform;
                m_rotator.transform.localPosition = Vector3.zero;

                //Create clip scroller
                Scroller clipScroller = UIFactory.CreateMusicRefAttachment(typeof(Scroller)) as Scroller;
                clipScroller.SetItemSpacing(m_itemSpacing);
                clipScroller.AddAcceptedDocktype(typeof(ClipCube));
                clipScroller.transform.parent = m_rotator.transform;
                clipScroller.SetOffset(new Vector3(-m_controlsMirrorOffset, m_controlsYOffset + 0.02f, 0.0f));
                m_clipScroller = clipScroller;

                AddChildControl(clipScroller);

                //Create clips
                foreach (ClipParameter clip in m_instrumentRef.clipList)
                {
                    ClipCube cube = UIFactory.CreateMusicRefAttachment(typeof(ClipCube), clip) as ClipCube;
                    cube.SetCloneable(true);
                    cube.SetIsSaveable(false);
                    cube.SetColour(m_instrumentRef.color);
                    cube.DockInto(this);
                    cube.SetToolmodeResponse(defaultToolResponse);
                }

                //Create parameter scroller
                Scroller paramScroller = UIFactory.CreateMusicRefAttachment(typeof(Scroller)) as Scroller;
                paramScroller.transform.parent = m_rotator.transform;
                paramScroller.SetOffset(new Vector3(m_controlsMirrorOffset, m_controlsYOffset, 0.0f));
                paramScroller.SetItemSpacing(m_itemSpacing);
                m_parameterScroller = paramScroller;

                AddChildControl(paramScroller);

                
                //Create note slider
                if (m_instrumentRef.isMidi)
                {
                    Slider noteSlider = UIFactory.CreateMusicRefAttachment(typeof(Slider), m_instrumentRef.noteChannel) as Slider;
                    noteSlider.SetCloneable(true);
                    noteSlider.SetIsSaveable(false);
                    noteSlider.DockInto(this);
                    noteSlider.SetToolmodeResponse(defaultToolResponse);
                }

                //Create parameters
                foreach (InstrumentParameter param in m_instrumentRef.paramList)
                {
                    Slider slider = UIFactory.CreateMusicRefAttachment(typeof(Slider), param) as Slider;
                    slider.SetCloneable(true);
                    slider.SetIsSaveable(false);
                    slider.DockInto(this);
                    slider.SetToolmodeResponse(defaultToolResponse);
                }

                //Create send sliders
                foreach (InstrumentParameter send in m_instrumentRef.sendsList)
                {
                    Slider slider = UIFactory.CreateMusicRefAttachment(typeof(Slider), send) as Slider;
                    slider.SetCloneable(true);
                    slider.SetIsSaveable(false);
                    slider.DockInto(this);
                    slider.SetToolmodeResponse(defaultToolResponse);
                }

                if (m_instrumentRef.clipList.Count < clipScroller.numDisplayedAttachments)
                    clipScroller.SetNumDisplayedAttachments(m_instrumentRef.clipList.Count);

                if (m_instrumentRef.paramList.Count < paramScroller.numDisplayedAttachments)
                    paramScroller.SetNumDisplayedAttachments(m_instrumentRef.paramList.Count);

                

                //Central divider 
                float largestHeight = (clipScroller.upperVisibleBounds > paramScroller.upperVisibleBounds) ? clipScroller.upperVisibleBounds : paramScroller.upperVisibleBounds;
                m_dividingQuad = UIFactory.CreateGuiQuad();
                m_dividingQuad.transform.localScale = new Vector3(m_dividerWidth, largestHeight, 1.0f);
                m_dividingQuad.transform.parent = m_rotator.transform;
                m_dividingQuad.transform.localPosition = new Vector3(0.0f, m_controlsYOffset, 0.0f);

                DisableControls();
            }
        }

        public override void Undock()
        {
            base.Undock();
            m_canShowLabel = false;
            m_firstDock = false;
            if (m_frame != null)
            {
                m_frame.gameObject.SetActive(false);
            }
        }

        public override void DockInto(BaseVRControl attach)
        {
            base.DockInto(attach);
            m_canShowLabel = true;
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            if (base.AddDockableAttachment(attach))
            {
                if (attach.GetType() == typeof(Slider))
                    m_parameterScroller.AddDockableAttachment(attach);
                else if (attach.GetType() == typeof(ClipCube))
                    m_clipScroller.AddDockableAttachment(attach);
                return true;
            }
            return false;
        }

        public override void RemoveDockableAttachment(BaseVRControl attach)
        {
            base.RemoveDockableAttachment(attach);
            if (attach.GetType() == typeof(Slider))
                m_parameterScroller.RemoveDockableAttachment(attach);
            else if (attach.GetType() == typeof(ClipCube))
                m_clipScroller.RemoveDockableAttachment(attach);
        }

        public override void ShowControls()
        {
            if (controlsEnabled)
            {
                m_rotator.SetActive(true);
                //m_parameterScroller.GetComponent<Scroller>().SetDockablesAsTweenable(true);
                //m_clipScroller.GetComponent<Scroller>().SetDockablesAsTweenable(true);

                base.ShowControls();
            }
        }

        public override void HideControls()
        {
            m_rotator.SetActive(false);
            base.HideControls();
        }


        public override void Update()
        {
            base.Update();

            if (m_frame != null)
            {

                if (m_frame.label.text != m_instrumentRef.name)
                {
                    m_frame.SetMatchTextWidth(true);
                    m_frame.SetLabel(m_instrumentRef.name);
                }
            }

            if (instrumentRef.isMeterDirty)
            {
                m_displayedMeter = instrumentRef.meterVolume;
                instrumentRef.SetMeterClean();
            }

            SetOutlineColor(UIFactory.outlineSelectedColor * new Color(1.0f, 1.0f, 1.0f, 0.2f + m_displayedMeter * 0.8f), false);
            SetOutlineSize(UIFactory.outlineSelectedSize * m_displayedMeter, false);
            float scale = m_displayedMeter * 0.8f + 0.2f;
            m_modelInterior.transform.localScale = new Vector3(scale, scale, scale);
            if (m_instrumentRef.playingClip != null)
                SetSelected(true);
            else
                SetSelected(false);

            if (m_useMeterDecay)
            {
                m_displayedMeter -= m_meterDecay;
                m_displayedMeter = Mathf.Clamp(m_displayedMeter, 0.0f, 1.0f);
            }
        }


        /*
         *  Gesture handlers
         */
        public override void Gesture_First()
        {
            base.Gesture_First();

            if (mode == BaseTool.ToolMode.PRIMARY)
                ToggleControls();
        }

        public override void StartHover()
        {
            base.StartHover();
            if (!m_frame.gameObject.activeSelf && m_canShowLabel && !m_firstDock)
                m_frame.gameObject.SetActive(true);
        }

        public override void StopHover()
        {
            base.StopHover();
            if (m_frame != null)
            {
                if (m_frame.gameObject.activeSelf && !m_firstDock)
                    m_frame.gameObject.SetActive(false);
            }
        }

        public override void Gesture_IdleProximity()
        {
            base.Gesture_IdleProximity();
        }

        public override void Gesture_Exit()
        {
            base.Gesture_Exit();
            if (mode == BaseTool.ToolMode.GRABBING)
            {
                //StopDragging();
            }
        }

        public override void Gesture_PushIn()
        {
            base.Gesture_PushIn();
        }

        public override void Gesture_PullOut()
        {
            base.Gesture_PullOut();
            //if (mode == BaseTool.ToolMode.SECONDARY)
            //{
            //    ZmqMusicNode.Instance.stopTrack(musicRef.trackIndex);
            //}
        }
    }
}
