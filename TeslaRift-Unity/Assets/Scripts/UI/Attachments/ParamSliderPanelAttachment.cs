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
	public delegate void SliderUpdateEvent();
	public event SliderUpdateEvent SliderUpdate;


	// Use this for initialization
	public override void Start () {
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
			
		SortBufferItems();
	}


	/*
	 * Updates the clips/params loaded into this buffer
	 */
	protected void SortBufferItems(){
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
	}

	/*
	 * Sets the slider values from a list of values
	 */
	public void SetSliderValues(Dictionary<BaseInstrumentParam,float> paramList){
		foreach(KeyValuePair<BaseInstrumentParam,float> pair in paramList){
			m_sliders.Find(p => p.musicRef == pair.Key).SetSliderValue(pair.Value);
		}
	}

	public void SlidersUpdated(){
		SliderUpdate();
	}
}
