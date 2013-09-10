using UnityEngine;
using System.Collections;

public class CandySphereListener : OSCListener {
	
	private enum Param : int { SCALE = 0, POWER, POLEA, POLEB, POLEC };
	
	public float bandScale = 10.0f;
	public float powerScale = 25.0f;
	public float poleScale = 10.0f;

	// Use this for initialization
	protected override void Start () {
		base.Start();
	}
	
	// Update is called once per frame
	protected override void Update () {
		base.Update();
		
		if(m_isDirty){
			//this.renderer.material.SetFloat("_Scale", 5.0f);
			this.renderer.material.SetFloat("_Scale", m_paramValues[(int)Param.SCALE] * bandScale);
			this.renderer.material.SetFloat("_Power", m_paramValues[(int)Param.POWER] * powerScale);
			this.renderer.material.SetVector("_PointA", new Vector4( m_paramValues[(int)Param.POLEA] * poleScale, 0.0f, 0.0f, 0.0f));
			this.renderer.material.SetVector("_PointB", new Vector4( 0.0f, m_paramValues[(int)Param.POLEB] * poleScale, 0.0f, 0.0f ));
			this.renderer.material.SetVector("_PointC", new Vector4( m_paramValues[(int)Param.POLEB] * poleScale, 0.0f, 0.0f, 0.0f));
			SetClean();
		}
	}
}
