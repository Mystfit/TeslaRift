using System;
using System.Collections.Generic;


public class SingleModifierTool : BaseTool
{	
	public SingleModifierTool (ToolHand hand) : base(hand)
	{
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

		base.Update();
	}
}


