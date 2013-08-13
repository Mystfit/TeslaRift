using UnityEngine;
using System.Collections;
using System.Xml;

public class InstrumentFactory : MonoBehaviour {
	
	public static string GAMEINSTRUMENT_PREFIX = "GInstr_";
	public GameObject instrumentPrefab = null;
	public TextAsset instrumentDefinitionFile;

	// Use this for initialization
	void Start () {
		LoadInstrumentDefinitions();
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	private void LoadInstrumentDefinitions(){
		//Load xml
		XmlDocument instrumentDoc = new XmlDocument ();
		instrumentDoc.LoadXml ( instrumentDefinitionFile.text );
		
		XmlNodeList instrumentList = instrumentDoc.GetElementsByTagName("instrument"); //instrument array
		XmlNode source = instrumentDoc.SelectSingleNode("/instrumentDefinitions/source");
		XmlNode client = instrumentDoc.SelectSingleNode("/instrumentDefinitions/client");
		
		//Create instrument objects		
		foreach(XmlNode instrument in instrumentList){			
			BaseInstrument instrumentDef = new BaseInstrument( client.InnerText, source.InnerText, instrument.Attributes["name"].Value );
			
			//Add params to instrument
			foreach(XmlElement param in instrument.ChildNodes){
				XmlAttribute name = param.Attributes["name"];
				XmlAttribute type = param.Attributes["type"];
				string typeStr = type != null ? type.Value : "";
				
				instrumentDef.addParam(name.Value, typeStr);
			}
			
			//Create associated gameobject for instrument
			CreateInstrumentGameObject(instrumentDef);
		}
	}
	
	private void CreateInstrumentGameObject(BaseInstrument instrument){
		GameObject instrumentGame = Instantiate(instrumentPrefab, new Vector3(Random.value * 2.5f - 2.5f, 0, Random.value * 2.5f - 2.5f), Quaternion.identity ) as GameObject;
		instrumentGame.name = GAMEINSTRUMENT_PREFIX + instrument.Name;
		instrumentGame.GetComponent<InstrumentDefinition>().Init(instrument.Name);
	}
}
