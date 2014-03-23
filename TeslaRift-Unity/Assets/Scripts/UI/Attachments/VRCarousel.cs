using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class VRCarousel : MonoBehaviour {

	protected List<GameObject> m_instruments;
	protected GameObject m_floatingInstrument;
	public float m_carouselRadius = 5.0f;

	// Use this for initialization
	void Start () {
		m_instruments = new List<GameObject>();
	}
	
	// Update is called once per frame
	void Update () {
	
	}


	/*
	 * Adds an instrument to the carousel
	 */
	public void AddInstrument(GameObject instrument){
		m_instruments.Add(instrument);
	}


	/*
	 * Pops an instrument off the carousel to be held by another object (control or hand)
	 */
	public void HoldInstrument(GameObject instrument){
		//DropInstrument();

		if(m_instruments.Remove(instrument)){
			m_floatingInstrument = instrument;
			m_floatingInstrument.rigidbody.isKinematic = false;
		}

		PlaceObjects();
	}

	/*
	 * 
	 */
	public void DropInstrument(){
		if(m_floatingInstrument != null){
			m_instruments.Add(m_floatingInstrument);
			m_floatingInstrument.rigidbody.velocity = Vector3.zero;
			m_floatingInstrument.rigidbody.isKinematic = true;
		}
		m_floatingInstrument = null;
	}

	public void PlaceObjects(){
		float angleInc = Mathf.PI * 2 / m_instruments.Count;

		for(int i =0; i < m_instruments.Count; i++){
			//Move this to the carousel
			Vector3 pos = new Vector3(
				Mathf.Cos(i * angleInc) * m_carouselRadius,
				Mathf.Sin(i * angleInc) * m_carouselRadius,
				0.0f
			);
			iTween.MoveTo(m_instruments[i], iTween.Hash("position", pos, "time", 0.5f, "islocal", true));

		}
	}

}
