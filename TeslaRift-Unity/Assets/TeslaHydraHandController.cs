
//
// Copyright (C) 2013 Sixense Entertainment Inc.
// All Rights Reserved
//

using UnityEngine;
using System.Collections;

public class TeslaHydraHandController : SixenseObjectController
{
	protected float				m_fLastTriggerVal = 0.0f;
	
	protected override void Start() 
	{
		base.Start();
	}
	
	protected override void UpdateObject( SixenseInput.Controller controller )
	{			
		base.UpdateObject(controller);
	}
	
	
	void OnGUI()
	{
		if ( Hand == SixenseHands.UNKNOWN )
		{
			return;
		}
		
		if ( !m_enabled )
		{
			int labelWidth = 250;
			int labelPadding = 120;
			int horizOffset = Hand == SixenseHands.LEFT ? -labelWidth - labelPadding  : labelPadding;
			
			string handStr = Hand == SixenseHands.LEFT ? "left" : "right";
			GUI.Box( new Rect( Screen.width / 2 + horizOffset, Screen.height - 40, labelWidth, 30 ),  "Press " + handStr + " START to control " + gameObject.name );		
		}		
	}
	
	// Updates the animated object from controller input.
	protected void UpdateAnimationInput( SixenseInput.Controller controller)
	{
		// Fist
		float fTriggerVal = controller.Trigger;
		fTriggerVal = Mathf.Lerp( m_fLastTriggerVal, fTriggerVal, 0.1f );
		m_fLastTriggerVal = fTriggerVal;
	}
}

