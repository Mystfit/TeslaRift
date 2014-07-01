using UnityEngine;
using UI;
using System.Collections;
using MusicIO;

namespace VRControls
{
    public class InstrumentOrb : BaseVRControl
    {

        protected GameObject m_parameterScroller;
        protected GameObject m_clipScroller;
        protected GameObject m_dividingQuad;
        protected GameObject m_rotator;

        public float m_dividerWidth = 0.005f;
        public float m_controlsMirrorOffset = 0.05f;
        public float m_controlsYOffset = 0.05f;
        public float m_clipCubeSpacing = 0.03f;
        public bool m_facePerformer = true;

		public InstrumentHandle instrumentRef { get { return m_instrumentRef; } }
        protected InstrumentHandle m_instrumentRef;

        public override void Awake()
        {
            base.Awake();

            //Since instrument attachments are created at runtime, we need to set the filter here
            m_respondsToToolMode = new BaseTool.ToolMode[]{
                BaseTool.ToolMode.GRABBING,
                BaseTool.ToolMode.HOVER
            };

            //Set the collision state
            SetCollideable(true);
            SetIsDockable(true);
            SetIsDraggable(true);
            SetCloneable(true);
            SetOutlineMat(renderer.materials[1]);
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
            if (m_instrumentRef != null)
            {
                //Set name
                gameObject.name = instrumentRef.name;

                //Set color
                renderer.materials[1].SetColor("_Color", m_instrumentRef.color);

                m_rotator = new GameObject("rotator");
                m_rotator.transform.parent = transform;
                m_rotator.transform.localPosition = Vector3.zero;

                //Create clip scroller
                Scroller clipScroller = UIFactory.CreateMusicRefAttachment(typeof(Scroller)) as Scroller;
                clipScroller.SetItemSpacing(m_clipCubeSpacing);
                clipScroller.AddAcceptedDocktype(typeof(ClipCube));
                clipScroller.transform.parent = m_rotator.transform;
                clipScroller.SetOffset(new Vector3(-m_controlsMirrorOffset, m_controlsYOffset + 0.02f, 0.0f));
                clipScroller.SetItemScale(UIFactory.sliderScale.x);

                //Create clips
                foreach (ClipParameter clip in m_instrumentRef.clipList)
                {
                    ClipCube cube = UIFactory.CreateMusicRefAttachment(typeof(ClipCube), clip) as ClipCube;
                    cube.SetCloneable(true);
                    cube.SetColour(m_instrumentRef.color);
                    cube.DockInto(clipScroller);
                }

                //Create parameter scroller
                Scroller paramScroller = UIFactory.CreateMusicRefAttachment(typeof(Scroller)) as Scroller;
                paramScroller.transform.parent = m_rotator.transform;
                paramScroller.SetOffset(new Vector3(m_controlsMirrorOffset, m_controlsYOffset, 0.0f));

                paramScroller.SetItemSpacing(m_clipCubeSpacing);
                paramScroller.SetItemScale(UIFactory.sliderScale.x);

                //Create note slider
                if (m_instrumentRef.isMidi)
                {
                    Slider noteSlider = UIFactory.CreateMusicRefAttachment(typeof(Slider), m_instrumentRef.noteChannel) as Slider;
                    noteSlider.SetCloneable(true);
                    noteSlider.DockInto(paramScroller);
                }

                //Create parameters
                foreach (InstrumentParameter param in m_instrumentRef.paramList)
                {
                    Slider slider = UIFactory.CreateMusicRefAttachment(typeof(Slider), param) as Slider;
                    slider.SetCloneable(true);
                    slider.DockInto(paramScroller);
                }

                //Create send sliders
                foreach (InstrumentParameter send in m_instrumentRef.sendsList)
                {
                    Slider slider = UIFactory.CreateMusicRefAttachment(typeof(Slider), send) as Slider;
                    slider.SetCloneable(true);
                    slider.DockInto(paramScroller);
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

        void FixedUpdate()
        {
            //Rotate to face player eyes
            if (m_facePerformer)
            {
                // Look at and dampen the rotation
                Quaternion rotation = Quaternion.LookRotation(this.interiorCollider.bounds.center - HydraController.Instance.EyeCenter);
                m_rotator.transform.rotation = Quaternion.Euler(new Vector3(0.0f, rotation.eulerAngles.y, 0.0f));
            }
        }

        public override void Update()
        {
            base.Update();
            if (m_instrumentRef.playingClip != null)
                SetSelected(true);
            else
                SetSelected(false);
        }


        /*
         *  Gesture handlers
         */
        public override void Gesture_First()
        {
            base.Gesture_First();

            //Make sure to start dragging the object if we're using the drag gesture
            if (m_mode == BaseTool.ToolMode.GRABBING)
                StartDragging(HydraController.Instance.GetHand(m_hand));

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
            if (m_mode == BaseTool.ToolMode.GRABBING)
            {
                StopDragging();
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
