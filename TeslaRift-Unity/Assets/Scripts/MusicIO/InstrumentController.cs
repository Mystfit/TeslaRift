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
	
	
	// Unity
	//-------------------------------------
	void Awake () {
		m_instruments = new List<BaseInstrument>();
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
		foreach(GenericMusicParam param in instrument.paramList){
			param.setEnabled(false);
		}
	}
		
	public void ResetInstrument(BaseInstrument instrument){
		ResetInstrumentParameters(instrument);
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

    public SendParameter FindSendParameter(int trackindex, int sendindex){
        foreach (BaseInstrument instrument in m_instruments)
        {
            if (instrument.trackIndex == trackindex)
            {
                foreach (SendParameter send in instrument.sendsList)
                {
                    if (send.sendIndex == sendindex)
                    {
                        return send;
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

}
