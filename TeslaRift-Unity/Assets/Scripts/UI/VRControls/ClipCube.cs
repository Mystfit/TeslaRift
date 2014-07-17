using UnityEngine;
using System.Collections;
using MusicIO;
using UI;

namespace VRControls
{
    public class ClipCube : CubeButton
    {
        public bool m_toggleClip = false;

        public override void Awake()
        {
            base.Awake();
            SetIsDraggable(true);
        }

        public override void Init(InstrumentParameter managedReference)
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
                switch (((ClipParameter)musicRef).clipState)
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
    }
}
