using UnityEngine;
using System.Collections;

public class TrailSpawnerListener : OSCListener {
	
	private enum Param : int { 
		SPAWN = 0,
		TRAILS_ON
	};
	
	protected SphereSurfaceSpawner m_spawner;

	// Use this for initialization
	protected override void  Start () {
		base.Start();
		m_spawner = this.GetComponent<SphereSurfaceSpawner>();
	}
	
	// Update is called once per frame
	protected override void Update () {
		base.Update();
		
		if(m_isDirty){
			if(m_paramValues[(int)Param.SPAWN] == 1.0f)
				m_spawner.SpawnBurst();
			if(m_paramValues[(int)Param.TRAILS_ON] == 1.0f)
				m_spawner.SetTrails(true);
			else
				m_spawner.SetTrails(false);
			
			SetClean();
		}
	} 
}
