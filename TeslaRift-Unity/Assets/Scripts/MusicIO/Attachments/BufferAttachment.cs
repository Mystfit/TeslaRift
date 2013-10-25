using UnityEngine;
using System.Collections;
using MusicIO;

public class BufferAttachment : BaseAttachment<ControlBuffer> {
	
	MusicIO.ControlBuffer m_bufferRef;
	
	// Use this for initialization
	public override void Start () {
		base.Start();
		Init( new ControlBuffer() );
	}
	
	public override void Init(ControlBuffer buffer)
	{
		m_bufferRef = buffer;
	}
	
	// Update is called once per frame
	public override void Update () {
		base.Update();
	}
	
	
	//Tool interface implementations
	//-----------------------------------
	
	/*
	 * Gesture handlers
	 */
	public override void Gesture_First ()
	{
		base.Gesture_First ();
	}
	
	public override void Gesture_IdleProximity ()
	{
		base.Gesture_IdleProximity ();
	}
	
	public override void Gesture_PushIn()
	{
		base.Gesture_PushIn ();
		Gesture_Exit();
	}
	
	public override void Gesture_PullOut ()
	{
		base.Gesture_PullOut ();
		Gesture_Exit();
	}
	
	public override void Gesture_Twist (float amount)
	{
		base.Gesture_Twist (amount);
	}
}
