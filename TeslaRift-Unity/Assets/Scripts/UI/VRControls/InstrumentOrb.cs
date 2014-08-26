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

        protected GameObject m_parameterScroller;
        protected GameObject m_clipScroller;
        protected GameObject m_dividingQuad;
        protected GameObject m_rotator;

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

                //Create clips
                foreach (ClipParameter clip in m_instrumentRef.clipList)
                {
                    ClipCube cube = UIFactory.CreateMusicRefAttachment(typeof(ClipCube), clip) as ClipCube;
                    cube.SetCloneable(true);
                    cube.SetColour(m_instrumentRef.color);
                    cube.DockInto(clipScroller);
                    cube.SetToolmodeResponse(defaultToolResponse);
                }

                //Create parameter scroller
                Scroller paramScroller = UIFactory.CreateMusicRefAttachment(typeof(Scroller)) as Scroller;
                paramScroller.transform.parent = m_rotator.transform;
                paramScroller.SetOffset(new Vector3(m_controlsMirrorOffset, m_controlsYOffset, 0.0f));
                paramScroller.SetItemSpacing(m_itemSpacing);

                
                //Create note slider
                if (m_instrumentRef.isMidi)
                {
                    Slider noteSlider = UIFactory.CreateMusicRefAttachment(typeof(Slider), m_instrumentRef.noteChannel) as Slider;
                    noteSlider.SetCloneable(true);
                    noteSlider.DockInto(paramScroller);
                    noteSlider.SetToolmodeResponse(defaultToolResponse);
                }

                //Create parameters
                foreach (InstrumentParameter param in m_instrumentRef.paramList)
                {
                    Slider slider = UIFactory.CreateMusicRefAttachment(typeof(Slider), param) as Slider;
                    slider.SetCloneable(true);
                    slider.DockInto(paramScroller);
                    slider.SetToolmodeResponse(defaultToolResponse);
                }

                //Create send sliders
                foreach (InstrumentParameter send in m_instrumentRef.sendsList)
                {
                    Slider slider = UIFactory.CreateMusicRefAttachment(typeof(Slider), send) as Slider;
                    slider.SetCloneable(true);
                    slider.DockInto(paramScroller);
                    slider.SetToolmodeResponse(defaultToolResponse);
                }

                if (m_instrumentRef.clipList.Count < clipScroller.numDisplayedAttachments)
                    clipScroller.SetNumDisplayedAttachments(m_instrumentRef.clipList.Count);

                if (m_instrumentRef.paramList.Count < paramScroller.numDisplayedAttachments)
                    paramScroller.SetNumDisplayedAttachments(m_instrumentRef.paramList.Count);

                m_parameterScroller = paramScroller.gameObject;
                m_clipScroller = clipScroller.gameObject;

                //Central divider 
                float largestHeight = (clipScroller.upperVisibleBounds > paramScroller.upperVisibleBounds) ? clipScroller.upperVisibleBounds : paramScroller.upperVisibleBounds;
                m_dividingQuad = UIFactory.CreateGuiQuad();
                m_dividingQuad.transform.localScale = new Vector3(m_dividerWidth, largestHeight, 1.0f);
                m_dividingQuad.transform.parent = m_rotator.transform;
                m_dividingQuad.transform.localPosition = new Vector3(0.0f, m_controlsYOffset, 0.0f);

                DisableControls();
            }
        }

        public override void ShowControls()
        {
            if (controlsEnabled)
            {
                m_rotator.SetActive(true);
                m_parameterScroller.GetComponent<Scroller>().SetDockablesAsTweenable(true);
                m_clipScroller.GetComponent<Scroller>().SetDockablesAsTweenable(true);

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

            //Make sure to start dragging the object if we're using the drag gesture
            if (mode == BaseTool.ToolMode.GRABBING)
                StartDragging(HydraController.Instance.GetHand(ActiveHand));

            if (mode == BaseTool.ToolMode.PRIMARY)
                ToggleControls();
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
