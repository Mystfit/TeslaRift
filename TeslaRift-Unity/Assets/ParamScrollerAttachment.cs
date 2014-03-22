using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UI;
using MusicIO;

public class ParamScrollerAttachment : BaseAttachment {

	//Colliders
	public HandProximityTrigger m_interiorCollider;
	public HandProximityTrigger m_exteriorCollider;
	public float m_collisionDepth = 0.5f;
	
	public float m_dampening = 0.95f;
	public float m_rotationMultiplier = 1.2f;
	public float m_speedCutoff = 0.1f;
	protected float m_angVelocity;		//Current angular velocity

	protected List<SliderAttachment> m_sliders;

	// Use this for initialization
	public override void Awake () {
		m_sliders = new List<SliderAttachment>();
		base.Start();
	}

	//Creates and adds a new parameter slider
	public void AddParam(BaseInstrumentParam param){
		SliderAttachment slider = UIFactory.CreateSlider(param, UIFrame.AnchorLocation.BOTTOM_LEFT);
		slider.transform.parent = transform;
		m_sliders.Add(slider);
		slider.transform.localPosition = new Vector3(0.0f, m_sliders.Count * slider.frame.height, 0.0f);
		m_interiorCollider.UpdateCollider(new Vector3(slider.frame.width*0.5f,m_sliders.Count * slider.frame.height * 0.5f,0.0f), -slider.frame.width*0.5f, m_sliders.Count * slider.frame.height * 0.5f, m_collisionDepth);
		m_exteriorCollider.UpdateCollider(new Vector3(slider.frame.width*0.5f,m_sliders.Count * slider.frame.height * 0.5f,0.0f), -slider.frame.width*0.5f, m_sliders.Count * slider.frame.height * 0.5f, m_collisionDepth);
	}
	
	// Update is called once per frame
	public override void Update () {
		if(m_angVelocity > m_speedCutoff || m_angVelocity < -m_speedCutoff){
			m_angVelocity *= m_dampening;
			transform.localPosition = new Vector3(0.0f, transform.localPosition.y + m_angVelocity, 0.0f);
			Debug.Log("Moving " + m_angVelocity);
		} else {
			Debug.Log("Cutoff " + m_angVelocity);
			m_angVelocity = 0.0f;
		}
	}

	protected void ApplyRotation(){
		m_angVelocity += BaseTool.HandToObjectSpace( HydraController.Instance.GetHandVelocity(m_hand), transform).y * m_rotationMultiplier;
	}

	/*
	 * Gesture overrides
	 */
	public override void Gesture_IdleProximity ()
	{
		ApplyRotation();
		base.Gesture_IdleProximity ();
	}
	
	public override void Gesture_IdleInterior ()
	{
		ApplyRotation();
		base.Gesture_IdleInterior ();
	}
}
