using UnityEngine;
using System;


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
	
	public static float Normalize(float value, float min, float max){
		return (value - min) / (max - min);
	}
				
	public static int Clamp(int value, int min, int max)  
	{  
    	return (value < min) ? min : (value > max) ? max : value;  
	}
	
	public static float Clamp(float value, float min, float max)  
	{  
    	return (value < min) ? min : (value > max) ? max : value;  
	}
	
	
	public static Vector3[] PointsOnSphere(int n){
		Vector3[] pts = new Vector3[n];
		
		float inc = Mathf.PI * (3 - Mathf.Sqrt(5));
		float off = 2.0f / n;
		float x, y, z, r, phi;
		
		for(int k = 0; k < n; k++){
			y = k * off -1 + (off / 2);
			r = Mathf.Sqrt(1 - y * y);
			phi = k * inc;
			x = Mathf.Cos(phi) * r;
			z = Mathf.Sin (phi) * r;
			
			pts[k] = new Vector3(x, y, z);
		}

		return pts;
	}
}


