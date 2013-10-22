using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using MusicIO;

public class InstrumentController : MonoBehaviour {
	
	private static InstrumentController m_instance;
	public static InstrumentController Instance{ get { return m_instance; }}

	public enum MusicObject{ INSTRUMENT = 0, PARAMETER};
	
	protected List<BaseInstrument> m_instruments;
	protected BaseInstrument m_selectedInstrument;
	protected GameObject m_lastSelectedGameInstrument = null;
	protected bool m_teslaInstrumentActive = false;			//Tesla specific killswitch
	protected bool m_teslaStateDirty = true;
	
	protected List<BaseInstrumentParam> m_selectedParams;	//Currently selected parameters across all instruments
	
	//Number of scenes expected in Live
	private int m_totalScenes = 0;
	public void SetNumScenes(int numScenes){ m_totalScenes = numScenes; }
	
	//Prefix source name in front of OSC messages
	private string m_sourceName;
	public void SetSourceName(string sourceName){ m_sourceName = sourceName; }
	
	//Unity
	//-----
	void Awake () {
		m_instruments = new List<BaseInstrument>();
		m_selectedParams = new List<BaseInstrumentParam>();
		m_instance = this;
	}
	
	public void ResetInstrumentParameters(BaseInstrument instrument){
		instrument.Reset();
		foreach(BaseInstrumentParam param in instrument.paramList){
			if(m_selectedParams.IndexOf(param) > -1){
				m_selectedParams.Remove(param);
				param.setEnabled(false);
			}
		}
	}
		
	public void ResetInstrument(BaseInstrument instrument){
		ResetInstrumentParameters(instrument);
		foreach(BaseInstrumentParam param in instrument.paramList){
			param.removeGenerators();
		}
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
			if(param.GetType() == typeof(NoteParam)){
				NoteParam chord = param as NoteParam;
				chord.setNote(value, 1.0f, 0, 1);
			}else if(param.GetType() == typeof(ToggleParam)){
				ToggleParam toggle = param as ToggleParam;
				toggle.setOverrideVal(value);
				toggle.setVal(value);
				Debug.Log ("Override is:" + value + " Clamped is:" + param.val);
			} else {
				param.setOverrideVal(value);
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
			if(param.GetType() == typeof(ToggleParam)){
				ToggleParam toggle = param as ToggleParam;
				toggle.setEnabled(true);
			} else {
				param.setEnabled(true);
			}
			Debug.Log (param + ", selected");
			m_selectedParams.Add(param);
		}
	}
	
	public void DeselectParameter(BaseInstrumentParam param){
		int existingIndex = m_selectedParams.IndexOf(param);
		if (existingIndex >= 0){
			if(param.GetType() == typeof(ToggleParam)){
				ToggleParam toggle = param as ToggleParam;
				toggle.setEnabled(false);
			} else {
				param.setEnabled(false);
			}
			Debug.Log (param + ", deselected");
			m_selectedParams.Remove(param);
		}
	}

	public void DeselectAllParameters(){
		m_selectedParams.Clear();		//Won't reset visual states! Move this into a dedicated tool
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
	
	//Global scene control
	public void ChangeScene(int scene){
		//float targetScene =Mathf.Clamp( (float)scene/(float)m_totalScenes, 0.0f, 1.0f);
		//int targetScene = Mathf.Clamp( Mathf.RoundToInt(Utils.Remap((float)scene, 1.0f, (float)m_totalScenes, 0.0f, 127.0f )), 0, 127 );
		int targetScene = scene-1;
		
		UnityOSC.OSCMessage msg = new UnityOSC.OSCMessage("/" + m_sourceName + "/scene", targetScene); 
		OSCHandler.Instance.SendBuiltMessageToClient(OSCcontroller.Instance.clientName, msg.Address, msg);
		OSCHandler.Instance.SendBuiltMessageToClient(OSCcontroller.Instance.loopbackName, msg.Address, msg);
	}
}
