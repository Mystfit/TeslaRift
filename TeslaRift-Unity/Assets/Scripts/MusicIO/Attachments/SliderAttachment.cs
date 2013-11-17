using UnityEngine;
using System.Collections;
using MusicIO;

public class SliderAttachment : BaseAttachment<BaseInstrumentParam> {

	protected BarSlider m_slider;
	protected BufferFrame m_frame;

	// Use this for initialization
	void Start () {
		m_slider = GetComponent<BarSlider>();
		m_frame = GetComponent<BufferFrame>();
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	public override void Gesture_IdleInterior ()
	{
		base.Gesture_IdleInterior ();
		SetValueFromHand( HydraController.Instance.GetHand( m_hand ).transform );
	}

	public override void Gesture_IdleProximity(){
		base.Gesture_IdleProximity();
		SetValueFromHand( HydraController.Instance.GetHand( m_hand ).transform );
	}

	/*
	 * Sets the value of the slider(0,1) based on location inside the slider frame
	 */
	public void SetValueFromHand(Transform worldPos){
		
		//Offset the position by the source's collider (if present)
		Vector3 worldOffset = worldPos.position;
		if(worldPos.collider != null){
			if( worldPos.collider.GetType() == typeof(CapsuleCollider) ){
				CapsuleCollider coll = worldPos.collider as CapsuleCollider;
				worldOffset = coll.bounds.center;
			}
		}
		
		Vector3 pos = transform.InverseTransformPoint(worldOffset);
		Vector2 sliderPosVal = new Vector2(
			Mathf.Clamp(pos.x, m_frame.width*-0.5f, m_frame.height*0.5f ), 
			Mathf.Clamp(pos.y,  m_frame.width*-0.5f, m_frame.height*0.5f )
		);

		float sliderVal = 0.0f;

		if(m_frame.isRotated)
			sliderVal = Utils.Normalize(sliderPosVal.x, m_frame.width*-0.5f, m_frame.height*0.5f);
		else
			sliderVal = Utils.Normalize(sliderPosVal.y, m_frame.width*-0.5f, m_frame.height*0.5f);

		m_slider.SetSliderVal(sliderVal);

		if(musicRef != null)
			musicRef.setVal(sliderVal);
	}
}
