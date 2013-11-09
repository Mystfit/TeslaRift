using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using DotNumerics.LinearAlgebra;

public class GlobalConfig : MonoBehaviour {
	
	public bool IsClient = false;

	// Use this for initialization
	void Awake () {
		
		if(IsClient){
			GameObject.Find("__HydraController").SetActive(false);
			GameObject.Find("__InstrumentSpawner").SetActive(false);
			GameObject.Find("OVRPlayerController").SetActive(false);
			GameObject.Find("__IOController").GetComponent<OSCcontroller>().isServer = false;
			GameObject.Find("__IOController").GetComponent<OSCcontroller>().loopback = false;
			GameObject.Find("ClientCamera").SetActive(true);
#if UNITY_STANDALONE_OSX
			GameObject.Find("ClientCamera").AddComponent<Syphon>();
			GameObject.Find("ClientCamera").AddComponent<SyphonServerTexture>();
#endif
		} else {
			GameObject.Find("ClientCamera").SetActive(false);
		}
		
		GameObject.Find("OVRPlayerController").GetComponent<OVRPlayerController>().SetAllowMouseRotation(false);
	
	
		//Rbf testing
		RBF.RBFCore rbf = new RBF.RBFCore(3, 2);
		rbf.setSigma(2.0);

		rbf.addTrainingPoint( new double[3]{1.0,1.0,1.0}, new double[2]{1.0, 2.0} );
		rbf.addTrainingPoint( new double[3]{2.5,1.5,7}, new double[2]{2, 3.0} );
		rbf.addTrainingPoint( new double[3]{5,10,0}, new double[2]{10, 5.0} );
		rbf.addTrainingPoint( new double[3]{6,2,1}, new double[2]{10, 5.0});
		
		float start = Time.realtimeSinceStartup;
		rbf.calculateWeights();
		double[] output = rbf.calculateOutput(new double[3]{1.0,1.0,1.0});
		
		Debug.Log("RBF finish " + (Time.realtimeSinceStartup - start));
		
		foreach(double val in output)
			Debug.Log(val);
	}
	
	// Update is called once per frame
	void Update () {
		if(Input.GetKeyDown(KeyCode.Escape))
			Application.Quit();
		
		if(Input.GetKeyDown(KeyCode.R)){
			Application.LoadLevel(Application.loadedLevel);
		}
	}
}
