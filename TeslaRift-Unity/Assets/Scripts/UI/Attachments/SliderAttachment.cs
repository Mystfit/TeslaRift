using UnityEngine;
using System.Collections;
using MusicIO;
using UI;

public class SliderAttachment : UIAttachment<BaseInstrumentParam> {

	protected BarSlider m_slider;
	protected UIFrame m_frame;
	protected ParamSliderPanelAttachment m_owner;
	public ParamSliderPanelAttachment owner{ get { return m_owner; }}

	// Use this for initialization
	public override void Start () {
		m_slider = GetComponent<BarSlider>();
		m_frame = GetComponent<UIFrame>();
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
		SetValueFromHand( HydraController.Instance.GetHand( m_hand ).transform );
	}

	public override void Gesture_IdleProximity(){
		base.Gesture_IdleProximity();
		SetValueFromHand( HydraController.Instance.GetHand( m_hand ).transform );
	}

	public override void Gesture_PullOut ()
	{
		base.Gesture_PullOut ();
		if(mode == BaseTool.ToolMode.SECONDARY){
			RemoveSlider();
		}
	}

	public override void Gesture_Exit ()
	{
		if(m_owner != null)
			m_owner.SlidersUpdated();
		base.Gesture_Exit ();
	}

	/*
	 * Removes this slider
	 */
	public void RemoveSlider(){
		owner.RemoveSlider(this);
	}


	/*
	 * Sets the value of the slider(0,1) based on location inside the slider frame
	 */
	public void SetValueFromHand(Transform worldPos){
		
		//Offset the position by the source's collider (if present)
		Vector3 worldOffset = worldPos.position;
		if(worldPos.collider != null){
			if( worldPos.collider.GetType() == typeof(CapsuleCollider) ){
				CapsuleCollider coll = worldPos.collider as CapsuleCollider;
				worldOffset = coll.bounds.center;
			}
		}
		
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
