using UnityEngine;
using System.Collections;
using MusicIO;
using UI;

namespace VRControls
{
    public class ClipCube : MusicVRControl<ClipParameter>
    {
        public bool m_toggleClip = false;

        protected BarSlider m_barSlider;
        protected SliderVRControl m_sliderAttach;
        protected UIFrame m_frame;

        public override void Awake()
        {
            base.Awake();
            SetIsDraggable(true);
            SetIsDockable(true);

            m_barSlider = GetComponent<BarSlider>();
            transform.localScale = UIFactory.sliderScale;

            m_frame = GetComponent<UIFrame>();
            m_frame.SetMatchTextWidth(true);
        }

        public override void Init(ClipParameter managedReference)
        {
            base.Init(managedReference);
            m_frame.SetLabel(managedReference.name);
        }

        public override void Update()
        {
            if (m_toggleClip)
            {
                m_toggleClip = false;
                if (musicRef != null)
                    musicRef.Send(true);
            }

            UpdatePlayingState();

            base.Update();
        }

        public void UpdatePlayingState()
        {
            if (musicRef != null)
            {
                switch (musicRef.clipState)
                {
                    case ClipParameter.ClipState.IS_DISABLED:
                        renderer.materials[1].SetColor("_Color", Color.grey);
                        break;
                    case ClipParameter.ClipState.IS_QUEUED:
                        Color trans = musicRef.owner.color;
                        trans.a = 0.5f;
                        renderer.materials[1].SetColor("_Color", trans);

                        break;
                    case ClipParameter.ClipState.IS_PLAYING:
                        renderer.materials[1].SetColor("_Color", musicRef.owner.color);

                        break;
                }
            }
        }

        public void SetColour(Color color)
        {
            renderer.materials[1].SetColor("_Color", color);
        }

        public override void Gesture_First()
        {
            if (mode == BaseTool.ToolMode.GRABBING)
            {
                StartDragging(HydraController.Instance.GetHand(m_hand));
            }
            else if (mode == BaseTool.ToolMode.PRIMARY)
            {
                if (musicRef != null)
                    musicRef.Send(true);
            }

            base.Gesture_First();
        }
    }
}
