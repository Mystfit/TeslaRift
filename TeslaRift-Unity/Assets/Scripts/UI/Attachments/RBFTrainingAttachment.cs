using UnityEngine;
using System;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using MusicIO;
using UI;

	
public class RBFTrainingAttachment : BaseAttachment {

    public Color m_selectedColor;
    public Color m_defaultColor;

    public override void Awake()
    {
        base.Awake();
        SetIsDraggable(true);
        m_outputValues = new Dictionary<RBFPlugAttachment, double>();  
    }

    public RBFSphereAttachment owner { 
        get { return m_owner; }
        set { m_owner = value; }
    }
    protected RBFSphereAttachment m_owner;

    public Quaternion angle{ get{return Quaternion.LookRotation(transform.localPosition); }}
    public float distance{ get { return Vector3.Distance(Vector3.zero, transform.localPosition); }}

    public Dictionary<RBFPlugAttachment, double> plugValues { get { return m_outputValues; } }
    protected Dictionary<RBFPlugAttachment, double> m_outputValues;

    public void StorePlugValue(RBFPlugAttachment plug)
    {
        m_outputValues[plug] = plug.val;
    }

    public void RemovePlugValue(RBFPlugAttachment plug)
    {
        m_outputValues.Remove(plug);
    }

    public override void ShowControls()
    {
        base.ShowControls();
        SetToolmodeResponse(new BaseTool.ToolMode[] { BaseTool.ToolMode.PRIMARY, BaseTool.ToolMode.GRABBING });
    }

    public override void HideControls()
    {
        base.HideControls();
        SetToolmodeResponse(new BaseTool.ToolMode[0]);
    }

    public override void SetSelected(bool state)
    {
        base.SetSelected(state);
        if(selected)
            iTween.ColorTo(gameObject, iTween.Hash("color", m_selectedColor, "time", 0.2f));
        else
            iTween.ColorTo(gameObject, iTween.Hash("color", m_defaultColor, "time", 0.2f));
    }

        
    /*
        * Gesture overrides
        */
    public override void Gesture_First()
    {
        if(m_mode == BaseTool.ToolMode.GRABBING)
			StartDragging(HydraController.Instance.GetHand(m_hand));
		if(m_mode == BaseTool.ToolMode.PRIMARY){
            if (m_owner != null)
				m_owner.SetSelectedtraining(this);
		}
        base.Gesture_First();
    }

	public override void Gesture_Exit ()
	{
		base.Gesture_Exit ();
		if(m_mode == BaseTool.ToolMode.GRABBING){
			StopDragging();
		}
	}
}

