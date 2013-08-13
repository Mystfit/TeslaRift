using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class ChoreographController : MonoBehaviour {
	
	public static string clientName = "Live";
	
	public TeslaInstrument m_testInstrument;

	// Use this for initialization
	void Start () {
		m_testInstrument = new TeslaInstrument("Live", "tesla", "teslaLead");
		m_testInstrument.addParam("noteParams", "chord");
		//m_testInstrument.addParam("noteOn", "int");
		m_testInstrument.addParam("gate", "int");
	}
	
	public void playTestNote(){
		int[] testNoteArr = {0,70,80};
		List<int> testNotes = new List<int>(testNoteArr);
			
		m_testInstrument.addMessageToQueue("noteParams", testNotes);
		m_testInstrument.addMessageToQueue("noteOn", 1);	
	}
	
	public void stopTestNote(){
		int[] testNoteArr = {0,70,80};
		List<int> testNotes = new List<int>(testNoteArr);
			
		m_testInstrument.addMessageToQueue("noteParams", testNotes);
		m_testInstrument.addMessageToQueue("noteOn", 0);
	}
	
	public void playTestChord1(BaseInstrument instrument){
		NoteParam chord = instrument.getParamByName("noteParams") as NoteParam;
		if(chord != null){
			chord.setNote(Utils.Midi.midiIntToFloat(70), 0.8f, 0, 1);
			chord.setNote(Utils.Midi.midiIntToFloat(82), 0.8f, 1, 1);
			chord.setNote(Utils.Midi.midiIntToFloat(86), 0.8f, 2, 1);
		}
	}
	
	public void stopTestChord1(BaseInstrument instrument){
		NoteParam chord = instrument.getParamByName("noteParams") as NoteParam;
		if(chord != null){
			chord.setNote(Utils.Midi.midiIntToFloat(70), 0.8f, 0, 0);
			chord.setNote(Utils.Midi.midiIntToFloat(82), 0.8f, 1, 0);
			chord.setNote(Utils.Midi.midiIntToFloat(86), 0.8f, 2, 0);
		}
	}
	
	public void playTestChord2(BaseInstrument instrument){
		NoteParam chord = instrument.getParamByName("noteParams") as NoteParam;
		if(chord != null){
			chord.setNote(Utils.Midi.midiIntToFloat(77), 0.8f, 0, 1);
			chord.setNote(Utils.Midi.midiIntToFloat(81), 0.8f, 1, 1);
			chord.setNote(Utils.Midi.midiIntToFloat(86), 0.8f, 2, 1);
		}
	}
	
	public void stopTestChord2(BaseInstrument instrument){
		NoteParam chord = instrument.getParamByName("noteParams") as NoteParam;
		if(chord != null){
			chord.setNote(Utils.Midi.midiIntToFloat(77), 0.8f, 0, 0);
			chord.setNote(Utils.Midi.midiIntToFloat(81), 0.8f, 1, 0);
			chord.setNote(Utils.Midi.midiIntToFloat(86), 0.8f, 2, 0);
		}
	}
	
	// Update is called once per frame
	void Update () {
		m_testInstrument.update();
	}
}
