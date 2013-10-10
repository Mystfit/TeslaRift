using UnityEngine;
using System.Collections;
using System.Collections.Generic;


//**
//	ToggleParameter
// 
// - On/off parameter toggle
//
//**
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
		if(value > m_overrideValue){
			result = 1.0f;
		} else {
			result = 0.0f;
		}
		base.setVal(result);
	}
}


//**
//	Noteparameter
// 
// - Multi-note chord channel for midi instruments.
//
//**
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