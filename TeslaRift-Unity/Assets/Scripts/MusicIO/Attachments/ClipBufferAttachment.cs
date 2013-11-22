using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using MusicIO;

public class ClipBufferAttachment : BaseAttachment {
	
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
	 * Clip visual parameters
	 */
	public float m_clipRowSize = 1.0f;
	public float m_clipColumnSize = 1.0f;
	public float m_clipBufferEdges = 0.05f;

	/*
	 * Prefabs
	 */
	public GameObject sliderPrefab;

	protected MusicControllerAttachment m_owner;
	
	/*
	 * Attached gameobjects
	 */
	List<InstrumentClip> m_attachedClips;
	private BufferFrame m_frame;
	Transform m_clipHolder;
	Transform m_paramHolder;

	
	/*
	 * Music object intialization and reference
	 */
	void Start () {
		//Add the buffer to the instrument controller
		InstrumentController.Instance.AddBuffer(this);
		
		m_attachedClips = new List<InstrumentClip>();
		m_frame = GetComponent<BufferFrame>();
		
		m_clipHolder = new GameObject("clipHolder").transform;
		m_clipHolder.transform.position = transform.position;
		m_clipHolder.transform.parent = transform;
	}


	/*
	 * Set owner
	 */
	public void Init(MusicControllerAttachment owner){
		m_owner = owner;
	}
	public MusicControllerAttachment owner{ get { return m_owner; }}

	
	/*
	 * Selects this buffer
	 */
	public override void SetSelected (bool state)
	{
		base.SetSelected (state);
		m_frame.ShowOutline(state);
	}


	/*
	 * Adds a music object to the buffer. Seperates clips and parameters automatically.
	 */
	public void AddMusicObjectToBuffer(InstrumentClip clip){							
		if(IsInstrumentInBuffer(clip.owner)){
			RemoveInstrumentFromBuffer(clip.owner);
		}

		m_attachedClips.Add(clip);

		m_frame.SortBufferItems ();
	}




	/*
	 * Checks for an instrument already existing inside the buffer. 
	 * Used to make sure only one clip per instrument is present in a buffer
	 */
	public bool IsInstrumentInBuffer(BaseInstrument instrument){
		foreach(InstrumentClip clip in m_attachedClips){
			if(clip.owner == instrument){
				return true;
			}
		}
		return false;
	}
	
	
	/*
	 * Removes a gameobject from the buffer
	 */
	public void RemoveInstrumentFromBuffer(BaseInstrument instrument){
		
		List<InstrumentClip> removeList = null;

		for(int i = 0; i < m_attachedClips.Count; i++){
			InstrumentClip clip = m_attachedClips[i] as InstrumentClip;
			
			if(clip.owner == instrument){
				if(removeList == null)
					removeList = new List<InstrumentClip>();

				m_attachedClips.Remove(clip);
			}
		}
	}


	/*
	 * Triggers all clips in buffer
	 */
	public void TriggerAllClips(){
		foreach(InstrumentClip clip in m_attachedClips){
			clip.Play();
		}
	}

	
	public override void Gesture_PushIn ()
	{
		TriggerAllClips();
	}
}
