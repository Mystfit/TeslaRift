using UnityEngine;
using MusicIO;
using UI;
using System.Collections;

public class ClipButtonAttachment : UIAttachment<InstrumentClip> {

	protected UIFrame m_frame;
	public UIFrame frame { get { return m_frame; }}

	public enum ClipState {
		IS_DISABLED = 0,
		IS_QUEUED,
		IS_PLAYING
	}
	protected ClipState m_clipState;
	public ClipState clipState{ get { return m_clipState; }}

	public bool m_toggleClip = false;

	/*
	 * Owner of this button
	 */
	public ClipBufferAttachment m_owner;
	public ClipBufferAttachment owner{ get { return m_owner; }}

	/*
	 * Queue status
	 */
	protected bool bIsQueued = false;
	public bool isQueued{ get { return bIsQueued; }}
	public void SetQueued(bool state){ bIsQueued = state; }


	/*
	 * Collider transforms
	 */
	public override Collider interiorCollider { get {
			if(m_interiorCollider == null)
				m_interiorCollider = transform.Find("BoxAreaTrigger").Find("interiorTrigger").GetComponent<HandProximityTrigger>();
			
			base.m_interiorCollider = m_interiorCollider;
			return base.interiorCollider;
		}
	}
	
	public override Collider exteriorCollider { get {
			if(m_exteriorCollider == null)
				m_exteriorCollider = transform.Find("BoxAreaTrigger").Find("proximityTrigger").GetComponent<HandProximityTrigger>();
			
			base.m_exteriorCollider = m_exteriorCollider;
			return base.exteriorCollider;
		}
	}

	public override void Update(){
		if(m_toggleClip){
			m_toggleClip = false;
			musicRef.Play();
		}
		base.Update();
	}


	// Use this for initialization
	public override void Awake () {
		base.Awake();
		m_frame = GetComponent<UIFrame>();
		SetPlayState(ClipState.IS_DISABLED);
	}


	/*
	 * Sets the state of this clip button
	 */
	public void SetPlayState (ClipState state)
	{
		switch(state){
		case ClipState.IS_DISABLED:
			m_frame.AnimateBackgroundColor(Color.gray);
			break;
		case ClipState.IS_QUEUED:
			m_frame.AnimateBackgroundColor(Color.blue);
			break;
		case ClipState.IS_PLAYING:
			if(m_clipState == ClipState.IS_PLAYING){
				SetPlayState(ClipState.IS_QUEUED);
				state = ClipState.IS_QUEUED;
			} else {
				m_frame.AnimateBackgroundColor(Color.yellow);
				musicRef.Play();
			}
			break;
		}

		m_clipState = state;
	}



	public override void Gesture_ExitIdleInterior ()
	{
		base.Gesture_ExitIdleInterior ();
		if(mode == BaseTool.ToolMode.PRIMARY){
			owner.PlayClip(this, true);
		} 
	}

	public override void Gesture_PushIn ()
	{
		base.Gesture_PushIn ();
	}

	public override void Gesture_PullOut ()
	{
		base.Gesture_PullOut ();
	}
}
