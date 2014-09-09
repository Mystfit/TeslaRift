using UnityEngine;
using System.Collections;

public class ProjectionCamera : MonoBehaviour {

    private RenderTexture m_screenTexture;
    private Camera m_camera;

    public GameObject m_leftProjectorMat;
    public GameObject m_centerProjectorMat;
    public GameObject m_rightProjectorMat;

    public Transform m_followTarget;
    public Vector3 m_viewOffset;

	// Use this for initialization
	public void Awake () {
        m_camera = GetComponent<Camera>();

        //Enable rift cam
        if (!GlobalConfig.Instance.UseRiftCamera)
        {
            GameObject riftCam = GameObject.Find("OVRCameraController");
            riftCam.SetActive(false);

            //Set projection camera settings
            m_screenTexture = new RenderTexture(GlobalConfig.Instance.ProjectionWidth, GlobalConfig.Instance.ProjectionHeight, 24);
            //m_screenTexture.filterMode = FilterMode.Trilinear;
            //m_screenTexture.antiAliasing = 2;
            m_camera.aspect = GlobalConfig.Instance.Aspect;
            m_camera.targetTexture = m_screenTexture;
            m_leftProjectorMat.renderer.material.SetTexture("_MainTex", m_screenTexture);
            m_centerProjectorMat.renderer.material.SetTexture("_MainTex", m_screenTexture);
            m_rightProjectorMat.renderer.material.SetTexture("_MainTex", m_screenTexture);
        }
        else
        {
            GameObject projectorCamera = GameObject.Find("ProjectorCamera");
            projectorCamera.SetActive(false);
        }    
	}

    public void Update()
    {
        transform.position = m_followTarget.position + m_viewOffset;
    }
}
