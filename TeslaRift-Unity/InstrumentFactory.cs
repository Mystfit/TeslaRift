using System;
using System.Xml.XmlTextReader;


public class InstrumentFactory : MonoBehaviour
{
	protected static string instrumentTextFile = "Assets/InstrumentList.xml";
	
	void Start()
	{	
		LoadInstrumentDefinitions();
		m_xmlReader = new XmlTextReader(instrumentTextFile);
		
		//Load xml
		//Create instrumetns
	}
		
	void Update()
	{
	}
	
	private void LoadInstrumentDefinitions(){
		XmlTextReader m_xmlReader = new XmlTextReader(instrumentTextFile);
		m_xmlReader.Read();
		while(m_xmlReader.Read()){
			if(m_xmlReader.IsStartElement()){
				Debug.Log(m_xmlReader.Read());
			}
			
		}

	}
}


