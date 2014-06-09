using UnityEngine;
using MusicIO;
using UI;
using System.Collections;

public class RBFPlugAttachment : BaseAttachment {

    public RBFSphereAttachment m_rbfSphere;
    public RotaryAttachment m_rotary;
    public ScrollerAttachment m_paramscroller;

    //Plug values
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

    //Plug drag/rotate values
    protected float m_lastAngle;
    protected float m_lastPlugDragPos;
    public float m_maxPlugDragDistance = 1.0f;
	protected Vector3 m_innerPlugScale;
    protected Vector3 m_exteriorPlugScale;

    //Plug drag objects
    public Transform m_plugInner;
    public Transform m_plugTop;
    public Transform m_plugExterior;

    public bool isDirty;
    public void setClean() { isDirty = false; }
    public void setDirty() { isDirty = true; }


	// Use this for initialization
	public override void Awake () {
		base.Awake();
		AddAcceptedDocktype(typeof(SliderAttachment));
        SetAsDock(true);
        m_paramscroller.SetItemScale(UIFactory.SliderScale.x);

		m_innerPlugScale = m_plugInner.localScale;
        m_exteriorPlugScale = m_plugExterior.localScale;
        HideControls();
	}

	public override bool AddDockableAttachment (BaseAttachment attach)
	{
    	SliderAttachment slider = attach as SliderAttachment;
    	slider.SetCloneable(false);
		slider.SetIsDraggable(true);
		slider.SetToolmodeResponse(new BaseTool.ToolMode[] { BaseTool.ToolMode.GRABBING });
		slider.DockInto(m_paramscroller);

            //iTween.MoveTo(slider.gameObject, iTween.Hash("position", transform.position, "time", 0.5f, "islocal", true));
            //iTween.RotateTo(slider.gameObject, iTween.Hash("rotation", transform.rotation, "time", 0.5f));
        
        return true;
	}

	public override void RemoveDockableAttachment (BaseAttachment attach)
	{
		base.RemoveDockableAttachment (attach);
		m_paramscroller.RemoveDockableAttachment(attach);
	}

    public override void HideControls()
    {
        base.HideControls();
        animation.Stop();
        animation.Play("drawer_in");
        foreach (SliderAttachment attach in m_paramscroller.DockedChildren)
        {
            attach.SetToolmodeResponse(new BaseTool.ToolMode[0]);
        }
        SetToolmodeResponse(new BaseTool.ToolMode[0]);
    }

    public override void ShowControls()
    {
        base.ShowControls();
        animation.Stop();
        animation.Play("drawer_out");
        foreach (SliderAttachment attach in m_paramscroller.DockedChildren)
        {
            attach.SetToolmodeResponse(new BaseTool.ToolMode[] { BaseTool.ToolMode.GRABBING });
        }
        SetToolmodeResponse(new BaseTool.ToolMode[] { BaseTool.ToolMode.PRIMARY, BaseTool.ToolMode.SECONDARY, BaseTool.ToolMode.GRABBING });
    }

    public override void Gesture_First()
    {
        base.Gesture_First();
		if(m_mode == BaseTool.ToolMode.PRIMARY){
            m_paramscroller.ToggleControls();
            //if(!m_paramscroller.gameObject.activeSelf)
            //    m_paramscroller.SetActive();
            //else
            //    m_paramscroller.SetInactive();
		}

		if(m_mode == BaseTool.ToolMode.GRABBING)
			m_lastPlugDragPos = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(m_hand)).z;
    }

    public override void Gesture_Exit()
    {
        m_lastAngle = 0.0f;
        base.Gesture_Exit();
    }

    public override void Gesture_IdleInterior()
    {
        //if (m_mode == BaseTool.ToolMode.SECONDARY)
        //{
        //    Vector3 pos = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition( m_hand ));
        //    pos.z = 0.0f;
        //    float angle = Mathf.Atan2(pos.y, pos.x);
        //    angle = (angle / Mathf.PI * 180.0f) + (angle > 0 ? 0 : 360);
        //    float delta = m_lastAngle - angle;
        //    float newVal = m_val - (delta/360.0f);
        //    Debug.Log(newVal);
        //    SetVal(Utils.Clamp(newVal, 0.0f, 1.0f));
        //    m_lastAngle = angle;
        //}
        if (m_mode == BaseTool.ToolMode.GRABBING)
        {
            Vector3 pos = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(m_hand));
            float delta = m_lastPlugDragPos - pos.z;

            float newVal = m_val - (delta/m_maxPlugDragDistance);
            SetVal(Utils.Clamp(newVal, 0.0f, 1.0f));
            m_lastPlugDragPos = pos.z;

			if (m_plugTop != null)
				m_plugTop.localPosition = new Vector3(0.0f, 0.0f, m_val * m_maxPlugDragDistance);
            if (m_plugInner != null)
				m_plugInner.localScale = new Vector3(m_innerPlugScale.x, m_innerPlugScale.y, m_val * m_innerPlugScale.z);
            if (m_plugExterior != null)
                m_plugExterior.localScale = new Vector3(m_exteriorPlugScale.x, m_exteriorPlugScale.y, m_val * m_exteriorPlugScale.z);
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
