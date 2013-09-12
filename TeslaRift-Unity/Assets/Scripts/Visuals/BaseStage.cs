using UnityEngine;
using System.Collections;

public class BaseStage : OSCListener {
	
	public string OSCinstrumentName;
	
	public enum TransitionState {
		IN_STATE = 0,
		LEAVING_STATE,
		ENTERING_STATE
	}
	private TransitionState m_transitionState = TransitionState.IN_STATE;
	
	// Update is called once per frame
	protected override void Update () {
		base.Update();
		
		if(m_transitionState == TransitionState.IN_STATE){
			UpdateSpawner();
			UpdateSphereShape();
			UpdateShader();
		}
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
