using UnityEngine;
using System.Collections;
using Uniduino;
using RBF;
using System;
 
public class ArduinoController : MonoBehaviour {
 
    private Arduino arduino;
	
	//Arduino pins
	private int[] m_bendPins = {14,15,16,17};
	private int m_bendCalibratePin = 18;
	
	private enum CalibrationState{
		AWAITING_CALIBRATION = 0,
		CALIBRATING,
		CALIBRATED
	}
	private CalibrationState m_calibrationState = CalibrationState.AWAITING_CALIBRATION;
	private double[] m_bendValues;
	
	//RBF gestures
	private RBFCore m_rbf;
	public enum Gestures {
		OPEN_PALM = 0,
		CLOSED_GRASP,
		INDEX_ONLY,
		MIDDLE_ONLY,
		PINKY_ONLY,
		INDEX_MIDDLE,
		INDEX_PINKY,
		INDEX_MIDDLE_RING
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
		m_rbf.setSigma(m_sigma);
		m_rbf = new RBFCore(m_bendPins.Length, Enum.GetNames(typeof(Gestures)).Length);
		m_bendValues = new double[m_bendPins.Length];
    }
	
	
	/*
	 * Set up pins
	 */
	protected void ConfigurePins( )
    {
		for(int i = 0; i < m_bendPins.Length; i++){
			arduino.pinMode(m_bendPins[i], PinMode.ANALOG);
			arduino.reportAnalog((byte)(m_bendPins[i]/8), 1);
		}
    }
	
	
	void Update () 
	{       
		bIsCalibrateButtonDown = Convert.ToBoolean(arduino.digitalRead(m_bendCalibratePin));
		
		for(int i = 0; i < m_bendValues.Length; i++)
			m_bendValues[i] = (double)arduino.analogRead(m_bendPins[i]);
			
		//Calibration
		switch(m_calibrationState){
		
		case CalibrationState.AWAITING_CALIBRATION:
			if(arduino != null){
				if(arduino.Connected){
					if( Convert.ToBoolean(arduino.digitalRead(m_bendCalibratePin ) ) ){
						m_calibrationState = CalibrationState.CALIBRATING;
					}
				}
			}
			break;
		
		case CalibrationState.CALIBRATING:
			if(bIsCalibrateButtonDown = false && bIsCalibrateButtonLast != bIsCalibrateButtonDown)
			{					
				m_rbf.addTrainingPoint(m_bendValues, GetRBFCalibrationArray( m_calibratingGestureIndex));

				if(m_calibratingGestureIndex < Enum.GetNames(typeof(Gestures)).Length){
					m_calibratingGestureIndex++;
					//Need some sort of gui text display for the current finger gesture to calibrate.
					//Best way would be to show the gesture on the model for the performer to imitate before calibrating
				} else {
					m_calibrationState = CalibrationState.CALIBRATED;
					m_rbf.calculateWeights();
				}
			}
			break;			
		
		case CalibrationState.CALIBRATED:
			
			double[] gestureOutput = m_rbf.calculateOutput(m_bendValues);
			
			double largestVal = 0.0;
			int largestIndex = 0;
			for(int i = 0; i < gestureOutput.Length; i++){
				if(m_bendValues[i] > largestVal){
					largestVal = m_bendValues[i];
					largestIndex = i;
				}
			}
			
			if(largestVal > m_gestureThreshold){
				m_lastGesture = m_currentGesture;
				m_currentGesture = (Gestures)largestIndex;
			}
			break;
		}
		
		bIsCalibrateButtonLast = bIsCalibrateButtonDown;
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