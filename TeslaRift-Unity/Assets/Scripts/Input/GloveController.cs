using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Uniduino;
using RBF;
using System;
 
public class GloveController : MonoBehaviour {
 	
	//Arduino
	private int[] m_bendPins = {1,0,3,2};
	private int m_bendCalibratePin = 18;
	private double[] m_bendValues;
	private Arduino m_arduino;

	//Calibration state
	public enum CalibrationState{
		AWAITING_CALIBRATION = 0,
		CALIBRATING,
		CALIBRATED
	}
	protected CalibrationState m_calibrationState = CalibrationState.AWAITING_CALIBRATION;
	public CalibrationState GetCalibrationState(){ return m_calibrationState; }
	private List<double[]> m_currentCalibrationSamples;
	protected int m_calibrationSamples = 60;
	protected bool bIsCollectingSamples;
	protected double[] m_calibrationAvg;

	//RBF
	private RBFCore m_rbf;
	private string m_currentGesture;
	private string m_lastGesture;
	private string m_lastGestureDown;
	private int m_currentGestureTimer = 0;
	public string m_activeGesture;
	private string m_activeGestureDown;
	private bool m_isDirty = true;

	//Gesture change speeds
	private double[] m_lastGestureOutput;
	private double[] m_gestureVelocity;
	public double activeGestureVelocity;

	private int m_calibratingGestureIndex;
	private bool bIsCalibrateButtonLast = false;
	
	public string[] m_gestures;
	public bool m_toggleCalibration = false;
	public bool m_toggleNextGestureCalibration = false;
	public double m_sigma = 0.5;
	public int m_gestureSwitchDelay = 0;
		
    void Awake( )
    {	
		m_arduino = GetComponent<Arduino>();
		if(m_arduino == null)
			throw new Exception("No arduino component found on glove!");
		
		m_arduino.Setup(ConfigurePins);
		m_rbf = new RBFCore(m_bendPins.Length, m_gestures.Length);
		m_rbf.setSigma(m_sigma);
		m_bendValues = new double[m_bendPins.Length];
		m_gestureVelocity = new double[m_gestures.Length];
		m_lastGestureOutput = new double[m_gestures.Length];
		m_currentCalibrationSamples = new List<double[]>();
    }
	
	
	/*
	 * Set up pins
	 */
	protected void ConfigurePins( )
    {
		for(int i = 0; i < m_bendPins.Length; i++){
			m_arduino.pinMode(m_bendPins[i], PinMode.ANALOG);
			m_arduino.reportAnalog(m_bendPins[i], 1);
		}
    }

	public void ToggleCalibration(){
		m_toggleCalibration = true;
	}
	
	public void CalibrateNext(){
		m_toggleNextGestureCalibration = true;
	}

