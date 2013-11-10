using UnityEngine;
using System.Collections;

public class RBFParamFrame : MonoBehaviour {

	// Use this for initialization
	void Start () {
		//Rbf testing
		RBF.RBFCore rbf = new RBF.RBFCore(3, 2);
		rbf.setSigma(2.0);

		rbf.addTrainingPoint( new double[3]{1.0,1.0,1.0}, new double[2]{1.0, 2.0} );
		rbf.addTrainingPoint( new double[3]{2.5,1.5,7}, new double[2]{2, 3.0} );
		rbf.addTrainingPoint( new double[3]{5,10,0}, new double[2]{10, 5.0} );
		rbf.addTrainingPoint( new double[3]{6,2,1}, new double[2]{10, 5.0});
		
		float start = Time.realtimeSinceStartup;
		rbf.calculateWeights();
		double[] output = rbf.calculateOutput(new double[3]{2.5,1.0,1.0});
		
		Debug.Log("RBF finish " + (Time.realtimeSinceStartup - start));
		
		foreach(double val in output)
			Debug.Log(val);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
