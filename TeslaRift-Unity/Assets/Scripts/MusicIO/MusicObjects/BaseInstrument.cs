using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityOSC;


namespace MusicIO
{
	
	
	//**
	//	Base Instrument
	// 
	// - All instruments derive from this for common instrument properties
	//
	//**
	public class BaseInstrument : BaseMusicObject {
		
		protected List<BaseInstrumentParam> m_clips;
		protected List<BaseInstrumentParam> m_params;
		protected List<OSCMessage> m_messageQueue;
		
		string m_client = "";
		string m_name = "";
		string m_owner = "";
		Color m_color;
		
		protected InstrumentClip m_loadedClip;		// Last played clip
		
		public BaseInstrument(string instrumentClient, string instrumentOwner, string instrumentName, Color color){
			m_name = instrumentName;
			m_owner = instrumentOwner;
			m_client = instrumentClient;
			m_color = color;
			
			m_clips = new List<BaseInstrumentParam>();
			m_params = new List<BaseInstrumentParam>();
			m_messageQueue = new List<OSCMessage>();
		}
		
		public string Name{ get {return m_name; } }
		public string Owner{ get {return m_owner; } } 
		public string Client{ get {return m_client; } }
		public Color color{ get { return m_color; }}
		
		
		//Reset instrument to default
		//-----------------------------
		public void Reset(){
	
		}
		
		
		// Clip functions
		//---------------
		public void AddClip(string name, bool looping, int scene){
			m_clips.Add(new InstrumentClip(name, this, scene));
		}
		
		public InstrumentClip GetClipByIndex(int index){ 
			return m_clips[index] as InstrumentClip;
		}
		
		
		public void AddParam(string name, string valueType, float min, float max){
			AddParam(name, valueType, min, max, "");
		}
		
		
		// Parameter functions
		//-----------------
		public void AddParam(string name, string valueType, float min, float max, string deviceName){
			if(valueType == "chord"){
				m_params.Add(new NoteParam(name, this)); 
			} else if(valueType == "toggle"){
				m_params.Add(new ToggleParam(name, this));
			} else{
				GenericMusicParam param = new GenericMusicParam(name, this, min, max);
				param.setDeviceName(deviceName);
				m_params.Add(param); 
			}
		}
	
		
		public BaseInstrumentParam getParamByName(string name){
			foreach(BaseInstrumentParam param in m_params){
				if(param.name == name){
					return param;
				} 
			}
			return null;
		}
		
		
		/*
		 * Parameter/Clip lists
		 */
		public List<BaseInstrumentParam> paramList{ get { return m_params; } }
		public List<BaseInstrumentParam> clipList{ get { return m_clips; } }
	
		
		/*
		 * Queues a midi note OSC message
		 */
		public void addMidiNoteMessageToQueue(string paramName, float pitch, float velocity, float voice, int trigger){
			object[] noteArr = {pitch, velocity , voice};
			List<object> noteList = new List<object>(noteArr);
			
			this.addMessageToQueue(paramName, noteList );
			this.addMessageToQueue("noteOn", trigger);
		}
		
		
		/*
		 * Queues a clip activation OSC message
		 */
		public void addClipMessageToQueue(int scene){
			//InstrumentController.instance.ChangeScene(scene);
			OSCMessage msg = new OSCMessage("/" + m_owner + "/" + m_name + "/launch", scene);	//-1 is for MaxForLive trackgrabber index starting at 0
			m_messageQueue.Add(msg);
		}
		
		
		/*
		 * Queues a generic float OSC message
		 */
		public void addMessageToQueue<T>(string paramName, List<T> values){
			OSCMessage msg = new OSCMessage("/" + m_owner + "/" + m_name + "/" + paramName);
			foreach(T value in values){
				msg.Append(value);
			}
			m_messageQueue.Add(msg);
		}
		
		public void addMessageToQueue<T>(string paramName, T value){
			List<object> valueList = new List<object>();
			valueList.Add(value);
			addMessageToQueue(paramName, valueList);
		}
		
		
		// Update functions
		//-----------------
		public void update(){
			processParameters();
			processMessageQueue();
		}
		
		public virtual void processParameters(){
			foreach(BaseInstrumentParam param in m_params){
				param.UpdateGenerators();
				if(param.isDirty){
					
					if(param.GetType() == typeof(NoteParam)){
						NoteParam chord = param as NoteParam;
						foreach(Note note in chord.getNoteList()){
							addMidiNoteMessageToQueue(note.name, note.val, note.velocity, note.noteIndex, note.noteTrigger );
						}
					} else {
						string paramName = param.name;
						if(param.deviceName != "")
							paramName = param.deviceName + "/" + param.name;
						
						addMessageToQueue(paramName, param.val);
					}
						
					param.setClean();
				}
			}
		}
		
		public void processMessageQueue(){
			List<OSCMessage> completed = new List<OSCMessage>();
			foreach(OSCMessage msg in m_messageQueue){
				OSCHandler.Instance.SendBuiltMessageToClient(m_client, msg.Address, msg);
				OSCHandler.Instance.SendBuiltMessageToClient(OSCcontroller.Instance.loopbackName, msg.Address, msg);
				
				completed.Add(msg);
			}
			m_messageQueue.Clear();
			completed.Clear();
		}
	}

}

