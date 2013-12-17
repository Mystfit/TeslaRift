using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class VRCarousel : MonoBehaviour {

	protected List<GameObject> m_instruments;
	public float m_carouselRadius = 5.0f;

	// Use this for initialization
	void Start () {
		m_instruments = new List<GameObject>();
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	public void AddInstrument(GameObject instrument){
		m_instruments.Add(instrument);
	}

	public void PlaceObjects(){
		float angleInc = Mathf.PI * 2 / m_instruments.Count;

		for(int i =0; i < m_instruments.Count; i++){
		
			//Move this to the carousel
			m_instruments[i].transform.localPosition = new Vector3(
				Mathf.Cos(i * angleInc) * m_carouselRadius,
				Mathf.Sin(i * angleInc) * m_carouselRadius,
				0.0f
			);
		}
	}

}
