using UnityEngine;
using System.Collections;

public class WorkspaceDockAttachment : BaseAttachment {

	public float m_carouselRadius = 1.0f;
	public float m_arcSize = Mathf.PI / 2;
	public float m_minAngle = Mathf.PI * 0.1f;

	// Use this for initialization
	public override void Start () {
		SetAsDock(true);
        AddAcceptedDocktype(typeof(InstrumentAttachment));
	}

	public override bool AddDockableAttachment (BaseAttachment attach)
	{
        if (base.AddDockableAttachment(attach))
        {
            attach.transform.parent = transform;
            attach.rigidbody.velocity = Vector3.zero;
            attach.rigidbody.isKinematic = true;
            PlaceObjects();
            //iTween.MoveTo(attach.gameObject, iTween.Hash("position", transform.localPosition, "uselocal", true ));
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
		Vector3[] points = Utils.BuildArcPositions(m_carouselRadius, m_arcSize, m_childDockables.Count, m_minAngle, true);
		for(int i = 0; i < points.Length; i++){
			points[i].z = points[i].y;
			points[i].y = 0.0f;
		}

		for(int i = 0; i < m_childDockables.Count; i++)
			iTween.MoveTo(m_childDockables[i].gameObject, iTween.Hash("position", points[i], "time", 0.5f, "islocal", true));

	}
	
	// Update is called once per frame
	public override void Update () {
	
	}
}
