using UnityEngine;
using System.Collections;
using Newtonsoft.Json;
using MusicIO;
using UI;

namespace VRControls
{
    public class Slider : BaseVRControl
    {
        public bool m_useHorizontalInput = true;
        protected BarSlider m_slider;
        protected UIFrame m_frame;
        public float m_collisionDepth;
        public UIFrame frame { get { return m_frame; } }

        [Range(0.0f, 1.0f)]
        public float m_sliderVal;

        // Use this for initialization
        public override void Awake()
        {
            base.Awake();
            SetIsDraggable(true);
            SetIsDockable(true);
            m_slider = GetComponent<BarSlider>();
            m_frame = GetComponent<UIFrame>();
            Maximize();
        }

        public override void Init(InstrumentParameter managedReference)
        {
            base.Init(managedReference);
            m_frame.SetLabel(managedReference.name);
            m_frame.SetAnchor(UIFrame.AnchorLocation.BOTTOM_LEFT);
        }


        /*
         * Selection overrides
         */
        public override void StartHover()
        {
            SetSelected(true);
        }

        public override void StopHover()
        {
            SetSelected(false);
        }

        public override void SetSelected(bool state)
        {
            if (!selected && state)
            {
                frame.SetTextAsSelected();
            }
            else if (selected && !state)
            {
                frame.SetTextAsDeselected();
            }
            base.SetSelected(state);
        }

        /*
         * Gesture overrides
         */
        public override void Gesture_First()
        {
            if (mode == BaseTool.ToolMode.GRABBING)
                StartDragging(HydraController.Instance.GetHand(m_hand));

            if (mode == BaseTool.ToolMode.PLAY1
               || mode == BaseTool.ToolMode.PLAY2
               || mode == BaseTool.ToolMode.PLAY3
               || mode == BaseTool.ToolMode.PLAY4)
                SetValueFromHand();

            //if (mode == BaseTool.ToolMode.PRIMARY)
            //   frame.SetTextAsSelected();

            base.Gesture_First();
        }

        public override void Gesture_IdleInterior()
        {
            base.Gesture_IdleInterior();
            if (mode == BaseTool.ToolMode.PRIMARY)
                SetValueFromHand();
        }


        public override void Gesture_ExitIdleInterior()
        {
            base.Gesture_ExitIdleInterior();
        }

        public override void Gesture_Exit()
        {
            if (IsTransient && IsDragging)
            {
                StopDragging();
            }

            //frame.SetTextAsDeselected();

            base.Gesture_Exit();
        }


        /*
         * Sets the value of the slider(0,1) based on location inside the slider frame
         */
        public void SetValueFromHand()
        {
            Vector3 pos = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(m_hand));
            Vector2 sliderPosVal = new Vector2(
                Mathf.Clamp(pos.x - frame.GetAnchorOffset(m_frame.width, m_frame.height, frame.m_anchorPoint).x, m_frame.width * -0.5f, m_frame.height * 0.5f),
                Mathf.Clamp(pos.y - frame.GetAnchorOffset(m_frame.width, m_frame.height, frame.m_anchorPoint).y, m_frame.width * -0.5f, m_frame.height * 0.5f)
            );

            float sliderVal = 0.0f;

            if (!m_useHorizontalInput)
                sliderVal = Utils.Scale(sliderPosVal.x, m_frame.width * -0.5f, m_frame.height * 0.5f);
            else
                sliderVal = Utils.Scale(sliderPosVal.y, m_frame.width * -0.5f, m_frame.height * 0.5f);

            SetSliderValue(sliderVal);
        }


        /*
	     * Sets slider value from an exterior value
	     */
        public void SetSliderValue(float val)
        {
            if (musicRef != null)
            {
                musicRef.setVal(val);
                m_sliderVal = val;
            } else
                m_slider.SetSliderVal(val);
            
        }


        public override void Update()
        {
            if (musicRef != null)
            {
                //if (musicRef.val != m_sliderVal)
                //    SetSliderValue(m_sliderVal);

                if (!bIsFrozen)
                {
                    m_slider.SetSliderVal(musicRef.val);
                    frame.SetValueLabel(musicRef.scaledVal.ToString());
                }
            }

            if(frame.isAnimating)
				UpdateColliders(new Vector3(frame.currentWidth*0.5f, frame.currentHeight*0.5f, 0.0f), new Vector3(frame.currentWidth, frame.currentHeight, m_collisionDepth));

            base.Update();
        }
    }
}