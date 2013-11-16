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
	 * Clip visual parameters
	 */
	public float m_clipRowSize = 1.0f;
	public float m_clipColumnSize = 1.0f;
	public float m_clipBufferEdges = 0.05f;

	/*
	 * Prefabs
	 */
	public GameObject sliderPrefab;
	
	/*
	 * Attached gameobjects
	 */
	List<BaseAttachment> m_attachedClips;
	List<BaseAttachment> m_attachedParams;
	private BufferFrame m_frame;
	Transform m_clipHolder;
	Transform m_paramHolder;

	
	/*
	 * Music object intialization and reference
	 */
	void Start () {
		Init( new ControlBuffer() );
		
		//Add the buffer to the instrument controller
		InstrumentController.Instance.AddBuffer(this);
		
		m_attachedClips = new List<BaseAttachment>();
		m_attachedParams = new List<BaseAttachment>();
		
		m_frame = GetComponent<BufferFrame>();
		
		m_clipHolder = new GameObject("clipHolder").transform;
		m_clipHolder.transform.position = transform.position;
		m_clipHolder.transform.parent = transform;
		m_paramHolder = new GameObject("paramHolder").transform;
		m_paramHolder.transform.position = transform.position;
		m_paramHolder.transform.parent = transform;
	}
	
	
	/*
	 * Selects this buffer
	 */
	public override void SetSelected (bool state)
	{
		base.SetSelected (state);
		m_frame.ShowOutline(state);
	}
	
	
	/*
	 * Gets the current world coordinates of a row by index
	 */
	public Vector3 GetRowWorldCoordinates(int index){
		return  new Vector3(transform.position.x, transform.position.y + index*m_clipRowSize +m_clipBufferEdges, transform.position.z);
	}
	
	/*
	 * Gets the current world coordinates of a column by index
	 */
	public Vector3 GetColumnWorldCoordinates(int index){
		return  new Vector3(transform.position.x + index*m_clipColumnSize + m_clipBufferEdges, transform.position.y, transform.position.z);
	}

	/*
	 * Gets the current coordinates of a row by index
	 */
	public Vector3 GetRowLocalCoordinates(int index, List<BaseAttachment> attachList){
		return  new Vector3(0.0f, (((m_clipRowSize+m_clipBufferEdges)*attachList.Count)*0.5f) - ((attachList.Count - index)* (m_clipRowSize + m_clipBufferEdges)), 0.0f);
	}
	
	/*
	 * Gets the current coordinates of a column by index
	 */
	public Vector3 GetColumnLocalCoordinates(int index, List<BaseAttachment> attachList){
		return  new Vector3((index*m_clipColumnSize +m_clipBufferEdges) - ((m_clipColumnSize+m_clipBufferEdges)*attachList.Count)*0.5f, 0.0f, 0.0f);
	}
	
	
	/*
	 * Adds a music object to the buffer. Seperates clips and parameters automatically.
	 */
	public void AddMusicObjectToBuffer(FloatingAttachment attach){	
		if(attach.musicRef.GetType() == typeof(InstrumentClip)){
						
			if(IsInstrumentInBuffer(attach.musicRef.owner, ParameterType.CLIP)){
				RemoveInstrumentFromBuffer(attach.musicRef.owner, ParameterType.CLIP);
			}

			m_attachedClips.Add(attach);
			
		} else if(attach.musicRef.GetType() == typeof(GenericMusicParam)){
			if(!m_attachedParams.Exists(a => attach))
			   CreateSlider(attach.musicRef);
		}
		
		Hashtable tweenParams = new Hashtable();
		tweenParams.Add("targetAttachment", attach);
		tweenParams.Add("targetList", GetActiveAttachList());
		
		//Animate floating attachement
		iTween.MoveTo(attach.gameObject, iTween.Hash(
			"position", GetRowWorldCoordinates(0),
			"time", 0.4f,
			"easetype", "easeInCubic",
			"oncomplete", "AttachmentAddAnimationComplete",
			"oncompletetarget", gameObject,
			"oncompleteparams", tweenParams
		));	
		
		iTween.RotateTo(attach.gameObject, iTween.Hash(
			"rotation", Vector3.zero,
			"time", 0.4f
		));	
	}


	/*
	 * Creates a new slider gui object representing a parameter value
	 */
	public void CreateSlider(BaseInstrumentParam param){
		GameObject sliderObj = Instantiate(sliderPrefab) as GameObject;
		sliderObj.transform.position = GetActiveAttachTransform().position;
		sliderObj.transform.rotation = GetActiveAttachTransform().rotation;
		sliderObj.transform.parent = GetActiveAttachTransform();
		SliderAttachment slider = sliderObj.GetComponent<SliderAttachment>();
		slider.Init( (param ));
		m_attachedParams.Add(slider);
	}


	/*
	 * Checks for an instrument already existing inside the buffer. 
	 * Used to make sure only one clip per instrument is present in a buffer
	 */
	public bool IsInstrumentInBuffer(BaseInstrument instrument, ParameterType type){
		
		if(type == ParameterType.CLIP){
			foreach(FloatingAttachment attach in m_attachedClips){
				if(attach.musicRef.owner == instrument){
					return true;
				}
			}
		} else if(type == ParameterType.CLIP){
			foreach(FloatingAttachment attach in m_attachedParams){
				if(attach.musicRef.owner == instrument){
					return true;
				}
			}
		}
		
		return false;
	}
	
	
	/*
	 * Removes a gameobject from the buffer
	 */
	public void RemoveInstrumentFromBuffer(BaseInstrument instrument, ParameterType type){
		
		List<BaseAttachment> removeList = null;
		List<BaseAttachment> targetList = null;
		
		if(type == ParameterType.CLIP)
			targetList = m_attachedClips;
		else if(type == ParameterType.CLIP)
			targetList = m_attachedParams;	
		
		for(int i = 0; i < m_attachedClips.Count; i++){
			FloatingAttachment attach = targetList[i] as FloatingAttachment;
			
			if(attach.musicRef.owner == instrument){
				if(removeList == null)
					removeList = new List<BaseAttachment>();
				
				targetList.Remove(attach);
				removeList.Add(attach);
			}
		}
		
		foreach(FloatingAttachment attach in removeList){
			Hashtable tweenParams = new Hashtable();
			tweenParams.Add("targetAttach", attach);
			
			attach.transform.parent = null;
			iTween.MoveTo(attach.gameObject, iTween.Hash(
				"position", InstrumentController.Instance.GetInstrumentGameByMusicReference( attach.musicRef.owner ),
				"time", 0.4f,
				"oncomplete", "AttachmentRemoveAnimationComplete",
				"oncompletetarget", gameObject,
				"oncompleteparams", tweenParams
			));
		}
	}
	
	
	/*
	 * Callback to handle floating removed attachment removing on animation end
	 */
	protected void AttachmentRemoveAnimationComplete(Hashtable tweenParams){
		BaseAttachment attach = tweenParams["targetAttach"] as BaseAttachment;
		Destroy(attach.gameObject);
	}
	
	
	
	/*
	 * Callback for floating animation clip being added. Slot
	 */
	protected void AttachmentAddAnimationComplete(Hashtable tweenParams){
		BaseAttachment attach = tweenParams["targetAttachment"] as BaseAttachment;
		List<BaseAttachment> attachList = tweenParams["targetList"] as List<BaseAttachment>;
		attach.transform.position = GetActiveAttachTransform().position;
		attach.transform.parent = GetActiveAttachTransform();

		//Add parameter gui controls
		if(attachList == m_attachedParams){

		} else if(attachList == m_attachedClips){
		
		}

		SortBufferItems ();
	}
	

	
	/*
	 * Updates the clips/params loaded into this buffer
	 */
	protected void SortBufferItems(){
		Debug.Log((0*(m_clipRowSize+m_clipBufferEdges)) - (((m_clipRowSize+m_clipBufferEdges)*GetActiveAttachList().Count)*0.5f));

		for(int i = 0; i < GetActiveAttachList().Count; i++){
			Vector3 local = GetRowLocalCoordinates(i, GetActiveAttachList());
			BaseAttachment attach = GetActiveAttachList()[i];
			iTween.MoveTo(attach.gameObject, iTween.Hash(
				"position", GetRowLocalCoordinates(i, GetActiveAttachList()),
				"time", 0.2f,
				"islocal", true
			));
		}
		
		m_frame.AnimateSize(m_frame.width, GetActiveAttachList().Count * (m_clipBufferEdges + m_clipRowSize) - (m_clipBufferEdges + m_clipRowSize) );
	}
	
	/*
	 * Gets the list for the active display mode
	 */
	public List<BaseAttachment> GetActiveAttachList(){
		List<BaseAttachment> attachList = null;
		
		if(m_displayMode == BufferDisplayMode.SHOWING_CLIPS){
			attachList = m_attachedClips;
		} else if(m_displayMode == BufferDisplayMode.SHOWING_PARAMS){
			attachList = m_attachedParams;
		}
		
		return attachList;
    }
	
	
	/*
	 * Gets the active parent transform for floating clips
	 */
	public Transform GetActiveAttachTransform(){
		Transform attachTransform = null;
		
		if(m_displayMode == BufferDisplayMode.SHOWING_CLIPS){
			attachTransform = m_clipHolder;
		} else if(m_displayMode == BufferDisplayMode.SHOWING_PARAMS){
			attachTransform = m_paramHolder;
		}
		
		return attachTransform;
    }
		
	
	/*
	 * Triggers all clips in buffer
	 */
	public void TriggerAllClips(){
		foreach(FloatingAttachment attach in m_attachedClips){
			InstrumentClip clip = attach.musicRef as InstrumentClip;
			clip.Play();
		}
	}
	

	
	/*
	 * Modifies all selected parameters
	 */
	public void SetSelectedParameterValues(float value){
		foreach( FloatingAttachment attach in m_attachedParams){
			attach.musicRef.setOverrideVal(value);
			attach.musicRef.setVal(value);
		}
	}
	
	
	/*
	 * Gesture overrides
	 */
	public override void Gesture_First ()
	{
		if(mode == BaseTool.ToolMode.PRIMARY)
			InstrumentController.Instance.SelectBuffer(this);
	}
	
	public override void Gesture_PushIn ()
	{
		TriggerAllClips();
	}
}
