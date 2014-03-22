using UnityEngine;
using UI;
using System.Collections;
using System.Collections.Generic;
using MusicIO;

public class ClipBufferAttachment : UIAttachment {

	protected MusicControllerAttachment m_owner;
	
	/*
	 * Attached gameobjects
	 */
	List<ClipButtonAttachment> m_attachedClips;
	private UIFrame m_frame;
	Transform m_clipHolder;

	/*
	 * Delegates
	 */
	public delegate void ClipRemoveEvent();
	public event ClipRemoveEvent ClipRemove;

	//UI spacing
	public float m_clipRowSize = 1.0f;
	public float m_clipColumnSize = 1.0f;
	public float m_clipBufferEdges = 0.05f;

	
	/*
	 * Music object intialization and reference
	 */
	public override void Awake () {
		//Add the buffer to the instrument controller
		InstrumentController.Instance.AddBuffer(this);
		
		m_attachedClips = new List<ClipButtonAttachment>();
		m_frame = GetComponent<UIFrame>();
		
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
	 * Returns all clip objects
	 */
	public List<InstrumentClip> GetClips(){
		List<InstrumentClip> clipList = new List<InstrumentClip>();
		foreach(ClipButtonAttachment clipBtn in m_attachedClips){
			clipList.Add(clipBtn.musicRef);
		}
		return clipList;
	}


	/*
	 * Adds a music object to the buffer. Seperates clips and parameters automatically.
	 */
	public void AddClipToBuffer(InstrumentClip clip){							

		if(m_attachedClips == null)
			m_attachedClips = new List<ClipButtonAttachment>();

		//Only have one slider per param
		foreach(ClipButtonAttachment clipButton in m_attachedClips){
			if(clipButton.musicRef == clip)
				return;
		}
		
		ClipButtonAttachment buttonObj = UI.UIFactory.CreateClipButton(clip, UIFrame.AnchorLocation.BOTTOM_RIGHT, this);
		buttonObj.transform.position = transform.position;
		buttonObj.transform.rotation = transform.rotation;
		buttonObj.transform.parent = transform;

		GameObject instrumentObj = UI.UIFactory.CreateFloatingInstrumentIcon(clip.owner);
		instrumentObj.transform.localScale = new Vector3(0.08f, 0.08f, 0.08f);
		instrumentObj.transform.position = buttonObj.transform.position;
		instrumentObj.transform.rotation = buttonObj.transform.rotation;
		instrumentObj.transform.parent = buttonObj.transform;
		//buttonObj.frame.toggleVertical = true;

		m_attachedClips.Add(buttonObj);
		
		SortBufferItems();
	}

	/*
	 * Removes a slider
	 */
	public void RemoveClipButton(ClipButtonAttachment clip){
		m_attachedClips.Remove(clip);
		HydraController.Instance.RemoveFromAllCollisionLists(clip.gameObject);
		Destroy(clip.gameObject);
		SortBufferItems();
		ClipRemove();
	}




	/* Refactor task:
	 * 
	 * MOVE INTO DEDICATED UI ROOT
	 *
	 */

	public void SortBufferItems(){
		for(int i = 0; i < m_attachedClips.Count; i++){
			Vector3 local = GetColumnLocalCoordinates(i);
			local += new Vector3(0.0f, 0.0f -0.001f);
			ClipButtonAttachment attach = m_attachedClips[i];
			iTween.MoveTo(attach.gameObject, iTween.Hash(
				"position", local,
				"time", 0.2f,
				"islocal", true
				));
		}
		
		m_frame.AnimateSize(m_clipRowSize, m_attachedClips.Count * m_clipColumnSize  );
	}


	/*
	 * Gets the current coordinates of a column by index
	 */
	public Vector3 GetColumnLocalCoordinates(int index){
		float edge = (index == 0) ? 0.0f : 0.0f;
		return  new Vector3((index*m_clipColumnSize + edge), 0.0f, 0.0f);
	}

	/*
	 * Gets the current coordinates of a row by index
	 */
	public Vector3 GetRowLocalCoordinates(int index){
		float edge = (index == 0) ? 0.0f : 0.0f;
		return  new Vector3(0.0f, (index*m_clipColumnSize + edge), 0.0f);
	}
	
	
	/*
	 * Gets the current world coordinates of a column by index
	 */
	public Vector3 GetColumnWorldCoordinates(int index){
		return  new Vector3(transform.position.x + index*m_clipColumnSize + m_clipBufferEdges, transform.position.y, transform.position.z);
	}




	/*
	 * Checks for an instrument already existing inside the buffer. 
	 * Used to make sure only one clip per instrument is present in a buffer
	 */
	public bool IsInstrumentInBuffer(BaseInstrument instrument){
		if(m_attachedClips != null){
			foreach(ClipButtonAttachment clip in m_attachedClips){
				if(clip.musicRef.owner == instrument){
					return true;
				}
			}
		}
		return false;
	}

	public void ToggleActivateClip(ClipButtonAttachment clipButton){
	
	}

	public void PlayAllQueuedClips(){
		foreach(ClipButtonAttachment clipButton in m_attachedClips){
			if(clipButton.clipState == ClipButtonAttachment.ClipState.IS_QUEUED)
				clipButton.SetPlayState(ClipButtonAttachment.ClipState.IS_PLAYING);
		}
	}

	public void StopAllQueuedClips(){
		//Stop playing clips here
	}


	public void PlayClip(ClipButtonAttachment clipButton, bool queued){
		//Toggle off all existing clips
		foreach(ClipButtonAttachment existingClip in m_attachedClips){
			if(existingClip.musicRef.owner == clipButton.musicRef.owner && existingClip != clipButton){
				if(existingClip.clipState == ClipButtonAttachment.ClipState.IS_PLAYING ||
				   existingClip.clipState == ClipButtonAttachment.ClipState.IS_QUEUED)
				{
					existingClip.SetPlayState(ClipButtonAttachment.ClipState.IS_DISABLED);
				}
			}
		}

		if(queued)
			clipButton.SetPlayState(ClipButtonAttachment.ClipState.IS_QUEUED);
		else
			clipButton.SetPlayState(ClipButtonAttachment.ClipState.IS_PLAYING);
	}


	/*
	 * Gesture Overrides
	 */
	public override void Gesture_PushIn ()
	{
		base.Gesture_PushIn ();
		PlayAllQueuedClips();
	}

	public override void Gesture_PullOut ()
	{
		base.Gesture_PullOut ();
		StopAllQueuedClips();
	}
}
