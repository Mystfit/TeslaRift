using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using ZST;

namespace MusicIO
{
	
	
	//**
	//	Base Instrument
	// 
	// - All instruments derive from this for common instrument properties
	//
	//**
	public class Instrument : BaseMusicObject {
		
		protected List<InstrumentParameter> m_clips;
		protected List<InstrumentParameter> m_params;
        protected List<InstrumentParameter> m_sends;

        protected NoteParameter m_noteChannel;

		string m_client = "";
		ZstPeerLink m_owner;
        bool m_isMidi = false;
		bool m_playable = false;
        bool m_isEffect = false;
		Color m_color;
		int m_trackIndex;
		int m_lastPlayedNote;

        public Instrument(string instrumentClient, ZstPeerLink instrumentOwner, string instrumentName, Color color, bool playable, int trackIndex, bool isMidi, bool isReturn)
            : base(instrumentName, null)
        {
            m_owner = instrumentOwner;
			m_client = instrumentClient;
			m_color = color;
			m_playable = playable;
			m_trackIndex = trackIndex;
            m_isEffect = isReturn;
			
			m_clips = new List<InstrumentParameter>();
			m_params = new List<InstrumentParameter>();
            m_sends = new List<InstrumentParameter>();

            m_isMidi = isMidi;
            if (isMidi)
                m_noteChannel = new NoteParameter("note", this);
		}
		
		public ZstPeerLink owner{ get {return m_owner; } } 
		public string Client{ get {return m_client; } }
		public Color color{ get { return m_color; } }
		public bool playable{ get { return m_playable; } }
        public bool isMidi { get { return m_isMidi; } }
        public bool isEffect { get { return m_isEffect; } }
		public int trackIndex{ get{ return m_trackIndex; } }
        public NoteParameter noteChannel { get { return m_noteChannel;  } }
		
		
		//Reset instrument to default
		//-----------------------------
		public void Reset(){
	
		}
		
		
		// Clip functions
		//---------------
        public void SetPlayingClip(ClipParameter clip) { m_playingClip = clip; }
        public ClipParameter playingClip { get { return m_playingClip; } }
        protected ClipParameter m_playingClip;		// Last played clip

		public void AddClip(string name, bool looping, int scene){
			m_clips.Add(new ClipParameter(name, this, scene));
		}
		
		public ClipParameter GetClipByIndex(int index){ 

			return m_clips[index-1] as ClipParameter;
		}

		// Parameter functions
		//-----------------
		public void AddParam(string name, float min, float max){
			AddParam(name, min, max, "", -1, -1);
		}

		public void AddParam(string name, float min, float max, string deviceName, int deviceIndex, int parameterIndex){
            DeviceParameter param = new DeviceParameter(name, this, deviceIndex, parameterIndex, min, max);
			param.deviceName = deviceName;
			m_params.Add(param); 
		}

        public void AddSend(string name, int sendIndex)
        {
            SendParameter send = new SendParameter(name, this, sendIndex);
            m_sends.Add(send);
        }
		
		public InstrumentParameter getParamByName(string name){
			foreach(InstrumentParameter param in m_params){
				if(param.name == name){
					return param;
				} 
			}
			return null;
		}

		public InstrumentParameter getSendByName(string name){
			foreach(InstrumentParameter param in m_sends){
				if(param.name == name){
					return param;
				} 
			}
			return null;
		}
		
		
		/*
		 * Parameter/Clip lists
		 */
		public List<InstrumentParameter> paramList{ get { return m_params; } }
		public List<InstrumentParameter> clipList{ get { return m_clips; } }
        public List<InstrumentParameter> sendsList { get { return m_sends; } }

	
		// Update functions
		//-----------------
		public void update(){
			processParameters();
		}
		
		public virtual void processParameters(){
			foreach(InstrumentParameter param in m_params){
                param.Send();
                //if(param.isDirty){
                //    if(param.GetType() == typeof(NoteParameter)){
                //        NoteParameter note = param as NoteParameter;
						
                //        if (GlobalConfig.Instance.ShowtimeEnabled)
                //        {
                //            if (m_lastPlayedNote >= 0)
                //                ZmqMusicNode.Instance.playNote(m_trackIndex, m_lastPlayedNote, 0, 0);
                                
                //            ZmqMusicNode.Instance.playNote(m_trackIndex, (int)note.scaledVal, note.velocity, 1);
                //            m_lastPlayedNote = (int)note.scaledVal;
                //        }    
                //    }
                //    else if (param.GetType() == typeof(InstrumentParameter))
                //    {
                //        if (GlobalConfig.Instance.ShowtimeEnabled)
                //            ZmqMusicNode.Instance.updateInstrumentValue(m_trackIndex, param.deviceIndex, param.parameterIndex, param.scaledVal, param.category);
                //    }
                //    param.setClean();
                //}
			}

            foreach (SendParameter sendVol in m_sends)
            {
                sendVol.Send();
            }
		}
	}
}
