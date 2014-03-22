using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Xml;
using System;
using MusicIO;
using System.IO;

public class InstrumentFactory : MonoBehaviour {

	public static InstrumentFactory Instance{ get { return m_instance; }}
	private static InstrumentFactory m_instance;
	
	public string m_client;		//Target OSC for instruments
	protected string m_source;		//Source we are sending messages from (first adress prefix in outgoing OSC)
	
	public GameObject instrumentPrefab = null;
	public GameObject paramPanelPrefab;
	public float m_radialInnerRadius = 0.05f;	
	public float m_radialOuterRadius = 0.5f;
	public float m_panelOrbitDistance = 0.2f;
	public TextAsset m_liveSessionFile;

	private InstrumentController m_instrumentControllerRef;
	public VRCarousel m_instrumentHolder;

	/*
	 * Prefabs
	 */
	public GameObject m_floatingInstrumentIconPrefab;
	public GameObject m_textPrefab;
	public GameObject m_trianglePanelPrefab;
	protected static Material m_panelMaterial;

	void Start () {
		m_instance = this;

		m_instrumentControllerRef = this.GetComponent<InstrumentController>();
		m_source = GlobalConfig.Instance.ProjectSourceName;

		//Load prefabs
		//m_floatingClipPrefab = Resources.LoadAssetAtPath("Assets/Prefabs/floatingClip.prefab", typeof(GameObject)) as GameObject;
		//m_textPrefab = Resources.LoadAssetAtPath("Assets/Prefabs/GUI/paramLabel.prefab", typeof(GameObject)) as GameObject;
		//m_trianglePanelPrefab = Resources.LoadAssetAtPath("Assets/Prefabs/GUI/trianglePanel.prefab", typeof(GameObject)) as GameObject;
		
		//LoadInstrumentDefinitions();
		LoadLiveSessionXml();
	}
	
	
	/*
	 * Creates instruments from Live's dumped session xml
	 */
	private void LoadLiveSessionXml(){
		
		//Load xml
		//XmlReaderSettings settings = new XmlReaderSettings();
		//settings.IgnoreWhitespace = true;

		//Debug.Log(Application.dataPath);
		//StreamReader sr = new StreamReader( Application.dataPath + "/" + m_liveSessionFile );
		//XmlReader xmlRead = XmlReader.Create(sr, settings);
		
		XmlDocument sessionXml = new XmlDocument ();

		sessionXml.LoadXml(m_liveSessionFile.text);
		//sessionXml.Load( xmlRead );
		
		//Get track, return, master information
		XmlNodeList trackList = sessionXml.GetElementsByTagName("track"); //instrument array	
		XmlNodeList returnList = sessionXml.GetElementsByTagName("trackReturn"); //instrument array	

		InstrumentController.Instance.SetSourceName(m_source);

		Debug.Log(m_liveSessionFile.text);
		
		CreateInstrumentFromXmlList( trackList);
		CreateInstrumentFromXmlList( returnList);
	}
	
	
	/*
	 * Creates instruments from xml lists
	 */
	private void CreateInstrumentFromXmlList(XmlNodeList xmlList){

		float angleInc = 360 / xmlList.Count;
		//Tracks are converted to instruments
		foreach(XmlNode track in xmlList){	
			//Get track definition
			Color color = Utils.intToColor( int.Parse(track.Attributes["color"].Value) );		

			bool armed = false;
			XmlNode armedNode = track.Attributes["arm"];
			if(armedNode != null)
			   armed = bool.Parse( track.Attributes["arm"].Value );
			
			BaseInstrument instrumentDef = new BaseInstrument( m_client, m_source, track.Attributes["name"].Value, color, armed);
			
			//Get devices present in track
			XmlNodeList deviceList = track.SelectNodes("device"); //device array	
			foreach(XmlNode device in deviceList){

				if((String)device.Attributes["name"].Value != "Looper" &&
				   (String)device.Attributes["name"].Value != "Scale"){
					//Get params in device
					XmlNodeList paramList = device.SelectNodes("parameter"); //parameter array	
					
					foreach(XmlNode parameter in paramList){
						string name = parameter.Attributes["name"].Value as String;
						name = name.Replace("/", "-");
						name = name.Replace(" ", "_");
						string deviceName = device.Attributes["name"].Value as String;
						deviceName = deviceName.Replace("/", "-");
						deviceName = deviceName.Replace(" ", "_");

						float min = Convert.ToSingle(parameter.Attributes["min"].Value);
						float max = Convert.ToSingle(parameter.Attributes["max"].Value);
						instrumentDef.AddParam(name, "float", min, max, deviceName);
					}
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
				name = name.Replace("/", "-");
				name = name.Replace(" ", "_");
				name = "Send-" + name;
				float min = Convert.ToSingle(send.Attributes["min"].Value);
				float max = Convert.ToSingle(send.Attributes["max"].Value);
				instrumentDef.AddParam(name, "float", min, max);
			}
			
			m_instrumentControllerRef.AddInstrument(instrumentDef);
			m_instrumentHolder.AddInstrument( CreateLayeredInstrument(instrumentDef, color) );
		}

		//Sort instruments
		m_instrumentHolder.PlaceObjects();
	}

	
	
	/*
	 * Creates a layered GameInstrument with rotary panel parameters seperated by layer
	 */
	private GameObject CreateLayeredInstrument(BaseInstrument instrument, Color instrumentColor){
		//Create an instrument prefab
		GameObject instrumentGame = Instantiate(instrumentPrefab, transform.position, Quaternion.identity ) as GameObject;
		instrumentGame.name = instrument.Name;
		instrumentGame.transform.parent = m_instrumentHolder.transform;

		//Create instrument attachment
		InstrumentAttachment attach = instrumentGame.AddComponent<InstrumentAttachment>();	//Instrument attachment needs to be manually added

		//Init instrumentRef and GUI controls
		attach.Init(instrument);
		attach.InitInstrumentControls();

		//Set listener prefixes
		instrumentGame.GetComponent<InstrumentListener>().SetPrefixedOSCAddresses(instrument.Name);		//Set instrument prefixes for OSC listener
		instrumentGame.renderer.material.SetColor("_Color", instrumentColor);

		return instrumentGame;
	}	
}
