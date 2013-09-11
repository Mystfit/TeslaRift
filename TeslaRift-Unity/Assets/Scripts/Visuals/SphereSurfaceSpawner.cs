using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class SphereSurfaceSpawner : MonoBehaviour {
	
	public float m_scale = 2.0f;
	public float m_randomness = 0.0f;
	public bool m_triggerSpawn = false;
	public bool m_trailsOn = false;
	
	public GameObject prefab;
	
	private List<GameObject> m_spawns;

	// Use this for initialization
	void Start () {
		m_spawns = new List<GameObject>();
	}
	
	public void SpawnBurst(){
		SpawnBurst(8, 1.28f);
	}
	
	public void SetTrails(bool state){
		m_trailsOn = state;
	}
	
	public void SpawnBurst(int numPoints, float distance){
		GameObject spawnParent = new GameObject("spawnParent");
		Vector3[] spawnPoints = Utils.PointsOnSphere(numPoints, distance, m_randomness);
		
		foreach(Vector3 pos in spawnPoints){
			//GameObject sphere = GameObject.CreatePrimitive(PrimitiveType.Sphere);
			GameObject sphere = Instantiate(prefab, transform.position, Quaternion.identity) as GameObject;
			if(!m_trailsOn)
				sphere.GetComponent<TrailRenderer>().enabled = false;
			
			sphere.transform.parent = spawnParent.transform;
			sphere.transform.localPosition = pos;
			sphere.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
		}
		
		spawnParent.transform.position = transform.position;
		spawnParent.transform.parent = transform;
	}
	 
	// Update is called once per frame
	void Update () {
		if(m_triggerSpawn){
			m_triggerSpawn = false;
			SpawnBurst(16, 1.0f);
		}
	}
}
