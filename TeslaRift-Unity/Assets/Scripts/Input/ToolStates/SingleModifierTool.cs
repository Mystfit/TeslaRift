using System;
using System.Collections.Generic;


public class SingleModifierTool : BaseTool
{
	private float m_singleParameterValue = 0.0f;
	
	public SingleModifierTool () : base()
	{
		m_singleParameterValue = 0.5f;
	}
	
	public override void update()
	{
		base.update();
	}
	
	public void testTriggerNote(float value){
		foreach(BaseInstrumentParam param in m_targetParameters){
			if(param.GetType() == typeof(NoteParam)){
				NoteParam note = param as NoteParam;
				note.setNote( value, 0.8f, 0, 1);
			} else {
				param.setVal(value);
			}
		}
	}
	
	public void testReleaseNote(){
		NoteParam note = getTargetByName("noteParams") as NoteParam;
		note.releaseChord();
	}
}


