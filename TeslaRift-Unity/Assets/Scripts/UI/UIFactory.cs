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
		
		void Start(){
			m_instance = this;
		}


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

			return attach;
		}


		public static UIFrame CreateFrame(){
			GameObject frame = Instantiate(Instance.framePrefab) as GameObject;
			UIFrame attach = frame.GetComponent<UIFrame>();

			return attach;
		}

		public static RBF.RBFTrainingPointAttachment CreateRBFTraining(){
			GameObject training = Instantiate(Instance.rbfTrainingPrefab) as GameObject;
			RBF.RBFTrainingPointAttachment attach = training.GetComponent<RBF.RBFTrainingPointAttachment>();

			return attach;
		}


		public static ClipButtonAttachment CreateClipButton(InstrumentClip clip, UIFrame.AnchorLocation anchor){
			return CreateClipButton(clip, anchor, null);
		}


		public static ClipButtonAttachment CreateClipButton(InstrumentClip clip, UIFrame.AnchorLocation anchor, ClipBufferAttachment owner){
			GameObject button = Instantiate(Instance.clipButtonPrefab) as GameObject;

			UIFrame frame = button.GetComponent<UIFrame>();
			frame.SetAnchor(anchor);

			ClipButtonAttachment attach = button.GetComponent<ClipButtonAttachment>();
			attach.Init(clip);

			if(owner != null)
				attach.SetOwner(owner);

			return attach;
		}

		
		public static MusicControllerAttachment CreateMusicGroup(){
			GameObject musicObj = Instantiate(Instance.musicGroupPrefab) as GameObject;
			return musicObj.GetComponent<MusicControllerAttachment>();
		}
	}
}

