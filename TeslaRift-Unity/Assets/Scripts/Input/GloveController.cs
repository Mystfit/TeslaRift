using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Uniduino;
using RBF;
using System;
 
public class GloveController : MonoBehaviour {
    
    //Arduino
    private int[] m_bendPins = {1,0,3,2};
    public double[] bendValues { get { return m_bendValues;  } }
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
    public int m_calibrationSamples = 60;
    protected bool bIsCollectingSamples;
    protected double[] m_calibrationAvg;
    private SixenseHands m_hand;

    //RBF
    private RBFCore m_rbf;
    private string m_currentGesture;
    private string m_lastGesture;
    private string m_lastGestureDown;
    private int m_currentGestureTimer = 0;
    public string m_activeGesture;
    private string m_activeGestureDown;
    private bool m_isDirty = true;
    public string m_rbfFilePath = "";
    public bool m_loadRbfFromFile = false;

    public int gestureIndex(string gestureName){ return m_gestureIndexLookup[gestureName]; }
    protected Dictionary<string, int> m_gestureIndexLookup;

    //Gesture change speeds
    private double[] m_lastGestureOutput;
    private double[] m_gestureVelocity;
    public double activeGestureVelocity;

    private int m_calibratingGestureIndex;

    public string[] m_gestures;
    public bool m_toggleCalibration = false;
    public bool m_toggleNextGestureCalibration = false;
    public double m_sigma = 0.5;
    public int m_gestureSwitchDelay = 0;
    
    //Collision positions
    public Transform[] m_joints;

    //Meshes
    public GameObject m_fingerBase;
    public GameObject m_fingerIndex;
    public GameObject m_fingerMiddle;
    public GameObject m_fingerRing;
    public GameObject m_fingerPinky;

    //Finger colors
    public Color m_fingerActiveColor;
    public Color m_fingerInactiveColor;
    public Color m_handHoverColor;
    public float m_handHoverOutlineSize;
    public float m_handOutlineSize;

    //Debug Hud objects
    private GameObject m_hudSliders;
    private GameObject m_activeGestureText;
        
    void Awake( )
    {   
        

        m_rbf = new RBFCore(m_bendPins.Length, m_gestures.Length);
        m_rbf.setSigma(m_sigma);
        m_bendValues = new double[m_bendPins.Length];
        m_gestureVelocity = new double[m_gestures.Length];
        m_lastGestureOutput = new double[m_gestures.Length];
        m_currentCalibrationSamples = new List<double[]>();
        m_gestureIndexLookup = new Dictionary<string, int>();
        
        for(int i = 0; i < m_gestures.Length; i++)
            m_gestureIndexLookup[m_gestures[i]] = i;

        Transform hudSliderTransform = transform.Find("ges_sliders");
        if(hudSliderTransform != null)
            m_hudSliders = hudSliderTransform.gameObject;

        Transform activeGestureTex = transform.Find("active_gesture_text");
        if (activeGestureTex != null)
            m_activeGestureText = activeGestureTex.gameObject;

        m_hand = GetComponent<HydraHand>().Hand;

        //Start Arduino
        m_arduino = GetComponent<Arduino>();
        if (m_arduino == null)
            throw new Exception("No arduino component found on glove!");
        if (!GlobalConfig.Instance.UseRemoteInput)
        {
            if (m_hand == SixenseHands.LEFT)
                m_arduino.PortName = GlobalConfig.Instance.LeftComPort;
            else
                m_arduino.PortName = GlobalConfig.Instance.RightComPort;

            m_arduino.Setup(ConfigurePins);
            m_arduino.Connect();
        }

        //Load cached RBF glove values
        if (m_loadRbfFromFile)
            LoadRBF();
    }


