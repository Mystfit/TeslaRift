using UnityEngine;
using System.Collections;
using UI;

public class MusicgroupSpawnerAttachment : BaseAttachment {

	public GameObject UIFacingTarget;
	public VRCarousel m_instrumentCarousel;
	protected MusicgroupFactory m_factory;

	//Kinetic scrolling
	protected float m_lastHandXpos;		//Last position of hand on x-axis
	protected float m_angVelocity;		//Current angular velocity of carousel
	public float m_dampening = 0.95f;
	public float m_rotationMultiplier = 1.2f;
	public float m_speedCutoff = 0.1f;


	public override void Start ()
	{
		base.Start ();
		m_factory = GetComponent<MusicgroupFactory>();
	}

	public override void Update(){
		if(m_angVelocity > m_speedCutoff || m_angVelocity < -m_speedCutoff){
			m_angVelocity *= m_dampening;
			m_instrumentCarousel.transform.rotation = m_instrumentCarousel.transform.rotation * Quaternion.Euler( new Vector3(0.0f, 0.0f, m_angVelocity) );
		} else {
			m_angVelocity = 0.0f;
		}

	}

	/*
	 * Gesture overrides
	 */

	public override void Gesture_First ()
	{
		base.Gesture_First ();
	}

	public override void Gesture_IdleProximity ()
	{
		if(mode == BaseTool.ToolMode.TERTIARY)
			ApplyRotation();
		base.Gesture_IdleProximity ();
	}

	public override void Gesture_IdleInterior ()
	{
		if(mode == BaseTool.ToolMode.TERTIARY)
			ApplyRotation();
		base.Gesture_IdleInterior ();
	}

	public override void Gesture_PullOut ()
	{
		base.Gesture_PullOut ();
		if(mode == BaseTool.ToolMode.SECONDARY)
			SpawnMusicgroup();
	}	

	public override void Gesture_PushIn ()
	{
		if(mode == BaseTool.ToolMode.SECONDARY)
			m_factory.WriteMusicGroupsToFile(InstrumentController.Instance.MusicGroups);

		base.Gesture_PushIn ();
	}	

	protected void ApplyRotation(){
		m_angVelocity += BaseTool.HandToObjectSpace( HydraController.Instance.GetHandVelocity(m_hand), transform).x * m_rotationMultiplier;
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
