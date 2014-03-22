using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;

public class HandAnimBlender : MonoBehaviour {

	protected List<double[]> m_rollingAverage;
	public int m_smoothingSamples = 5;

	[Range(0.0f, 1.0f)]
	public float weightA;

	[Range(0.0f, 1.0f)]
	public float weightB;

	[Range(0.0f, 1.0f)]
	public float weightC;

	[Range(0.0f, 1.0f)]
	public float weightD;

	[Range(0.0f, 1.0f)]
	public float weightE;

	[Range(0.0f, 1.0f)]
	public float weightF;

	[Range(0.0f, 1.0f)]
	public float weightG;

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

//		animation.Play("idle");
//		animation["idle"].layer = 1;
//		animation["idle"].blendMode = AnimationBlendMode.Additive;
//
//		animation.Play("grasp");
//		animation["grasp"].layer = 2;
//		animation["grasp"].blendMode = 
//
//		animation.Play("index_point");
//		animation["index_point"].layer = 2;
//		animation["index_point"].blendMode = AnimationBlendMode.Blend;
//	
//		animation.Play("index_middle");
//		animation["index_middle"].layer = 3;
//		animation["index_middle"].blendMode = AnimationBlendMode.Blend;

		//animation.Sample();
	}
	
	public void SetWeights(double[] weights){
		if(weights.Length == animation.GetClipCount()){
			for(int i = 0; i < weights.Length; i++){
				animation[m_glove.gestureTypes[i]].weight = Convert.ToSingle(weights[i]);
			}
		} else {
			Debug.LogError("Mismatched animation weight count");
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

		weightA = animation["IDLE_HAND"].weight;
		weightB = animation["CLOSED_HAND"].weight;
		weightC = animation["INDEX_POINT"].weight;
		weightD = animation["INDEX_MIDDLE"].weight;
		weightE = animation["THREE_SWIPE"].weight;
		weightF = animation["PINKY"].weight;
		weightG = animation["ROCK_ON"].weight;

//		animation["IDLE_HAND"].weight = weightA;
//		animation["CLOSED_HAND"].weight = weightB;
//		animation["INDEX_POINT"].weight = weightC;
//		animation["INDEX_MIDDLE"].weight = weightD;
//		animation["THREE_SWIPE"].weight = weightE;
//		animation["PINKY"].weight = weightF;
//		animation["ROCK_ON"].weight = weightG;
	}
}
