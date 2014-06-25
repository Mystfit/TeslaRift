using UnityEngine;
using MusicIO;
using UI;
using System.Collections;

public class ClipButtonAttachment : BaseAttachmentIO<InstrumentClip> {

	protected UIFrame m_frame;
	public UIFrame frame { get { return m_frame; }}

	public bool m_toggleClip = false;

	/*
	 * Queue status
	 */
	protected bool bIsQueued = false;
	public bool isQueued{ get { return bIsQueued; }}
	public void SetQueued(bool state){ bIsQueued = state; }


    public override void Awake()
    {
        base.Awake();
        SetIsDraggable(true);
        SetIsDockable(true);
        m_frame = GetComponent<UIFrame>();
        m_frame.SetAnchor(UIFrame.AnchorLocation.BOTTOM_LEFT);
    }

	public override void Init (InstrumentClip managedReference)
	{
		base.Init (managedReference);
		m_frame.SetLabel(managedReference.name);
	}

	public override void Update(){
		if(m_toggleClip){
			m_toggleClip = false;
            if(musicRef != null)
			    musicRef.Play();
		}
		base.Update();
	}


	/*
	 * Sets the animation state of this clip button
	 */
	public virtual void UpdatePlayingState()
	{
		switch(musicRef.clipState){
		case InstrumentClip.ClipState.IS_DISABLED:
            if(m_frame != null)
			    m_frame.AnimateBackgroundColor(Color.gray);
			break;
        case InstrumentClip.ClipState.IS_QUEUED:
            if (m_frame != null)
			    m_frame.AnimateBackgroundColor(Color.blue);
			break;
        case InstrumentClip.ClipState.IS_PLAYING:
            if (m_frame != null)
                m_frame.AnimateBackgroundColor(Color.yellow);
			break;
		}
	}


    public override void Gesture_First()
    {
        if (mode == BaseTool.ToolMode.GRABBING)
        {
            StartDragging(HydraController.Instance.GetHand(m_hand));
        } 
        else if (mode == BaseTool.ToolMode.PRIMARY)
        {
            if (musicRef != null)
                musicRef.Play();
        }

        base.Gesture_First();
    }
}
