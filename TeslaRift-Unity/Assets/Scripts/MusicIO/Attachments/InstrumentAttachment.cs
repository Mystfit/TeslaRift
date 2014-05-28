using UnityEngine;
using UI;
using System.Collections;
using MusicIO;
	
public class InstrumentAttachment : BaseAttachment<BaseInstrument> {

	protected GameObject m_parameterScroller;
	
	public override void Awake ()
	{
		//Since instrument attachments are created at runtime, we need to set the filter here
		m_respondsToToolMode = new BaseTool.ToolMode[]{
			BaseTool.ToolMode.PRIMARY, 
			BaseTool.ToolMode.SECONDARY, 
			BaseTool.ToolMode.GRABBING
		};
		base.Awake ();

		//Set the collision state
		SetCollideable(true);
		SetIsDockable(true);
		SetIsDraggable(true);
	}

	public void InitInstrumentControls(){
		if(musicRef  != null){
			//Create clipbuttons
			ParamScrollerAttachment clipScroller = UIFactory.CreateParamScroller();
            clipScroller.AddAcceptedDocktype(typeof(ClipButtonAttachment));
			clipScroller.transform.parent = transform;
			clipScroller.transform.localPosition = Vector3.zero;
			
			foreach(InstrumentClip clip in musicRef.clipList){ 
				ClipButtonAttachment clipButton = UIFactory.CreateClipButton(clip, UIFrame.AnchorLocation.BOTTOM_LEFT);
                clipButton.transform.localScale = UIFactory.SliderScale;
                clipButton.DockInto(clipScroller);
			}
			
			//Create param sliders
			ParamScrollerAttachment paramScroller = UIFactory.CreateParamScroller();
			paramScroller.transform.parent = transform;
			paramScroller.transform.localPosition = Vector3.zero;

			foreach(BaseInstrumentParam param in musicRef.paramList){ 
				SliderAttachment slider = UIFactory.CreateSlider(param, UIFrame.AnchorLocation.BOTTOM_LEFT);
                slider.transform.localScale = UIFactory.SliderScale;
                slider.DockInto(paramScroller);
			}
                
			//Set clip scroller scale
			//clipScroller.transform.localScale = UIFactory.SliderScale;

			//Set param scroller scale
			//paramScroller.transform.localScale = UIFactory.SliderScale;

			//Hide controls
			clipScroller.SetInactive();
			paramScroller.SetInactive();
			m_parameterScroller = paramScroller.gameObject;
		}

	}
	
	
	public override void Update () {

	}

	
	//Tool interface implementations
	//-----------------------------------
	
	/*
	 * Handles code for the mode of the interacting tool
	 */
	public override void SetToolMode(BaseTool.ToolMode mode){
		base.SetToolMode(mode);
	}
	
	/*
	 *  Gesture handlers
	 */
	public override void Gesture_First ()
	{
		base.Gesture_First ();

		//Make sure to start dragging the object if we're using the drag gesture
		if(m_mode == BaseTool.ToolMode.GRABBING){
            StartDragging(HydraController.Instance.GetHand(m_hand));
		}
	}
	
	public override void Gesture_IdleProximity ()
	{
		base.Gesture_IdleProximity ();
	}

	public override void Gesture_Exit ()
	{
		base.Gesture_Exit ();
		if(m_mode == BaseTool.ToolMode.GRABBING){
			StopDragging();
		}
	}

	public override void Gesture_PushIn (){
		base.Gesture_PushIn ();
		Gesture_Exit();
	}

	public override void Gesture_PullOut ()
	{
		if(m_mode == BaseTool.ToolMode.SECONDARY){
			m_parameterScroller.SetActive(!m_parameterScroller.activeSelf);
		}
		base.Gesture_PullOut ();
		Gesture_Exit();
	}
}

