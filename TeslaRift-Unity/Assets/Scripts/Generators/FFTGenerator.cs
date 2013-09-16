using UnityEngine;
using System.Collections;

public class FFTGenerator : BaseGenerator {
	
	protected AudioInController m_waveIn;
	public int m_freqBucket;
	public int m_numSamplesInBucket;
	public float m_scale = 16.0f;
	
	public float m_sumFrequency = 0.0f;

	// Use this for initialization
	public override void Start () {
		m_waveIn = externalInputs.GetComponent<AudioInController>();
		base.Start();
	}
	
	public override float SignalProcessing ()
	{
		m_sumFrequency = 0.0f;
		float[] fft = m_waveIn.Spectrum();
		for(int i = m_freqBucket; i < m_freqBucket + m_numSamplesInBucket; i++){
			m_sumFrequency += fft[i] / m_scale;
		}
		
		return m_sumFrequency;
	}
	
	/*
	 protected float QuinOut(float t, float b, float c, float d){
		float ts=(t/=d)*t;
		float tc=ts*t;
		return b+c*(tc*ts + -5*ts*ts + 10*tc + -10*ts + 5*t);
	}
	*/
}
