using UnityEngine;
using System.Collections;
using MusicIO;
using UI;

public class SliderAttachment : UIAttachment<BaseInstrumentParam> {

	public bool m_useHorizontalInput = true;
	protected BarSlider m_slider;
	protected UIFrame m_frame;
	public UIFrame frame{ get { return m_frame; }}
	protected ParamSliderPanelAttachment m_owner;
	public ParamSliderPanelAttachment owner{ get { return m_owner; }}

	// Use this for initialization
	public override void Awake () {
		m_slider = GetComponent<BarSlider>();
		m_frame = GetComponent<UIFrame>();
	}

	public override void Init (BaseInstrumentParam managedReference)
	{
		base.Init (managedReference);
		BarSlider sliderFrame = GetComponent<BarSlider>();
		sliderFrame.SetLabel(managedReference.name);
	}

	public override Collider interiorCollider {
		get {
			if(m_interiorCollider == null)
				m_interiorCollider = transform.Find("BoxAreaTrigger").Find("interiorTrigger").GetComponent<HandProximityTrigger>();
			
			base.m_interiorCollider = m_interiorCollider;
			return base.interiorCollider;
		}
	}
	
	public override Collider exteriorCollider {
		get {
			if(m_exteriorCollider == null)
				m_exteriorCollider = transform.Find("BoxAreaTrigger").Find("proximityTrigger").GetComponent<HandProximityTrigger>();
			
			base.m_exteriorCollider = m_exteriorCollider;
			return base.exteriorCollider;
		}
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
			SetValueFromHand( HydraController.Instance.GetHandColliderPosition( m_hand ) );
	}


	public override void Gesture_ExitIdleInterior ()
	{
		base.Gesture_ExitIdleInterior ();
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
	public void SetValueFromHand(Vector3 worldPos){
		
		Vector3 pos = transform.InverseTransformPoint(worldPos);
		Vector2 sliderPosVal = new Vector2(
			Mathf.Clamp(pos.x - frame.GetAnchorOffset(m_frame.width, m_frame.height, frame.m_anchorPoint).x, m_frame.width*-0.5f, m_frame.height*0.5f ), 
			Mathf.Clamp(pos.y - frame.GetAnchorOffset(m_frame.width, m_frame.height, frame.m_anchorPoint).y,  m_frame.width*-0.5f, m_frame.height*0.5f )
		);

		float sliderVal = 0.0f;

		if(!m_useHorizontalInput)
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
