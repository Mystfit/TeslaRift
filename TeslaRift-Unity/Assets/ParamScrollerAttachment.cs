using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UI;
using MusicIO;

public class ParamScrollerAttachment : BaseAttachment {

	//Colliders
	public HandProximityTrigger m_interiorCollider;
	public HandProximityTrigger m_exteriorCollider;
	public Transform m_paramHolder;
	public float m_faceDampening;
	public bool m_facePerformer;
	public float m_collisionDepth = 0.5f;
	
	public float m_dampening = 0.95f;
	public float m_scrollMultiplier = 1.2f;
	public float m_speedCutoff = 0.01f;
	protected float m_scrollVel;		//Current scrolling velocity
	protected Vector3 m_offset;
	protected Vector3 m_lastPosition;
	protected bool bIsDragging;

	protected List<SliderAttachment> m_sliders;

	// Use this for initialization
	public override void Awake () {
		m_sliders = new List<SliderAttachment>();
		base.Start();
	}

	//Creates and adds a new parameter slider
	public void AddParam(BaseInstrumentParam param){
		SliderAttachment slider = UIFactory.CreateSlider(param, UIFrame.AnchorLocation.BOTTOM_LEFT);
		slider.transform.parent = m_paramHolder.transform;
		m_sliders.Add(slider);
		slider.transform.localPosition = new Vector3(0.0f, m_sliders.Count * slider.frame.height, 0.0f);
		m_interiorCollider.UpdateCollider(new Vector3(slider.frame.width*0.5f,m_sliders.Count * slider.frame.height * 0.5f,0.0f), -slider.frame.width*0.5f, m_sliders.Count * slider.frame.height * 0.5f, m_collisionDepth);
		m_exteriorCollider.UpdateCollider(new Vector3(slider.frame.width*0.5f,m_sliders.Count * slider.frame.height * 0.5f,0.0f), -slider.frame.width*0.5f, m_sliders.Count * slider.frame.height * 0.5f, m_collisionDepth);
	}
	
	// Update is called once per frame
	public override void Update () {
		if(!bIsDragging){
			if(m_scrollVel > m_speedCutoff || m_scrollVel < -m_speedCutoff){
				m_scrollVel *= m_dampening;
				Vector3 vel = new Vector3(0.0f, m_scrollVel, 0.0f);
				m_paramHolder.transform.localPosition += vel;
			} else {
				m_scrollVel = 0.0f;
			}
		}
	}

	void FixedUpdate(){
		//Rotate to face player eyes
		if (m_facePerformer) {
			// Look at and dampen the rotation
			Quaternion rotation = Quaternion.LookRotation(m_interiorCollider.collider.bounds.center - HydraController.Instance.EyeCenter);
			//transform.rotation = Quaternion.Slerp(transform.rotation, rotation, Time.deltaTime * m_faceDampening);
			transform.rotation = rotation;
		}
	}

	protected void DragScroller(){
		Vector3 inversePoint = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(m_hand));
		m_paramHolder.transform.localPosition = m_offset + new Vector3(0.0f, inversePoint.y, 0.0f);
		m_scrollVel = (m_paramHolder.transform.localPosition - m_lastPosition).y;
		m_lastPosition = m_paramHolder.transform.localPosition;
	}

	/*
	 * Gesture overrides
	 */
	public override void Gesture_IdleProximity ()
	{
		if(bIsDragging)
			DragScroller();
		base.Gesture_IdleProximity ();
	}
	
	public override void Gesture_IdleInterior ()
	{
		if(bIsDragging)
			DragScroller();
		base.Gesture_IdleInterior ();
	}

	public override void Gesture_ExitIdleExterior ()
	{
		base.Gesture_ExitIdleExterior ();
		Gesture_Exit();
	}

//	public override void Gesture_ExitIdleProximity ()
//	{
//		base.Gesture_ExitIdleExterior ();
//		Gesture_Exit();
//	}
//
//	public override void Gesture_ExitIdleInterior ()
//	{
//		base.Gesture_ExitIdleExterior ();
//		Gesture_Exit();
//	}

	public override void Gesture_First ()
	{
		base.Gesture_First ();
		if(m_mode == BaseTool.ToolMode.TERTIARY){
			bIsDragging = true;
			m_scrollVel = 0.0f;
			Vector3 handPos = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(m_hand));
			handPos.x = 0;
			handPos.z = 0;
			m_offset = m_paramHolder.transform.localPosition - handPos;
		}
	}

	public override void Gesture_Exit ()
	{
		if(m_mode == BaseTool.ToolMode.TERTIARY){
			bIsDragging = false;
			m_offset = Vector3.zero;
		}
		base.Gesture_Exit ();
	}
}
