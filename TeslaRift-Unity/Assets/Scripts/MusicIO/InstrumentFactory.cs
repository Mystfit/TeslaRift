using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Xml;
using System;

public class InstrumentFactory : MonoBehaviour {
	
	public static string GAMEINSTRUMENT_PREFIX = "GInstr_";
	public GameObject instrumentPrefab = null;
	public TextAsset instrumentDefinitionFile;
	public GameObject paramPanelPrefab;
	public float radialInnerRadius = 0.05f;	
	public float radialOuterRadius = 0.5f;

	private InstrumentController m_instrumentControllerRef;

	void Start () {
		m_instrumentControllerRef = this.GetComponent<InstrumentController>();
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
		XmlNode scenes = instrumentDoc.SelectSingleNode("/instrumentDefinitions/scenes");

		InstrumentController.Instance.SetSourceName(source.InnerText);
		InstrumentController.Instance.SetNumScenes( int.Parse(scenes.InnerText));
		
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
				
				instrumentDef.addParam(name.Value, typeStr);
			}
			
			//Clip creation
			XmlNodeList clipList = instrument.SelectSingleNode("clips").SelectNodes("clip");
			
			//Add params to instrument
			foreach(XmlElement clip in clipList){
				XmlAttribute name = clip.Attributes["name"];
				XmlAttribute type = clip.Attributes["type"];
				XmlAttribute scene = clip.Attributes["scene"];
				string typeStr = type != null ? type.Value : "";
				
				instrumentDef.addClip(name.Value, typeStr, int.Parse(scene.Value));
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

		//Add an instrument attachmet to interface with the MusicIO controllers
		instrumentGame.AddComponent<InstrumentAttachment>().Init(instrument);
		instrumentGame.renderer.material.SetColor("_Color", instrumentColor);
				
		//Build a mesh for each layer with the number of parameters/clips
		if(instrument.clipList.Count > 0){
			
		}
		
		if(instrument.paramList.Count > 0){
			//Creates a gameobject containing each triangle panel
			GameObject paramLayer = CreatePolygonLayer(instrument.paramList, radialOuterRadius, radialInnerRadius);
			paramLayer.transform.position = instrumentGame.transform.position;
			paramLayer.transform.rotation = instrumentGame.transform.rotation;
			paramLayer.transform.parent = instrumentGame.transform;
			paramLayer.transform.position += new Vector3(0.0f, 0.0f, -0.2f);
			
			//Orients panels to fan around center
			foreach(Transform child in paramLayer.transform.GetComponentsInChildren<Transform>()){
				//child.LookAt(instrumentGame.transform);
				//child.gameObject.renderer.material.SetColor("_Color", Color.white);
			}
		}
		
		if(instrument.clipList.Count > 0){
			//Creates a gameobject containing each triangle panel
			GameObject clipLayer = CreatePolygonLayer(instrument.clipList, radialOuterRadius, radialInnerRadius );
			clipLayer.transform.position = instrumentGame.transform.position;
			clipLayer.transform.rotation = instrumentGame.transform.rotation;
			clipLayer.transform.parent = instrumentGame.transform;
			clipLayer.transform.position += new Vector3(0.0f, 0.0f, -0.2f);
			
			//Orients panels to fan around center
			foreach(Transform child in clipLayer.transform.GetComponentsInChildren<Transform>()){
				//child.LookAt(instrumentGame.transform);
				//child.gameObject.renderer.material.SetColor("_Color", Color.white);
			}
		}
	}
	
	
	/*
	 * Creates a layer of triangular panels representing selectable parameters
	 */
	private GameObject CreatePolygonLayer(List<BaseInstrumentParam> attachList, float radius, float innerRadius){
		GameObject panelLayer = new GameObject("panelLayer");
		GameObject textPrefab = Resources.LoadAssetAtPath("Assets/Prefabs/paramLabel.prefab", typeof(GameObject)) as GameObject;
		GameObject trianglePanelPrefab = Resources.LoadAssetAtPath("Assets/Prefabs/trianglePanel.prefab", typeof(GameObject)) as GameObject;
		Material panelMaterial = Resources.LoadAssetAtPath("Assets/materials/whiteMat.mat", typeof(Material)) as Material;

		for(int i = 0; i < attachList.Count; i++){
			//Create a tiangle panel for this parameter
			Mesh panelMesh = CreatePolygonPanel(0, attachList.Count, radius, innerRadius);
			GameObject panel = Instantiate(trianglePanelPrefab) as GameObject;
			
			panel.GetComponent<MeshFilter>().mesh = panelMesh;
			panel.GetComponent<MeshCollider>().sharedMesh = panelMesh;
			panel.GetComponentInChildren<TextMesh>().text = attachList[i].name;
				
			panel.transform.parent = panelLayer.transform;	
			panel.transform.localRotation = Quaternion.Euler(0.0f, 0.0f, 360/(float)attachList.Count*(float)i);
			panel.transform.GetChild(0).GetChild(0).localPosition = new Vector3(0.0f, radius-0.05f, 0.0f);
			panel.transform.GetChild(0).localRotation =  Quaternion.Euler(0.0f, 0.0f, 270.0f + (360/(float)attachList.Count)*0.5f);
			panel.AddComponent<ParamAttachment>().Init(attachList[i]);	
		}
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
}
