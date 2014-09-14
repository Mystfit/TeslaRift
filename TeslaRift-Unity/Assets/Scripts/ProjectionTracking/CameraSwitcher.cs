using UnityEngine;
using System.Collections;

public class CameraSwitcher : MonoBehaviour {

	// Use this for initialization
	void Start () {

        GameObject slaveProjectorCamera = GameObject.Find("SlaveCameraTarget");
        GameObject riftCam = GameObject.Find("OVRCameraController");
        GameObject projectorCamera = GameObject.Find("ProjectorCamera");
        GameObject remoteCamera = GameObject.Find("RemoteCamera"); 

        if (GlobalConfig.Instance.UseKinectCamera)
        {
            riftCam.SetActive(false);
            remoteCamera.SetActive(false);
        } else if (GlobalConfig.Instance.UseRiftCamera) 
        {
            projectorCamera.SetActive(false);
            remoteCamera.SetActive(false);
        }
        else
        {
            riftCam.SetActive(false);
            projectorCamera.SetActive(false);
            slaveProjectorCamera.SetActive(false);
            remoteCamera.SetActive(true);
        }
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
