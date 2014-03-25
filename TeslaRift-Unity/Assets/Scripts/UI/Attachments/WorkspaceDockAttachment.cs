using UnityEngine;
using System.Collections;

public class WorkspaceDockAttachment : BaseAttachment {

	// Use this for initialization
	public override void Start () {
		SetAsDock(true);
		AddAcceptedDocktype<InstrumentAttachment>();
	}

	public override void AddDockableAttachment (BaseAttachment attach)
	{
		base.AddDockableAttachment (attach);
		attach.transform.parent = transform;
		attach.rigidbody.velocity = Vector3.zero;
		attach.rigidbody.isKinematic = true;
		iTween.MoveTo(attach.gameObject, iTween.Hash("position", transform.localPosition, "uselocal", true ));
	}

	public override void RemoveDockableAttachment (BaseAttachment attach)
	{
		base.RemoveDockableAttachment (attach);
		attach.rigidbody.isKinematic = false;
	}
	
	// Update is called once per frame
	public override void Update () {
	
	}
}
