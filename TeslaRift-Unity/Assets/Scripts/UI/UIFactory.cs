using System;
using UnityEngine;
using MusicIO;

namespace UI
{
	public class UIFactory : MonoBehaviour
	{
		//Singletons
		private static UIFactory m_instance;
		public static UIFactory Instance{ get { return m_instance; }}

		//Prefab objects
		public GameObject sliderPrefab;
		public GameObject framePrefab;
        public GameObject rbfSphereTrainingPrefab;
		public GameObject clipButtonPrefab;
		public GameObject instrumentIconPrefab;
		public GameObject rotaryPrefab;
		public GameObject paramScrollerPrefab;
		public GameObject instrumentPrefab;
		public GameObject rotaryInstrumentSlotPrefab;
        public GameObject guiQuadPrefab;

		//Slider localscale amount
		public float m_sliderScale = 0.1f;
		public static Vector3 SliderScale{get {return new Vector3(Instance.m_sliderScale, Instance.m_sliderScale, Instance.m_sliderScale); }}

		void Awake(){
			m_instance = this;
		}


        public static BaseAttachment CreateGhostDragger(BaseAttachment attach)
        {
            BaseAttachment ghostAttach = null;
            if(attach.GetType() == typeof(SliderAttachment)){
                SliderAttachment slider = attach as SliderAttachment;
                ghostAttach = UIFactory.CreateSlider(slider.musicRef, UIFrame.AnchorLocation.BOTTOM_LEFT);
            }
            if (attach.GetType() == typeof(ClipButtonAttachment))
            {
                ClipButtonAttachment clipButton = attach as ClipButtonAttachment;
                ghostAttach = UIFactory.CreateClipButton(clipButton.musicRef, UIFrame.AnchorLocation.BOTTOM_LEFT);
            }

            ghostAttach.transform.parent = attach.transform;
            ghostAttach.transform.position = attach.transform.position;
            ghostAttach.transform.localScale = attach.transform.localScale;
            ghostAttach.transform.parent = null;
            ghostAttach.SetTransient(true);

            return ghostAttach;
        }


		/*
		 * Slider
		 * A controllable parameter slider
		 */
		public static SliderAttachment CreateSlider(BaseInstrumentParam param, UIFrame.AnchorLocation anchor){
			GameObject slider = Instantiate(Instance.sliderPrefab) as GameObject;
			
			UIFrame frame = slider.GetComponent<UIFrame>();
			//frame.SetAnchor(UIFrame.AnchorLocation.TOP_LEFT);
			frame.SetAnchor(anchor);
			
			SliderAttachment attach = slider.GetComponent<SliderAttachment>();
			attach.Init(param);
			
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
		 * A draggable RBF training point for the sphere RBF ccontroller
		 */
        public static RBF.RBFSphereTraining CreateRBFSphereTraining()
        {
            GameObject training = Instantiate(Instance.rbfSphereTrainingPrefab) as GameObject;
            RBF.RBFSphereTraining attach = training.GetComponent<RBF.RBFSphereTraining>();

            return attach;
        }



		/*
		 * Button
		 * Pressable clip button
		 */
		public static ClipButtonAttachment CreateClipButton(InstrumentClip clip, UIFrame.AnchorLocation anchor){
			GameObject button = Instantiate(Instance.clipButtonPrefab) as GameObject;
			
			ClipButtonAttachment attach = button.GetComponent<ClipButtonAttachment>();
			attach.Init(clip);

			UIFrame frame = button.GetComponent<UIFrame>();
			frame.SetAnchor(anchor);

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
		 * Rotary slot
		 * Creates a rotary param that will hold an instrument
		 */
//		public static GameObject CreateRotaryInstru(BaseInstrumentParam param){
//			GameObject rotary = Instantiate(Instance.rotaryPrefab) as GameObject;
//			RotaryAttachment attach = rotary.GetComponent<RotaryAttachment>();
//			attach.Init(param);
//			return attach;
//		}


		/*
		 * Parameter scroller
		 * Creates a holder for parameter sliders that uses kinetic scrolling.
		 */
		public static ParamScrollerAttachment CreateParamScroller(){
			GameObject paramScroller = Instantiate(Instance.paramScrollerPrefab) as GameObject;
			ParamScrollerAttachment attach = paramScroller.GetComponent<ParamScrollerAttachment>();

			return attach;
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
		public static InstrumentAttachment CreateInstrument(BaseInstrument instrument, Color instrumentColor){
			//Create an instrument prefab
			GameObject instrumentGame = Instantiate(Instance.instrumentPrefab) as GameObject;
			instrumentGame.name = instrument.Name;

			//Create instrument attachment
			InstrumentAttachment attach = instrumentGame.AddComponent<InstrumentAttachment>();	//Instrument attachment needs to be manually added
			
			//Init instrumentRef and GUI controls
			attach.Init(instrument);
			attach.InitInstrumentControls();
			
			//Set listener prefixes
			instrumentGame.GetComponent<InstrumentListener>().SetPrefixedOSCAddresses(instrument.Name);		//Set instrument prefixes for OSC listener
			instrumentGame.renderer.material.SetColor("_Color", instrumentColor);
			
			return attach;
		}

        /*
         * Qui quad prefab
         * Creates a quad for gui items
         */
        public static GameObject CreateGuiQuad()
        {
            GameObject quad = Instantiate(Instance.guiQuadPrefab) as GameObject;
            return quad;
        }
	}
}

