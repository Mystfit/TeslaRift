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

	//Prefix source name in front of OSC messages
	private string m_sourceName;
	public void SetSourceName(string sourceName){ m_sourceName = sourceName; }

	//Inspector toggles
	public bool m_blastAllParameters;
	
	
	// Unity
	//-------------------------------------
	void Awake () {
		m_instruments = new List<BaseInstrument>();
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

    public BaseInstrument GetInstrumentByTrackindex(int trackindex)
    {
        foreach (BaseInstrument instrument in m_instruments)
        {
            if (instrument.trackIndex == trackindex)
                return instrument;
        }

        return null;
    }

    /*
     * Finds a specific parameter by index
     */
    public BaseInstrumentParam FindParameter(int trackindex, int deviceindex, int parameterindex){
        foreach (BaseInstrument instrument in m_instruments)
        {
            if (instrument.trackIndex == trackindex)
            {
                foreach (BaseInstrumentParam param in instrument.paramList)
                {
                    if (param.deviceIndex == deviceindex && param.parameterIndex == parameterindex)
                    {
                        return param;
                    }
                }
            }
        }
        return null;
    }

    /*
     * Find a specific clip by index
     */
    public InstrumentClip FindClip(int trackindex, int clipindex)
    {
        foreach (BaseInstrument instrument in m_instruments)
        {
            if (instrument.trackIndex == trackindex)
            {
                foreach (InstrumentClip clip in instrument.clipList)
                {
                    if (clip.scene == clipindex)
                    {
                        return clip;
                    }
                }
            }
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
	 * Instrument playing
	 */
	 public void TriggerNote(){
	 	if(m_selectedInstrument != null){
	 		m_selectedInstrument.TriggerNote();
	 	}
	 }

}
