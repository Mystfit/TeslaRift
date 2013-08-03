using UnityEngine;
using System.Collections;

public class EffectCube : MonoBehaviour {
	
	public string OSCmessage = "effect";
	
	protected bool m_isGrabbed = false;
	protected bool m_isActive = false;
	
	protected GameObject m_firstGrabber = null;
	protected GameObject m_secondGrabber = null;

	// Use this for initialization
	void Start () {
	
	}
	
	public void AddGrabber(GameObject grabber){
		m_isGrabbed = true;
		
		if(m_firstGrabber == null){
			m_firstGrabber = grabber;
			this.gameObject.GetComponent<Rigidbody>().isKinematic = true;
			this.transform.parent = grabber.transform;
			
		} else if (m_secondGrabber == null){
			m_secondGrabber = grabber;
			m_isActive = true;
			this.transform.parent = null;
			this.gameObject.GetComponent<Rigidbody>().isKinematic = true;
		}
	}
	
	
	public void RemoveGrabber(GameObject grabber){
		if(grabber == m_firstGrabber){
			m_firstGrabber = m_secondGrabber;
			m_secondGrabber = null;
			if(m_firstGrabber != null)
				this.transform.parent = m_firstGrabber.transform;
			m_isActive = false;
		} else if(grabber == m_secondGrabber){
			m_secondGrabber = null;
			m_isActive = false;
			this.transform.parent = m_firstGrabber.transform;
		}
		
		if(m_firstGrabber == null && m_secondGrabber == null)
			m_isGrabbed = false;
			this.gameObject.GetComponent<Rigidbody>().isKinematic = false;
			this.transform.parent = null;		
	}
		
	
	
	// Update is called once per frame
	void Update () {
		if(m_isActive){

			float xAvg = (m_firstGrabber.transform.localPosition.x + m_secondGrabber.transform.localPosition.x) * 0.5f;
			float yAvg = (m_firstGrabber.transform.localPosition.y + m_secondGrabber.transform.localPosition.y) * 0.5f;
			float zAvg = (m_firstGrabber.transform.localPosition.z + m_secondGrabber.transform.localPosition.z) * 0.5f;
			
			float xRotAvg = (m_firstGrabber.transform.rotation.x + m_secondGrabber.transform.rotation.x) * 0.5f;
			float yRotAvg = (m_firstGrabber.transform.rotation.y + m_secondGrabber.transform.rotation.y) * 0.5f;
			float zRotAvg = (m_firstGrabber.transform.rotation.z + m_secondGrabber.transform.rotation.z) * 0.5f;
			float wRotAvg = (m_firstGrabber.transform.rotation.w + m_secondGrabber.transform.rotation.w) * 0.5f;
			
			this.transform.position.Set(xAvg, yAvg, zAvg);
			this.transform.rotation.Set(xRotAvg, yRotAvg, zRotAvg, wRotAvg);
		}
	}
}
