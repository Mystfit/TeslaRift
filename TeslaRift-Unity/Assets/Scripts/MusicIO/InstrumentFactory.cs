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
	public float panelDistance = 1.0f;
	private InstrumentController m_instrumentControllerRef;
	public enum PanelMode {
		SURROUND = 0, 
		LAYERS
	}
	public PanelMode m_panelLayout;
	
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

		InstrumentController.instance.SetSourceName(source.InnerText);
		InstrumentController.instance.SetNumScenes( int.Parse(scenes.InnerText));
		
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
			
			//Panel layout generators
			switch(m_panelLayout){
			case PanelMode.LAYERS:
				CreateLayeredInstrument(instrumentDef, instrColor);
				break;
			case PanelMode.SURROUND:
				CreateSurroundInstrument(instrumentDef, instrColor);
				break;
			}
			
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
			GameObject paramLayer = CreatePolygonLayer(instrument.paramList, panelDistance );
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
	}
	
	
	/*
	 * Creates a layer of triangular panels representing selectable parameters
	 */
	private GameObject CreatePolygonLayer(List<BaseInstrumentParam> attachList, float radius){
		GameObject panelLayer = new GameObject("panelLayer");
		GameObject textPrefab = Resources.LoadAssetAtPath("Assets/Prefabs/paramLabel.prefab", typeof(GameObject)) as GameObject;
		GameObject trianglePanelPrefab = Resources.LoadAssetAtPath("Assets/Prefabs/trianglePanel.prefab", typeof(GameObject)) as GameObject;
		Material panelMaterial = Resources.LoadAssetAtPath("Assets/materials/whiteMat.mat", typeof(Material)) as Material;

		for(int i = 0; i < attachList.Count; i++){
			//Create a tiangle panel for this parameter
			Mesh panelMesh = CreatePolygonPanel(0, attachList.Count, radius);
			GameObject panel = Instantiate(trianglePanelPrefab) as GameObject;
			panel.GetComponent<MeshFilter>().mesh = panelMesh;
			panel.GetComponent<MeshCollider>().sharedMesh = panelMesh;
			panel.GetComponentInChildren<TextMesh>().text = attachList[i].name;
			panel.transform.parent = panelLayer.transform;	
			panel.transform.localRotation = Quaternion.Euler(0.0f, 0.0f, 360/(float)attachList.Count*(float)i);
			panel.AddComponent<ParamAttachment>().Init(attachList[i]);
			
			
		}
		return panelLayer;
	}
	
	
	/*
	 * Creates a single parameter panel as either a triangle or a quad
	 */
	private Mesh CreatePolygonPanel(int panelNum, int totalPanels, float radius){
		
		Mesh layerMesh = new Mesh(); 
		float angleInc = Mathf.PI*2 / totalPanels;
		float borderAngle = 1.25f;
		Vector3 depth = new Vector3(0.0f,0.0f,0.01f);
		
		Vector3[] vertices = new Vector3[6];
		Vector3[] normals = new Vector3[6];
		Vector2[] uvs = new Vector2[6];
		int[] indices = new int[24];
		
		if(totalPanels > 2){	// 1 or 2 sides will need a square shaped layer.
			
			Vector3 a = new Vector3(Mathf.Cos((angleInc)* panelNum + Mathf.Deg2Rad * borderAngle -(angleInc*0.5f) ) * radius, Mathf.Sin((angleInc) * panelNum + Mathf.Deg2Rad * borderAngle -(angleInc*0.5f) ) * radius, 0.0f);
			Vector3 b = new Vector3(Mathf.Cos((angleInc)*(panelNum+1) - Mathf.Deg2Rad * borderAngle -(angleInc*0.5f)) * radius, Mathf.Sin((angleInc) * (panelNum+1) -Mathf.Deg2Rad * borderAngle -(angleInc*0.5f)) * radius, 0.0f);
			Vector3 c = new Vector3(
				((Mathf.Cos((angleInc -(angleInc*0.5f))*panelNum+Mathf.Deg2Rad*5.0f ) * borderAngle*0.005f) + (Mathf.Cos((angleInc -(angleInc*0.5f))*(panelNum+1)-Mathf.Deg2Rad*5.0f) * borderAngle*0.005f)) * 0.5f,
				((Mathf.Sin((angleInc -(angleInc*0.5f))*panelNum+Mathf.Deg2Rad*5.0f ) * borderAngle*0.005f) + (Mathf.Sin((angleInc -(angleInc*0.5f))*(panelNum+1)-Mathf.Deg2Rad*5.0f) * borderAngle*0.005f)) * 0.5f,
				0.0f
			);
			vertices[0] = a;
			vertices[1] = b;
			vertices[2] = c;
			vertices[3] = a + depth;
			vertices[4] = b + depth;
			vertices[5] = c + depth;
			normals[0] = -Vector3.forward;
			normals[1] = -Vector3.forward;
			normals[2] = -Vector3.forward;
			normals[3] = -Vector3.forward;
			normals[4] = -Vector3.forward;
			normals[5] = -Vector3.forward;
			uvs[0] = new Vector2( (((Mathf.Cos(angleInc*panelNum) * radius) + radius*0.5f) / radius*2), 
				(((Mathf.Sin(angleInc*panelNum) * radius) + radius*0.5f) / radius*2)  );
			uvs[1] = new Vector2( (((Mathf.Cos(angleInc*panelNum+1) * radius) + radius*0.5f) / radius*2), 
				(((Mathf.Sin(angleInc*panelNum+1) * radius) + radius*0.5f) / radius*2)  );
			uvs[2] = new Vector2(0.5f, 0.5f);
			uvs[3] = uvs[0];
			uvs[4] = uvs[1];
			uvs[5] = uvs[2];
			
			//Top
			indices[0] = 0;
			indices[1] = 2;
			indices[2] = 1;
			
			//Bottom
			indices[3] = 3;
			indices[4] = 4;
			indices[5] = 5;
			
			//Topright side
			indices[6] = 0;
			indices[7] = 1;
			indices[8] = 4;
			indices[9] = 4;
			indices[10] = 3;
			indices[11] = 0;
			
			//Topleft side
			indices[12] = 1;
			indices[13] = 2;
			indices[14] = 5;
			indices[15] = 5;
			indices[16] = 4;
			indices[17] = 1;
			
			//Bottom side
			indices[18] = 2;
			indices[19] = 0;
			indices[20] = 3;
			indices[21] = 3;
			indices[22] = 5;
			indices[23] = 2;
			
		} else {
			if(totalPanels == 1){
				vertices = new Vector3[4];
				normals = new Vector3[4];
				uvs = new Vector2[4];
				indices = new int[6];
				
				vertices[0] = new Vector3(radius * -1.0f, radius * -1.0f, 0.0f);
				vertices[1] = new Vector3(radius, radius * -1.0f, 0.0f);
				vertices[2] = new Vector3(radius * -1.0f, radius, 0.0f);
				vertices[3] = new Vector3(radius, radius, 0.0f);
				normals[0] = -Vector3.forward;
				normals[1] = -Vector3.forward;
				normals[2] = -Vector3.forward;
				normals[3] = -Vector3.forward;
				uvs[0] = new Vector2(0.0f,0.0f);
				uvs[1] = new Vector2(1.0f,0.0f);
				uvs[2] = new Vector2(0.0f,1.0f);
				uvs[3] = new Vector2(1.0f,1.0f);
				indices[0] = 0;
				indices[1] = 2;
				indices[2] = 1;
				indices[3] = 2;
				indices[4] = 3;
				indices[5] = 1;
			}
		}
		
		layerMesh.vertices = vertices;
		layerMesh.normals = normals;
		layerMesh.uv = uvs;
		layerMesh.triangles = indices;
		layerMesh.RecalculateNormals();
		
		return layerMesh;
	}
	
	
	/*
	 * Legacy panel creation. Surrounds instrument with equally spaced parameter panels
	 */
	private void CreateSurroundInstrument(BaseInstrument instrument, Color instrumentColor){
		//Create an instrument prefab
		GameObject instrumentGame = Instantiate(instrumentPrefab, transform.position, Quaternion.identity ) as GameObject;
		instrumentGame.name = GAMEINSTRUMENT_PREFIX + instrument.Name;
		
		//Add an instrument attachmet to interface with the MusicIO controllers
		instrumentGame.AddComponent<InstrumentAttachment>().Init(instrument);
		instrumentGame.renderer.material.SetColor("_Color", instrumentColor);
		
		//Place parameter panels evenly around the outside of the instrument. NEEDS REDESIGN
		Vector3[] points = Utils.PointsOnSphere(instrument.paramList.Count, (int)instrument.paramList.Count);
		
		for(int i = 0; i < points.Length; i++){
			Vector3 point = points[i];
			Vector3 pos = instrumentGame.transform.position + point * panelDistance;
			GameObject paramPlane = Instantiate(paramPanelPrefab, pos, Quaternion.identity) as GameObject;
			
			paramPlane.transform.parent = instrumentGame.transform;
			paramPlane.transform.LookAt(instrumentGame.transform);
			paramPlane.layer = LayerMask.NameToLayer("ParamSelectable");
			
			paramPlane.GetComponentInChildren<TextMesh>().text = instrument.paramList[i].name;
			paramPlane.AddComponent<ParamAttachment>().Init(instrument.paramList[i]);
		}
	}
}
