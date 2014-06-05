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
        public GameObject clipCubePrefab;
		public GameObject clipPlaceholderPrefab;
		public GameObject instrumentIconPrefab;
		public GameObject rotaryPrefab;
		public GameObject paramScrollerPrefab;
		public GameObject instrumentPrefab;
		public GameObject rotaryInstrumentSlotPrefab;
        public GameObject guiQuadPrefab;
        public GameObject volumetricCylinderPrefab;

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
            else if (attach.GetType() == typeof(ClipButtonAttachment))
            {
                ClipButtonAttachment clipButton = attach as ClipButtonAttachment;
                ghostAttach = UIFactory.CreateClipButton(clipButton.musicRef, UIFrame.AnchorLocation.BOTTOM_LEFT);
            }
            else if (attach.GetType() == typeof(ClipCubeAttachment))
            {
                ClipCubeAttachment cubeButton = attach as ClipCubeAttachment;
                ghostAttach = UIFactory.CreateClipCube(cubeButton.musicRef);
            }
			else if (attach.GetType() == typeof(InstrumentAttachment))
            {
                InstrumentAttachment instrument = attach as InstrumentAttachment;
                ghostAttach = UIFactory.CreateInstrument(instrument.musicRef);
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
         * ClipCube
         * Draggable clip cube
         */
		public static ClipCubeAttachment CreateClipCube(InstrumentClip clip){
			return CreateClipCube(clip, false);
		}

        public static ClipCubeAttachment CreateClipCube(InstrumentClip clip, bool autoResize)
        {
            GameObject cube = Instantiate(Instance.clipCubePrefab) as GameObject;

            ClipCubeAttachment attach = cube.GetComponent<ClipCubeAttachment>();
			attach.frame.SetMatchTextWidth(autoResize);

            if(clip != null)
                attach.Init(clip);

            return attach;
        }


		/*
         * ClipPlaceholder
         * Draggable clip cube
         */
		public static GameObject CreateClipPlaceholder()
		{
			GameObject cubePlaceholder = Instantiate(Instance.clipPlaceholderPrefab) as GameObject;
			return cubePlaceholder;
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
		public static ScrollerAttachment CreateParamScroller(){
			GameObject paramScroller = Instantiate(Instance.paramScrollerPrefab) as GameObject;
			ScrollerAttachment attach = paramScroller.GetComponent<ScrollerAttachment>();

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
		public static InstrumentAttachment CreateInstrument(BaseInstrument instrument){
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
            instrumentGame.renderer.material.SetColor("_Color", instrument.color);
			
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


        /*
         * Qui quad prefab
         * Creates a quad for gui items
         */
        public static GameObject CreateVolumetricCylinder()
        {
            GameObject cylinder = Instantiate(Instance.volumetricCylinderPrefab) as GameObject;
            return cylinder;
        }
	}
}

