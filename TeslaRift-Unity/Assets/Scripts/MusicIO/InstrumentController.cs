using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class InstrumentController : MonoBehaviour {
	
	public enum MusicObject{ INSTRUMENT = 0, PARAMETER};
	
	protected List<BaseInstrument> m_instruments;
	protected BaseInstrument m_selectedInstrument;
	protected GameObject m_lastSelectedGameInstrument = null;
	
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
			instrument.update();
		}
	}
	
	
	//Parameter selection and value modification
	//------------------------------------------
	public void SetSelectedParameterValues(float value){
		foreach(BaseInstrumentParam param in m_selectedParams){
			param.setVal(value);
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
		if (existingIndex > 0){
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
}
