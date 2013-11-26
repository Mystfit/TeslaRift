using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using MusicIO;

public class ClipBufferAttachment : BaseAttachment {

	protected MusicControllerAttachment m_owner;
	
	/*
	 * Attached gameobjects
	 */
	List<ClipButtonAttachment> m_attachedClips;
	private UIFrame m_frame;
	Transform m_clipHolder;

	//UI spacing
	public float m_clipRowSize = 1.0f;
	public float m_clipColumnSize = 1.0f;
	public float m_clipBufferEdges = 0.05f;

	
	/*
	 * Music object intialization and reference
	 */
	void Start () {
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
	 * Adds a music object to the buffer. Seperates clips and parameters automatically.
	 */
	public void AddClipToBuffer(InstrumentClip clip){							

		/*
		if(IsInstrumentInBuffer(clip.owner)){
			RemoveInstrumentFromBuffer(clip.owner);
		}

		if(m_attachedClips == null)
			m_attachedClips = new List<ClipButtonAttachment>();
		m_attachedClips.Add(clip);

		m_frame.SortBufferItems ();

		*/

		//Only have one slider per param
		foreach(ClipButtonAttachment clipButton in m_attachedClips){
			if(clipButton.musicRef == clip)
				return;
		}
		
		ClipButtonAttachment buttonObj = UI.UIFactory.CreateClipButton(clip, UIFrame.AnchorLocation.TOP_RIGHT, this);
		buttonObj.transform.position = transform.position;
		buttonObj.transform.rotation = transform.rotation;
		buttonObj.transform.parent = transform;

		m_attachedClips.Add(buttonObj);
		
		SortBufferItems();
	}




	/* Refactor task:
	 * 
	 * MOVE INTO DEDICATED UI ROOT
	 *
	 */

	public void SortBufferItems(){
		for(int i = 0; i < m_attachedClips.Count; i++){
			Vector3 local = GetColumnLocalCoordinates(i);
			local += new Vector3(0.0f, 0.0f -0.0001f);
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


	public void PlayClip(ClipButtonAttachment clipButton, bool queued){
		//Toggle off all existing clips
		foreach(ClipButtonAttachment existingClip in m_attachedClips){
			if(existingClip.musicRef.owner == clipButton.musicRef.owner && existingClip != clipButton){
				if(existingClip.clipState == ClipButtonAttachment.ClipState.IS_PLAYING){
					existingClip.SetPlayState(ClipButtonAttachment.ClipState.IS_DISABLED);
				}
			}
		}

		if(queued)
			clipButton.SetPlayState(ClipButtonAttachment.ClipState.IS_QUEUED);
		else
			clipButton.SetPlayState(ClipButtonAttachment.ClipState.IS_PLAYING);
	}
}
