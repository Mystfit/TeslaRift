using UnityEngine;
using System.Collections;

public class Clock : OSCListener {
	
	public enum Params {
		TAP = 0
	}
	
	public bool m_tapBpm = false;
	
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
	
	protected int m_numTaps = 0;
	protected float m_firstBeat = 0.0f;

	// Use this for initialization
	public override void Start () {
		Init(m_beatsPerBar, m_bpm);
		base.Start();
	}
	
	void Init(int beatsPerbar, float bpm){
		m_beatsPerBar = beatsPerbar;
		SetBpm(bpm);
	}
	
	// Update is called once per frame
	public override void Update () {
		base.Update();
		float time = (Time.time - m_startTime) % m_beatLength;
		float cycleTime = (Time.time - m_startTime) % (m_beatLength * m_beatsPerBar);
		
		m_beatTime = Utils.Scale(time, 0.0f, m_beatLength);
		m_cycleTime =  Utils.Scale(cycleTime, 0.0f, m_beatLength * m_beatsPerBar);
		
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
		
		if(m_isDirty){
			if(m_paramValues[(int)Params.TAP] == 1.0f || m_paramValues[(int)Params.TAP] == 0.0f)
				Tap();
			SetClean();
		}

		
		
		if(m_tapBpm){
			Tap();
			m_tapBpm = false;
			Debug.Log("CATS");
		}
	
	}
	
	public void Tap(){
		float time = Time.time;
		float bpm = m_bpm;
		
		if(m_numTaps > m_beatsPerBar * 2){
			m_numTaps = 0;	
		}
		
		if(m_numTaps == 0){
			m_firstBeat = time;
			Debug.Log("BING" + (time - m_firstBeat));
		}
		
		if(time - m_firstBeat > 0.0f)
			SetBpm(m_numTaps / (time - m_firstBeat) * 60);
			
		Debug.Log(bpm);
		
		BeatSync();
		
		m_numTaps++;
	}
	
	public void SetBpm(float bpm){
		m_bpm = bpm;
		m_beatLength = 1.0f / (m_bpm / 60);
	}
	
	public void BeatSync(){
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
