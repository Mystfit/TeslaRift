using UnityEngine;
using System.Collections;

public class CopyOVRCameraPosition : MonoBehaviour {

	public OVRCamera m_leftCamera;
	public OVRCamera m_rightCamera;


	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
//		transform.rotation = m_targetCamera.transform.rotation;
//		transform.position = new Vector3(
//			m_targetCamera.transform.parent.position.x, 
//			m_targetCamera.transform.position.y, 
//			m_targetCamera.transform.parent.position.z);
		transform.position = Vector3.Lerp(m_leftCamera.transform.position, m_rightCamera.transform.position, 0.5f);
		transform.rotation = m_leftCamera.transform.rotation;
	}
}
