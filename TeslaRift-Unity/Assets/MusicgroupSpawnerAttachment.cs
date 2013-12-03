using UnityEngine;
using System.Collections;
using UI;

public class MusicgroupSpawnerAttachment : BaseAttachment {

	public GameObject UIFacingTarget;
	protected MusicgroupFactory m_factory;

	public override void Start ()
	{
		base.Start ();
		m_factory = GetComponent<MusicgroupFactory>();
	}

	public override void Gesture_PullOut ()
	{
		base.Gesture_PullOut ();
		SpawnMusicgroup();
	}	

	public override void Gesture_PushIn ()
	{
		base.Gesture_PushIn ();
		m_factory.WriteMusicGroupsToFile();
	}	

	public MusicControllerAttachment SpawnMusicgroup(){
		MusicControllerAttachment attach = UIFactory.CreateMusicGroup(transform);
		attach.transform.position = transform.position;
		attach.transform.parent = transform;
		attach.facePerformer = true;
		attach.faceTarget = UIFacingTarget.transform;
		attach.rigidbody.AddForce(new Vector3(0.0f, 50.0f, 0.0f));
		InstrumentController.Instance.AddMusicGroup(attach);
		return attach;
	}
}
