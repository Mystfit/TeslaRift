using UnityEngine;
using System.Collections;

public class ParamAttachment : MonoBehaviour {

	private BaseInstrumentParam m_paramRef;

	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public void Init(BaseInstrumentParam param){
		m_paramRef = param;
	}
	
	public BaseInstrumentParam paramRef{ get {return m_paramRef; } }
	
}
