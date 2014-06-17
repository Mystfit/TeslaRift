using UnityEngine;
using DotNumerics;
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

	public static string ReplaceWhitespaceSlashes(string input){
		string output = input.Replace("/", "-");
		output = input.Replace(" ", "_");
		return output;
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
