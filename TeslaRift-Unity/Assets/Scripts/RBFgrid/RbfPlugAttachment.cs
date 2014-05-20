using UnityEngine;
using MusicIO;
using System.Collections;

public class RbfPlugAttachment : BaseAttachment<BaseInstrumentParam> {

    public RBFSphere m_parentRbf;
    public RotaryAttachment m_rotary;

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

            m_rotary.setVal(val);
        }

        base.Gesture_IdleInterior();
    }
	
	// Update is called once per frame
	void Update () {
	   
	}
}
