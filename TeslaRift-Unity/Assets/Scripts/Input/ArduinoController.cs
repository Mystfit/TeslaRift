using UnityEngine;
using System.Collections;
using Uniduino;
using RBF;
using System;
 
public class ArduinoController : MonoBehaviour {
 
    private Arduino arduino;
	
	//Arduino pins
	private int[] m_bendPins = {1,0,3,2};
	private int m_bendCalibratePin = 18;
	
	private enum CalibrationState{
		AWAITING_CALIBRATION = 0,
		CALIBRATING,
		CALIBRATED
	}
	private CalibrationState m_calibrationState = CalibrationState.AWAITING_CALIBRATION;
	private double[] m_bendValues;
	
	public bool m_toggleCalibration = false;
	public bool m_toggleNextGestureCalibration = false;
	
	//RBF gestures
	private RBFCore m_rbf;
	public enum Gestures {
		OPEN_PALM = 0,
		CLOSED_GRASP,
		INDEX_ONLY,
		PINKY_ONLY,
		INDEX_MIDDLE,
		ROCK_ON
	}
	private Gestures m_currentGesture;
	private Gestures m_lastGesture;
	private float[] m_gestureValues;	
	private int m_calibratingGestureIndex;
	private bool bIsCalibrateButtonDown = false;
	private bool bIsCalibrateButtonLast = false;
	public double m_gestureThreshold = 0.8;
	public double m_sigma = 0.5;
		
    void Start( )
    {		
        arduino = Arduino.global;
		arduino.Setup(ConfigurePins);
		m_rbf = new RBFCore(m_bendPins.Length, Enum.GetNames(typeof(Gestures)).Length);
		m_rbf.setSigma(m_sigma);
		m_bendValues = new double[m_bendPins.Length];
    }
	
	
	/*
	 * Set up pins
	 */
	protected void ConfigurePins( )
    {
		for(int i = 0; i < m_bendPins.Length; i++){
			arduino.pinMode(m_bendPins[i], PinMode.ANALOG);
			arduino.reportAnalog(m_bendPins[i], 1);
		}
    }
	
	
	void Update () 
	{       
		if(arduino != null){
			if(arduino.Connected){
				bIsCalibrateButtonDown = Convert.ToBoolean(arduino.digitalRead(m_bendCalibratePin));
				
				for(int i = 0; i < m_bendValues.Length; i++)
					m_bendValues[i] = (double)arduino.analogRead(m_bendPins[i]);
				
				if(m_toggleCalibration){
					m_toggleCalibration = false;
					m_calibrationState = CalibrationState.CALIBRATING;
					m_calibratingGestureIndex = 0;
					Debug.Log("Glove calibration start:");
					Debug.Log("Calibrate " + Enum.GetNames(typeof(Gestures))[m_calibratingGestureIndex]);
				}
					
				//Calibration
				switch(m_calibrationState){
				
				case CalibrationState.AWAITING_CALIBRATION:
					if( Convert.ToBoolean(arduino.digitalRead(m_bendCalibratePin ) ) ){
						m_calibrationState = CalibrationState.CALIBRATING;
					}
					break;
				
				case CalibrationState.CALIBRATING:
					if(m_toggleNextGestureCalibration || Input.GetKeyDown(KeyCode.RightArrow))					//Keyboard calibration trigger
					//if(bIsCalibrateButtonDown = false && bIsCalibrateButtonLast != bIsCalibrateButtonDown)	//Arduino calibration trigger
					{					
						m_toggleNextGestureCalibration = false;
						
						m_rbf.addTrainingPoint(m_bendValues, GetRBFCalibrationArray( m_calibratingGestureIndex));
						m_calibratingGestureIndex++;
		
						if(m_calibratingGestureIndex < Enum.GetNames(typeof(Gestures)).Length){
							
							Debug.Log("Calibrate " + Enum.GetNames(typeof(Gestures))[m_calibratingGestureIndex]);
							//Need some sort of gui text display for the current finger gesture to calibrate.
							//Best way would be to show the gesture on the model for the performer to imitate before calibrating
						} else {
							m_calibrationState = CalibrationState.CALIBRATED;
							m_rbf.calculateWeights();
							Debug.Log("Calibration complete!");
						}
					}
					break;			
				
				case CalibrationState.CALIBRATED:	
					
					double[] gestureOutput = m_rbf.calculateOutput(m_bendValues);
					
					double largestVal = 0.0;
					int largestIndex = 0;
					
					for(int i = 0; i < gestureOutput.Length; i++){
						if(gestureOutput[i] > largestVal){
							largestVal = gestureOutput[i];
							largestIndex = i;
						}
					}
					
					/*string output = "";
					foreach(double val in gestureOutput)
						output += val + " ";
					Debug.Log(output);
					*/
					
					//if(largestVal > m_gestureThreshold){
						m_lastGesture = m_currentGesture;
						m_currentGesture = (Gestures)largestIndex;
						Debug.Log(m_currentGesture);
					//}
					break;
				}
				
				bIsCalibrateButtonLast = bIsCalibrateButtonDown;
			}
		}
	}
					
	
	/*
	 * Gets an array with the chosen gesture index set to 1.0. Used for finger RBF gesture matching
	 */
	protected double[] GetRBFCalibrationArray(int gestureIndex){
		double[] calibrationArr = new double[Enum.GetNames(typeof(Gestures)).Length];
		calibrationArr[gestureIndex] = 1.0;
		return calibrationArr;
	}
}