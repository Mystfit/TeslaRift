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
	protected List<ClipBufferAttachment> m_buffers;
	protected MusicControllerAttachment m_selectedMusicController;

	//Controller references
	protected List<MusicControllerAttachment> m_musicGroups;
	
	//Prefix source name in front of OSC messages
	private string m_sourceName;
	public void SetSourceName(string sourceName){ m_sourceName = sourceName; }

	//Inspector toggles
	public bool m_blastAllParameters;

	
	
	// Unity
	//-------------------------------------
	void Awake () {
		m_instruments = new List<BaseInstrument>();
		m_buffers = new List<ClipBufferAttachment>();
		m_musicGroups = new List<MusicControllerAttachment>();
		m_instance = this;

		SetSourceName(GlobalConfig.Instance.ProjectSourceName);
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
	public void AddBuffer(ClipBufferAttachment buffer){
		m_buffers.Add(buffer);
	}


	/*
	 * Adds an object to the controller
	 */
	public void AddToActivePanel(BaseInstrumentParam param){
		if(m_selectedMusicController != null){
			if( param.GetType() == typeof(InstrumentClip)){
				m_selectedMusicController.clipBuffer.AddClipToBuffer ( (InstrumentClip) param );
			} else if( param.GetType() == typeof(GenericMusicParam) ){
				m_selectedMusicController.paramControls.CreateSlider( (GenericMusicParam) param );
			}
		}
	}


	/*
	 * Selects a buffer
	 */
	public void SelectMusicController(MusicControllerAttachment musicControl){
		if(m_selectedMusicController != null)
			m_selectedMusicController.SetSelected(false);
		m_selectedMusicController = musicControl;
		m_selectedMusicController.SetSelected(true);
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


	/*
	 * Music controller interaction
	 */
	public void AddMusicGroup(MusicControllerAttachment mGroup){
		m_musicGroups.Add(mGroup);
	}

	public List<MusicControllerAttachment> MusicGroups{ get { return m_musicGroups; }}
}
