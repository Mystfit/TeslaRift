using UnityEngine;
using System.Collections;
using System.Xml;

public class InstrumentFactory : MonoBehaviour {
	
	public TextAsset instrumentDefinitionFile;

	// Use this for initialization
	void Start () {
		LoadInstrumentDefinitions();
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	private void LoadInstrumentDefinitions(){
		XmlDocument instrumentDoc = new XmlDocument ();
		instrumentDoc.LoadXml ( instrumentDefinitionFile.text );
		XmlNodeList instrumentList = instrumentDoc.GetElementsByTagName("instrument"); // array of the level nodes.
				
		foreach(XmlNode instrument in instrumentList){
			foreach(XmlNode param in instrument.ChildNodes){
				Debug.Log(param.Name);
			}
		}
		
	}
}
