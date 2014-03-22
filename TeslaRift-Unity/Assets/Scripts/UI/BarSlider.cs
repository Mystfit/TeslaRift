using UnityEngine;
using MusicIO;
using System.Collections;

public class BarSlider : MonoBehaviour {

	protected GameObject m_fill;
	protected UIFrame m_frame;
	protected bool bIsActive;
	public TextMesh m_label;
	public string m_sliderLabel = "";

	[Range(0.0f, 1.0f)]
	public float m_sliderVal;

	void Start () {
		m_fill = transform.FindChild("sliderFill").gameObject;
		m_frame = GetComponent<UIFrame>();
		m_label.text = m_sliderLabel;
	}

	public void SetLabel(string label){
		m_sliderLabel = label;
		m_label.text = label;
	}
	
	void Update () {
		SetSliderVal(m_sliderVal);
		if(m_fill != null)
			m_fill.renderer.material.SetFloat("_Cutoff", 1.0f - m_sliderVal);

		m_fill.transform.localScale = m_frame.background.localScale;
		m_fill.transform.localPosition = m_frame.background.localPosition - new Vector3(0.0f, 0.0f, 0.001f);
		//m_label.transform.localPosition = m_frame.GetAnchorOffset(m_frame.width, m_frame.height, m_frame.m_anchorPoint);
		m_label.anchor = FrameAnchorToTextAnchor(m_frame.m_anchorPoint);
	}


	/*
	 * Converts frame anchors to text anchors
	 */
	public static TextAnchor FrameAnchorToTextAnchor(UIFrame.AnchorLocation anchor){
		switch(anchor){
		case UIFrame.AnchorLocation.BOTTOM:
			return TextAnchor.LowerCenter;
		case UIFrame.AnchorLocation.BOTTOM_LEFT:
			return TextAnchor.LowerLeft;
		case UIFrame.AnchorLocation.BOTTOM_RIGHT:
			return TextAnchor.LowerRight;
		case UIFrame.AnchorLocation.CENTER:
			return TextAnchor.MiddleCenter;
		case UIFrame.AnchorLocation.LEFT:
			return TextAnchor.MiddleLeft;
		case UIFrame.AnchorLocation.RIGHT:
			return TextAnchor.MiddleRight;
		case UIFrame.AnchorLocation.TOP:
			return TextAnchor.UpperCenter;
		case UIFrame.AnchorLocation.TOP_LEFT:
			return TextAnchor.UpperLeft;
		case UIFrame.AnchorLocation.TOP_RIGHT:
			return TextAnchor.UpperRight;
		}
		return TextAnchor.MiddleCenter;
	}

	public void SetSliderVal(float val){
		float clamped = Mathf.Clamp(val, 0.0f, 1.0f);
		m_sliderVal = clamped;
	}

	public float sliderVal{ get { return m_sliderVal; }}
}
