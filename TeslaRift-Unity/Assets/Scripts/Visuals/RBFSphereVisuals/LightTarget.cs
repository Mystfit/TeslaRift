using UnityEngine;
using System.Collections;

public class LightTarget : MonoBehaviour {

    public ParticleSphere m_sphere;

	// Use this for initialization
	void Start () {
        if (m_sphere != null)
        {
            m_sphere.AddLightTarget(transform);
        }
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
