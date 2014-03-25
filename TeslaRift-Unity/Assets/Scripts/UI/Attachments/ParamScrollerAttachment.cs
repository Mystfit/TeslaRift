using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UI;
using MusicIO;

public class ParamScrollerAttachment : BaseAttachment {

	//Colliders
	public float m_faceDampening;
	public bool m_facePerformer;
	public float m_collisionDepth = 0.5f;

	public float m_overflow = 2.0f;
	public float m_dampening = 0.95f;
	public float m_scrollMultiplier = 1.2f;
	public float m_speedCutoff = 0.01f;
	public int m_displayedSliderCount = 6;

	protected float m_scrollVel;		//Current scrolling velocity
	protected Vector3 m_offset;
	protected Vector3 m_lastPosition;
	protected float m_lastSliderHeight;
	protected bool bIsDragging;

	protected Transform m_controlHolder;

	protected List<BaseAttachment> m_controlList;

	// Use this for initialization
	public override void Awake () {
		base.Awake();
		m_controlList = new List<BaseAttachment>();
		m_controlHolder = transform.Find("paramHolder");
	}

	public override Collider interiorCollider {
		get {
			if(m_interiorCollider == null){
				m_interiorCollider = transform.Find("BoxAreaTrigger").Find("interiorTrigger").GetComponent<HandProximityTrigger>();
			}
			return base.interiorCollider;
		}
	}

	public override Collider exteriorCollider {
		get {
			if(m_exteriorCollider == null){
				m_exteriorCollider = transform.Find("BoxAreaTrigger").Find("proximityTrigger").GetComponent<HandProximityTrigger>();
			}
			return base.exteriorCollider;
		}
	}
	
	//Creates and adds a new parameter slider
	public void AddControl(BaseAttachment attach){
		attach.transform.parent = m_controlHolder.transform;
		m_controlList.Add(attach);

		UpdateBoxColliders(
			new Vector3(attach.interiorCollider.bounds.size.x *0.5f, (m_controlList.Count + m_overflow) * attach.interiorCollider.bounds.size.y * 0.5f, 0.0f),
			attach.interiorCollider.bounds.size.x,
			(m_controlList.Count + m_overflow) * attach.interiorCollider.bounds.size.y,
			m_collisionDepth, 
			1.2f
		);

		attach.transform.localPosition = new Vector3(0.0f, m_controlList.Count * attach.interiorCollider.bounds.size.y, 0.0f);
		m_lastSliderHeight = attach.interiorCollider.bounds.size.y;
	}
	
	// Update is called once per frame
	public override void Update () {
		if(!bIsDragging){
			if(m_scrollVel > m_speedCutoff || m_scrollVel < -m_speedCutoff){
				m_scrollVel *= m_dampening;
				Vector3 vel = new Vector3(0.0f, m_scrollVel, 0.0f);
				m_controlHolder.localPosition += vel;

			} else {
				m_scrollVel = 0.0f;
				m_lastPosition = m_controlHolder.transform.localPosition;
			}
		}
		if(m_controlHolder.localPosition.y > 0.0f) {
			m_controlHolder.localPosition = new Vector3(m_controlHolder.transform.localPosition.x, 0.0f, m_controlHolder.transform.localPosition.z);
			m_scrollVel = 0.0f;
			m_lastPosition = m_controlHolder.localPosition;
		}
		else if(m_controlHolder.localPosition.y < (m_controlList.Count - m_displayedSliderCount) * m_lastSliderHeight * -1.0f) {
			m_controlHolder.localPosition = new Vector3(m_controlHolder.transform.localPosition.x, 
			                                            (m_controlList.Count - m_displayedSliderCount) * m_lastSliderHeight * -1.0f, 
			                                            m_controlHolder.transform.localPosition.z);
			m_scrollVel = 0.0f;
			m_lastPosition = m_controlHolder.localPosition;
		}

		MaskControls();
	}

	/*
	 * Hide and reveal sliders to keep them in range
	 */
	protected void MaskControls(){
		for(int i =0; i < m_controlList.Count; i++){
			float y = (m_controlHolder.localPosition.y < 0.0f) ? m_controlHolder.localPosition.y * -1.0f : m_controlHolder.localPosition.y;

			if(i < y/m_lastSliderHeight || i > y/m_lastSliderHeight + m_displayedSliderCount){
				if(m_controlList[i].gameObject.GetComponent<iTween>() == null && m_controlList[i].transform.localScale.x != 0.0f)
					iTween.ScaleTo(m_controlList[i].gameObject, iTween.Hash("x", 0.0f, "time", 0.15f, "oncomplete", "SetInactive", "easetype", iTween.EaseType.easeOutQuad));
			} else {
				if(m_controlList[i].gameObject.GetComponent<iTween>() == null && m_controlList[i].transform.localScale.x == 0.0f)
					m_controlList[i].SetActive();
				iTween.ScaleTo(m_controlList[i].gameObject, iTween.Hash("x", 1.0f, "time", 0.15f, "easetype", iTween.EaseType.easeInQuad));
			}
		}
	}

	void FixedUpdate(){
		//Rotate to face player eyes
		if (m_facePerformer) {
			// Look at and dampen the rotation
			Quaternion rotation = Quaternion.LookRotation(this.interiorCollider.bounds.center - HydraController.Instance.EyeCenter);
			//transform.rotation = Quaternion.Slerp(transform.rotation, rotation, Time.deltaTime * m_faceDampening);
			transform.rotation = rotation;
		}
	}

	protected void DragScroller(){
		Vector3 inversePoint = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(m_hand));
		float posY = inversePoint.y;
		m_controlHolder.localPosition = m_offset + new Vector3(0.0f, posY, 0.0f);
		m_scrollVel = (m_controlHolder.localPosition - m_lastPosition).y;
		m_lastPosition = m_controlHolder.localPosition;
	}

	/*
	 * Gesture overrides
	 */
	public override void Gesture_IdleProximity ()
	{
		if(m_mode == BaseTool.ToolMode.TERTIARY){
			if(bIsDragging)
				DragScroller();
			else {
				Gesture_First();
			}
		}

		base.Gesture_IdleProximity ();
	}
	
	public override void Gesture_IdleInterior ()
	{
		if(bIsDragging)
			DragScroller();
		else {
			Gesture_First();
		}
		base.Gesture_IdleInterior ();
	}

	public override void Gesture_IdleExterior ()
	{
		if(!IsFirstGesture){
			Debug.Log("EXITING SCROLLER");
			Gesture_Exit();
		}
		base.Gesture_IdleExterior ();
	}

	public override void Gesture_ExitIdleExterior ()
	{
		base.Gesture_ExitIdleExterior ();
		Gesture_Exit();
	}
	

	public override void Gesture_First ()
	{
		base.Gesture_First ();
		if(m_mode == BaseTool.ToolMode.TERTIARY){
			bIsDragging = true;
			m_scrollVel = 0.0f;
			Vector3 handPos = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(m_hand));
			handPos.x = 0;
			handPos.z = 0;
			m_offset = m_controlHolder.localPosition - handPos;
		}
	}

	public override void Gesture_Exit ()
	{
		if(m_mode == BaseTool.ToolMode.TERTIARY){
			bIsDragging = false;
			//m_offset = Vector3.zero;
		}
		base.Gesture_Exit ();
	}
}
