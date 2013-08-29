using UnityEngine;
using System;
using System.Collections.Generic;


public class SingleModifierTool : BaseTool
{	
	public float m_maxDistance = 7.0f;
	public float m_distanceFromInstrument = 0.0f;
	
	public SingleModifierTool ()
	{
	}
	
	public override void TransitionOut ()
	{
		base.TransitionOut ();
	}
	
	public void playTestChord(){
		NoteParam chord = m_instrumentRef.getParamByName("noteParam") as NoteParam;
		if(chord != null){
			chord.setNote(Utils.Midi.midiIntToFloat(70), 0.8f, 0, 1);
			chord.setNote(Utils.Midi.midiIntToFloat(82), 0.8f, 1, 1);
			chord.setNote(Utils.Midi.midiIntToFloat(86), 0.8f, 2, 1);
		}
	}
	
	public void stopTestChord(){
		NoteParam chord = m_instrumentRef.getParamByName("noteParam") as NoteParam;
		if(chord != null){
			chord.setNote(Utils.Midi.midiIntToFloat(70), 0.8f, 0, 1);
			chord.setNote(Utils.Midi.midiIntToFloat(82), 0.8f, 1, 1);
			chord.setNote(Utils.Midi.midiIntToFloat(86), 0.8f, 2, 1);
		}
	}
	
	public override void Update()
	{
		m_distanceFromInstrument = Vector3.Distance(m_hydraRef.GetHand(m_hand).transform.position, m_instrumentControlRef.LastSelectedGameInstrument.transform.position);
		m_distanceFromInstrument = Mathf.Clamp( Utils.Normalize( m_distanceFromInstrument, 0.0f, m_maxDistance) , 0.0f, 1.0f);

		m_instrumentControlRef.SetSelectedParameterValues(m_distanceFromInstrument);
		
		base.Update();
	}
}


