using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Xml;
using System;
using MusicIO;
using UI;
using System.IO;
using Newtonsoft.Json;

public class InstrumentFactory : MonoBehaviour {

	public static InstrumentFactory Instance{ get { return m_instance; }}
	private static InstrumentFactory m_instance;
	
	public string m_client;		//Target OSC for instruments
	protected string m_source;		//Source we are sending messages from (first adress prefix in outgoing OSC)

	public string[] m_instrumentFilter;
	public GameObject instrumentPrefab = null;
	public GameObject paramPanelPrefab;
	public float m_radialInnerRadius = 0.05f;	
	public float m_radialOuterRadius = 0.5f;
	public float m_panelOrbitDistance = 0.2f;
	public TextAsset m_liveSessionFile;

	public ScrollerAttachment m_instrumentHolder;
    public TetrahedronBlenderAttachment m_returnHolder;

	void Start () {
		m_instance = this;
		m_source = GlobalConfig.Instance.ProjectSourceName;
	}

	/*
	 * Creates instruments from Live's song info
	 */
	public void LoadLiveSessionJson(string jsonString){
		Debug.Log (jsonString);

        Dictionary<string, object> song = JsonConvert.DeserializeObject<Dictionary<string, object>>(jsonString);

        object[] tracks = JsonConvert.DeserializeObject<object[]>(song["tracks"].ToString());
        foreach (object trackStr in tracks)
        {
            Dictionary<string, object> track = JsonConvert.DeserializeObject<Dictionary<string, object>>(trackStr.ToString());
            object[] devices = JsonConvert.DeserializeObject<object[]>(track["devices"].ToString());

            foreach(object deviceStr in devices){
                Dictionary<string, object> device = JsonConvert.DeserializeObject<Dictionary<string, object>>(deviceStr.ToString());
                object[] parameters = JsonConvert.DeserializeObject<object[]>(device["parameters"].ToString());

				foreach (object parameterStr in parameters)
                {
                    Dictionary<string, object> parameter = JsonConvert.DeserializeObject<Dictionary<string, object>>(parameterStr.ToString());
                    Debug.Log(parameter);
                }
            }
        }
		
	}
	
	
	/*
	 * Creates instruments from Live's dumped session xml
	 */
	public void LoadLiveSessionXml(string xmlString){

		XmlDocument sessionXml = new XmlDocument ();

		if(xmlString != null)
			sessionXml.LoadXml(xmlString);
		else
			sessionXml.LoadXml(m_liveSessionFile.text);

		//Get track, return, master information
		XmlNodeList trackList = sessionXml.GetElementsByTagName("track"); //instrument array	
		XmlNodeList returnList = sessionXml.GetElementsByTagName("trackReturn"); //instrument array	
		
        foreach(XmlNode track in trackList){
            
            InstrumentAttachment instrument = CreateInstrumentFromXmlList(track);
            if (instrument != null)
            {
                instrument.DockInto(m_instrumentHolder);
                InstrumentController.Instance.AddInstrument(instrument.musicRef);
            }
        }

		int returnIndex = 0;
        foreach (XmlNode returnTrack in returnList)
        {
            InstrumentAttachment returnInstrument = CreateInstrumentFromXmlList(returnTrack);
            if (returnInstrument != null)
            {
                InstrumentController.Instance.AddReturn(returnInstrument.musicRef);
				m_returnHolder.AddReturnInstrument(returnInstrument, returnIndex++); 
            }
        }
	}
	
	
	/*
	 * Creates instruments from xml lists
	 */
    private InstrumentAttachment CreateInstrumentFromXmlList(XmlNode track)
    {
		//Get track definition
		Color color = Utils.intToColor( int.Parse(track.Attributes["color"].Value) );
		int trackIndex = -1;
		bool isReturn = false;

		if(track.Attributes["index"] != null){
			trackIndex = int.Parse(track.Attributes["index"].Value);
			isReturn = false;
		} else if(track.Attributes["returnTrackIndex"] != null){
			trackIndex = int.Parse(track.Attributes["returnTrackIndex"].Value);
			isReturn = true;
		} else {
			return null;
		}

		bool isMidi = false;
		bool armed = false;

		if(!isReturn) {
			isMidi = bool.Parse(track.Attributes["midi"].Value);
			armed = bool.Parse( track.Attributes["armed"].Value );
        }

        BaseInstrument instrumentDef = new BaseInstrument(m_client, m_source, track.Attributes["name"].Value, color, armed, trackIndex, isMidi, isReturn);

        //Get devices present in track
		XmlNodeList deviceList = track.SelectNodes("device"); //device array	
		foreach(XmlNode device in deviceList){
			//Get params in device
			XmlNodeList paramList = device.SelectNodes("parameter"); //parameter array	
			int deviceIndex = int.Parse(device.Attributes["index"].Value);
					
			foreach(XmlNode parameter in paramList){
				string name = parameter.Attributes["name"].Value as String;
				name = name.Replace("/", "-");
				name = name.Replace(" ", "_");
				string deviceName = device.Attributes["name"].Value as String;
				deviceName = deviceName.Replace("/", "-");
				deviceName = deviceName.Replace(" ", "_");
				int parameterIndex =int.Parse(parameter.Attributes["index"].Value);

				float min = Convert.ToSingle(parameter.Attributes["min"].Value);
				float max = Convert.ToSingle(parameter.Attributes["max"].Value);
				instrumentDef.AddParam(name, min, max, deviceName, deviceIndex, parameterIndex);
			}
				
		}
			
		//Get clips in track
		XmlNodeList clipList = track.SelectNodes("clip");
		foreach(XmlNode clip in clipList){
			string name = clip.Attributes["name"].Value as String;
			int index = int.Parse( clip.Attributes["index"].Value );
			bool looping = Convert.ToBoolean( clip.Attributes["looping"].Value );
			instrumentDef.AddClip(name, looping, index);
		}
			
		//Get sends in track
		XmlNodeList sendsList = track.SelectNodes("sends");
		foreach(XmlNode send in sendsList){
			string name = send.Attributes["name"].Value as String;
            int sendIndex = int.Parse( send.Attributes["index"].Value );
			name = name.Replace("/", "-");
			name = name.Replace(" ", "_");
			//name = "Send-" + name;
			float min = Convert.ToSingle(send.Attributes["min"].Value);
			float max = Convert.ToSingle(send.Attributes["max"].Value);
            instrumentDef.AddSend(name, sendIndex);
		}

        InstrumentAttachment instrument = UIFactory.CreateInstrument(instrumentDef);
			
		//InstrumentController.Instance.AddInstrument(instrumentDef);
		//instrument.DockInto(m_instrumentHolder);

        return instrument;
	}
}
