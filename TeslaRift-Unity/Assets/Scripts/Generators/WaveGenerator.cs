using UnityEngine;
using System.Collections;

public class WaveGenerator : BaseGenerator {
	
	// Use this for initialization
	public override void Start () {
		base.Start();
	}

	public override float SignalProcessing ()
	{
		return 0.5f + (Mathf.Sin( m_clock.GetCycleTime() * Mathf.PI * 2) * 0.5f);
	}
}
