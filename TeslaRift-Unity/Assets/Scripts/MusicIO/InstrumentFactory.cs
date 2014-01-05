using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Xml;
using System;
using MusicIO;
using System.IO;

public class InstrumentFactory : MonoBehaviour {
	
	public string m_client;		//Target OSC for instruments
	protected string m_source;		//Source we are sending messages from (first adress prefix in outgoing OSC)
	
	public GameObject instrumentPrefab = null;
	public TextAsset instrumentDefinitionFile;
	public GameObject paramPanelPrefab;
	public float m_radialInnerRadius = 0.05f;	
	public float m_radialOuterRadius = 0.5f;
	public float m_panelOrbitDistance = 0.2f;
	public string m_liveSessionFile;
	
	private InstrumentController m_instrumentControllerRef;
	public VRCarousel m_instrumentHolder;
	
	/*
	 * Prefabs
	 */
	protected static GameObject m_floatingClipPrefab;
	protected static GameObject m_textPrefab;
	protected static GameObject m_trianglePanelPrefab;
	protected static Material m_panelMaterial;

	void Start () {
		m_instrumentControllerRef = this.GetComponent<InstrumentController>();
		m_source = GlobalConfig.Instance.ProjectSourceName;

		//Load prefabs
		m_floatingClipPrefab = Resources.LoadAssetAtPath("Assets/Prefabs/floatingClip.prefab", typeof(GameObject)) as GameObject;
		m_textPrefab = Resources.LoadAssetAtPath("Assets/Prefabs/GUI/paramLabel.prefab", typeof(GameObject)) as GameObject;
		m_trianglePanelPrefab = Resources.LoadAssetAtPath("Assets/Prefabs/GUI/trianglePanel.prefab", typeof(GameObject)) as GameObject;
		
		//LoadInstrumentDefinitions();
		LoadLiveSessionXml();
	}
	
	
	/*
	 * Creates instruments from Live's dumped session xml
	 */
	private void LoadLiveSessionXml(){
		
		//Load xml
		XmlReaderSettings settings = new XmlReaderSettings();
		settings.IgnoreWhitespace = true;
		
		StreamReader sr = new StreamReader( Application.dataPath + "../../../Live/MidiRemote/" + m_liveSessionFile );
		XmlReader xmlRead = XmlReader.Create(sr, settings);
		
		XmlDocument sessionXml = new XmlDocument ();
		sessionXml.Load( xmlRead );
		
		//Get track, return, master information
		XmlNodeList trackList = sessionXml.GetElementsByTagName("track"); //instrument array	
		XmlNodeList returnList = sessionXml.GetElementsByTagName("trackReturn"); //instrument array	

		InstrumentController.Instance.SetSourceName(m_source);
		
		CreateInstrumentFromXmlList( trackList);
		CreateInstrumentFromXmlList( returnList);
	}
	
	
	/*
	 * Creates instruments from xml lists
	 */
	private void CreateInstrumentFromXmlList(XmlNodeList xmlList){

		int insCount = 0;
		float angleInc = 360 / xmlList.Count;
		//Tracks are converted to instruments
		foreach(XmlNode track in xmlList){	
			//Get track definition
			Color color = Utils.intToColor( int.Parse(track.Attributes["color"].Value) );		
			bool armed = bool.Parse( track.Attributes["arm"] );
			
			BaseInstrument instrumentDef = new BaseInstrument( m_client, m_source, track.Attributes["name"].Value, color, armed);
			
			//Get devices present in track
			XmlNodeList deviceList = track.SelectNodes("device"); //device array	
			foreach(XmlNode device in deviceList){
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

		InstrumentAttachment attach = instrumentGame.AddComponent<InstrumentAttachment>();	//Instrument attachment needs to be manually added
		attach.Init(instrument);															//Init with instrument object to set musicref
		instrumentGame.GetComponent<InstrumentListener>().SetPrefixedOSCAddresses(instrument.Name);		//Set instrument prefixes for OSC listener
		instrumentGame.renderer.material.SetColor("_Color", instrumentColor);
		
		//Create parameter radial menu
		if(instrument.paramList.Count > 0){
			GameObject panelLayer = CreateRadialSelector(instrument.paramList, instrumentGame);
			panelLayer.name = "paramLayer";
			attach.AddRadial( panelLayer, ParameterType.PARAM );			
		}
		
		//Create clip radial menu
		if(instrument.clipList.Count > 0){
			GameObject panelLayer = CreateRadialSelector(instrument.clipList, instrumentGame);
			panelLayer.name = "clipLayer";
			attach.AddRadial( panelLayer, ParameterType.CLIP );
		}
		
		
		return instrumentGame;
	}
	
	
	/*
	 * Creates a radial menu selector from a list of parameters/clips
	 */
	private GameObject CreateRadialSelector(List<BaseInstrumentParam> parameterList, GameObject parentObj)
	{
		GameObject panelLayer = new GameObject("panelLayer");
		

		for(int i = 0; i < parameterList.Count; i++){
			//Create a tiangle panel for this parameter
			Mesh panelMesh = CreatePolygonPanel(0, parameterList.Count, m_radialOuterRadius, m_radialInnerRadius);
			GameObject panel = Instantiate(m_trianglePanelPrefab) as GameObject;
			panel.name = (parameterList[i].deviceName != "") ? parameterList[i].deviceName + "/" + parameterList[i].name : parameterList[i].name;
			
			panel.GetComponent<MeshFilter>().mesh = panelMesh;
			panel.GetComponent<MeshCollider>().sharedMesh = panelMesh;
			panel.GetComponentInChildren<TextMesh>().text = parameterList[i].name;
				
			panel.transform.parent = panelLayer.transform;	
			panel.transform.localRotation = Quaternion.Euler(0.0f, 0.0f, 180/(float)parameterList.Count*(float)i);
			panel.transform.localPosition = new Vector3(0.0f, 0.0f, m_panelOrbitDistance);
			
			//Label position
			panel.transform.GetChild(0).GetChild(0).localPosition = new Vector3(0.0f, m_radialOuterRadius - 0.25f);
			panel.transform.GetChild(0).localRotation =  Quaternion.Euler(0.0f, 0.0f, 270.0f + (360/(float)parameterList.Count)*0.5f);
			panel.AddComponent<ParamAttachment>().Init(parameterList[i]);	
		}
		
		panelLayer.transform.position = parentObj.transform.position;
		panelLayer.transform.rotation = parentObj.transform.rotation;
		panelLayer.transform.parent = parentObj.transform;
		panelLayer.SetActive(false);
		
		return panelLayer;
	}
	
	
	/*
	 * Creates a single parameter panel as either a triangle or a quad
	 */
	private Mesh CreatePolygonPanel(int panelNum, int totalPanels, float radius, float innerRadius){
		
		Mesh layerMesh = new Mesh(); 
		float angleInc = Mathf.PI*2 / totalPanels;
		float borderAngle = 2.25f;
		Vector3 depth = new Vector3(0.0f,0.0f,0.01f);
		Vector3 lowEdge = new Vector3(0.0f,0.0f,-0.03f);
		
		Vector3[] vertices = new Vector3[8];
		Vector3[] normals = new Vector3[8];
		Vector2[] uvs = new Vector2[8];
		int[] indices = new int[36];
		
		Vector3 a = Vector3.zero;
		Vector3 b = Vector3.zero;
		Vector3 c = Vector3.zero;
		Vector3 d = Vector3.zero;
		
		if(totalPanels > 2){	// 1 or 2 sides will need a square shaped layer.
			a = new Vector3(Mathf.Cos((angleInc)* panelNum + Mathf.Deg2Rad * borderAngle ) * radius, Mathf.Sin((angleInc) * panelNum + Mathf.Deg2Rad * borderAngle ) * radius, 0.0f);
			b = new Vector3(Mathf.Cos((angleInc)*(panelNum+1) - Mathf.Deg2Rad * borderAngle) * radius, Mathf.Sin((angleInc) * (panelNum+1) -Mathf.Deg2Rad * borderAngle ) * radius, 0.0f);
			c = new Vector3(Mathf.Cos((angleInc)* panelNum + Mathf.Deg2Rad * borderAngle ) * innerRadius, Mathf.Sin((angleInc) * panelNum + Mathf.Deg2Rad * borderAngle ) * innerRadius, 0.0f);
			d = new Vector3(Mathf.Cos((angleInc)*(panelNum+1) - Mathf.Deg2Rad * borderAngle) * innerRadius, Mathf.Sin((angleInc) * (panelNum+1) -Mathf.Deg2Rad * borderAngle ) * innerRadius, 0.0f);
		} else if(totalPanels == 2){
			float topOffset = (panelNum == 0) ? 1.0f : 0.0f;
			float bottomOffset = (panelNum == 0) ? 0.0f : 1.0f;
			a = new Vector3(-radius, -(radius * topOffset) ,0.0f);
			b = new Vector3(radius, -(radius * topOffset),0.0f);
			c = new Vector3(-radius, radius * bottomOffset,0.0f);
			d = new Vector3(radius, radius * bottomOffset,0.0f);
		} else if(totalPanels == 1){
			a = new Vector3(-radius, -radius ,0.0f);
			b = new Vector3(radius, -radius ,0.0f);
			c = new Vector3(-radius, radius ,0.0f);
			d = new Vector3(radius, radius ,0.0f);
		}

		//Hardcoded vertices
		vertices[0] = a;
		vertices[1] = b;
		vertices[2] = c + lowEdge;
		vertices[3] = d + lowEdge;
		vertices[4] = a + depth;
		vertices[5] = b + depth;
		vertices[6] = c + depth + lowEdge;
		vertices[7] = d + depth + lowEdge;

		normals[0] = -Vector3.forward;
		normals[1] = -Vector3.forward;
		normals[2] = -Vector3.forward;
		normals[3] = -Vector3.forward;
		normals[4] = -Vector3.forward;
		normals[5] = -Vector3.forward;
		normals[6] = -Vector3.forward;
		normals[7] = -Vector3.forward;

		uvs[0] = new Vector2(0,0);
		uvs[1] = new Vector2(0,1); 
		uvs[2] = new Vector2(1,0);
		uvs[3] = new Vector2(1,1);
		uvs[4] = uvs[1];
		uvs[5] = uvs[2];
		uvs[6] = uvs[2];
		uvs[7] = uvs[3];
		
		//Front
		indices[0] = 0;
		indices[1] = 2;
		indices[2] = 1;
		indices[3] = 2;
		indices[4] = 3;
		indices[5] = 1;
		
		//Back
		indices[6] = 4;
		indices[7] = 5;
		indices[8] = 6;
		indices[9] = 6;
		indices[10] = 5;
		indices[11] = 7;
		
		//Top
		indices[12] = 1;
		indices[13] = 5;
		indices[14] = 0;
		indices[15] = 5;
		indices[16] = 4;
		indices[17] = 0;
		
		//Right
		indices[18] = 3;
		indices[19] = 7;
		indices[20] = 1;
		indices[21] = 7;
		indices[22] = 5;
		indices[23] = 1;
		
		//Bottom
		indices[24] = 2;
		indices[25] = 6;
		indices[26] = 3;
		indices[27] = 6;
		indices[28] = 7;
		indices[29] = 3;
		
		//Left
		indices[30] = 0;
		indices[31] = 4;
		indices[32] = 2;
		indices[33] = 4;
		indices[34] = 6;
		indices[35] = 2;	
		
		layerMesh.vertices = vertices;
		layerMesh.normals = normals;
		layerMesh.uv = uvs;
		layerMesh.triangles = indices;
		layerMesh.RecalculateNormals();
		
		return layerMesh;
	}
	
	public static GameObject CreateFloatingInstrument(BaseInstrument instrument){
		GameObject insObj = GameObject.Instantiate(m_floatingClipPrefab) as GameObject;
		insObj.renderer.material.SetColor("_Color", instrument.color);
		return insObj;
	}

}
