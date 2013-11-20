using UnityEngine;
using System;
using System.Collections.Generic;


public static class Utils
{
	public static class Midi {
		public static float midiIntToFloat(int midiValue){
			return Clamp( ((float)midiValue / 127.0f), 0.0f, 1.0f);
		}
		
		public static int floatToMidiInt(float fValue){
			return Clamp( (int)(fValue * 127), 0, 127);
		}
	}

	public static float Scale(float value, float min, float max){
		return (value - min) / (max - min);
		//return Remap(value, 0.0f, 1.0f, min, max);
	}
				
	public static int Clamp(int value, int min, int max)  
	{  
    	return (value < min) ? min : (value > max) ? max : value;  
	}
	
	public static float Clamp(float value, float min, float max)  
	{  
    	return (value < min) ? min : (value > max) ? max : value;  
	}
	
	public static float Remap (float value, float from1, float to1, float from2, float to2) {
    	return (value - from1) / (to1 - from1) * (to2 - from2) + from2;
	}

	
	//Generates points on the surface of a sphere
	public static Vector3[] PointsOnSphere(int n, float scale){
		return PointsOnSphere(n, scale, 0.0f);
	}
	
	public static Vector3[] PointsOnSphere(int n, float scale, float randomness){
		Vector3[] pts = new Vector3[n];
		
		float inc = Mathf.PI * (3 - Mathf.Sqrt(5));
		float off = 2.0f / n;
		float x, y, z, r, phi;
		float randAngle;
		
		randAngle = (randomness != 0.0f) ? UnityEngine.Random.value * randomness : 1.0f;
		
		for(int k = 0; k < n; k++){
			y = k * off -1 + (off / 2);
			r = Mathf.Sqrt(1 - y * y);
			phi = k * inc * randAngle;
			x = Mathf.Cos(phi) * r;
			z = Mathf.Sin (phi) * r;
						
			pts[k] = new Vector3(x, y, z) * scale;
		}

		return pts;
	}
	
	/// <summary>
	/// Takes an array of input coordinates used to define a Catmull-Rom spline, and then
	/// samples the resulting spline according to the specified sample count (per span),
	/// populating the output array with the newly sampled coordinates. The returned boolean
	/// indicates whether the operation was successful (true) or not (false).
	/// NOTE: The first and last points specified are used to describe curvature and will be dropped
	/// from the resulting spline. Duplicate them if you wish to include them in the curve.
	/// </summary>
	public static bool CatmullRom(Vector3[] inCoordinates, out Vector3[] outCoordinates, int samples)
	{
		if (inCoordinates.Length < 4)
		{
			outCoordinates = null;
			return false;
		}
	 
		List<Vector3> results = new List<Vector3>();
	 
		for (int n = 1; n < inCoordinates.Length - 2; n++)
			for (int i = 0; i < samples; i++)
				results.Add(PointOnCurve(inCoordinates[n - 1], inCoordinates[n], inCoordinates[n + 1], inCoordinates[n + 2], (1f / samples) * i ));
	 
		results.Add(inCoordinates[inCoordinates.Length - 2]);
	 
		outCoordinates = results.ToArray();
		return true;
	}
	 
	/// <summary>
	/// Return a point on the curve between P1 and P2 with P0 and P4 describing curvature, at
	/// the normalized distance t.
	/// </summary>
	 
	public static Vector3 PointOnCurve(Vector3 p0, Vector3 p1, Vector3 p2, Vector3 p3, float t)
	{
		Vector3 result = new Vector3();
	 
		float t0 = ((-t + 2f) * t - 1f) * t * 0.5f;
		float t1 = (((3f * t - 5f) * t) * t + 2f) * 0.5f;
		float t2 = ((-3f * t + 4f) * t + 1f) * t * 0.5f;
		float t3 = ((t - 1f) * t * t) * 0.5f;
	 
		result.x = p0.x * t0 + p1.x * t1 + p2.x * t2 + p3.x * t3;
		result.y = p0.y * t0 + p1.y * t1 + p2.y * t2 + p3.y * t3;
		result.z = p0.z * t0 + p1.z * t1 + p2.z * t2 + p3.z * t3;
	 
		return result;
	}
	
	/*
	 * Color converters
	 */
	public static string intToHex(int input){
		return input.ToString("X");
	}
	
	public static Color intToColor(int input){
		return new Color( (float)((input >> 16) & 255) / 255, (float)((input >> 8) & 255) / 255, (float)((input) & 255) / 255 );
	}
}