    public bool LoadRBF()
    {
        if (m_rbfFilePath != String.Empty)
        {
            if (m_rbf.LoadRBF(m_rbfFilePath))
            {
                m_calibrationState = CalibrationState.CALIBRATED;
                Debug.Log("Glove RBF loaded from file");
                return true;
            }
        }

        return false;
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

    public void ToggleDebugText()
    {
        ShowDebugText(!bIsDebugTextVisible);
    }

    public void ShowDebugText(bool state)
    {
        if (m_hudSliders != null)
        {
            m_hudSliders.SetActive(state);
            m_activeGestureText.SetActive(state);
        }
        bIsDebugTextVisible = state;
    }
    private bool bIsDebugTextVisible = false;

    public void ToggleCalibration(){
        m_toggleCalibration = true;
    }
    
    public void CalibrateNext(){
        m_toggleNextGestureCalibration = true;
    }

    void Update () 
    {
        if (m_arduino.Connected || GlobalConfig.Instance.UseRemoteInput)
        {
            if (GlobalConfig.Instance.UseRemoteInput)
                m_bendValues = HydraGloveNode.Instance.gloveBendValues(m_hand);
            else
            {
                for (int i = 0; i < m_bendValues.Length; i++)
                    m_bendValues[i] = (double)m_arduino.analogRead(m_bendPins[i]);
            }
            
            if(m_toggleCalibration){
                m_toggleCalibration = false;
                //m_toggleNextGestureCalibration = true;
                m_calibrationState = CalibrationState.CALIBRATING;
                m_calibratingGestureIndex = 0;
                Debug.Log("Glove calibration start:");

                //Set first gesture that needs to be calibrated
                m_activeGesture = m_gestures[m_calibratingGestureIndex];
                Debug.Log("Calibrate " + m_gestures[m_calibratingGestureIndex]);
                animation.Play(activeGesture);
            }
                
            //Calibration
            switch(m_calibrationState){
            
            case CalibrationState.AWAITING_CALIBRATION:
                break;
            
            case CalibrationState.CALIBRATING:

                if(m_toggleNextGestureCalibration){
                    //Start recording samples to calculate the averages per bend sensor.
                    if(m_currentCalibrationSamples.Count == 0){
                        bIsCollectingSamples = true;
                    }

                    if(bIsCollectingSamples){
                        if(m_currentCalibrationSamples.Count < m_calibrationSamples){
                            double[] sensorValues = m_bendValues.Clone() as Double[];
                            m_currentCalibrationSamples.Add(sensorValues);
                            //m_rbf.addTrainingPoint(sensorValues, BuildRBFGestureOuput(m_calibratingGestureIndex));

                            string vals = "";
                            int count = 0;
                            foreach(double n in sensorValues){
                                vals += n.ToString() + ", ";
                                count++;
                            }
                        } 
                        else {
                            double[] m_calibrationTotal = new double[m_bendValues.Length];
                            m_calibrationAvg = new double[m_bendValues.Length];
                            foreach (double[] vals in m_currentCalibrationSamples)
                            {
                                for (int i = 0; i < vals.Length; i++)
                                {
                                    m_calibrationTotal[i] += vals[i];
                                }
                            }
                            for (int i = 0; i < m_calibrationTotal.Length; i++)
                            {
                                m_calibrationAvg[i] = m_calibrationTotal[i] / m_calibrationSamples;
                            }
                            bIsCollectingSamples = false;
                        }   
                    } else {
                        //Samples recorded, save into RBF engine.
                        m_toggleNextGestureCalibration = false;
                        
                        m_rbf.addTrainingPoint(m_calibrationAvg, BuildRBFGestureOuput( m_calibratingGestureIndex));
                        m_currentCalibrationSamples.Clear();
                        m_calibratingGestureIndex++;
                        
                        if(m_calibratingGestureIndex < m_gestures.Length){
                            m_activeGesture = m_gestures[m_calibratingGestureIndex];
                            animation.Play(activeGesture);

                            Debug.Log("Calibrate " + m_gestures[m_calibratingGestureIndex]);
                        } else {
                            m_calibrationState = CalibrationState.CALIBRATED;
                            m_rbf.calculateWeights();
                            Debug.Log("Calibration complete!");

                            if (m_rbfFilePath != String.Empty)
                                m_rbf.SaveRBF(m_rbfFilePath);
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
        string gestureName = m_gestures[gestureIndex];

        BoxCollider col = collider as BoxCollider;
        switch (gestureName)
        {
            case "IDLE_HAND":
                col.center =  transform.InverseTransformPoint(m_joints[gestureIndex].transform.position); //new Vector3(0.0f, 0.01f, 0.06f);
                col.size = new Vector3(0.11f, -0.03f, 0.23f);
                SetFingerLight(new float[]{0.0f, 0.0f, 0.0f, 0.0f});
                break;
            case "CLOSED_HAND":
                col.center = transform.InverseTransformPoint(m_joints[gestureIndex].transform.position); //new Vector3(0.0f, -0.02f, 0.0f);
                col.size = new Vector3(0.13f, 0.05f, 0.1f);
                break;
            case "INDEX_POINT":
                col.center = transform.InverseTransformPoint(m_joints[gestureIndex].transform.position); //new Vector3(0.03f, -0.01f, 0.03f);
                col.size = new Vector3(0.025f, 0.035f, 0.15f);
                SetFingerLight(new float[]{1.0f, 0.0f, 0.0f, 0.0f});
                break;
            case "INDEX_MIDDLE":
                col.center = transform.InverseTransformPoint(m_joints[gestureIndex].transform.position); //new Vector3(0.02f, 0.0f, 0.07f);
                col.size = new Vector3(0.05f, 0.04f, 0.15f);
                SetFingerLight(new float[]{1.0f, 1.0f, 0.0f, 0.0f});
                break;
            case "THREE_SWIPE":
                col.center = transform.InverseTransformPoint(m_joints[gestureIndex].transform.position); //new Vector3(0.01f, 0.0f, 0.07f);
                col.size = new Vector3(0.075f, 0.05f, 0.15f);
                SetFingerLight(new float[] { 1.0f, 1.0f, 1.0f, 0.0f });
                break;
            case "PINKY":
                col.center = transform.InverseTransformPoint(m_joints[gestureIndex].transform.position); //new Vector3(-0.035f, 0.0f, 0.07f);
                col.size = new Vector3(0.025f, 0.05f, 0.15f);
                SetFingerLight(new float[] { 0.0f, 0.0f, 0.0f, 1.0f });
                break;
            case "ROCK_ON":
                col.center = transform.InverseTransformPoint(m_joints[gestureIndex].transform.position); //new Vector3(0.0f, 0.01f, 0.06f);
                col.size = new Vector3(0.11f, -0.03f, 0.11f);
                SetFingerLight(new float[] { 1.0f, 0.0f, 0.0f, 1.0f });
                break;
            case "PLAY_1":
                col.center = transform.InverseTransformPoint(m_joints[gestureIndex].transform.position); 
                col.size = new Vector3(0.025f, 0.07f, 0.15f);
                SetFingerLight(new float[]{0.8f, 0.0f, 0.0f, 0.0f});
                break;
            case "PLAY_2":
                col.center = transform.InverseTransformPoint(m_joints[gestureIndex].transform.position); 
                col.size = new Vector3(0.025f, 0.07f, 0.15f);
                SetFingerLight(new float[] { 0.0f, 0.8f, 0.0f, 0.0f });
                break;
            case "PLAY_3":
                col.center = transform.InverseTransformPoint(m_joints[gestureIndex].transform.position); 
                col.size = new Vector3(0.025f, 0.07f, 0.15f);
                SetFingerLight(new float[] { 0.0f, 0.0f, 0.8f, 0.0f });
                break;
            case "PLAY_4":
                col.center = transform.InverseTransformPoint(m_joints[gestureIndex].transform.position);
                col.size = new Vector3(0.025f, 0.07f, 0.15f);
                break;
			default:
				SetFingerLight(new float[] { 0.0f, 0.0f, 0.0f, 0.0f });
				break;
        }
    }

    public void SetFingerLight(float[] strength)
    {
        if (GlobalConfig.Instance.EnableAnimations)
        {
            iTween.ColorTo(m_fingerIndex, iTween.Hash("color", Color.Lerp(m_fingerInactiveColor, m_fingerActiveColor, strength[0]), "time", 0.1f, "easetype", "easeOutCubic"));
            iTween.ColorTo(m_fingerMiddle, iTween.Hash("color", Color.Lerp(m_fingerInactiveColor, m_fingerActiveColor, strength[1]), "time", 0.1f, "easetype", "easeOutCubic"));
            iTween.ColorTo(m_fingerRing, iTween.Hash("color", Color.Lerp(m_fingerInactiveColor, m_fingerActiveColor, strength[2]), "time", 0.1f, "easetype", "easeOutCubic"));
            iTween.ColorTo(m_fingerPinky, iTween.Hash("color", Color.Lerp(m_fingerInactiveColor, m_fingerActiveColor, strength[3]), "time", 0.1f, "easetype", "easeOutCubic"));
        }
        else {
            m_fingerIndex.renderer.material.SetColor("_Color", Color.Lerp(m_fingerInactiveColor, m_fingerActiveColor, strength[0]));
            m_fingerMiddle.renderer.material.SetColor("_Color", Color.Lerp(m_fingerInactiveColor, m_fingerActiveColor, strength[1]));
            m_fingerRing.renderer.material.SetColor("_Color", Color.Lerp(m_fingerInactiveColor, m_fingerActiveColor, strength[2]));
            m_fingerPinky.renderer.material.SetColor("_Color", Color.Lerp(m_fingerInactiveColor, m_fingerActiveColor, strength[3]));
        }
    }

    public void StartHover()
    {
        if (GlobalConfig.Instance.EnableAnimations)
        {
            iTween.ValueTo(gameObject, iTween.Hash("from", 0.0f, "to", m_handHoverOutlineSize, "time", 0.1f, "onupdate", "SetOutlineUpdate", "easetype", iTween.EaseType.easeOutExpo));
        }
        else
        {
            SetOutlineUpdate(m_handHoverOutlineSize);
        }
    }

    public void StopHover()
    {
        if (GlobalConfig.Instance.EnableAnimations)
        {
            iTween.ValueTo(gameObject, iTween.Hash("from", m_handHoverOutlineSize, "to", 0.0f, "time", 0.0f, "onupdate", "SetOutlineUpdate", "easetype", iTween.EaseType.easeOutExpo));
        }
        else
        {
            SetOutlineUpdate(0.0f);
        }
    }

     public void SetOutlineUpdate(float size)
     {
         m_fingerIndex.renderer.material.SetFloat("_Outline", size);
         m_fingerMiddle.renderer.material.SetFloat("_Outline", size);
         m_fingerRing.renderer.material.SetFloat("_Outline", size);
         m_fingerPinky.renderer.material.SetFloat("_Outline", size);
     }
    

        
    /*
     * Getters
     */
    public string activeGesture{ get { return m_activeGesture; }}
    public int activeGestureIndex { get { return m_gestureIndexLookup[m_activeGesture];  } }
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
    protected double[] BuildRBFGestureOuput(int gestureIndex){
        double[] calibrationArr = new double[m_gestures.Length];
        calibrationArr[gestureIndex] = 1.0;
        return calibrationArr;
    }
}