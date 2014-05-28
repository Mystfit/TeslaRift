using UnityEngine;
using UI;
using MusicIO;
using System.Collections;

public class InstrumentPickerAttachment : BaseAttachment {

	public GameObject m_instrumentScroller;

	public override void Awake ()
	{
		//m_instrumentScroller.SetActive(false);
		base.Awake ();
	}

	public override void Gesture_PullOut ()
	{
		if(m_instrumentScroller != null){
			m_instrumentScroller.SetActive(!m_instrumentScroller.activeSelf);
		}
		base.Gesture_PullOut ();
	}
}
