using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class SphereStateController : OSCListener {
	
	public enum ActiveStage {
		STAGE1 = 0,
		STAGE2,
		STAGE3,
		STAGE4
	};
	private BaseStage m_activeStage;
	
	private BaseStage[] m_stages;

	// Use this for initialization
	protected override void Start () {
		base.Start();
		
		m_stages = new BaseStage[4]; 
		m_stages[(int)ActiveStage.STAGE1] = new Stage1();
		m_stages[(int)ActiveStage.STAGE2] = new Stage2();
		m_stages[(int)ActiveStage.STAGE3] = new Stage3();
		m_stages[(int)ActiveStage.STAGE4] = new Stage4();
	}
	
	// Update is called once per frame
	protected override void Update () {
		base.Update();
		
		//Get OSC state
		if(m_isDirty){
			
			for(int i = 0; i < m_paramValues.Length; i++){
				if(m_paramValues[i] == 1.0f)
					TransitionToStage( (ActiveStage)i );
			}
			
			SetClean();
		}
	}
	
	public void TransitionToStage(ActiveStage stage){
		m_activeStage = m_stages[(int)stage];
	}
	
	public void TransitionFromStage(){
		m_activeStage.TransitionOut();
	}
}
