using UnityEngine;
using System.Collections;

public class MetaballListener : OSCListener {
	
	private enum Param : int { 
		SCALE = 0, 
		POWER, 
		POLEA, 
		POLEB, 
		POLEC, 
		ORBITSPEED, 
		ORBITDIST, 
		ORBITPULSE
	};
	
	public float m_bandScale = 10.0f;
	public float m_powerScale = 25.0f;
	public float m_poleScale = 10.0f;
	public float m_blobScale = 10.0f;
	
	private BlobPosition[] m_blobPositions;

	// Use this for initialization
	protected override void Start () {
		base.Start();
		
		m_blobPositions = new BlobPosition[3];
		for(int i = 0; i < 3; i++)
			m_blobPositions[i] = new BlobPosition();
		
	}
	
	// Update is called once per frame
	protected override void Update () {
		base.Update();
		
		if(m_isDirty){
			//this.renderer.material.SetFloat("_Scale", 5.0f);
			this.renderer.material.SetFloat("_Scale", m_paramValues[(int)Param.SCALE] * m_bandScale);
			this.renderer.material.SetFloat("_Power", m_paramValues[(int)Param.POWER] * m_powerScale);
			this.renderer.material.SetVector("_PointA", new Vector4( m_paramValues[(int)Param.POLEA] * m_poleScale, 0.0f, 0.0f, 0.0f));
			this.renderer.material.SetVector("_PointB", new Vector4( 0.0f, m_paramValues[(int)Param.POLEB] * m_poleScale, 0.0f, 0.0f ));
			this.renderer.material.SetVector("_PointC", new Vector4( m_paramValues[(int)Param.POLEB] * m_poleScale, 0.0f, 0.0f, 0.0f));
			
			for(int i = 0; i < m_blobPositions.Length; i++){
				m_blobPositions[i].velocity = m_paramValues[(int)Param.ORBITSPEED];
				m_blobPositions[i].orbitDistance = m_paramValues[(int)Param.ORBITDIST];
				m_blobPositions[i].orbitPulse = m_paramValues[(int)Param.ORBITPULSE];
				m_blobPositions[i].Update();				
			}
			
			MCBlob blob = this.GetComponent<MCBlob>();
			blob.m_blobPositions[0] = new Vector4(
				m_blobPositions[0].x,
				m_blobPositions[0].y,
				0.0f,
				m_blobPositions[0].isoPulse
			);
			blob.m_blobPositions[1] = new Vector4(
				m_blobPositions[1].x,
				m_blobPositions[1].y,
				0.0f,
				m_blobPositions[1].isoPulse
			);
			
			SetClean();
		}
	}
}

class BlobPosition
{
	public float velocity = 0.0f;
	public float x = 0.0f;
	public float y = 0.0f;
	public float orbitAngle = 0.0f;
	public float orbitDistance = 0.0f;
	public float orbitPulse = 0.0f;
	private float pulseDistance = 0.0f;
	
	public float isoPulse = 0.0f;
	private float baseIsoPulse = 0.13f; 
		
	void BlobPostitions()
	{}
	
	public void Update(){
		orbitAngle += velocity;
		pulseDistance = Mathf.Cos(Time.deltaTime * orbitPulse) * orbitDistance;
		x = Mathf.Cos(orbitAngle) * pulseDistance;
		y = Mathf.Sin(orbitAngle) * pulseDistance;
		isoPulse = Mathf.Cos(Time.deltaTime * orbitPulse) * baseIsoPulse;
	}
	
}
