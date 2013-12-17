using UnityEngine;
using System.Collections;
using MusicIO;
using UI;

public class SliderAttachment : UIAttachment<BaseInstrumentParam> {

	protected BarSlider m_slider;
	protected UIFrame m_frame;
	public UIFrame frame{ get { return m_frame; }}
	protected ParamSliderPanelAttachment m_owner;
	public ParamSliderPanelAttachment owner{ get { return m_owner; }}

	// Use this for initialization
	public override void Start () {
		m_slider = GetComponent<BarSlider>();
		m_frame = GetComponent<UIFrame>();
	}

	public override void Init (BaseInstrumentParam managedReference)
	{
		base.Init (managedReference);
		GetComponent<BarSlider>().SetLabel(managedReference.name);
	}

	/*
	 * Owning panel for this UI object
	 */
	public void SetOwner (ParamSliderPanelAttachment panelOwner)
	{
		m_owner = panelOwner;
	}


	/*
	 * Gesture overrides
	 */
	public override void Gesture_IdleInterior ()
	{
		base.Gesture_IdleInterior ();
		if(mode == BaseTool.ToolMode.PRIMARY)
			SetValueFromHand( HydraController.Instance.GetHandTip( m_hand ) );
	}


	public override void Gesture_ExitIdleInterior ()
	{
		base.Gesture_ExitIdleInterior ();
		if(mode == BaseTool.ToolMode.TERTIARY){
			owner.RemoveSlider(this);
		}
	}

	public override void Gesture_Exit ()
	{
		if(m_owner != null)
			m_owner.SlidersUpdated();
		base.Gesture_Exit ();
	}


	/*
	 * Sets the value of the slider(0,1) based on location inside the slider frame
	 */
	public void SetValueFromHand(Transform worldPos){
		
		//Offset the position by the source's collider (if present)
		Vector3 worldOffset = worldPos.position;
		
		Vector3 pos = transform.InverseTransformPoint(worldOffset);
		Vector2 sliderPosVal = new Vector2(
			Mathf.Clamp(pos.x, m_frame.width*-0.5f, m_frame.height*0.5f ), 
			Mathf.Clamp(pos.y,  m_frame.width*-0.5f, m_frame.height*0.5f )
		);

		float sliderVal = 0.0f;

		if(m_frame.isRotated)
			sliderVal = Utils.Scale(sliderPosVal.x, m_frame.width*-0.5f, m_frame.height*0.5f);
		else
			sliderVal = Utils.Scale(sliderPosVal.y, m_frame.width*-0.5f, m_frame.height*0.5f);

		m_slider.SetSliderVal(sliderVal);

		if(musicRef != null)
			musicRef.setVal(sliderVal);
	}


	/*
	 * Sets slider value from an exterior value
	 */
	public void SetSliderValue(float val){
		m_slider.SetSliderVal(val);
		
		if(musicRef != null)
			musicRef.setVal(val);
	}
}
