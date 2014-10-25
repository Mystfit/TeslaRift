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
            //projectorCamera.tag = "MainCamera";
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
            remoteCamera.transform.position = new Vector3(
                GlobalConfig.Instance.RemoteCameraX,
                GlobalConfig.Instance.RemoteCameraY,
                GlobalConfig.Instance.RemoteCameraZ);
            remoteCamera.transform.rotation = Quaternion.Euler(new Vector3(
                GlobalConfig.Instance.RemoteCameraPitch,
                GlobalConfig.Instance.RemoteCameraYaw,
                0.0f));

            remoteCamera.GetComponent<Camera>().fieldOfView = GlobalConfig.Instance.RemoteCameraFOV;
            remoteCamera.tag = "MainCamera";
        }
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
