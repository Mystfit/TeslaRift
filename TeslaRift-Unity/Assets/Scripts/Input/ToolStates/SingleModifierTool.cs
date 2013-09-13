using UnityEngine;
using System;
using System.Collections.Generic;


public class SingleModifierTool : BaseTool
{	
	public float m_maxDistance = 0.8f;
	public float m_startDistance = 0.4f;
	public float m_distanceFromInstrument = 0.0f;
	
	public SingleModifierTool ()
	{
	}
	
	public override void TransitionOut ()
	{
		base.TransitionOut();
		m_instrumentControlRef.SetNoteOff();
	}
	
	public override void Update()
	{
		m_distanceFromInstrument = Vector3.Distance(m_hydraRef.GetHand(m_hand).transform.position, m_instrumentControlRef.LastSelectedGameInstrument.transform.position);
		m_distanceFromInstrument = Mathf.Clamp( Utils.Normalize( m_distanceFromInstrument - m_startDistance, 0.0f, m_maxDistance) , 0.0f, 1.0f);

		m_instrumentControlRef.SetSelectedParameterValues(m_distanceFromInstrument);
		
		base.Update();
	}
}


