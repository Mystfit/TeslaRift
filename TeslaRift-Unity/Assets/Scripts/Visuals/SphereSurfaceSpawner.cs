using UnityEngine;
using System.Collections;

public class SphereSurfaceSpawner : MonoBehaviour {
	
	public float scale = 2.0f;
	public float randomness = 0.0f;
	public GameObject prefab;

	// Use this for initialization
	void Start () {
		SpawnBurst();
	}
	
	void SpawnBurst(){
		Vector3[] spawnPoints = Utils.PointsOnSphere(20, scale, randomness);
		
		foreach(Vector3 pos in spawnPoints){
			//GameObject sphere = GameObject.CreatePrimitive(PrimitiveType.Sphere);
			GameObject sphere = Instantiate(prefab, transform.position, Quaternion.identity) as GameObject;
			sphere.transform.parent = transform;
			sphere.transform.localPosition = pos;
			sphere.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
		}
	}
	
	// Update is called once per frame
	void Update () {
		if(Input.GetKeyDown(KeyCode.Space)){
			SpawnBurst();
		}
	}
}
