using UnityEngine;
using System.Collections;

public class Clock : MonoBehaviour {
	
	public int m_beatsPerBar;
	public float m_bpm;
	protected float m_cycleTime;
	protected float m_beatTime;
	protected float m_beatLength;
	protected float m_startTime = 0.0f;
	
	protected bool m_isBeatDirty = false;
	protected bool m_isDownBeat = false;
	protected float m_lastBeatTime = 0.0f;
	protected float m_lastCycleTime = 0.0f;

	// Use this for initialization
	void Start () {
		Init(m_beatsPerBar, m_bpm);
	}
	
	void Init(int beatsPerbar, float bpm){
		m_beatsPerBar = beatsPerbar;
		m_bpm = bpm;
		m_beatLength = 1.0f / (m_bpm / 60);
	}
	
	// Update is called once per frame
	void Update () {
		float time = (Time.time - m_startTime) % m_beatLength;
		float cycleTime = (Time.time - m_startTime) % (m_beatLength * m_beatsPerBar);
		
		m_beatTime = Utils.Normalize(time, 0.0f, m_beatLength);
		m_cycleTime =  Utils.Normalize(cycleTime, 0.0f, m_beatLength * m_beatsPerBar);
		
		//Beat marked dirty
		if(m_lastBeatTime > m_beatTime)
			m_isBeatDirty = true;
		else m_isBeatDirty = false;
		
		//Downbeat hit
		if(m_lastCycleTime > m_cycleTime)
			m_isDownBeat = true;
		else m_isDownBeat = false;
				
		m_lastBeatTime = m_beatTime;
		m_lastCycleTime = m_cycleTime;
	}
	
	public void BeatReset(){
		m_startTime = Time.time;
	}
	
	public float GetCycleTime(){
		return m_cycleTime;
	}
	
	public float GetBeatTime(){
		return m_beatTime;
	}
	
	public bool IsBeatDirty(){
		return m_isBeatDirty;
	}
	
	public bool IsDownBeat(){
		return m_isDownBeat;
	}
}
