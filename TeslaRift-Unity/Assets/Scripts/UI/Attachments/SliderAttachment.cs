using UnityEngine;
using System.Collections;
using MusicIO;
using UI;

public class SliderAttachment : UIAttachment<BaseInstrumentParam> {

	public bool m_useHorizontalInput = true;
	protected BarSlider m_slider;
	protected UIFrame m_frame;
	public UIFrame frame{ get { return m_frame; }}

	// Use this for initialization
	public override void Awake () {
		base.Awake();
		SetIsDraggable(true);
		SetIsDockable(true);
		m_slider = GetComponent<BarSlider>();
		m_frame = GetComponent<UIFrame>();
	}

	public override void Init (BaseInstrumentParam managedReference)
	{
		base.Init (managedReference);
        BarSlider m_slider = GetComponent<BarSlider>();
		m_frame.SetLabel(managedReference.name);
	}


	/*
	 * Gesture overrides
	 */
    public override void Gesture_First()
    {
        if(mode == BaseTool.ToolMode.GRABBING){
			if(!HydraController.Instance.IsHandDragging(m_hand)){
	            //Clone parameter here
                if (IsCloneable)
                {
                    SliderAttachment attach = UIFactory.CreateGhostDragger(this) as SliderAttachment;
                    attach.StartDragging(HydraController.Instance.GetHand(m_hand));
                }
			}
        }

        base.Gesture_First();
    }

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
        if (IsTransient && IsDragging)
        {
            StopDragging();
        }

		base.Gesture_Exit ();
	}

	public override void Floating ()
	{
		if (IsTransient)
		{
			if (DockedInto == null)
			{
				GameObject.Destroy(gameObject);
			}
		}
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

        SetSliderValue(sliderVal);
	}


    public override void Update()
    {
        if (musicRef != null)
            m_slider.SetSliderVal(musicRef.val);
       
        base.Update();
    }


	/*
	 * Sets slider value from an exterior value
	 */
	public void SetSliderValue(float val){		
		if(musicRef != null)
			musicRef.setVal(val);
        else
            m_slider.SetSliderVal(val);
	}
}
