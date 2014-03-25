using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class VRCarousel : MonoBehaviour {

	protected List<InstrumentAttachment> m_instruments;
	protected InstrumentAttachment m_floatingInstrument;
	public float m_carouselRadius = 5.0f;

	// Use this for initialization
	void Start () {
		m_instruments = new List<InstrumentAttachment>();
	}
	
	// Update is called once per frame
	void Update () {
	
	}


	/*
	 * Adds an instrument to the carousel
	 */
	public void AddInstrument(InstrumentAttachment instrument){
		m_instruments.Add(instrument);
	}

	public List<InstrumentAttachment> GetInstrumentList(){
		return m_instruments;
	}


	/*
	 * Pops an instrument off the carousel to be held by another object (control or hand)
	 */
	public void HoldInstrument(InstrumentAttachment instrument){
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
			iTween.MoveTo(m_instruments[i].gameObject, iTween.Hash("position", pos, "time", 0.5f, "islocal", true));

		}
	}

}
