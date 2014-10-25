using UnityEngine;
using System.Collections;

public class ProjectionCamera : MonoBehaviour {

    private RenderTexture m_screenTexture;
    private Camera m_camera;

    public GameObject m_leftProjectorMat;
    public GameObject m_centerProjectorMat;
    public GameObject m_rightProjectorMat;

    public Transform m_leftAnchor;
    public Transform m_rightAnchor;

    public Transform m_followTarget;
    public Vector3 m_viewOffset;

	// Use this for initialization
	public void Awake () {
        m_camera = GetComponent<Camera>();

        if (GlobalConfig.Instance.UseKinectCamera)
        {
            transform.parent = m_followTarget;
            transform.localPosition = m_viewOffset;

            //Set projection camera settings
            m_screenTexture = new RenderTexture(GlobalConfig.Instance.ProjectionWidth, GlobalConfig.Instance.ProjectionHeight, 24);
            m_screenTexture.filterMode = FilterMode.Trilinear;
            m_screenTexture.antiAliasing = 2;

            m_camera.fieldOfView = GlobalConfig.Instance.KinectFOV;
            m_camera.aspect = GlobalConfig.Instance.Aspect;
            m_camera.targetTexture = m_screenTexture;
            m_leftProjectorMat.renderer.material.SetTexture("_MainTex", m_screenTexture);
            m_centerProjectorMat.renderer.material.SetTexture("_MainTex", m_screenTexture);
            m_rightProjectorMat.renderer.material.SetTexture("_MainTex", m_screenTexture);
        }
	}

    public void Update()
    {
        if (GlobalConfig.Instance.UseKinectCamera)
        {
            if (GlobalConfig.Instance.CameraRotatesUsingShoulders)
            {
                Vector3 lookAt = m_rightAnchor.position - m_leftAnchor.position;
                Quaternion r = Quaternion.LookRotation(lookAt);
                r *= Quaternion.Euler(0.0f, 270.0f, 0.0f);
                transform.localRotation = r;
                //transform.position = m_followTarget.position + m_viewOffset;
            }
            else if (GlobalConfig.Instance.CameraFacesCenter)
            {
                //Quaternion faceAt = Quaternion.LookRotation(Vector3.zero - transform.position);
                //faceAt.x = 0.0f;
                //faceAt.z = 0.0f;
                //transform.rotation = Quaternion.Slerp(transform.rotation, faceAt, Time.deltaTime * 30);
                transform.LookAt(new Vector3(0.0f, transform.position.y, 0.0f));
            }
        }
    }
}
