using UnityEngine;
using System.Collections;

public class TestGeneratorChain : MonoBehaviour {
	
	private FFTGenerator bass;
	private FFTGenerator mid;
	private FFTGenerator treb;
	private WaveGenerator wave;
	private BeatGenerator beat;

	// Use this for initialization
	void Start () {
		bass = GameObject.Find("_bassGenerator").GetComponent<FFTGenerator>();
		mid = GameObject.Find("_midGenerator").GetComponent<FFTGenerator>();
		treb = GameObject.Find("_trebGenerator").GetComponent<FFTGenerator>();
		wave = GameObject.Find("_waveGenerator").GetComponent<WaveGenerator>();
		beat = GameObject.Find("_beatGenerator").GetComponent<BeatGenerator>();
	}
	
	// Update is called once per frame
	void Update () {
		//bass.SetOutputTarget(wave);
		//wave.SetOutputTarget(beat);
	}
}
