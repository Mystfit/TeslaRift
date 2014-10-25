using UnityEngine;
using System.Collections;

public class KinectSettings : MonoBehaviour {

	// Use this for initialization
	void Awake () {
        if (GlobalConfig.Instance.UseKinectCamera)
        {
            KinectSensor sensor = GetComponent<KinectSensor>();
            sensor.sensorHeight = GlobalConfig.Instance.KinectHeight;
            sensor.kinectCenter = new Vector3(GlobalConfig.Instance.KinectXFromCenter, 0.0f, GlobalConfig.Instance.KinectZFromCenter);
        }
        else
        {
            GameObject.Find("KinectPointMan").SetActive(false);
            gameObject.SetActive(false);
        }
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
