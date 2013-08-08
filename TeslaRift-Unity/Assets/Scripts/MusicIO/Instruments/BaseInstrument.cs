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
	
	
	// Parameter functions
	//-----------------
	public void addParam(string name, string valueType){
		if(valueType == "note")
			m_params.Add(new Note(name, this, false)); 
		else
			m_params.Add(new BaseInstrumentParam(name, this, false)); 
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
	
	}
	
	public void processMessageQueue(){
		List<OSCMessage> completed = new List<OSCMessage>();
		foreach(OSCMessage msg in m_messageQueue){
			OSCHandler.Instance.SendBuiltMessageToClient(m_client, msg.Address, msg);
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
	BaseInstrument m_owner = null;
	protected bool m_enabled = true;
	protected bool m_isMidiNoteParam = false;
	protected bool m_isDirty = false;

	//OSC addresses
	protected bool m_expectingReturnMessage = false;
	
	public BaseInstrumentParam(string name, BaseInstrument paramOwner, bool isExpectingReturnMessage){
		m_name = name;
		m_owner = paramOwner;
	}
	
	//Getters / Setters
	public string name{	get { return m_name; } }
	public BaseInstrument owner{ get { return m_owner; } }
	public float val { get { return m_fValue; }	}
	public void setVal(float value){ 
		m_fValue = value; 
		m_isDirty = true;
	}
	public bool isDirty { get { return m_isDirty; } }
	public void setClean(){ m_isDirty = false; }
	public bool enabled{ get { return m_enabled; } }
	public void setEnabled(bool value){	m_enabled = value; m_isDirty = true; }
}



//**
//	Note class
// 
// - Single midi note
//
//**
public class Note : BaseInstrumentParam {
	
	public float velocity = 0;
	public int[] noteIndex;
	
	public void setNote(float notePitch, float noteVelocity, int index, int trigger){
		velocity = noteVelocity;
		noteIndex[index] = trigger;
		
		setVal(notePitch);	//Need to find better way of keeping value in sync with note parameters
	}
	
	public void releaseNote(int index = 0){
		noteIndex[index] = 0;
		m_isDirty = true;
	}
			
	public Note(string name, BaseInstrument paramOwner, bool isExpectingReturnMessage)
			: base(name, paramOwner, isExpectingReturnMessage)
	{
		noteIndex = new int[4];
	}
}

