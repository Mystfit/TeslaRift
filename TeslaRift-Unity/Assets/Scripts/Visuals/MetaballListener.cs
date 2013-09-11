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
	
	public float m_scale = 0.0f;
	public float m_power = 0.0f;
	public float m_poleA = 0.0f;
	public float m_poleB = 0.0f;
	public float m_poleC = 0.0f;
	
	public float m_orbitSpeed = 0.0f;
	public float m_orbitDistance = 0.0f;
	public float m_orbitPulse = 0.0f;
	
	public float m_bandScale = 10.0f;
	public float m_powerScale = 25.0f;
	public float m_poleScale = 10.0f;
	public float m_blobScale = 10.0f;
	
	public float m_orbitSpeedScale = 0.0f;
	public float m_orbitDistanceScale = 0.0f;
	public float m_orbitPulseScale = 0.0f;
	
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
		
		//Grab parameters from OSC
		if(m_isDirty){
			m_scale = m_paramValues[(int)Param.SCALE] * m_bandScale;
			m_power = m_paramValues[(int)Param.POWER] * m_powerScale;
			m_poleA = m_paramValues[(int)Param.POLEA] * m_poleScale;
			m_poleB = m_paramValues[(int)Param.POLEB] * m_poleScale;
			m_poleC = m_paramValues[(int)Param.POLEC] * m_poleScale;
			
			m_orbitSpeed = m_paramValues[(int)Param.ORBITSPEED];
			m_orbitDistance = m_paramValues[(int)Param.ORBITDIST];
			m_orbitPulse = m_paramValues[(int)Param.ORBITPULSE];

			SetClean();
		}
		
		//Set shader parameters
		this.renderer.material.SetFloat("_Scale", m_scale * m_bandScale);
		this.renderer.material.SetFloat("_Power", m_power * m_powerScale);
		this.renderer.material.SetVector("_PointA", new Vector4( m_poleA * m_poleScale, 0.5f, 0.0f, 0.0f));
		this.renderer.material.SetVector("_PointB", new Vector4( 0.5f, m_poleB * m_poleScale, 0.0f, 0.0f ));
		this.renderer.material.SetVector("_PointC", new Vector4( m_poleC * m_poleScale, 0.5f, 0.0f, 0.0f));
		
		//Store metablob parameters
		for(int i = 1; i <= m_blobPositions.Length; i++){
			m_blobPositions[i-1].velocity = 0.05f * i * m_orbitSpeed * ((i % 2) * 2 - 1) * m_orbitSpeedScale;
			m_blobPositions[i-1].orbitDistance =  0.05f * i * m_orbitDistance * m_orbitDistanceScale;
			m_blobPositions[i-1].orbitPulse = 0.05f * i * m_orbitPulse * m_orbitPulseScale;
			m_blobPositions[i-1].Update();				
		}
		
		//Set metablob parameters
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
		blob.m_blobPositions[2] = new Vector4(
			m_blobPositions[2].x,
			m_blobPositions[2].y,
			0.0f,
			m_blobPositions[2].isoPulse
		);
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
