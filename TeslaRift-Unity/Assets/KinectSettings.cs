using UnityEngine;
using System.Collections;

public class KinectSettings : MonoBehaviour {

	// Use this for initialization
	void Awake () {
        KinectSensor sensor = GetComponent<KinectSensor>();
        sensor.sensorHeight = GlobalConfig.Instance.KinectHeight;
        sensor.kinectCenter = new Vector3(GlobalConfig.Instance.KinectXFromCenter, 0.0f, GlobalConfig.Instance.KinectZFromCenter);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
