using UnityEngine;
using System.Collections;

public class ProjectionSettings : MonoBehaviour {

    public float screenScale;
    private Transform m_leftScreenQuad;
    private Transform m_centerScreenQuad;
    private Transform m_rightScreenQuad;

    public Transform test_room;

	// Use this for initialization
	void Start () {
        Vector3 projectionScale = new Vector3(GlobalConfig.Instance.Aspect * screenScale, screenScale, 1.0f);


        m_leftScreenQuad = transform.Find("left_screen");
        m_leftScreenQuad.localScale = projectionScale;
        m_centerScreenQuad = transform.Find("center_screen");
        m_centerScreenQuad.localScale = projectionScale;
        m_rightScreenQuad = transform.Find("right_screen");
        m_rightScreenQuad.localScale = projectionScale;

        if (GlobalConfig.Instance.NumScreens < 3)
        {
            m_leftScreenQuad.gameObject.SetActive(false);
            m_rightScreenQuad.gameObject.SetActive(false);
        }

        Screen.SetResolution(GlobalConfig.Instance.ProjectionWidth, GlobalConfig.Instance.ProjectionHeight, GlobalConfig.Instance.Fullscreen);

	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
