using UnityEngine;
using MusicIO;
using UI;
using System.Collections;
using System.Collections.Generic;

public class ParamSliderPanelAttachment : UIAttachment {

	//Owner
	protected MusicControllerAttachment m_owner;
	public MusicControllerAttachment owner{ get { return m_owner; }}

	//UI spacing
	public float m_clipRowSize = 1.0f;
	public float m_clipColumnSize = 1.0f;
	public float m_clipBufferEdges = 0.05f;

	//Sliders
	protected List<SliderAttachment> m_sliders;
	protected UIFrame m_frame;

	//Delegates
	public delegate void SliderUpdateEvent();
	public event SliderUpdateEvent SliderUpdate;
	public delegate void SliderAddEvent();
	public event SliderAddEvent SliderAdd;
	public delegate void SliderRemoveEvent();
	public event SliderRemoveEvent SliderRemove;

	//States
	protected bool bQueuedSort;


	// Use this for initialization
	public override void Awake () {
		m_sliders = new List<SliderAttachment>();
		m_frame = GetComponent<UIFrame>();
	}

	/*
	 * Set owner
	 */
	public void Init(MusicControllerAttachment owner){
		m_owner = owner;
	}


	/*
	 * Gets the current coordinates of a column by index
	 */
	public Vector3 GetColumnLocalCoordinates(int index){
		float edge = (index == 0) ? 0.0f : 0.0f;
		return  new Vector3((index*m_clipColumnSize + edge), 0.0f, 0.0f);
	}


	/*
	 * Gets the current world coordinates of a column by index
	 */
	public Vector3 GetColumnWorldCoordinates(int index){
		return  new Vector3(transform.position.x + index*m_clipColumnSize + m_clipBufferEdges, transform.position.y, transform.position.z);
	}

	/*
	 * Gets a list of music parameters only
	 */
	public List<BaseInstrumentParam> GetParametersFromSliders(){

		List<BaseInstrumentParam> paramList = new List<BaseInstrumentParam>();

		foreach(SliderAttachment slider in m_sliders){
			paramList.Add(slider.musicRef);		
		}

		return paramList;
	}


	/*
	 * Creates a new slider gui object representing a parameter value
	 */
	public void CreateSlider(BaseInstrumentParam param){

		//if(m_sliders == null)
			//m_sliders = new List<SliderAttachment>();

		//Only have one slider per param
		foreach(SliderAttachment slider in m_sliders){
			if(slider.musicRef == param)
				return;
		}

		SliderAttachment sliderAttach = UI.UIFactory.CreateSlider(param, UIFrame.AnchorLocation.TOP_LEFT, this);
		sliderAttach.transform.position = transform.position;
		sliderAttach.transform.rotation = transform.rotation;
		sliderAttach.transform.parent = transform;
		m_sliders.Add(sliderAttach);		

		QueueSort();
		SliderAdd();
	}


	/*
	 * Removes a slider
	 */
	public void RemoveSlider(SliderAttachment slider){
		m_sliders.Remove(slider);
		Destroy(slider.gameObject);
		QueueSort();
		SliderRemove();
	}

	public bool HasParameter(BaseInstrumentParam param){
		if(m_sliders != null){
			foreach(SliderAttachment slider in m_sliders){
				if(slider.musicRef == param)
					return true;
			}
		}
		return false;
	}


	/*
	 * Updates the clips/params loaded into this buffer
	 */
	public bool SortBufferItems(){
		for(int i = 0; i < m_sliders.Count; i++){
			Vector3 local = GetColumnLocalCoordinates(i);
			local += new Vector3(0.0f, 0.0f -0.0001f);
			SliderAttachment slider = m_sliders[i];
			iTween.MoveTo(slider.gameObject, iTween.Hash(
				"position", local,
				"time", 0.2f,
				"islocal", true
				));
		}
		
		m_frame.AnimateSize(m_sliders.Count * m_clipColumnSize , m_clipRowSize );
		return false;
	}

	/*
	 * Sets the slider values from a list of values
	 */
	public void SetSliderValues(Dictionary<BaseInstrumentParam,float> paramList){
		foreach(KeyValuePair<BaseInstrumentParam,float> pair in paramList){
			SliderAttachment slider = m_sliders.Find(p => p.musicRef == pair.Key);
			if(slider != null)
				slider.SetSliderValue(pair.Value);
		}
	}

	public void SlidersUpdated(){
		SliderUpdate();
	}

	public void QueueSort(){
		bQueuedSort = true;
	}

	public override void Update(){
		if(bQueuedSort){
			if(m_frame != null)
				bQueuedSort = SortBufferItems();
		}
	}
}
