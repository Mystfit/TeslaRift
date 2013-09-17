using UnityEngine;
using System.Collections;

public class BaseStage : OSCListener {
	
	public enum Param { 
		MSH_DISTANCE = 0,
		MSH_SPIKE,
		MSH_OSCILLATE,
		MSH_VIBRATO,
		SH_DISTANCE,
		SH_SPIKE,
		SH_OSCILLATE,
		SH_VIBRATO,
		SPN_DISTANCE,
		SPN_SPIKE,
		SPN_OSCILLATE,
		SPN_VIBRATO
	}
	
	protected float[] m_distance;
	protected float[] m_oscillate;
	protected float[] m_vibrato;
	
	protected int m_numTargets = 3;
	protected float m_sharedOscillator;
	
	public enum TransitionState {
		IN_STATE = 0,
		LEAVING_STATE,
		ENTERING_STATE
	}
	
	public enum TargetSphereComponent {
		MESH = 0,
		SHADER,
		SPAWNER
	};
	
	private TransitionState m_transitionState = TransitionState.IN_STATE;
		
	
	protected override void Start ()
	{
		m_distance = new float[m_numTargets];
		m_oscillate = new float[m_numTargets];
		m_vibrato = new float[m_numTargets];
		
		base.Start ();
	}
	
	// Update is called once per frame
	protected override void Update () {
		base.Update();
		
		//Get OSC state
		if(m_isDirty){
			
			/*
			m_targetComponent[(int)TargetSphereComponent.MESH] = (m_paramValues[(int)Param.MESHTARGET] == 1.0f) ? true : false;
			m_targetComponent[(int)TargetSphereComponent.SHADER] = (m_paramValues[(int)Param.SHADERTARGET] == 1.0f) ? true : false;
			m_targetComponent[(int)TargetSphereComponent.SPAWNER] = (m_paramValues[(int)Param.SPAWNERTARGET] == 1.0f) ? true : false;
			*/
			
			m_distance[0] = m_paramValues[(int)Param.MSH_DISTANCE];
			m_distance[1] = m_paramValues[(int)Param.SH_DISTANCE];
			m_distance[2] = m_paramValues[(int)Param.SPN_DISTANCE];
			
			m_oscillate[0] = m_paramValues[(int)Param.MSH_OSCILLATE];
			m_oscillate[1] = m_paramValues[(int)Param.SH_OSCILLATE];
			m_oscillate[2] = m_paramValues[(int)Param.SPN_OSCILLATE];
			
			m_vibrato[0] = m_paramValues[(int)Param.MSH_VIBRATO];
			m_vibrato[1] = m_paramValues[(int)Param.SH_VIBRATO];
			m_vibrato[2] = m_paramValues[(int)Param.SPN_VIBRATO];
		
			if(m_paramValues[(int)Param.MSH_SPIKE] == 1.0f) Spike(TargetSphereComponent.MESH );
			if(m_paramValues[(int)Param.SH_SPIKE] == 1.0f) Spike(TargetSphereComponent.SHADER );
			if(m_paramValues[(int)Param.SPN_SPIKE] == 1.0f) Spike(TargetSphereComponent.SPAWNER );
			
			SetClean();
		}
		
		if(m_transitionState == TransitionState.IN_STATE){
			UpdateSpawner();
			UpdateSphereShape();
			UpdateShader();
		}
		m_sharedOscillator = Mathf.Sin(Time.time * 40.0f);
	}
	
	protected virtual void Spike(TargetSphereComponent target){
	}
	
	protected virtual void UpdateSpawner(){
	}
	
	protected virtual void UpdateSphereShape(){
	}
	
	protected virtual void UpdateShader(){
	}
	
	public virtual void TransitionIn(){
		m_transitionState = TransitionState.ENTERING_STATE;
	}
	
	public virtual void TransitionOut(){
		m_transitionState = TransitionState.LEAVING_STATE;
	}
}
