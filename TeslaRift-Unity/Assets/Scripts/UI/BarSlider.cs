using UnityEngine;
using MusicIO;
using System.Collections;

public class BarSlider : MonoBehaviour {

    protected GameObject m_fill;
    protected UIFrame m_frame;
    protected bool bIsActive;

    [Range(0.0f, 1.0f)]
    public float m_sliderVal;

    void Start () {
        m_fill = transform.FindChild("sliderFill").gameObject;
        m_frame = GetComponent<UIFrame>();
    }
    
    void Update () {
        SetSliderVal(m_sliderVal);
        if(m_fill != null)
            m_fill.renderer.material.SetFloat("_Cutoff", 1.0f - m_sliderVal);

        m_fill.transform.localScale = m_frame.background.localScale;
        m_fill.transform.localPosition = m_frame.background.localPosition - new Vector3(0.0f, 0.0f, 0.001f);
        //m_label.transform.localPosition = m_frame.GetAnchorOffset(m_frame.width, m_frame.height, m_frame.m_anchorPoint);
    }


    public void SetSliderVal(float val){
        float clamped = Mathf.Clamp(val, 0.0f, 1.0f);
        m_sliderVal = clamped;
    }

    public float sliderVal{ get { return m_sliderVal; }}
}
