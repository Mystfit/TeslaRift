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
	
	protected List<BaseInstrumentParam> m_params;
	protected List<OSCMessage> m_messageQueue;
	
	string m_client = "";
	string m_name = "";
	string m_owner = "";
	
	public BaseInstrument(string instrumentClient, string instrumentOwner, string instrumentName){
		m_name = instrumentName;
		m_owner = instrumentOwner;
		m_client = instrumentClient;
		
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
	
	// Parameter functions
	//-----------------
	public void addParam(string name, string valueType){
		if(valueType == "chord")
			m_params.Add(new NoteParam(name, this)); 
		else if(valueType == "toggle")
			m_params.Add(new ToggleParam(name, this));
		else
			m_params.Add(new BaseInstrumentParam(name, this)); 
		
		//Other types for parameters need to be defined here. Mainly interaction types!"
		//Toggle
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
	
	public void addMidiNoteMessageToQueue(string paramName, float pitch, float velocity, float voice, int trigger){
		object[] noteArr = {pitch, velocity , voice};
		List<object> noteList = new List<object>(noteArr);
		
		this.addMessageToQueue(paramName, noteList );
		this.addMessageToQueue("noteOn", trigger);
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
			OSCHandler.Instance.SendBuiltMessageToClient("loopback", msg.Address, msg);
			
			completed.Add(msg);
		}
		m_messageQueue.Clear();
		completed.Clear();
	}
}



//**
//	Instrument Params class
// 
// - Definition of one parameter for an external instrument
//
//**
public class BaseInstrumentParam {
	
	protected string m_name = "";
	protected float m_fValue = 0.0f;
	protected float m_triggerThreshold = 0.0f;
	protected BaseInstrument m_owner = null;
	protected bool m_enabled = true;
	protected bool m_isMidiNoteParam = false;
	protected bool m_isDirty = false;
	
	protected BaseGenerator m_generatorInput;

	//OSC addresses
	protected bool m_expectingReturnMessage = false;
	
	public BaseInstrumentParam(string name, BaseInstrument paramOwner){
		m_name = name;
		m_owner = paramOwner;
		m_generators = new List<BaseGenerator>();
	}
	
	//Getters / Setters
	public string name{	get { return m_name; } }
	public BaseInstrument owner{ get { return m_owner; } }
	public float val { get { return m_fValue; }	}
	public virtual void setVal(float value){ 
		m_isDirty = true;
		m_fValue = value; 
	}
	public void setTriggerThreshold(float val){
		m_isDirty = true;
		m_triggerThreshold = val;
	}
	public bool isDirty { get { return m_isDirty; } }
	public void setClean(){ m_isDirty = false; }
	public bool enabled{ get { return m_enabled; } }
	public virtual void setEnabled(bool value){	
		m_enabled = value;
	}
	
	
	//Generator references
	//-----------------
	protected List<BaseGenerator> m_generators;
	
	public void attachGenerator(BaseGenerator generator){
		m_generators.Add(generator);
	}
	
	public void removeGenerators(){
		for(int i = 0; i < m_generators.Count; i++){
			removeGenerator(m_generators[i]);
		}
	}
	public void removeGenerator(BaseGenerator generator){
		m_generators.Remove(generator);
	}
	
	public void UpdateGenerators(){
		float summedGenerators = 0.0f;
		
		foreach(BaseGenerator gen in m_generators)
			summedGenerators += gen.val;
		
		if(m_generators.Count > 0)
			setVal(summedGenerators);
	}	
}


//Toggles can only be either 1.0f or 0.0f. Used for boolean style switches
//------------------------------------------------------------------------
public class ToggleParam : BaseInstrumentParam {
	
	public ToggleParam(string name, BaseInstrument paramOwner)
			: base(name, paramOwner)
	{
		m_generators = new List<BaseGenerator>();
	}
	
	public override void setEnabled (bool value)
	{
		base.setEnabled (value);
		if(value == true) setVal(1.0f);
		else setVal (0.0f);
	}
	
	public override void setVal(float value){
		float result = value;
		if(value > m_triggerThreshold){
			result = 1.0f;
		} else {
			result = 0.0f;
		}
		Debug.Log("Toggle threshold value:" + m_triggerThreshold + " Value:" + value + "Clamped:" + result );

		base.setVal(result);
	}
}


public class NoteParam : BaseInstrumentParam {
	
	
	protected List<Note> m_chordNotes;
	
	
	public NoteParam(string name, BaseInstrument paramOwner)
			: base(name, paramOwner)
	{
		m_chordNotes = new List<Note>();
	}
	
	public void releaseChord(){
		foreach(Note note in m_chordNotes){
			note.releaseNote();
		}
	}
	
	public Note getNote(int index){ return m_chordNotes[index]; }
	public List<Note> getNoteList(){ return m_chordNotes; }
	
	public void setNote(float notePitch, float noteVelocity, int index, int trigger){
		bool noteExists = false;
		if(index < m_chordNotes.Count){
			foreach(Note note in m_chordNotes){
				if(note.noteIndex == index){
					note.setNote(notePitch, noteVelocity, index, trigger);
					noteExists = true;
					m_isDirty = true;
					return;
				}
			}
		}
		
		if(!noteExists){
			m_chordNotes.Add(new Note(m_name, m_owner, false));
			m_chordNotes[m_chordNotes.Count-1].setNote(notePitch, noteVelocity, index, trigger);			
		}		
	}
}


//**
//	Note class
// 
// - Single midi note
//
//**
public class Note : BaseInstrumentParam {
	
	public float velocity = 0;
	public int noteTrigger;
	public int noteIndex;
	
	public void setNote(float notePitch, float noteVelocity, int index, int trigger){
		velocity = noteVelocity;
		noteTrigger = trigger;
		noteIndex = index;
		setVal(notePitch);
	}
	
	public void releaseNote(){
		noteTrigger = 0;
		m_isDirty = true;
	}
			
	public Note(string name, BaseInstrument paramOwner, bool isExpectingReturnMessage)
			: base(name, paramOwner)
	{
		
	}
}

