using UnityEngine;
using System.Collections;
using MusicIO;
using UI;

namespace VRControls
{
    public class CubeButton : BaseVRControl
    {
        protected Slider m_sliderAttach;
        protected UIFrame m_frame;

		public bool m_toggleFire = false;

        public override void Awake()
        {
            base.Awake();
            SetIsDockable(true);
			SetAsDock(true);

            //transform.localScale = UIFactory.sliderScale;

            m_frame = GetComponent<UIFrame>();
            if(m_frame != null)
                m_frame.SetMatchTextWidth(true);
        }

		public override void Update(){
			if(m_toggleFire){
				m_toggleFire = false;
				Fire();
			}
		}

        public void SetColour(Color color)
        {
            renderer.materials[1].SetColor("_Color", color);
        }

        public override void Gesture_First()
        {
			if (mode == BaseTool.ToolMode.PRIMARY)
				Fire();

            base.Gesture_First();
        }

		public override void Fire(){
			if (musicRef != null)
				musicRef.Send(true);

			if (DockedChildren.Count > 0)
			{
				foreach (BaseVRControl attach in DockedChildren)
					attach.Fire();
			}
		}
    }
}
