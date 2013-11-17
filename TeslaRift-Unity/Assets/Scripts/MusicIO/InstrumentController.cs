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
	protected List<GameObject> m_instrumentGameObjs;
	protected GameObject m_lastSelectedGameInstrument = null;
	
	//Buffer references
	protected List<BufferAttachment> m_buffers;
	protected ParamSliderPanelAttachment m_paramPanel;
	
	//Prefix source name in front of OSC messages
	private string m_sourceName;
	public void SetSourceName(string sourceName){ m_sourceName = sourceName; }
	
	//Inspector toggles
	public bool m_blastAllParameters;

	
	
	// Unity
	//-------------------------------------
	void Awake () {
		m_instruments = new List<BaseInstrument>();
		m_instrumentGameObjs = new List<GameObject>();
		m_buffers = new List<BufferAttachment>();
		m_instance = this;
	}
	
	
	void Update () {
		foreach(BaseInstrument instrument in m_instruments){
			instrument.update();
		}
		
		if(m_blastAllParameters){
			m_blastAllParameters = false;
			foreach(BaseInstrument instrument in m_instruments){
				foreach(BaseInstrumentParam param in instrument.paramList){
					param.setVal(1.0f);
				}
				
				foreach(InstrumentClip clip in instrument.clipList){
					clip.Play();
				}
			}
		}
	}
	
	
	/*
	 * Instrument reset
	 */
	public void ResetInstrumentParameters(BaseInstrument instrument){
		instrument.Reset();
		foreach(GenericMusicParam param in instrument.paramList){
			param.setEnabled(false);
		}
	}
		
	public void ResetInstrument(BaseInstrument instrument){
		ResetInstrumentParameters(instrument);
		foreach(GenericMusicParam param in instrument.paramList){
			param.removeGenerators();
		}
	}
	
	
	
	// Buffer manipulation
	//-------------------------------------
	
	/*
	 * Adds a new buffer
	 */
	public void AddBuffer(BufferAttachment buffer){
		m_buffers.Add(buffer);
	}
	
	public void AddToActivePanel(BaseInstrumentParam param){
		if(m_paramPanel != null){
			m_paramPanel.CreateSlider( param );
		}
	}

	/*
	 * Selects a buffer
	 */
	public void SelectBuffer(ParamSliderPanelAttachment panel){
		if(m_paramPanel != null)
			m_paramPanel.SetSelected(false);
		m_paramPanel = panel;
		m_paramPanel.SetSelected(true);
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
	
	public void AddInstrumentGame(GameObject instrumentGame){
		m_instrumentGameObjs.Add(instrumentGame);
	}
	
	public GameObject GetInstrumentGameByMusicReference(BaseInstrument instrumentRef){
		foreach(GameObject instrumentGame in m_instrumentGameObjs){
			if (instrumentGame.GetComponent<InstrumentAttachment>().musicRef == instrumentRef){
				return instrumentGame;
			}
		}
		return null;
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
