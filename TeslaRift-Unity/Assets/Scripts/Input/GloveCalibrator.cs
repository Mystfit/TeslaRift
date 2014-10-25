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
    public bool m_leftHandActive = true;
    public bool m_rightHandActive = true;

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
                if(m_leftHandActive || m_rightHandActive){
                    bool calibrationStart = false;
                    HydraController.Instance.UnfreezeHands();

                    if(m_leftHandActive && m_leftGlove != null){
                        if(m_leftGlove.GetCalibrationState() == GloveController.CalibrationState.AWAITING_CALIBRATION){
                            m_leftGlove.ToggleCalibration();
                            calibrationStart = true;
                        }
                    }

                    if(m_rightHandActive && m_rightGlove != null){
                        if(m_rightGlove.GetCalibrationState() == GloveController.CalibrationState.AWAITING_CALIBRATION){
                            m_rightGlove.ToggleCalibration();
                            calibrationStart = true;
                        }
                    }

                    if(calibrationStart){
                        m_currentCalibrateTime = m_calibrateDuration;
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
                                m_leftGlove.ShowDebugText(false);
                                m_rightGlove.ShowDebugText(false);
                                m_toggleCalibration = false;
                                isCalibrated = true;
                            } else {
                                m_leftGlove.CalibrateNext();
                                m_rightGlove.CalibrateNext();
                                m_currentCalibrateTime = m_calibrateDuration;
                            }
                        }   
                    }
                }
            }
        }
    }
}