	void Update () 
	{       
		if(m_arduino.Connected){
			for(int i = 0; i < m_bendValues.Length; i++)
				m_bendValues[i] = (double)m_arduino.analogRead(m_bendPins[i]);
			
			if(m_toggleCalibration){
				m_toggleCalibration = false;
				m_toggleNextGestureCalibration = true;
				m_calibrationState = CalibrationState.CALIBRATING;
				m_calibratingGestureIndex = 0;
				Debug.Log("Glove calibration start:");

				//Set first gesture that needs to be calibrated
				m_activeGesture = m_gestures[m_calibratingGestureIndex];
				Debug.Log("Calibrate " + m_gestures[m_calibratingGestureIndex]);
			}
				
			//Calibration
			switch(m_calibrationState){
			
			case CalibrationState.AWAITING_CALIBRATION:
				if( Convert.ToBoolean( m_arduino.digitalRead(m_bendCalibratePin ) ) || Input.GetKeyDown(KeyCode.RightArrow) ){
					m_calibrationState = CalibrationState.CALIBRATING;
				}
				break;
			
			case CalibrationState.CALIBRATING:

				if(m_toggleNextGestureCalibration){
					//Start recording samples to calculate the averages per bend sensor.
					if(m_currentCalibrationSamples.Count == 0){
						bIsCollectingSamples = true;
					}

					if(bIsCollectingSamples){
						if(m_currentCalibrationSamples.Count < m_calibrationSamples){
							m_currentCalibrationSamples.Add(m_bendValues.Clone() as Double[]);
						} else {
							double[] m_calibrationTotal = new double[m_bendValues.Length];
							m_calibrationAvg = new double[m_bendValues.Length];
							foreach(double[] vals in m_currentCalibrationSamples){
								for(int i = 0; i < vals.Length; i++){
									m_calibrationTotal[i] += vals[i];
								}
							}
							for(int i =0; i < m_calibrationTotal.Length; i++){
								m_calibrationAvg[i] = m_calibrationTotal[i] / m_calibrationSamples;
							}
							bIsCollectingSamples = false;
						}	
					} else {
						//Samples recorded, save into RBF engine.
						m_toggleNextGestureCalibration = false;
						
						m_rbf.addTrainingPoint(m_calibrationAvg, GetRBFCalibrationArray( m_calibratingGestureIndex));
						m_currentCalibrationSamples.Clear();
						m_calibratingGestureIndex++;
						
						if(m_calibratingGestureIndex < m_gestures.Length){
							m_activeGesture = m_gestures[m_calibratingGestureIndex];
							Debug.Log("Calibrate " + m_gestures[m_calibratingGestureIndex]);
							//Need some sort of gui text display for the current finger gesture to calibrate.
							//Best way would be to show the gesture on the model for the performer to imitate before calibrating
						} else {
							m_calibrationState = CalibrationState.CALIBRATED;
							m_rbf.calculateWeights();
							Debug.Log("Calibration complete!");
						}
					}
				} 
				break;			
			
			case CalibrationState.CALIBRATED:	
				double[] gestureOutput = m_rbf.calculateOutput(m_bendValues);

				//Calculate gesture change velocities
				for(int i = 0; i < m_gestures.Length; i++){
					m_gestureVelocity[i] = gestureOutput[i] - m_lastGestureOutput[i];
					if(m_gestureVelocity[i] < 0) m_gestureVelocity[i] *= -1.0;
				}

				m_lastGestureOutput = gestureOutput;

				double largestVal = 0.0;
				int activeIndex = 0;
				
				for(int i = 0; i < gestureOutput.Length; i++){
					if(gestureOutput[i] > largestVal){
						largestVal = gestureOutput[i];
						activeIndex = i;
					}
				}

				m_currentGesture = m_gestures[activeIndex];
				
				//Delay the reported gesture change by a frame count to let the RBF settle
				if(m_currentGesture != m_lastGesture)
					m_currentGestureTimer = 0;
				else 
					m_currentGestureTimer++;
				
				if(m_currentGestureTimer > m_gestureSwitchDelay){
					m_activeGesture = m_currentGesture;
					
					if(m_activeGesture != m_lastGestureDown){
						m_activeGestureDown = m_activeGesture;
						activeGestureVelocity = m_gestureVelocity[activeIndex];
						SetDirty();
						//SetCollider(activeIndex);
					} else {
						m_activeGestureDown = "";
						SetClean();
					}
					
					m_lastGestureDown = m_currentGesture;
				}
				
				m_lastGesture = m_currentGesture;
				
				break;
			}
		}
	}


	/*
	 * Collider center/size for different gestures
	 */
	public void SetCollider(int gestureIndex){
		SetCollider(m_gestures[gestureIndex]);
	}

	public void SetCollider(string gesture){
		BoxCollider col = collider as BoxCollider;
		switch(gesture){
		case "IDLE_HAND":
			col.center  = new Vector3(0.0f, 0.01f, 0.06f);
			col.size = new Vector3(0.11f, -0.03f, 0.11f);
			break;
		case "CLOSED_HAND":
			col.center = new Vector3(0.0f, -0.02f, 0.0f);
			col.size = new Vector3(0.11f, 0.05f, 0.08f);
			break;
		case "INDEX_POINT":
			col.center = new Vector3(0.03f, -0.01f, 0.03f);
			col.size = new Vector3(0.025f, 0.07f, 0.15f);
			break;
		case "INDEX_MIDDLE":
			col.center = new Vector3(0.02f, 0.0f, 0.07f);
			col.size = new Vector3(0.05f, 0.05f, 0.15f);
			break;
		case "THREE_SWIPE":
			col.center = new Vector3(0.01f, 0.0f, 0.07f);
			col.size = new Vector3(0.075f, 0.05f, 0.15f);
			break;
		case "PINKY":
			col.center = new Vector3(-0.035f, 0.0f, 0.07f);
			col.size = new Vector3(0.025f, 0.05f, 0.15f);
			break;
		case "ROCK_ON":
			col.center = new Vector3(0.0f, 0.01f, 0.06f);
			col.size = new Vector3(0.11f, -0.03f, 0.11f);
			break;
		}
	}
	
	
		
	/*
	 * Getters
	 */
	public string activeGesture{ get { return m_activeGesture; }}
	public string[] gestureTypes{ get { return m_gestures; }}
	public bool GetGestureDown(string gesture){ 
		if(m_activeGestureDown == gesture && m_activeGestureDown != "")
			return true;
		return false;
	}
	public double[] GetRawGestures(){
		return m_lastGestureOutput;
	}
	
	public string GetGestureName(int index){
		if(index < m_gestures.Length)
			return m_gestures[index];
		return null;
	}

	/*
	 * GestureState notifiers
	 */
	private void SetDirty(){ m_isDirty = true; }
	private void SetClean(){ m_isDirty = false; }
	public bool IsGestureClean(){ return m_isDirty; }

	/*
	 * Gets an array with the chosen gesture index set to 1.0. Used for finger RBF gesture matching
	 */
	protected double[] GetRBFCalibrationArray(int gestureIndex){
		double[] calibrationArr = new double[m_gestures.Length];
		calibrationArr[gestureIndex] = 1.0;
		return calibrationArr;
	}
}