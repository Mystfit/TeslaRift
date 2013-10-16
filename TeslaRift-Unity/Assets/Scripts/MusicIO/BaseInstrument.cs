using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityOSC;


//**
//	Base Instrument
// 
// - All instruments derive from this for common instrument properties
//
//**
public class BaseInstrument {
	
	protected List<BaseInstrumentParam> m_clips;
	protected List<BaseInstrumentParam> m_params;
	protected List<OSCMessage> m_messageQueue;
	
	string m_client = "";
	string m_name = "";
	string m_owner = "";
	
	protected InstrumentClip m_loadedClip;		// Last played clip
	
	public BaseInstrument(string instrumentClient, string instrumentOwner, string instrumentName){
		m_name = instrumentName;
		m_owner = instrumentOwner;
		m_client = instrumentClient;
		
		m_clips = new List<BaseInstrumentParam>();
		m_params = new List<BaseInstrumentParam>();
		m_messageQueue = new List<OSCMessage>();
	}
	
	public string Name{ get {return m_name; } }
	public string Owner{ get {return m_owner; } } 
	public string Client{ get {return m_client; } }
	
	//Reset instrument to default
	//-----------------------------
	public void Reset(){

	}
	
	
	// Clip functions
	//---------------
	public void addClip(string name, string type, int scene){
		m_clips.Add(new InstrumentClip(name, this, scene));
	}
	
	public InstrumentClip GetClipByIndex(int index){ 
		return m_clips[index] as InstrumentClip;
	}
	
	
	// Parameter functions
	//-----------------
	public void addParam(string name, string valueType){
		if(valueType == "chord")
			m_params.Add(new NoteParam(name, this)); 
		else if(valueType == "toggle")
			m_params.Add(new ToggleParam(name, this));
		else
			m_params.Add(new BaseInstrumentParam(name, this)); 
	}

	
	public BaseInstrumentParam getParamByName(string name){
		BaseInstrumentParam result = null;
		foreach(BaseInstrumentParam param in m_params){
			if(param.name == name){
				return param;
				//result = param;
			} 
		}
		return result;
	}

	
	public List<BaseInstrumentParam> paramList{ get { return m_params; } }
	public List<BaseInstrumentParam> clipList{ get { return m_clips; } }

	
	public void addMidiNoteMessageToQueue(string paramName, float pitch, float velocity, float voice, int trigger){
		object[] noteArr = {pitch, velocity , voice};
		List<object> noteList = new List<object>(noteArr);
		
		this.addMessageToQueue(paramName, noteList );
		this.addMessageToQueue("noteOn", trigger);
	}
	
	public void addClipMessageToQueue(int scene){
		//InstrumentController.instance.ChangeScene(scene);
		OSCMessage msg = new OSCMessage("/" + m_owner + "/" + m_name + "/launch", scene);	//-1 is for MaxForLive trackgrabber index starting at 0
		m_messageQueue.Add(msg);
	}
	
	
	// Message queue
	//-----------------
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
					addMessageToQueue(param.name, param.val);
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


public class InstrumentClip : BaseInstrumentParam
{
	public int scene;
	public bool isPlaying;
	
	public InstrumentClip(string name, BaseInstrument paramOwner, int clipScene) : base(name, paramOwner)
	{
		scene = clipScene;
	}
}
