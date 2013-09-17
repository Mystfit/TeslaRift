
//
// Copyright (C) 2013 Sixense Entertainment Inc.
// All Rights Reserved
//

using UnityEngine;
using System.Collections;

public class HydraHand : SixenseObjectController
{
	//Collision variables
	
	protected HydraController m_hydra= null;
	
	protected float				m_fLastTriggerVal = 0.0f;
	
	protected override void Start() 
	{
		m_hydra = GameObject.Find("__HydraController").GetComponent<HydraController>();
		base.Start();
	}
	
	public void SetEnabled(bool state){
		m_enabled = state;
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
		
		/*if ( !m_enabled )
		{
			int labelWidth = 250;
			int labelPadding = 120;
			int horizOffset = Hand == SixenseHands.LEFT ? -labelWidth - labelPadding  : labelPadding;
			
			string handStr = Hand == SixenseHands.LEFT ? "left" : "right";
			GUI.Box( new Rect( Screen.width / 2 + horizOffset, Screen.height - 40, labelWidth, 30 ),  "Press " + handStr + " START to control " + gameObject.name );		
		}*/		
	}

	void OnTriggerEnter (Collider collidee) {		
		m_hydra.TriggerCollision(collidee.gameObject, Hand);
	}
	
	void OnTriggerExit (Collider collidee) {	
		m_hydra.UnTriggerCollision(collidee.gameObject, Hand);
	}
}

