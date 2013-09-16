using UnityEngine;
using System;
using System.Collections;

public class WaveInFFTDemo : MonoBehaviour
{
	const int NUM_SAMPLES = 128; //128

	float[] calcSamples = new float[NUM_SAMPLES];
	WaveInFFTDisplay calcDisplay;

	float[] dataSamples = new float[NUM_SAMPLES];
	WaveInFFTDisplay dataDisplay;

	WaveInFFT waveInFFT;
	
	void Start(){
		waveInFFT.StartDevice(0);
	}

	void Awake ()
	{
		calcDisplay = transform.FindChild ("calc_display").GetComponent<WaveInFFTDisplay> ();
		dataDisplay = transform.FindChild ("data_display").GetComponent<WaveInFFTDisplay> ();
		
		waveInFFT = GetComponent<WaveInFFT> ();
	}

	void Update ()
	{
		waveInFFT.GetSpectrumData (calcSamples, 0);
		calcDisplay.UpdateDisplay (calcSamples, 4 * 0.5f);
		
		audio.GetSpectrumData (dataSamples, 0, FFTWindow.Rectangular);
		dataDisplay.UpdateDisplay (dataSamples, 4 * 0.5f);
	}
}
