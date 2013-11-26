using UnityEngine;
using MusicIO;
using System.Collections;

public class ClipButtonAttachment : BaseAttachment<InstrumentClip> {

	protected UIFrame m_frame;
	public enum ClipState {
		IS_DISABLED = 0,
		IS_QUEUED,
		IS_PLAYING
	}
	protected ClipState m_clipState;
	public ClipState clipState{ get { return m_clipState; }}

	/*
	 * Owner of this button
	 */
	protected ClipBufferAttachment m_owner;
	public ClipBufferAttachment owner{ get { return m_owner; }}
	public void SetOwner(ClipBufferAttachment owner){ m_owner = owner; }


	/*
	 * Queue status
	 */
	protected bool bIsQueued = false;
	public bool isQueued{ get { return bIsQueued; }}
	public void SetQueued(bool state){ bIsQueued = state; }


	// Use this for initialization
	void Start () {
		m_clipState = ClipState.IS_DISABLED;
		m_frame = GetComponent<UIFrame>();
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
	


	public override void Gesture_First ()
	{
		base.Gesture_First ();
		if(mode == BaseTool.ToolMode.PRIMARY){
			owner.PlayClip(this, true);
		} else if(mode == BaseTool.ToolMode.SECONDARY){
			//Play track instantly
			owner.PlayClip(this, false);
		}
	}
}
