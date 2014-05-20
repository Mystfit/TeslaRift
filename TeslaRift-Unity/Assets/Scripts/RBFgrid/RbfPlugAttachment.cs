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

    public bool isDirty;
    public void setClean() { isDirty = false; }
    public void setDirty() { isDirty = true; }


	// Use this for initialization
	void Start () {
		AddAcceptedDocktype(typeof(SliderAttachment));
	}

	public override void AddDockableAttachment (BaseAttachment attach)
	{
        animation.Play("drawer_out");
		SliderAttachment slider = attach as SliderAttachment;
        iTween.MoveTo(slider.gameObject, iTween.Hash("position", transform.position, "time", 0.5f));
        iTween.RotateTo(slider.gameObject, iTween.Hash("rotation", transform.rotation, "time", 0.5f));

		base.AddDockableAttachment (attach);
	}

    public override void Gesture_First()
    {
        base.Gesture_First();
    }

    public override void Gesture_IdleInterior()
    {
        if (m_mode == BaseTool.ToolMode.SECONDARY)
        {
            Vector3 pos = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition( m_hand ));
            pos.y = 0.0f;

            float val = Mathf.Clamp(pos.z, 0.0f, 1.1f);

            SetVal(val);
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
