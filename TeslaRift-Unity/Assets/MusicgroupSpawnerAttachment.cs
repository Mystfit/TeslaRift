using UnityEngine;
using System.Collections;
using UI;

public class MusicgroupSpawnerAttachment : BaseAttachment {

	public GameObject UIFacingTarget;
	
	public override void Gesture_PullOut ()
	{
		base.Gesture_PullOut ();
		MusicControllerAttachment attach = UIFactory.CreateMusicGroup(transform);
		attach.transform.position = transform.position;
		attach.transform.parent = transform;
		attach.facePerformer = true;
		attach.faceTarget = UIFacingTarget.transform;
		attach.rigidbody.AddForce(new Vector3(0.0f, 50.0f, 0.0f));
		InstrumentController.Instance.AddMusicGroup(attach);
	}	
}
