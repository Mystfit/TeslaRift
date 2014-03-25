using UnityEngine;
using UI;
using System.Collections;
using MusicIO;
	
public class InstrumentAttachment : BaseAttachment<BaseInstrument> {
	
	public override void Awake ()
	{
		base.Awake ();
	}

	public override Collider interiorCollider {
		get {
			if(m_interiorCollider == null){
				m_interiorCollider = transform.Find("AreaTrigger").Find("interiorTrigger").GetComponent<HandProximityTrigger>();
			}
			return base.interiorCollider;
		}
	}
	
	public override Collider exteriorCollider {
		get {
			if(m_exteriorCollider == null){
				m_exteriorCollider = transform.Find("AreaTrigger").Find("proximityTrigger").GetComponent<HandProximityTrigger>();
			}
			return base.exteriorCollider;
		}
	}

	public void InitInstrumentControls(){
		if(musicRef  != null){
			//Create clip buttons
			GameObject clipHolder = new GameObject();
			clipHolder.transform.parent = transform;
			clipHolder.transform.localPosition = Vector3.zero;
			clipHolder.name = "clipHolder";

			for(int i = 0; i < musicRef.clipList.Count; i++){
				InstrumentClip clip = musicRef.clipList[i] as InstrumentClip;
				ClipButtonAttachment clipButton = UIFactory.CreateClipButton(clip, UIFrame.AnchorLocation.BOTTOM);
				clipButton.transform.parent = clipHolder.transform;
				clipButton.transform.localPosition = new Vector3(0.0f, i * 0.2f, 0.0f);
			}

			//Create param sliders
			ParamScrollerAttachment paramScroller = UIFactory.CreateParamScroller();
			paramScroller.transform.parent = transform;
			paramScroller.transform.localPosition = Vector3.zero;

			foreach(BaseInstrumentParam param in musicRef.paramList){ 
				SliderAttachment slider = UIFactory.CreateSlider(param, UIFrame.AnchorLocation.BOTTOM_LEFT);
				paramScroller.AddControl(slider);
			}

			//Set param scroller scale
			paramScroller.transform.localScale = UIFactory.SliderScale;

			//Hide controls
			clipHolder.SetActive(false);
			//paramScroller.gameObject.SetActive(false);
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
	}
	
	public override void Gesture_IdleProximity ()
	{
		base.Gesture_IdleProximity ();
	}

	public override void Gesture_Exit ()
	{
		base.Gesture_Exit ();
	}

	public override void Gesture_PushIn (){
		base.Gesture_PushIn ();
		Gesture_Exit();
	}

	public override void Gesture_PullOut ()
	{
		base.Gesture_PullOut ();
		Gesture_Exit();
	}
}

