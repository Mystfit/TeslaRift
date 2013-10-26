using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using MusicIO;

public class BufferAttachment : BaseAttachment<ControlBuffer> {
	
	/*
	 * Flags specifying direction to expand frame in
	 */
	protected enum ExpandDirection{
		UP = 0,
		DOWN,
		LEFT,
		RIGHT
	}
	protected ExpandDirection m_expandDirection;
	
	
	/*
	 * Flags specifying display state of buffer
	 */
	public enum BufferDisplayMode{
		SHOWING_CLIPS = 0,
		TRANSITIONING_TO_PARAMS,
		SHOWING_PARAMS,
		TRANSITIONING_TO_CLIPS
	}
	public BufferDisplayMode m_displayMode;
	
	
	/*
	 * Attached gameobjects
	 */
	List<FloatingAttachment> m_attachedClips;
	List<FloatingAttachment> m_attachedParams;
	
	
	/*
	 * Music object intialization and reference
	 */
	void Start () {
		Init( new ControlBuffer() );
		
		//Add the buffer to the instrument controller
		InstrumentController.Instance.AddBuffer(this);
		
		m_attachedClips = new List<FloatingAttachment>();
		m_attachedParams = new List<FloatingAttachment>();
	}
	
	
	public void AddMusicObjectToBuffer(FloatingAttachment attach){
		BaseInstrumentParam param = attach.musicRef;
		
		if(param.GetType() == typeof(InstrumentClip)){
			m_attachedClips.Add(attach);
			
		}else if(param.GetType() == typeof(GenericMusicParam)){
			m_attachedParams.Add(attach);
		}
	}
	
	
	
	/*
	 * Triggers all clips in buffer
	 */
	public void TriggerAllClips(){
		foreach(FloatingAttachment attach in m_attachedClips){
			InstrumentClip clip = attach.musicRef as InstrumentClip;
			clip.owner.addClipMessageToQueue(clip.scene);
		}
	}
	

	
	/*
	 * Modifies all selected parameters
	 */
	public void SetSelectedParameterValues(float value){
		foreach( FloatingAttachment attach in m_attachedParams){
			
		/*
		 * Legacy parameter type specifics
		 * 
		 * if(param.GetType() == typeof(NoteParam)){
			NoteParam chord = param as NoteParam;
			chord.setNote(value, 1.0f, 0, 1);
		}else if(param.GetType() == typeof(ToggleParam)){
			ToggleParam toggle = param as ToggleParam;
			toggle.setOverrideVal(value);
			toggle.setVal(value);
			Debug.Log ("Override is:" + value + " Clamped is:" + param.val);
		}
		*/
		
			attach.musicRef.setOverrideVal(value);
			attach.musicRef.setVal(value);
		}
	}
	
	
	/*
	 * Gesture overrides
	 */
	public override void Gesture_First ()
	{
		InstrumentController.Instance.SelectBuffer(this);
	}
}
