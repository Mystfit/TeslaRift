using UnityEngine;
using System.Collections;

public class BaseStage : OSCListener {
	
	public enum Param { 
		DISTANCE = 0,
		SPIKE = 1,
		OSCILLATE = 2,
		VIBRATO = 3,
		MESHTARGET = 4,
		SHADERTARGET = 5,
		SPAWNERTARGET = 6
	}
	
	protected enum TargetSphereComponent {
		SHADER = 0,
		MESH,
		SPAWNER
	}
	protected int m_numTargets = 3;
	
	protected bool[] m_targetComponent;
	protected float[] m_distance;
	protected float[] m_oscillate;
	protected float m_vibrato;
	protected float m_sharedOscillator;
	
	public enum TransitionState {
		IN_STATE = 0,
		LEAVING_STATE,
		ENTERING_STATE
	}
	private TransitionState m_transitionState = TransitionState.IN_STATE;
		
	
	protected override void Start ()
	{
		/*m_address[(int)Param.DISTANCE] = "/visual/" + OSCinstrumentName + "/distance";
		m_address[(int)Param.SPIKE] = "/visual/" + OSCinstrumentName + "/spike";
		m_address[(int)Param.OSCILLATE] = "/visual/" + OSCinstrumentName + "/oscillate";
		m_address[(int)Param.VIBRATO] = "/visual/" + OSCinstrumentName + "/vibrato";
		m_address[(int)Param.MESHTARGET] = "/visual/" + OSCinstrumentName + "/meshTarget";
		m_address[(int)Param.SHADERTARGET] = "/visual/" + OSCinstrumentName + "/shaderTarget";
		m_address[(int)Param.SPAWNERTARGET] = "/visual/" + OSCinstrumentName + "/spawnerTarget";
		*/

		m_distance = new float[m_numTargets];
		m_oscillate = new float[m_numTargets];
		//m_vibrato = new float[m_numTargets];
		m_targetComponent = new bool[m_numTargets];
		
		base.Start ();
	}
	
	// Update is called once per frame
	protected override void Update () {
		base.Update();
		
		//Get OSC state
		if(m_isDirty){
			
			m_targetComponent[(int)TargetSphereComponent.MESH] = (m_paramValues[(int)Param.MESHTARGET] == 1.0f) ? true : false;
			m_targetComponent[(int)TargetSphereComponent.SHADER] = (m_paramValues[(int)Param.SHADERTARGET] == 1.0f) ? true : false;
			m_targetComponent[(int)TargetSphereComponent.SPAWNER] = (m_paramValues[(int)Param.SPAWNERTARGET] == 1.0f) ? true : false;
			
			for(int i = 0; i < m_numTargets; i++){
				if(m_targetComponent[i]){
					m_distance[i] = m_paramValues[(int)Param.DISTANCE];
					m_oscillate[i] = m_paramValues[(int)Param.OSCILLATE];
					//m_vibrato[i] = m_paramValues[(int)Param.VIBRATO];
					
					if(m_paramValues[(int)Param.SPIKE] == 1.0f) Spike((TargetSphereComponent) i);
				}	
			}
			
			m_vibrato = m_paramValues[(int)Param.VIBRATO];
		
			SetClean();
		}
		
		if(m_transitionState == TransitionState.IN_STATE){
			UpdateSpawner();
			UpdateSphereShape();
			UpdateShader();
		}
		
		m_sharedOscillator = Mathf.Sin(Time.time * 40.0f) * m_vibrato;
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
