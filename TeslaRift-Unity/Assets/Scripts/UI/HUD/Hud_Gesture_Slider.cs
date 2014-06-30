using UnityEngine;
using System;
using System.Collections;

public class Hud_Gesture_Slider : MonoBehaviour {

    public GloveController m_targetGlove;
    public int m_gestureindex;
    protected BarSlider m_slider;
    protected UIFrame m_frame;

    // Use this for initialization
    void Start () {
        m_targetGlove = m_targetGlove.GetComponent<GloveController>();
        m_slider = GetComponent<BarSlider>();
        m_frame = GetComponent<UIFrame>();
        m_frame.SetLabel(m_targetGlove.GetGestureName(m_gestureindex));
    }
    
    // Update is called once per frame
    void Update () {
        double[] gestureVals = m_targetGlove.GetRawGestures();
        if(m_gestureindex < gestureVals.Length){
            float val = Convert.ToSingle(gestureVals[m_gestureindex]);
            m_slider.SetSliderVal( val );
        }
    }
}
