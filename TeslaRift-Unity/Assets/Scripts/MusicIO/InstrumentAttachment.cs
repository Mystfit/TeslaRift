using UnityEngine;
using System.Collections;

public class InstrumentAttachment : MonoBehaviour {
	
	public string instrumentTarget;
	private BaseInstrument m_instrumentRef;

	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public void Init(string instrument){
		instrumentTarget = instrument;
		m_instrumentRef = GameObject.Find("__PerformanceControllers").GetComponent<InstrumentController>().GetInstrumentByName(instrument);
	}
	
	public BaseInstrument instrumentRef{ get {return m_instrumentRef; } }
	
	
}
