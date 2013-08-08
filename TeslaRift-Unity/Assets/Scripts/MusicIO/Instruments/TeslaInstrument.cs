using UnityEngine;
using System.Collections;

public class TeslaInstrument : BaseInstrument {
	
	public TeslaInstrument(string instrumentName, string instrumentOwner, string instrumentClient) 
		: base(instrumentName, instrumentOwner, instrumentClient)
	{
	}
	
	public override void processParameters(){
		foreach(BaseInstrumentParam param in m_params){
			if(param.isDirty){
				
				if(param.name == "noteParams"){
					Note note = param as Note;
					addMidiNoteMessageToQueue(param.name, note.val, note.velocity, 0, note.noteIndex[0] );
				} else {
					addMessageToQueue(param.name, param.val);
				}
					
				param.setClean();
			}
		}
	}

}
