using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class ChoreographController : MonoBehaviour {
	
	public TeslaInstrument m_testInstrument;

	// Use this for initialization
	void Start () {
		m_testInstrument = new TeslaInstrument("Live", "tesla", "teslaLead");
		m_testInstrument.addParam("noteParams", "note");
		//m_testInstrument.addParam("noteOn", "int");
		m_testInstrument.addParam("gate", "int");
	}
	
	public void playTestNote(){
		int[] testNoteArr = {0,70,80};
		List<int> testNotes = new List<int>(testNoteArr);
			
		m_testInstrument.addMessageToQueue("noteparams", testNotes);
		m_testInstrument.addMessageToQueue("noteOn", 1);
	}
	
	public void stopTestNote(){
		int[] testNoteArr = {0,70,80};
		List<int> testNotes = new List<int>(testNoteArr);
			
		m_testInstrument.addMessageToQueue("noteparams", testNotes);
		m_testInstrument.addMessageToQueue("noteOn", 0);
	}
	
	public void playTestChord1(){
		//All OSC specific stuff to be moved into the tool/instrument controllers!
		int[] testNote = {0,0,0};
		List<int> testNoteParams = new List<int>(testNote);
		
		testNoteParams[0] = 0;
		testNoteParams[1] = 70;
		testNoteParams[2] = 80;
		m_testInstrument.addMessageToQueue("noteparams", testNoteParams);
		m_testInstrument.addMessageToQueue("noteOn", 1);

		testNoteParams[0] = 1;
		testNoteParams[1] = 82;
		testNoteParams[2] = 80;
		m_testInstrument.addMessageToQueue("noteparams", testNoteParams);
		m_testInstrument.addMessageToQueue("noteOn", 1);

		testNoteParams[0] = 2;
		testNoteParams[1] = 86;
		testNoteParams[2] = 80;
		m_testInstrument.addMessageToQueue("noteparams", testNoteParams);
		m_testInstrument.addMessageToQueue("noteOn", 1);
	}
	
	public void stopTestChord1(){
		//All OSC specific stuff to be moved into the tool/instrument controllers!
		int[] testNote = {0,0,0};
		List<int> testNoteParams = new List<int>(testNote);
		
		testNoteParams[0] = 0;
		testNoteParams[1] = 70;
		testNoteParams[2] = 80;
		m_testInstrument.addMessageToQueue("noteparams", testNoteParams);
		m_testInstrument.addMessageToQueue("noteOn", 0);

		testNoteParams[0] = 1;
		testNoteParams[1] = 82;
		testNoteParams[2] = 80;
		m_testInstrument.addMessageToQueue("noteparams", testNoteParams);
		m_testInstrument.addMessageToQueue("noteOn", 0);

		testNoteParams[0] = 2;
		testNoteParams[1] = 86;
		testNoteParams[2] = 80;
		m_testInstrument.addMessageToQueue("noteparams", testNoteParams);
		m_testInstrument.addMessageToQueue("noteOn", 0);
	}
	
	public void playTestChord2(){
		//All OSC specific stuff to be moved into the tool/instrument controllers!
		int[] testNote = {0,0,0};
		List<int> testNoteParams = new List<int>(testNote);
		
		testNoteParams[0] = 0;
		testNoteParams[1] = 77;
		testNoteParams[2] = 80;
		m_testInstrument.addMessageToQueue("noteparams", testNoteParams);
		m_testInstrument.addMessageToQueue("noteOn", 1);
	
		testNoteParams[0] = 1;
		testNoteParams[1] = 81;
		testNoteParams[2] = 80;
		m_testInstrument.addMessageToQueue("noteparams", testNoteParams);
		m_testInstrument.addMessageToQueue("noteOn", 1);
	
		testNoteParams[0] = 2;
		testNoteParams[1] = 86;
		testNoteParams[2] = 80;
		m_testInstrument.addMessageToQueue("noteparams", testNoteParams);
		m_testInstrument.addMessageToQueue("noteOn", 1);
	}
	
	public void stopTestChord2(){
		//All OSC specific stuff to be moved into the tool/instrument controllers!
		int[] testNote = {0,0,0};
		List<int> testNoteParams = new List<int>(testNote);
		
		testNoteParams[0] = 0;
		testNoteParams[1] = 77;
		testNoteParams[2] = 80;
		m_testInstrument.addMessageToQueue("noteparams", testNoteParams);
		m_testInstrument.addMessageToQueue("noteOn", 0);

		testNoteParams[0] = 1;
		testNoteParams[1] = 81;
		testNoteParams[2] = 80;
		m_testInstrument.addMessageToQueue("noteparams", testNoteParams);
		m_testInstrument.addMessageToQueue("noteOn", 0);

		testNoteParams[0] = 2;
		testNoteParams[1] = 86;
		testNoteParams[2] = 80;
		m_testInstrument.addMessageToQueue("noteparams", testNoteParams);
		m_testInstrument.addMessageToQueue("noteOn", 0);
	}
	
	// Update is called once per frame
	void Update () {
		m_testInstrument.update();
	}
}
