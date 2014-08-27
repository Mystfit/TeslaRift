using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using ZST;
using Newtonsoft.Json;

namespace MusicIO
{


    //**
    //  Base InstrumentOrb
    // 
    // - All instruments derive from this for common instrument properties
    //
    //**
    [JsonConverter(typeof(InstrumentHandleSerializer))]
    public class InstrumentHandle
    {
        //MusicObjects belonging to this instrument
        protected List<InstrumentParameter> m_clips;
        protected List<InstrumentParameter> m_params;
        protected List<InstrumentParameter> m_sends;

        //Dedicated note parameter for outgoing midi notes
        protected NoteParameter m_noteChannel;
        public NoteParameter noteChannel { get { return m_noteChannel; } }

        public string name { get { return m_name; } }
        string m_name;

        public ZstPeerLink owner { get { return m_owner; } }
        ZstPeerLink m_owner;

        public Color color { get { return m_color; } }
        Color m_color;

        public bool isMidi { get { return m_isMidi; } }
        bool m_isMidi = false;

        public bool isEffect { get { return m_isEffect; } }
        bool m_isEffect = false;

        public int trackIndex { get { return m_trackIndex; } }
        int m_trackIndex;


        public InstrumentHandle(ZstPeerLink instrumentOwner, string instrumentName, Color color, int trackIndex, bool isMidi, bool isReturn)
        {
            m_owner = instrumentOwner;
			m_name = instrumentName;
            m_color = color;
            m_trackIndex = trackIndex;
            m_isEffect = isReturn;

            m_clips = new List<InstrumentParameter>();
            m_params = new List<InstrumentParameter>();
            m_sends = new List<InstrumentParameter>();

            m_isMidi = isMidi;
            if (isMidi)
            {
                m_noteChannel = new NoteParameter("note", this);
                m_noteChannel.SetValueRounded(true);
            }
        }


        //Mixer values
        //------------
        public float meterVolume
        {
            get { return m_meterValue;  }
            set { 
                m_meterValue = value;
                m_isMeterDirty = true;
            }
        }
        protected float m_meterValue;

        public bool isMeterDirty { get { return m_isMeterDirty; } }
        public void SetMeterClean() { m_isMeterDirty = false; }
        protected bool m_isMeterDirty;


        // Clip functions
        //---------------
        public void SetPlayingClip(ClipParameter clip) { m_playingClip = clip; }
        public ClipParameter playingClip { get { return m_playingClip; } }
        protected ClipParameter m_playingClip;      // Last played clip

        public void AddClip(string name, bool looping, int scene)
        {
            m_clips.Add(new ClipParameter(name, this, scene));
        }

        public ClipParameter GetClipByIndex(int index)
        {

            return m_clips[index - 1] as ClipParameter;
        }

        // Parameter functions
        //-----------------
        public void AddParam(string name, float min, float max)
        {
            AddParam(name, min, max, "", -1, -1);
        }

        public void AddParam(string name, float min, float max, string deviceName, int deviceIndex, int parameterIndex)
        {
            DeviceParameter param = new DeviceParameter(name, this, deviceIndex, parameterIndex, min, max);
            param.deviceName = deviceName;
            m_params.Add(param);
        }

        public void AddSend(string name, int sendIndex)
        {
            SendParameter send = new SendParameter(name, this, sendIndex);
            m_sends.Add(send);
        }

        public InstrumentParameter getParamByName(string name)
        {
            foreach (InstrumentParameter param in m_params)
            {
                if (param.name == name)
                {
                    return param;
                }
            }
            return null;
        }

        public InstrumentParameter getSendByName(string name)
        {
            foreach (InstrumentParameter param in m_sends)
            {
                if (param.name == name)
                {
                    return param;
                }
            }
            return null;
        }


        /*
         * Parameter/Clip lists
         */
        public List<InstrumentParameter> paramList { get { return m_params; } }
        public List<InstrumentParameter> clipList { get { return m_clips; } }
        public List<InstrumentParameter> sendsList { get { return m_sends; } }


        // Update functions
        //-----------------
        //public void update()
        //{
        //    processParameters();
        //}

        //public virtual void processParameters()
        //{
        //    foreach (InstrumentParameter param in m_params)
        //        param.Send();

        //    foreach (SendParameter sendVol in m_sends)
        //        sendVol.Send();

        //    if(m_noteChannel != null)
        //        m_noteChannel.Send();
        //}
    }
}
