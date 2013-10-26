using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Xml;
using System;
using MusicIO;

public class InstrumentFactory : MonoBehaviour {
	
	public static string GAMEINSTRUMENT_PREFIX = "GInstr_";
	public GameObject instrumentPrefab = null;
	public TextAsset instrumentDefinitionFile;
	public GameObject paramPanelPrefab;
	public float m_radialInnerRadius = 0.05f;	
	public float m_radialOuterRadius = 0.5f;
	public float m_panelOrbitDistance = 0.2f;
	
	private InstrumentController m_instrumentControllerRef;
	
	/*
	 * Prefabs
	 */
	protected static GameObject m_floatingClipPrefab;
	protected static GameObject m_textPrefab;
	protected static GameObject m_trianglePanelPrefab;
	protected static Material m_panelMaterial;

	void Start () {
		m_instrumentControllerRef = this.GetComponent<InstrumentController>();
		
		//Load prefabs
		m_floatingClipPrefab = Resources.LoadAssetAtPath("Assets/Prefabs/floatingClip.prefab", typeof(GameObject)) as GameObject;
		m_textPrefab = Resources.LoadAssetAtPath("Assets/Prefabs/GUI/paramLabel.prefab", typeof(GameObject)) as GameObject;
		m_trianglePanelPrefab = Resources.LoadAssetAtPath("Assets/Prefabs/GUI/trianglePanel.prefab", typeof(GameObject)) as GameObject;
		
		LoadInstrumentDefinitions();
	}
	
	void Update () {
	
	}
	
	
	/*
	 * Loads instrument definitions from XML
	 */
	private void LoadInstrumentDefinitions(){
		//Load xml
		XmlDocument instrumentDoc = new XmlDocument ();
		instrumentDoc.LoadXml ( instrumentDefinitionFile.text );
		
		XmlNodeList instrumentList = instrumentDoc.GetElementsByTagName("instrument"); //instrument array
		XmlNode source = instrumentDoc.SelectSingleNode("/instrumentDefinitions/source");
		XmlNode client = instrumentDoc.SelectSingleNode("/instrumentDefinitions/client");

		InstrumentController.Instance.SetSourceName(source.InnerText);
		
		//Create instrument objects		
		foreach(XmlNode instrument in instrumentList){		
			BaseInstrument instrumentDef = new BaseInstrument( client.InnerText, source.InnerText, instrument.Attributes["name"].Value );
			string[] colorStr = instrument.Attributes["colour"].Value.Split(',');
			Color instrColor = new Color(Convert.ToSingle(colorStr[0]), Convert.ToSingle(colorStr[1]), Convert.ToSingle(colorStr[2]));
			
			
			//Instrument parameter creation
			XmlNodeList paramList = instrument.SelectSingleNode("parameters").SelectNodes("param");
			
			//Add params to instrument
			foreach(XmlElement param in paramList){
				XmlAttribute name = param.Attributes["name"];
				XmlAttribute type = param.Attributes["type"];
				string typeStr = type != null ? type.Value : "";
				
				instrumentDef.AddParam(name.Value, typeStr);
			}
			
			//Clip creation
			XmlNodeList clipList = instrument.SelectSingleNode("clips").SelectNodes("clip");
			
			//Add clips to instrument
			foreach(XmlElement clip in clipList){
				XmlAttribute name = clip.Attributes["name"];
				XmlAttribute type = clip.Attributes["type"];
				XmlAttribute scene = clip.Attributes["scene"];
				string typeStr = type != null ? type.Value : "";
				
				instrumentDef.AddClip(name.Value, typeStr, int.Parse(scene.Value));
			}
			
			m_instrumentControllerRef.AddInstrument(instrumentDef);
			
			CreateLayeredInstrument(instrumentDef, instrColor);
		}
	}
	
	
	/*
	 * Creates a layered GameInstrument with rotary panel parameters seperated by layer
	 */
	private void CreateLayeredInstrument(BaseInstrument instrument, Color instrumentColor){
		//Create an instrument prefab
		GameObject instrumentGame = Instantiate(instrumentPrefab, transform.position, Quaternion.identity ) as GameObject;
		instrumentGame.name = GAMEINSTRUMENT_PREFIX + instrument.Name;

		//Add an instrument attachment to interface with the MusicIO controllers
		InstrumentAttachment attach = instrumentGame.AddComponent<InstrumentAttachment>();
		attach.Init(instrument);
		
		instrumentGame.renderer.material.SetColor("_Color", instrumentColor);
		
		//Create parameter radial menu
		if(instrument.paramList.Count > 0)
			attach.AddRadial( CreateRadialSelector(instrument.paramList, instrumentGame), ParameterType.PARAM );			
		
		//Create clip radial menu
		if(instrument.clipList.Count > 0)
			attach.AddRadial(  CreateRadialSelector(instrument.clipList, instrumentGame), ParameterType.CLIP );
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
			
			panel.GetComponent<MeshFilter>().mesh = panelMesh;
			panel.GetComponent<MeshCollider>().sharedMesh = panelMesh;
			panel.GetComponentInChildren<TextMesh>().text = parameterList[i].name;
				
			panel.transform.parent = panelLayer.transform;	
			panel.transform.localRotation = Quaternion.Euler(0.0f, 0.0f, 360/(float)parameterList.Count*(float)i);
			panel.transform.localPosition = new Vector3(0.0f, 0.0f, m_panelOrbitDistance);
			
			//Label position
			panel.transform.GetChild(0).GetChild(0).localPosition = new Vector3(0.0f, m_radialOuterRadius - 0.25f);
			panel.transform.GetChild(0).localRotation =  Quaternion.Euler(0.0f, 0.0f, 270.0f + (360/(float)parameterList.Count)*0.5f);
			panel.AddComponent<ParamAttachment>().Init(parameterList[i]);	
		}
		
