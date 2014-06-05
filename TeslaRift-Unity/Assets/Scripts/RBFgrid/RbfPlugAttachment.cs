using UnityEngine;
using MusicIO;
using System.Collections;

public class RbfPlugAttachment : BaseAttachment<BaseInstrumentParam> {

    public RBFSphere m_parentRbf;
    public RotaryAttachment m_rotary;

    public void SetVal(float val) { 
        m_val = val;
        m_rotary.setVal(val);
        setDirty(); 
    }
    public float val { get { return m_val; } }
    protected float m_val;
    protected float m_lastAngle;

    public bool isDirty;
    public void setClean() { isDirty = false; }
    public void setDirty() { isDirty = true; }


	// Use this for initialization
	void Awake () {
		base.Awake();
		AddAcceptedDocktype(typeof(SliderAttachment));
	}

	public override bool AddDockableAttachment (BaseAttachment attach)
	{
        if (base.AddDockableAttachment(attach))
        {
            animation.Play("drawer_out");
            SliderAttachment slider = attach as SliderAttachment;
            slider.SetCloneable(false);
            iTween.MoveTo(slider.gameObject, iTween.Hash("position", transform.position, "time", 0.5f));
            iTween.RotateTo(slider.gameObject, iTween.Hash("rotation", transform.rotation, "time", 0.5f));
            return true;
        }
        return false;
	}

    public override void Gesture_First()
    {
        base.Gesture_First();
    }

    public override void Gesture_Exit()
    {
        m_lastAngle = 0.0f;
        base.Gesture_Exit();
    }

    public override void Gesture_IdleInterior()
    {
        if (m_mode == BaseTool.ToolMode.SECONDARY)
        {
            Vector3 pos = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition( m_hand ));
            pos.z = 0.0f;
            float angle = Mathf.Atan2(pos.y, pos.x);
            angle = (angle / Mathf.PI * 180.0f) + (angle > 0 ? 0 : 360);
            float delta = m_lastAngle - angle;
            float newVal = m_val - (delta/360.0f);
            Debug.Log(newVal);
            SetVal(Utils.Clamp(newVal, 0.0f, 1.0f));
            m_lastAngle = angle;
        }

        base.Gesture_IdleInterior();
    }

    public void setSliderVals(float value)
    {
		if(m_childDockables != null){
	        foreach (SliderAttachment attach in m_childDockables)
	        {
	            if (attach.HasMusicRef)
	            {
	                attach.musicRef.setVal(value);
	            }
	        }
		}
		SetVal(value);
    }
	
	void Update () {            
	}

    
}
