using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class SpawnParent : MonoBehaviour {
	
	public float speed = 0.0f;
	public float length = 1.0f;
	public float variance = 0.0f;
	public float distance = 2.0f;
	public float spawnSpeed = 1.0f;
	public float returnSpeed = 20.0f;
	public bool isQueuedToDelete = false;
	
	private List<GameObject> m_particles;
	private TrailRenderer m_trailRenderer;

	void Start(){
		m_particles = new List<GameObject>();
		m_trailRenderer = gameObject.GetComponent<TrailRenderer>();
	}
	
	public void ScaleOut(){
		iTween.ScaleTo(gameObject, iTween.Hash(
			"scale", new Vector3(distance, distance, distance), 
			"time", spawnSpeed, 
			"easetype", "easeOutExpo", 
			"oncomplete", "ScaleIn", 
			"oncompletetarget" , this.gameObject
		));
	}
	
	public void ScaleIn(){
		iTween.ScaleTo(gameObject, iTween.Hash(
			"scale", new Vector3(), 
			"time", returnSpeed, 
			"easetype", "easeInSine",  
			"oncomplete", "DelayRemove", 
			"oncompletetarget" , this.gameObject
		));
	}
	
	private void DelayRemove(){
		iTween.ValueTo(gameObject, iTween.Hash(
			"from", 0.0f,
			"to", 1.0f,
			"time", length, 
			"onupdate", "DelayProgress", 
			"onupdatetarget", gameObject,
			"oncomplete", "Remove", 
			"oncompletetarget" , gameObject
		));
	}
	
	private void DelayProgress(float tweenProgress){
	}
	
	public void Remove(){
		isQueuedToDelete = true;
		foreach (GameObject particle in m_particles){
			Destroy(particle);
		}
		Destroy(gameObject);
		Destroy(this);
	}
			
	public void AddPoint(GameObject point){
		if(m_particles == null)
			m_particles = new List<GameObject>();

		point.transform.parent = transform;
		m_particles.Add(point);
	}
	
	void Update(){
		Vector3 rot = transform.localRotation.eulerAngles;
		rot.x += 1.0f * speed;
		rot.y += 1.5f * speed;
		rot.z += 2.0f * speed;
		transform.localRotation = Quaternion.Euler(rot);
		if(m_trailRenderer)
			m_trailRenderer.time = length;
		/*
		foreach(Transform t in GetComponentsInChildren<Transform>()){
			t.localScale = new Vector3(
				5.0f/(transform.localScale.x * 5.0f), 
				5.0f/(transform.localScale.y * 5.0f),
				5.0f/(transform.localScale.z * 5.0f)
			);
		}*/
		
	}
}