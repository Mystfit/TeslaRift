using UnityEngine;
using System.Collections;
using MusicIO;
using UI;

public class RotaryAttachment : UIAttachment<BaseInstrumentParam> {

	public GameObject m_rotaryFill;

	// Use this for initialization
	public override void Start () {
		
	}
	
	public override void Init (BaseInstrumentParam managedReference)
	{
		base.Init (managedReference);
	}
	
	public override void Update(){
		if(m_rotaryFill != null && musicRef != null)
			m_rotaryFill.renderer.material.SetFloat("_Cutoff", 1.0f - musicRef.val);
	}
}
