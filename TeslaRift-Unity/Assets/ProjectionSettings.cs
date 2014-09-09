using UnityEngine;
using System.Collections;

public class ProjectionSettings : MonoBehaviour {

    public float screenScale;
    private Transform m_leftScreenQuad;
    private Transform m_centerScreenQuad;
    private Transform m_rightScreenQuad;

	// Use this for initialization
	void Start () {
        m_leftScreenQuad = transform.Find("left_screen");
        m_centerScreenQuad = transform.Find("center_screen");
        m_rightScreenQuad = transform.Find("right_screen");
        
        Vector3 projectionScale = new Vector3(GlobalConfig.Instance.Aspect * screenScale, screenScale, 1.0f);
        m_leftScreenQuad.localScale = projectionScale;
        m_centerScreenQuad.localScale = projectionScale;
        m_rightScreenQuad.localScale = projectionScale;

        Screen.SetResolution(GlobalConfig.Instance.ProjectionWidth, GlobalConfig.Instance.ProjectionHeight, false);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
