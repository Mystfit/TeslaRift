using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Stage1 : BaseStage {
	
	//Shader variables
	public float m_bandScale = 1.0f;
	public float m_powerScale = 10.0f;
	public float m_poleScale = 1.0f;
	
	//Mesh Variables
	protected MCBlob m_blob;
	protected SphereSurfaceSpawner m_surfaceSpawner;
	private BlobPosition[] m_blobPositions;
	public float m_orbitDistanceScale = 1.0f;
	public float m_orbitSpeedScale = 1.0f;
	
	//Spawner variables
	public int m_numParticlesScaler;
	private List<SpawnParent> m_spawns;
	private List<SpawnParent> m_removeSpawns;
	public GameObject m_spawnParticlePrefab;
	public float m_spawnDistance = 7.0f;

	// Use this for initialization
	protected override void Start () {
		//Create metaball positions
		m_blobPositions = new BlobPosition[3];
		for(int i = 0; i < 3; i++)
			m_blobPositions[i] = new BlobPosition();
		
		m_surfaceSpawner = this.GetComponent<SphereSurfaceSpawner>();
		m_blob = this.GetComponent<MCBlob>();
		
		m_spawns = new List<SpawnParent>();
		m_removeSpawns = new List<SpawnParent>();

		
		base.Start();
	}
	
	protected override void UpdateSpawner(){
		foreach(SpawnParent spawn in m_spawns){
			spawn.speed = m_oscillate[(int)TargetSphereComponent.SPAWNER];
			spawn.distance =  m_distance[(int)TargetSphereComponent.SPAWNER] * m_spawnDistance;
			spawn.returnSpeed = m_vibrato[(int)TargetSphereComponent.SPAWNER] * 20.0f;
			
			if(spawn.isQueuedToDelete)
				m_removeSpawns.Add(spawn);
		}
		
		foreach(SpawnParent spawn in m_removeSpawns){
			m_spawns.Remove(spawn);
		}
		
		m_removeSpawns.Clear();
	}
	
	protected override void UpdateSphereShape(){ 
		//Store metablob parameters
		float oscillateSin = Mathf.Sin(Time.deltaTime * m_oscillate[(int)TargetSphereComponent.MESH]);
		for(int i = 1; i <= m_blobPositions.Length; i++){
			m_blobPositions[i-1].velocity = i * m_oscillate[(int)TargetSphereComponent.MESH] * ((i % 2) * 2 - 1) * m_orbitSpeedScale;
			m_blobPositions[i-1].orbitDistance =  i * m_distance[(int)TargetSphereComponent.MESH] * m_orbitDistanceScale;
			m_blobPositions[i-1].orbitPulse = i * m_vibrato[(int)TargetSphereComponent.MESH];
			m_blobPositions[i-1].Update();				
		}
		
		//Set metablob parameters
		m_blob.m_blobPositions[0] = new Vector4(
			m_blobPositions[0].x,
			m_blobPositions[0].y,
			0.0f,
			m_blobPositions[0].isoPulse
		);
		m_blob.m_blobPositions[1] = new Vector4(
			m_blobPositions[1].x,
			m_blobPositions[1].y,
			0.0f,
			m_blobPositions[1].isoPulse
		);
		m_blob.m_blobPositions[2] = new Vector4(
			m_blobPositions[2].x,
			m_blobPositions[2].y,
			0.0f,
			m_blobPositions[2].isoPulse
		);
	}
	
	protected override void UpdateShader(){
		//Set shader parameters
		float oscillateSin = Mathf.Sin(Time.deltaTime * m_oscillate[(int)TargetSphereComponent.SHADER]);
		float oscillateCos = Mathf.Cos(Time.deltaTime * m_oscillate[(int)TargetSphereComponent.SHADER]);
		
		this.renderer.material.SetFloat("_Scale", m_distance[(int)TargetSphereComponent.SHADER] * m_bandScale);
		this.renderer.material.SetFloat("_Power", oscillateSin * m_powerScale);
		this.renderer.material.SetVector("_PointA", new Vector4( m_distance[(int)TargetSphereComponent.SHADER] * m_poleScale, 0.5f, 0.0f, 0.0f));
		this.renderer.material.SetVector("_PointB", new Vector4( oscillateCos, oscillateSin, 0.0f, 0.0f ));
		this.renderer.material.SetVector("_PointC", new Vector4( 0.5f, m_distance[(int)TargetSphereComponent.SHADER] * m_poleScale, 0.0f, 0.0f));
	}
	
	protected override void Spike(TargetSphereComponent target){
		if(target == BaseStage.TargetSphereComponent.MESH){
		} 
		else  if(target == BaseStage.TargetSphereComponent.SHADER){
		} 
		else if(target == BaseStage.TargetSphereComponent.SPAWNER){
			SpawnBurst();
		}
	}
	
	public override void TransitionIn(){
		base.TransitionIn();
	}
	
	public override void TransitionOut(){
		base.TransitionOut();
	}
	
	private void SpawnBurst(){
		GameObject spawnParent = new GameObject("spawnparent");
		spawnParent.transform.parent = gameObject.transform;
		spawnParent.transform.rotation = Random.rotation;
		SpawnParent s = spawnParent.AddComponent<SpawnParent>();
		
		Vector3[] spawnPoints = Utils.PointsOnSphere( (int)((float)m_numParticlesScaler * m_oscillate[(int)TargetSphereComponent.SPAWNER]) + 1, 1.0f);
		
		foreach(Vector3 pos in spawnPoints){
			//GameObject sphere = GameObject.CreatePrimitive(PrimitiveType.Sphere)
			GameObject sphere = Instantiate(m_spawnParticlePrefab, transform.position, Quaternion.identity) as GameObject;
			
			//if(!m_trailsOn)
			sphere.GetComponent<TrailRenderer>().enabled = true;
			
			sphere.transform.localPosition = pos;
			sphere.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
			s.AddPoint(sphere);
		}
		
		s.transform.position = transform.position;
		s.transform.parent = transform;
		s.ScaleOut();
		m_spawns.Add(s);
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
