using UnityEngine;
using System.Collections;
using System.Collections.Generic;


namespace MusicIO
{
    /*
     *  ClipParameter
     *  A clip on this instrument channel
     */
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

        public ClipParameter(string name, Instrument paramOwner, int clipScene)
            : base(name, paramOwner, paramOwner.owner.methods["fire_clip"], 0, 127)
        {
            m_scene = clipScene;
        }

        public override void Send(bool force)
        {
            SetRemoteArg("trackindex", owner.trackIndex);
            SetRemoteArg("clipindex", m_scene);
            base.Send(force);
        }
    }
}