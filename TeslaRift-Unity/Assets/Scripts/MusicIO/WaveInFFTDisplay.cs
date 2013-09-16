using UnityEngine;
using System.Collections;

public class WaveInFFTDisplay : MonoBehaviour
{
	Transform[] bars;

	public void UpdateDisplay (float[] samples, float barScale)
	{
		float[] crunchedSamples = new float[4];
		
		for(int i = 0; i < 4; i++){
			for(int j = i * (samples.Length / 4); j < (i+1) * (samples.Length / 4); j++){
				crunchedSamples[i] += samples[j];
			}
		}
			
		if (null == bars || bars.Length != crunchedSamples.Length) {
			if (null != bars)
				foreach (var bar in bars)
					Destroy (bar);
			
			bars = new Transform[crunchedSamples.Length];
			for (int i = 0; i < bars.Length; i++) {
				bars[i] = GameObject.CreatePrimitive (PrimitiveType.Cube).transform;
				{
					bars[i].transform.parent = transform;
					bars[i].localPosition = new Vector3 (i, 0, 0);
					bars[i].localScale = new Vector3 (1, 0, 1);
				}
			}
		}
		
		for (int i = 0; i < bars.Length; i++) {
			bars[i].localPosition = new Vector3 (i, barScale * crunchedSamples[i] * 0.5f);
			bars[i].localScale = new Vector3 (1, barScale * crunchedSamples[i], 1);
		}
	}
}
