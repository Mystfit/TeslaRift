using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class CarouselAttachment : BaseAttachment {

	public float m_carouselRadius = 5.0f;

	/*
	 * Initialization
	 */
	public override void Awake() {
		base.Awake();
		SetAsDock(true);
		AddAcceptedDocktype(typeof(InstrumentAttachment));
	}

	/*
	 * Adds an instrument to the carousel
	 */
	public override bool AddDockableAttachment(BaseAttachment attach){
        if (base.AddDockableAttachment(attach))
        {
            attach.transform.parent = transform;
            attach.rigidbody.velocity = Vector3.zero;
            attach.rigidbody.isKinematic = true;
            PlaceObjects();
            return true;
        }
        return false;
	}

	public override void RemoveDockableAttachment (BaseAttachment attach)
	{
		base.RemoveDockableAttachment (attach);
		attach.rigidbody.isKinematic = false;
		PlaceObjects();
	}

	public void PlaceObjects(){
		Vector3[] points = Utils.BuildArcPositions(m_carouselRadius, Mathf.PI * 2, m_childDockables.Count);
		for(int i = 0; i < m_childDockables.Count; i++){
			iTween.MoveTo(m_childDockables[i].gameObject, iTween.Hash("position", points[i], "time", 0.5f, "islocal", true));
		}
	}
}