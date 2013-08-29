using UnityEngine;
using System.Collections;

public class InstrumentAttachment : BaseAttachment {
	
	private BaseInstrument m_instrumentRef;

	// Use this for initialization
	protected override void Start () {
		base.Start();
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public override void SetSelected (bool state)
	{
		base.SetSelected (state);
		//m_instrumentRef.setEnabled(true);
	}
	
	public void Init(BaseInstrument instrument){
		m_instrumentRef = instrument;
	}
	
	public BaseInstrument instrumentRef{ get {return m_instrumentRef; } }
	
	
}
