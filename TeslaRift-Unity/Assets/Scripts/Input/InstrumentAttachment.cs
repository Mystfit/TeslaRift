using UnityEngine;
using System.Collections;

public class InstrumentAttachment : MonoBehaviour {
	
	private BaseInstrument m_instrumentRef;

	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public void Init(BaseInstrument instrument){
		m_instrumentRef = instrument;
	}
	
	public BaseInstrument instrumentRef{ get {return m_instrumentRef; } }
	
	
}
