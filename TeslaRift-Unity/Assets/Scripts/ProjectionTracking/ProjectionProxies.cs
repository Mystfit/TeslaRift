using UnityEngine;
using System.Collections;

public class ProjectionProxies : MonoBehaviour {

    private Transform m_leftScreen;
    private Transform m_centerScreen;
    private Transform m_rightScreen;
    private Transform m_leftHinge;
    private Transform m_centerHinge;
    private Transform m_rightHinge;


	// Use this for initialization
	void Start () {
        m_leftHinge = transform.Find("left_hinge");
        m_centerHinge = transform.Find("center_hinge");
        m_rightHinge = transform.Find("right_hinge");

        m_leftScreen = m_leftHinge.Find("left_screen");
        m_centerScreen = m_centerHinge.Find("center_screen");
        m_rightScreen = m_rightHinge.Find("right_screen");


        m_leftScreen.transform.localPosition = new Vector3(GlobalConfig.Instance.ScreenWidthMeters * -0.5f, GlobalConfig.Instance.ScreenHeightMeters * 0.5f, 0.0f);
        m_leftScreen.transform.localScale = new Vector3(GlobalConfig.Instance.ScreenWidthMeters, GlobalConfig.Instance.ScreenHeightMeters, 1.0f);

        m_centerScreen.transform.localPosition = new Vector3(0.0f, GlobalConfig.Instance.ScreenHeightMeters * 0.5f, 0.0f);
        m_centerScreen.transform.localScale = new Vector3(GlobalConfig.Instance.ScreenWidthMeters, GlobalConfig.Instance.ScreenHeightMeters, 1.0f);

        m_rightScreen.transform.localPosition = new Vector3(GlobalConfig.Instance.ScreenWidthMeters * 0.5f, GlobalConfig.Instance.ScreenHeightMeters * 0.5f, 0.0f); 
        m_rightScreen.transform.localScale = new Vector3(GlobalConfig.Instance.ScreenWidthMeters, GlobalConfig.Instance.ScreenHeightMeters, 1.0f);

        m_leftHinge.localPosition = new Vector3(GlobalConfig.Instance.ScreenWidthMeters * -0.5f, 0.0f, 0.0f);
        m_leftHinge.localRotation = Quaternion.Euler(new Vector3(0.0f, -GlobalConfig.Instance.ScreenAngle, 0.0f));

        m_rightHinge.localPosition = new Vector3(GlobalConfig.Instance.ScreenWidthMeters * 0.5f, 0.0f, 0.0f);
        m_rightHinge.localRotation = Quaternion.Euler(new Vector3(0.0f, GlobalConfig.Instance.ScreenAngle, 0.0f));

        if (GlobalConfig.Instance.NumScreens < 3)
        {
            m_leftScreen.gameObject.SetActive(false);
            m_rightScreen.gameObject.SetActive(false);
        }

        transform.position = new Vector3(transform.position.x, GlobalConfig.Instance.ScreenHeightFromGround, transform.position.z);
    }
	
	// Update is called once per frame
	void Update () {
	
	}
}
