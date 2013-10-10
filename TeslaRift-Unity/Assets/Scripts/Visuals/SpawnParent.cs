using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class SpawnParent : MonoBehaviour {
	
	public float speed = 0.0f;
	public float variance = 0.0f;
	public float distance = 2.0f;
	public float returnSpeed = 20.0f;
	public bool isQueuedToDelete = false;
	
	private List<GameObject> m_particles;

	void Start(){
		m_particles = new List<GameObject>();
	}
	
	public void ScaleOut(){
		iTween.ScaleTo(gameObject, iTween.Hash("scale", new Vector3(distance, distance, distance), "time", 1.0f, "oncomplete", "ScaleIn", "oncompletetarget" , this.gameObject));
	}
	
	public void ScaleIn(){
		iTween.ScaleTo(gameObject, iTween.Hash("scale", new Vector3(), "time", returnSpeed, "oncomplete", "Remove", "oncompletetarget" , this.gameObject));
	}
	
	public void Remove(){
		isQueuedToDelete = true;
		foreach (GameObject particle in m_particles){
			DestroyImmediate(particle);
		}
		DestroyImmediate(gameObject);
		DestroyImmediate(this);
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
	}
}