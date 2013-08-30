using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class InstrumentController : MonoBehaviour {
	
	public enum MusicObject{ INSTRUMENT = 0, PARAMETER};
	
	protected List<BaseInstrument> m_instruments;
	protected BaseInstrument m_selectedInstrument;
	protected GameObject m_lastSelectedGameInstrument = null;
	protected bool m_teslaInstrumentActive = false;		//Tesla specific killswitch
	protected bool m_teslaStateDirty = true;
	
	protected List<BaseInstrumentParam> m_selectedParams;
	
	public InstrumentController(){
		
	}
	
	//Unity
	//-----
	void Start () {
		m_instruments = new List<BaseInstrument>();
		m_selectedParams = new List<BaseInstrumentParam>();
	}
	
	void Update () {
		foreach(BaseInstrument instrument in m_instruments){
			
			//Tesla specific killswitch
			if(instrument.Name == "TeslaLead"){
				if(m_teslaStateDirty){					
					if(m_teslaInstrumentActive){
						instrument.addMessageToQueue("killswitch", 0.0f);
					} else {
						instrument.addMessageToQueue("killswitch", 1.0f);
					}
					instrument.update();
					m_teslaStateDirty = false;
				} else {
					if(m_teslaInstrumentActive)
						instrument.update();
				}

			} else {
				instrument.update();
			}
		}
	}
	
	
	//Parameter selection and value modification
	//------------------------------------------
	public void SetSelectedParameterValues(float value){
		foreach(BaseInstrumentParam param in m_selectedParams){
			if(param.GetType() == typeof(NoteParam)){
				NoteParam chord = param as NoteParam;
				chord.setNote(value, 1.0f, 0, 1);
			} else {
				param.setVal(value);
			}
		}
	}
	
	public void SetNoteOff(){
		foreach(BaseInstrumentParam param in m_selectedParams){	
			if(param.GetType() == typeof(NoteParam)){
				NoteParam chord = param as NoteParam;
				chord.setNote(chord.getNoteList()[0].val, 1.0f, 0, 0);
			}
		}
	}
	
	public void SelectParameter(BaseInstrumentParam param){
	
		if( m_selectedParams.IndexOf(param) < 0){
			param.setEnabled(true);
			Debug.Log (param + ", selected");
			m_selectedParams.Add(param);
		}
	}
	
	public void DeselectParameter(BaseInstrumentParam param){
		int existingIndex = m_selectedParams.IndexOf(param);
		if (existingIndex >= 0){
			
			param.setEnabled(false);
			Debug.Log (param + ", deselected");
			m_selectedParams.Remove(param);
		}
	}
	
	
	//Instrument selection
	//--------------------
	public BaseInstrument SelectedInstrument{ get { return m_selectedInstrument; } }
	
	public void SelectInstrument(BaseInstrument instrument){ 
		m_selectedInstrument = instrument; 
		Debug.Log ("Selected " + m_selectedInstrument.Name);
	}
	
	public void SelectInstrument(string instrument){ 
		m_selectedInstrument = GetInstrumentByName(instrument); 
		Debug.Log("Selected " + m_selectedInstrument.Name);
	}
	
	public void AddInstrument(BaseInstrument instrument){
		m_instruments.Add(instrument);
	}
	
	public BaseInstrument GetInstrumentByName(string targetInstrument){
		foreach(BaseInstrument instrument in m_instruments){
			if(instrument.Name == targetInstrument)
				return instrument;
		}
			
		return null;
	}
	
	public void SetLastSelectedGameInstrument(GameObject gameInstrument){
		m_lastSelectedGameInstrument = gameInstrument;
	}
	
	public GameObject LastSelectedGameInstrument{ get { return m_lastSelectedGameInstrument; }}
	
	
	//Tesla specific functions
	//------------------------
	public void PrimeTesla(){
		m_teslaInstrumentActive = !m_teslaInstrumentActive;
		m_teslaStateDirty = true;
	}
}
