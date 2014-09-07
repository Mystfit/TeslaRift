using UnityEngine;
using System.Collections;

public class CameraSwitcher : MonoBehaviour {

	// Use this for initialization
	public void Awake () {
        //Enable rift cam
        if (!GlobalConfig.Instance.UseRiftCamera)
        {
            GameObject riftCam = GameObject.Find("OVRCameraController");
            riftCam.SetActive(false);
        }
        else
        {
            GameObject projectorCamera = GameObject.Find("ProjectorCamera");
            projectorCamera.SetActive(false);
        }    
	}
}
