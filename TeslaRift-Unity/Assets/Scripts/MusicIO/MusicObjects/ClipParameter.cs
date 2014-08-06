using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Newtonsoft.Json;



namespace MusicIO
{
    /*
     *  ClipParameter
     *  A clip on this instrument channel
     */
    [JsonConverter(typeof(ClipSerializer))]
    public class ClipParameter : InstrumentParameter
    {
        protected int m_scene;
        public int scene { get { return m_scene; } }

        //Clip state
        public enum ClipState
        {
            IS_DISABLED = 0,
            IS_QUEUED,
            IS_PLAYING
        }
        protected ClipState m_clipState;
        public ClipState clipState { get { return m_clipState; } }
        public void SetClipState(ClipState state)
        {
            if (state == ClipState.IS_PLAYING)
                owner.SetPlayingClip(this);
            m_clipState = state;
        }

        public ClipParameter(string name, InstrumentHandle paramOwner, int clipScene)
            : base(name, paramOwner, 0, 127)
        {
            SetRemoteMethod(paramOwner.owner.methods["fire_clip"]);
            m_scene = clipScene;
        }

		public override void setVal (float value)
		{
			base.setVal (value);
			Send();
		}

        public override void Send(bool force)
        {
            SetRemoteArg("trackindex", owner.trackIndex);
            SetRemoteArg("clipindex", m_scene);
            base.Send(force);
        }
    }
}