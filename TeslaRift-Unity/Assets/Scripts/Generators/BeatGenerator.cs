using UnityEngine;
using System.Collections;

public class BeatGenerator : BaseGenerator {
	
	public float m_power = 1.0f;
	public float m_base = 1.0f;
	public bool m_downbeatOnly = false;
	
	// Use this for initialization
	public override void Start () {
		base.Start();
	}
	
	public override float SignalProcessing(){
		float clock = 0.0f;
		if(m_downbeatOnly)
			clock = m_clock.GetCycleTime();
		else
			clock = m_clock.GetBeatTime();
		
		//return Mathf.Exp(m_clock.GetCycleTime() * -(m_power) );
		return Mathf.Pow(m_base, clock * -(m_power)); 
	}
}
