using System;
using UnityEngine;
using MusicIO;

namespace UI
{
	public class UIFactory : MonoBehaviour
	{
		private static UIFactory m_instance;
		public static UIFactory Instance{ get { return m_instance; }}

		public GameObject sliderPrefab;
		public GameObject framePrefab;
		public GameObject rbfTrainingPrefab;
		public GameObject clipButtonPrefab;
		public GameObject musicGroupPrefab;
		public GameObject instrumentIconPrefab;
		public GameObject rotaryPrefab;
		public GameObject paramScrollerPrefab;
		public GameObject instrumentPrefab;

		public float m_sliderScale = 0.1f;
		public static Vector3 SliderScale{get {return new Vector3(Instance.m_sliderScale, Instance.m_sliderScale, Instance.m_sliderScale); }}

		void Start(){
			m_instance = this;
		}


		/*
		 * Slider
		 * A controllable parameter slider
		 */
		public static SliderAttachment CreateSlider(BaseInstrumentParam param, UIFrame.AnchorLocation anchor){
			return CreateSlider(param, anchor, null);
		}

		public static SliderAttachment CreateSlider(BaseInstrumentParam param, UIFrame.AnchorLocation anchor,  ParamSliderPanelAttachment owner){
			GameObject slider = Instantiate(Instance.sliderPrefab) as GameObject;

			UIFrame frame = slider.GetComponent<UIFrame>();
			//frame.SetAnchor(UIFrame.AnchorLocation.TOP_LEFT);
			frame.SetAnchor(anchor);

			SliderAttachment attach = slider.GetComponent<SliderAttachment>();
			attach.Init(param);
			attach.SetOwner(owner);

			//Wake up colliders
			object temp = attach.interiorCollider; temp = attach.exteriorCollider;

			return attach;
		}


		/*
		 * UIFrame
		 * A generic UI frame
		 */
		public static UIFrame CreateFrame(){
			GameObject frame = Instantiate(Instance.framePrefab) as GameObject;
			UIFrame attach = frame.GetComponent<UIFrame>();

			return attach;
		}


		/*
		 * RBF Training point
		 * A draggable RBF training point
		 */
		public static RBF.RBFTrainingPointAttachment CreateRBFTraining(){
			GameObject training = Instantiate(Instance.rbfTrainingPrefab) as GameObject;
			RBF.RBFTrainingPointAttachment attach = training.GetComponent<RBF.RBFTrainingPointAttachment>();

			return attach;
		}


		/*
		 * Button
		 * Pressable clip button
		 */
		public static ClipButtonAttachment CreateClipButton(InstrumentClip clip, UIFrame.AnchorLocation anchor){
			return CreateClipButton(clip, anchor, null);
		}

		public static ClipButtonAttachment CreateClipButton(InstrumentClip clip, UIFrame.AnchorLocation anchor, ClipBufferAttachment owner){
			GameObject button = Instantiate(Instance.clipButtonPrefab) as GameObject;

			UIFrame frame = button.GetComponent<UIFrame>();
			frame.SetAnchor(anchor);

			ClipButtonAttachment attach = button.GetComponent<ClipButtonAttachment>();
			attach.Init(clip);

			//Wake up colliders
			object temp = attach.interiorCollider; temp = attach.exteriorCollider;

			if(owner != null)
				attach.SetOwner(owner);

			return attach;
		}


		/*
		 * Rotary Control
		 * Creates a rotary param controller that uses twists to set values
		 */
		public static RotaryAttachment CreateRotary(BaseInstrumentParam param){
			GameObject rotary = Instantiate(Instance.rotaryPrefab) as GameObject;
			RotaryAttachment attach = rotary.GetComponent<RotaryAttachment>();
			attach.Init(param);
			return attach;
		}


		/*
		 * Parameter scroller
		 * Creates a holder for parameter sliders that uses kinetic scrolling.
		 */
		public static ParamScrollerAttachment CreateParamScroller(){
			GameObject paramScroller = Instantiate(Instance.paramScrollerPrefab) as GameObject;
			ParamScrollerAttachment attach = paramScroller.GetComponent<ParamScrollerAttachment>();

			//Wake up colliders
			object temp = attach.interiorCollider; temp = attach.exteriorCollider;

			return attach;
		}


		/*
		 * MusicGroup UI
		 * Prefab containing a vertical clip holder, horizontal param slider holder and an RBF panel
		 */
		public static MusicControllerAttachment CreateMusicGroup(){
			Transform t = null;
			return CreateMusicGroup(t);
		}

		public static MusicControllerAttachment CreateMusicGroup(Transform t){
			GameObject musicObj = null;
			if(t != null)
				musicObj = Instantiate(Instance.musicGroupPrefab, t.position, t.rotation) as GameObject;
			else
				musicObj = Instantiate(Instance.musicGroupPrefab) as GameObject;

			return musicObj.GetComponent<MusicControllerAttachment>();
		}


		/*
		 * Floating Instrument icon
		 * Coloured prefab representing an instrument reference
		 */
		public static GameObject CreateFloatingInstrumentIcon(BaseInstrument instrument){
			GameObject insObj = GameObject.Instantiate(Instance.instrumentIconPrefab) as GameObject;
			insObj.renderer.material.SetColor("_Color", instrument.color);
			return insObj;
		}


		/*
		 * Main instrument prefab
		 * Grabbable instrument with clips and parameter buttons/sliders
		 */
		/*
	 * Creates a layered GameInstrument with rotary panel parameters seperated by layer
	 */
		public static InstrumentAttachment CreateInstrument(BaseInstrument instrument, Color instrumentColor){
			//Create an instrument prefab
			GameObject instrumentGame = Instantiate(Instance.instrumentPrefab) as GameObject;
			instrumentGame.name = instrument.Name;

			//Create instrument attachment
			InstrumentAttachment attach = instrumentGame.AddComponent<InstrumentAttachment>();	//Instrument attachment needs to be manually added
			
			//Init instrumentRef and GUI controls
			attach.Init(instrument);
			attach.InitInstrumentControls();

			//Wake up colliders
			object temp = attach.interiorCollider; temp = attach.exteriorCollider;
			
			//Set listener prefixes
			instrumentGame.GetComponent<InstrumentListener>().SetPrefixedOSCAddresses(instrument.Name);		//Set instrument prefixes for OSC listener
			instrumentGame.renderer.material.SetColor("_Color", instrumentColor);
			
			return attach;
		}	
	}
}

