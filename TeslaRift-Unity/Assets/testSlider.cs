using UnityEngine;
using UI;
using System.Collections;

public class testSlider : MonoBehaviour {

	// Use this for initialization
	void Start () {
		SliderAttachment slider = UIFactory.CreateSlider(
			new MusicIO.BaseInstrumentParam("RACHEL", new MusicIO.BaseInstrument(
				"","","",Color.red,false
			), 0.0f, 1.0f), UIFrame.AnchorLocation.BOTTOM_LEFT);
		slider.transform.position = new Vector3(0.0f, 0.0f, 5.0f);

		ClipButtonAttachment clipButton = UIFactory.CreateClipButton(
			new MusicIO.InstrumentClip("RACHEL", new MusicIO.BaseInstrument(
			"","","",Color.red,false
			), 0), UIFrame.AnchorLocation.BOTTOM_LEFT);
		clipButton.transform.position = new Vector3(1.0f, 0.0f, 5.0f);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
