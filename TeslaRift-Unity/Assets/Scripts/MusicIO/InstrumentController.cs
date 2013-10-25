using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using MusicIO;

public class InstrumentController : MonoBehaviour {
	
	//Singleton references
	private static InstrumentController m_instance;
	public static InstrumentController Instance{ get { return m_instance; }}
	
	//Instrument references
	protected List<BaseInstrument> m_instruments;
	protected BaseInstrument m_selectedInstrument;
	protected GameObject m_lastSelectedGameInstrument = null;
	
	//Buffer references
	protected List<ControlBuffer> m_buffers;
	protected ControlBuffer m_selectedBuffer;
	
	//Prefix source name in front of OSC messages
	private string m_sourceName;
	public void SetSourceName(string sourceName){ m_sourceName = sourceName; }
	
	
	// Unity
	//-------------------------------------
	void Awake () {
		m_instruments = new List<BaseInstrument>();
		m_buffers = new List<ControlBuffer>();
		m_instance = this;
	}
	
	
	void Update () {
		foreach(BaseInstrument instrument in m_instruments){
			instrument.update();
		}
	}
	
	
	/*
	 * Instrument reset
	 */
	public void ResetInstrumentParameters(BaseInstrument instrument){
		instrument.Reset();
		foreach(BaseInstrumentParam param in instrument.paramList){
			param.setEnabled(false);
		}
	}
		
	public void ResetInstrument(BaseInstrument instrument){
		ResetInstrumentParameters(instrument);
		foreach(BaseInstrumentParam param in instrument.paramList){
			param.removeGenerators();
		}
	}
	
	
	
	// Buffer manipulation
	//-------------------------------------
	
	/*
	 * Adds a new buffer
	 */
	public void AddBuffer(ControlBuffer buffer){
		m_buffers.Add(buffer);
	}
	
	
	/*
	 * Selects a buffer
	 */
	public void SelectBuffer(ControlBuffer buffer){
		m_selectedBuffer = buffer;
	}
	
	
	
	// Parameter selection and modification
	//-------------------------------------
	
	public void SelectParameter(BaseInstrumentParam param){
		m_selectedBuffer.AddParamToBuffer(param);
	}

	
	
	
	/*
	 * Deselects all selected parameters
	 */
	public void DeselectAllParameters(){
		m_selectedBuffer.ClearBuffer();		//Won't reset visual states! Move this into a dedicated tool
	}
	
	
	//Instrument selection
	//--------------------
	public BaseInstrument SelectedInstrument{ get { return m_selectedInstrument; } }
	
	
	/*
	 * Adds an instrument
	 */
	public void AddInstrument(BaseInstrument instrument){
		m_instruments.Add(instrument);
	}
	
	
	/*
	 * Gets instrument by name
	 */
	public BaseInstrument GetInstrumentByName(string targetInstrument){
		foreach(BaseInstrument instrument in m_instruments){
			if(instrument.Name == targetInstrument)
				return instrument;
		}
			
		return null;
	}
	
	
	/*
	 * Remembers last selected isntrument
	 */
	public void SetLastSelectedGameInstrument(GameObject gameInstrument){
		m_lastSelectedGameInstrument = gameInstrument;
	}
	
	
	/*
	 * Gets last selected isntrument
	 */
	public GameObject LastSelectedGameInstrument{ get { return m_lastSelectedGameInstrument; }}
}
