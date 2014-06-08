using UnityEngine;
using System.Collections;
using System.Collections.Generic;


namespace MusicIO
{

	/*
	 *	ToggleParameter
	 *   On/off toggles. Fires message on change
	 */
	public class ToggleParam : BaseInstrumentParam {
		
		public ToggleParam(string name, BaseInstrument paramOwner, int deviceIndex, int parameterIndex)
				: base(name, paramOwner, 0.0f, 1.0f, deviceIndex, parameterIndex)
		{
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
	
	
	/*
	 *	Noteparameter
	 *   Multi-note chord channel for midi instruments.
	 */
	public class NoteParam : BaseInstrumentParam {
		
		protected List<Note> m_chordNotes;

        public int lastPlayedNote { get { return m_lastPlayedNote; } }
        public void SetLastPlayedNote(int note) { m_lastPlayedNote = note; }
        protected int m_lastPlayedNote = -1;

		public Note mainNote{get { return m_mainNote; }}
		protected Note m_mainNote;
		
		public NoteParam(string name, BaseInstrument paramOwner)
				: base(name, paramOwner, 0.0f, 127.0f, -1, -1)
		{
			m_chordNotes = new List<Note>();
			m_mainNote = new Note(m_name, m_owner);
		}
		
		public void releaseChord(){
			foreach(Note note in m_chordNotes){
				note.releaseNote();
			}
		}
		
		public Note getNote(int index){ return m_chordNotes[index]; }
		public List<Note> getNoteList(){ return m_chordNotes; }
		
		public void setNote(int notePitch, int noteVelocity, int index, int trigger){
            //bool noteExists = false;
            //if(index < m_chordNotes.Count){
            //    foreach(Note note in m_chordNotes){
            //        if(note.noteIndex == index){
            //            if (trigger == 0)
            //            {
            //                note.setNote(notePitch, noteVelocity, index, trigger);
            //                m_chordNotes.Remove(note);
            //            }
            //            else
            //            {
            //                note.setNote(notePitch, noteVelocity, index, trigger);
            //                noteExists = true;
            //                m_isDirty = true;
            //                return;
            //            }
            //        }
            //    }
            //}
			
            //if(!noteExists){
            //    m_chordNotes.Add(new Note(m_name, m_owner, false, 0, 0));
            //    m_chordNotes[m_chordNotes.Count-1].setNote(notePitch, noteVelocity, index, trigger);			
            //}		
            
			m_mainNote.setNote(notePitch, noteVelocity, 0, trigger);
		}
	}
	
	
	/*
	 *	Note
	 *  Single note in a chord
	 */
	public class Note : BaseInstrumentParam {
		
		public int velocity = 127;
		public int noteTrigger;
		public int noteIndex;
		
		public void setNote(int notePitch, int noteVelocity, int index, int trigger){
			velocity = noteVelocity;
			noteTrigger = trigger;
			noteIndex = index;
			setVal((float)notePitch);
		}
		
		public void releaseNote(){
			noteTrigger = 0;
			m_isDirty = true;
		}
				
		public Note(string name, BaseInstrument paramOwner)
				: base(name, paramOwner, 0.0f, 127.0f, -1, -1)
		{
		}
	}
	
	
	/*
	 *	InstrumentClip
	 *  A clip on this instrument channel
	 */
	public class InstrumentClip : BaseInstrumentParam
	{
		public int scene;
		public bool isPlaying;

        //Clip state
        public enum ClipState
        {
            IS_DISABLED = 0,
            IS_QUEUED,
            IS_PLAYING
        }
        protected ClipState m_clipState;
        public ClipState clipState { get { return m_clipState; } }
        public void SetClipState(ClipState state){
			if(state == ClipState.IS_PLAYING)
				m_owner.SetPlayingClip(this);
            m_clipState = state;
        }
		
		public InstrumentClip(string name, BaseInstrument paramOwner, int clipScene) 
			: base(name, paramOwner, 0, 127, -1, -1)
		{
			scene = clipScene;
		}
		
		public void Play(){
			if(GlobalConfig.Instance.ShowtimeEnabled)
                ZmqMusicNode.Instance.fireClip(m_owner.trackIndex, this.scene);
		}
	}
	
	
	/*
	 * Generic parameter
	 */
	public class GenericMusicParam : BaseInstrumentParam {
		public GenericMusicParam(string name, BaseInstrument paramOwner, float min, float max, int deviceIndex, int parameterIndex) 
			: base(name, paramOwner, min, max, deviceIndex, parameterIndex)
		{
		}
	}
}