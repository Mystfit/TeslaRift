using UnityEngine;
using System.Collections;
using UI;

public class CopyOVRCameraPosition : MonoBehaviour {

    public OVRCamera m_camera;


    // Use this for initialization
    void Start () {
        
    }
    
    // Update is called once per frame
    void Update () {
//      transform.rotation = m_targetCamera.transform.rotation;
//      transform.position = new Vector3(
//          m_targetCamera.transform.parent.position.x, 
//          m_targetCamera.transform.position.y, 
//          m_targetCamera.transform.parent.position.z);
        transform.position = UIController.Instance.EyeTarget;
        transform.rotation = m_camera.transform.rotation;
    }
}
