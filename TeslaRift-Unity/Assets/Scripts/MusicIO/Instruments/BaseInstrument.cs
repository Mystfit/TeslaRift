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
		m_params.Add(new BaseInstrumentParam(name, false)); 
	}
	
	public void addNoteParam(){
	
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
		processMessageQueue();
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
	protected bool m_enabled = true;
	protected bool m_isMidiNoteParam = false;

	//OSC addresses
	protected bool m_expectingReturnMessage = false;
	
	public BaseInstrumentParam(string name, bool isExpectingReturnMessage){
		m_name = name;
	}
	
	//Getters / Setters
	public string name{	get { return m_name; } }
	public float val { get { return m_fValue; }	}
	public void setVal(float value){ m_fValue = value; }
	public bool enabled{ get { return m_enabled; } }
	public void setEnabled(bool value){	m_enabled = value; }
}



//**
//	Note class
// 
// - Single midi note
//
//**
public class Note : BaseInstrumentParam {
	
	protected int m_pitch = 0;
	protected int m_velocity = 0;
	protected int m_aftertouch = 0;
	protected int m_noteIndex = 0;
	
	public void setNoteParams(int pitch, int velocity, int aftertouch, int noteIndex){
		m_pitch = pitch;
		m_velocity = velocity;
		m_aftertouch = aftertouch;
		m_noteIndex = noteIndex;
	}
			
	public Note(string name, bool isExpectingReturnMessage)
			: base(name, isExpectingReturnMessage)
	{
	}
}

