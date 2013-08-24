using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class ChoreographController : MonoBehaviour {
	
	public static string clientName = "Live";
	
	public float m_pitchBendRate;
	
	public TeslaInstrument m_testInstrument;

	void Start () {
		m_testInstrument = new TeslaInstrument("Live", "tesla", "TeslaLead");
		m_testInstrument.addParam("noteParams", "chord");
		m_testInstrument.addParam("pitchbend", "int");
		m_testInstrument.addParam("noteOn", "int");
		m_testInstrument.addParam("gate", "int");
	}
	
	void Update () {
		
		pitchSin(Mathf.Sin(Time.time * m_pitchBendRate * 2.0f));
		m_testInstrument.update();
	}
	
	
	public void playTestChord(){
		playTestChord1( m_testInstrument );
	}
	
	public void stopTestChord(){
		stopTestChord1( m_testInstrument );
	}
	
	//Reference chord functions
	//---------------------------------
	public void playTestChord1(BaseInstrument instrument){
		if(instrument != null){
			NoteParam chord = instrument.getParamByName("noteParams") as NoteParam;
			if(chord != null){
				chord.setNote(Utils.Midi.midiIntToFloat(70), 0.8f, 0, 1);
				chord.setNote(Utils.Midi.midiIntToFloat(82), 0.8f, 1, 1);
				chord.setNote(Utils.Midi.midiIntToFloat(86), 0.8f, 2, 1);
			}
			
		}
	}
	
	public void pitchSin(float bend){
		BaseInstrumentParam pitchBend = m_testInstrument.getParamByName("pitchbend");
		pitchBend.setVal((bend * 127.0f * 0.5f) + (127.0f * 0.5f));
	}
	
	public void stopTestChord1(BaseInstrument instrument){
		if(instrument != null){
			NoteParam chord = instrument.getParamByName("noteParams") as NoteParam;
			if(chord != null){
				chord.setNote(Utils.Midi.midiIntToFloat(70), 0.8f, 0, 0);
				chord.setNote(Utils.Midi.midiIntToFloat(82), 0.8f, 1, 0);
				chord.setNote(Utils.Midi.midiIntToFloat(86), 0.8f, 2, 0);
			}
		}
	}
		
}
