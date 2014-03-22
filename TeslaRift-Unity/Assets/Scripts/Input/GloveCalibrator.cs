using UnityEngine;
using System.Collections;

public class GloveCalibrator : MonoBehaviour {

	public bool isCalibrated = false;
	public float m_calibrateReadyCountdown = 3.0f;
	public float m_calibrateDuration = 2.0f;
	public int m_calibrationSamples;
	protected float m_currentCalibrateTime = 0.0f;

	public Hud_Glove_Calibration m_gloveCalibrateHud;
	public bool m_toggleCalibration;
	public GloveController m_leftGlove;
	public GloveController m_rightGlove;

	// Use this for initialization
	void Start () {

	}

	public void StartCalibration(){
		m_toggleCalibration = true;
	}
	
	// Update is called once per frame
	void Update () {
		if(m_toggleCalibration){
			//Countdown to calibration process
			if(m_calibrateReadyCountdown > 0.0f){
				m_calibrateReadyCountdown -= Time.deltaTime;
				m_gloveCalibrateHud.SetCalibrationReady(m_calibrateReadyCountdown);
			} else {
				//Start calibration
				if(m_leftGlove.GetCalibrationState() == GloveController.CalibrationState.AWAITING_CALIBRATION || 
				   m_rightGlove.GetCalibrationState() == GloveController.CalibrationState.AWAITING_CALIBRATION){
					m_leftGlove.ToggleCalibration();
					m_rightGlove.ToggleCalibration();
					m_currentCalibrateTime = m_calibrateDuration;
					HydraController.Instance.UnfreezeHands();
				} else {
					//Countdown to next gesture
					if(m_currentCalibrateTime > 0.0f){
						m_currentCalibrateTime -= Time.deltaTime;
						m_gloveCalibrateHud.SetCalibrationTime(m_currentCalibrateTime);
					} else {
						//All finished
						if(m_leftGlove.GetCalibrationState() == GloveController.CalibrationState.CALIBRATED || 
						   m_rightGlove.GetCalibrationState() == GloveController.CalibrationState.CALIBRATED){
							m_gloveCalibrateHud.Finished();
							m_toggleCalibration = false;
							isCalibrated = true;
						} else {
							m_leftGlove.CalibrateNext();
							m_rightGlove.CalibrateNext();
							m_currentCalibrateTime = m_calibrateDuration;
							Debug.Log(m_currentCalibrateTime);
						}
					}
				}
			}
		}
	}
}
