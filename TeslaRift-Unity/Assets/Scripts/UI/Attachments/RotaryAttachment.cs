using UnityEngine;
using System.Collections;
using MusicIO;
using UI;

public class RotaryAttachment : UIAttachment<BaseInstrumentParam> {

	public GameObject m_rotaryFill;

    public void setVal(float value) { m_value = value; }
    protected float m_value;

	
	public override void Init (BaseInstrumentParam managedReference)
	{
		base.Init (managedReference);
	}
	
	public override void Update(){
        if (musicRef != null)
            m_value = musicRef.val;

		if(m_rotaryFill != null)
            m_rotaryFill.renderer.material.SetFloat("_Cutoff", 1.0f - m_value);
	}

    /*
    * Sets the value of the slider(0,1) based on location inside the slider frame
    */
    public float GetTwistFromHand(Transform hand)
    {
        Quaternion localRot = transform.rotation * Quaternion.Inverse(hand.rotation);
        return localRot.eulerAngles.y;
    }
}
