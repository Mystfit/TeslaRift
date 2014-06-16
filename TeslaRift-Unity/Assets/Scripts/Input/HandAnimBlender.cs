using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;

public class HandAnimBlender : MonoBehaviour {

	protected List<double[]> m_rollingAverage;
	public int m_smoothingSamples = 5;

	protected string[] m_gestureNames;
	protected GloveController m_glove;

	// Use this for initialization
	void Start () {
		m_rollingAverage = new List<double[]>();
		m_glove = GetComponent<GloveController>();

		foreach(string gesture in m_glove.gestureTypes){
			animation.Play(gesture);
			animation[gesture].layer = 1;
			animation[gesture].blendMode = AnimationBlendMode.Blend;
		}
	}
	
	public void SetWeights(double[] weights){
		for(int i = 0; i < m_glove.gestureTypes.Length; i++){
			animation[m_glove.gestureTypes[i]].weight = Convert.ToSingle(weights[i]);
		}	
	}
	
	// Update is called once per frame
	void Update () {

		m_rollingAverage.Add(m_glove.GetRawGestures());
		if(m_rollingAverage.Count > m_smoothingSamples){
			m_rollingAverage.RemoveAt(0);
		}
		double[] totalVals = new double[m_glove.GetRawGestures().Length];
		double[] avgValues = new double[m_glove.GetRawGestures().Length];

		foreach(double[] vals in m_rollingAverage){
			for(int i = 0; i < vals.Length; i++){
				totalVals[i] += vals[i];
			}
		}

		for(int i=0; i < totalVals.Length; i++){
			avgValues[i] = totalVals[i] / m_rollingAverage.Count;
		}

		SetWeights(avgValues);
	}
}