		panelLayer.transform.position = parentObj.transform.position;
		panelLayer.transform.rotation = parentObj.transform.rotation;
		panelLayer.transform.parent = parentObj.transform;
		//panelLayer.transform.position += new Vector3(0.0f, 0.0f, );
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
		
		if(totalPanels > 2){	// 1 or 2 sides will need a square shaped layer.
			
			Vector3 a = new Vector3(Mathf.Cos((angleInc)* panelNum + Mathf.Deg2Rad * borderAngle ) * radius, Mathf.Sin((angleInc) * panelNum + Mathf.Deg2Rad * borderAngle ) * radius, 0.0f);
			Vector3 b = new Vector3(Mathf.Cos((angleInc)*(panelNum+1) - Mathf.Deg2Rad * borderAngle) * radius, Mathf.Sin((angleInc) * (panelNum+1) -Mathf.Deg2Rad * borderAngle ) * radius, 0.0f);
			Vector3 c = new Vector3(Mathf.Cos((angleInc)* panelNum + Mathf.Deg2Rad * borderAngle ) * innerRadius, Mathf.Sin((angleInc) * panelNum + Mathf.Deg2Rad * borderAngle ) * innerRadius, 0.0f);
			Vector3 d = new Vector3(Mathf.Cos((angleInc)*(panelNum+1) - Mathf.Deg2Rad * borderAngle) * innerRadius, Mathf.Sin((angleInc) * (panelNum+1) -Mathf.Deg2Rad * borderAngle ) * innerRadius, 0.0f);
			
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
		}
		
		layerMesh.vertices = vertices;
		layerMesh.normals = normals;
		layerMesh.uv = uvs;
		layerMesh.triangles = indices;
		layerMesh.RecalculateNormals();
		
		return layerMesh;
	}
	
	public static FloatingAttachment CreateFloatingAttachment(ParamAttachment attach){
		BaseInstrumentParam param = attach.musicRef as BaseInstrumentParam;
		
		GameObject paramObj = GameObject.Instantiate(m_floatingClipPrefab) as GameObject;
		FloatingAttachment floatAttach = paramObj.AddComponent<FloatingAttachment>();
		floatAttach.Init(param);
		return floatAttach;
	}
}
