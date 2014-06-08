using UnityEngine;
using MusicIO;
using UI;
using System.Collections;

public class RBFPlugAttachment : BaseAttachment {

    protected RBFSphereAttachment m_rbfSphere;
    public RotaryAttachment m_rotary;
    public ScrollerAttachment m_paramscroller;

	public void SetVal(float val) { 
		SetVal(val, false);
	}
    public void SetVal(float val, bool silent) { 
        m_val = val;
        m_rotary.setVal(val);
		if(!silent)
        	m_rbfSphere.UpdatePlugValues(this);
    }
    public float val { get { return m_val; } }
    protected float m_val;
    protected float m_lastAngle;

    public bool isDirty;
    public void setClean() { isDirty = false; }
    public void setDirty() { isDirty = true; }


	// Use this for initialization
	public override void Awake () {
		base.Awake();
		m_rbfSphere = transform.parent.gameObject.GetComponent<RBFSphereAttachment>();
		AddAcceptedDocktype(typeof(SliderAttachment));
        SetAsDock(true);

        m_paramscroller.SetItemScale(UIFactory.SliderScale.x);
	}

	public override bool AddDockableAttachment (BaseAttachment attach)
	{
        if (base.AddDockableAttachment(attach))
        {
            animation.Play("drawer_out");
            SliderAttachment slider = attach as SliderAttachment;
            slider.SetCloneable(false);
            attach.DockInto(m_paramscroller);

            //iTween.MoveTo(slider.gameObject, iTween.Hash("position", transform.position, "time", 0.5f, "islocal", true));
            //iTween.RotateTo(slider.gameObject, iTween.Hash("rotation", transform.rotation, "time", 0.5f));
            return true;
        }
        return false;
	}

    public override void Gesture_First()
    {
        base.Gesture_First();
		if(m_mode == BaseTool.ToolMode.PRIMARY){
			if(!m_paramscroller.gameObject.activeSelf)
				m_paramscroller.SetActive();
			else
				m_paramscroller.SetInactive();
		}
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

    public void SetSliderVals(float value)
    {
		if(m_paramscroller.DockedChildren != null){
            foreach (SliderAttachment attach in m_paramscroller.DockedChildren)
	        {
	            if (attach.HasMusicRef)
	            {
	                attach.musicRef.setVal(value);
	            }
	        }
		}
		SetVal(value);
    }
	
	public override void Update () {            
	}

    
}
