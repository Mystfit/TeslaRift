using UnityEngine;
using UI;
using System.Collections;
using MusicIO;
	
public class InstrumentAttachment : BaseAttachment<BaseInstrument> {
	
	public override void Awake ()
	{
		base.Awake ();
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
				ClipButtonAttachment clipButton = UIFactory.CreateClipButton(clip, UIFrame.AnchorLocation.BOTTOM_LEFT);
				clipButton.transform.parent = clipHolder.transform;
				clipButton.transform.localPosition = new Vector3(0.0f, i * 0.2f, 0.0f);
			}
			clipHolder.SetActive(false);

			//Create param sliders
			ParamScrollerAttachment paramScroller = UIFactory.CreateParamScroller();
			paramScroller.transform.parent = transform;
			paramScroller.transform.localPosition = Vector3.zero;

			foreach(BaseInstrumentParam param in musicRef.paramList){ 
				paramScroller.AddParam(param);
			}

			paramScroller.transform.localScale = UIFactory.SliderScale;
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

