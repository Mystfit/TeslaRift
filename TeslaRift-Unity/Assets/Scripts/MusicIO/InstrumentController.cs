using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using MusicIO;

public class InstrumentController : MonoBehaviour {
	
	//Singleton references
	private static InstrumentController m_instance;
	public static InstrumentController Instance{ get { return m_instance; }}
	
	//Instrument references
	protected List<Instrument> m_instruments;
    protected List<Instrument> m_returns;
	protected Instrument m_selectedInstrument;
	protected GameObject m_lastSelectedGameInstrument = null;
	
	
	// Unity
	//-------------------------------------
	void Awake () {
		m_instruments = new List<Instrument>();
        m_returns = new List<Instrument>();
		m_instance = this;
	}
	
	
	void Update () {
		foreach(Instrument instrument in m_instruments){
			instrument.update();
		}

        foreach (Instrument instrument in m_returns)
        {
            instrument.update();
        }
	}
	
	
	/*
	 * Instrument reset
	 */
	public void ResetInstrumentParameters(Instrument instrument){
		instrument.Reset();
		foreach(InstrumentParameter param in instrument.paramList){
			param.setEnabled(false);
		}
	}
		
	public void ResetInstrument(Instrument instrument){
		ResetInstrumentParameters(instrument);
	}


	//Instrument selection
	//--------------------
	public Instrument SelectedInstrument{ get { return m_selectedInstrument; } }
	
	
	/*
	 * Adds an instrument
	 */
	public void AddInstrument(Instrument instrument){
		m_instruments.Add(instrument);
	}

    public void AddReturn(Instrument instrument)
    {
        m_returns.Add(instrument);
    }
	
	
	/*
	 * Gets instrument by name
	 */
	public Instrument GetInstrumentByName(string targetInstrument){
		foreach(Instrument instrument in m_instruments){
			if(instrument.name == targetInstrument)
				return instrument;
		}

		return null;
	}

    public Instrument GetInstrumentByTrackindex(int trackindex)
    {
        foreach (Instrument instrument in m_instruments)
        {
            if (instrument.trackIndex == trackindex)
                return instrument;
        }

        return null;
    }

    /*
     * Finds a specific parameter by index
     */
    public DeviceParameter FindParameter(int trackindex, int deviceindex, int parameterindex, int category){

        List<Instrument> instrumentList;

        if (category == 0)
            instrumentList = m_instruments;
        else
            instrumentList = m_returns;

        foreach (Instrument instrument in instrumentList)
        {
            if (instrument.trackIndex == trackindex)
            {
                foreach (DeviceParameter param in instrument.paramList)
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
        foreach (Instrument instrument in m_instruments)
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
    public ClipParameter FindClip(int trackindex, int clipindex)
    {
        foreach (Instrument instrument in m_instruments)
        {
            if (instrument.trackIndex == trackindex)
            {
                foreach (ClipParameter clip in instrument.clipList)
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
