using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class SphereSurfaceSpawner : MonoBehaviour {
	
	public float m_scale = 2.0f;
	public float m_randomness = 0.0f;
	public bool m_triggerSpawn = false;
	public bool m_trailsOn = false;

	public GameObject prefab;
	
	private List<SpawnParent> m_spawns;
	private List<SpawnParent> m_removeSpawns;

	// Use this for initialization
	void Start () {
		m_spawns = new List<SpawnParent>();
		m_removeSpawns = new List<SpawnParent>();
	}
	
	public void SpawnBurst(){
		SpawnBurst(8, 1.28f);
	}
	
	public void SetTrails(bool state){
		m_trailsOn = state;
	}
	
	public void SpawnBurst(int numPoints, float distance){
		
		GameObject spawnParent = new GameObject("spawnparent");
		spawnParent.transform.parent = gameObject.transform;
		SpawnParent s = spawnParent.AddComponent<SpawnParent>();
		
		Vector3[] spawnPoints = Utils.PointsOnSphere(numPoints, distance, m_randomness);
		
		foreach(Vector3 pos in spawnPoints){
			//GameObject sphere = GameObject.CreatePrimitive(PrimitiveType.Sphere);
			GameObject sphere = Instantiate(prefab, transform.position, Quaternion.identity) as GameObject;
			if(!m_trailsOn)
				sphere.GetComponent<TrailRenderer>().enabled = false;
			
			sphere.transform.localPosition = pos;
			sphere.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
			s.AddPoint(sphere);
		}
		
		s.transform.position = transform.position;
		s.transform.parent = transform;
		s.ScaleOut();
		m_spawns.Add(s);
		
	}
	 
	// Update is called once per frame
	void Update () {
		if(m_triggerSpawn){
			m_triggerSpawn = false;
			SpawnBurst();
		}
		
		foreach(SpawnParent spawn in m_spawns){
			if(spawn.isQueuedToDelete)
				m_removeSpawns.Add(spawn);
		}
		
		foreach(SpawnParent spawn in m_removeSpawns){
			m_spawns.Remove(spawn);
		}
		
		m_removeSpawns.Clear();
	}
	
	
}


