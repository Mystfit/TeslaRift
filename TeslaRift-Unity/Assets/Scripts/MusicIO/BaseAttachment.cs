using UnityEngine;
using System.Collections;

public class BaseAttachment : MonoBehaviour {
	
	protected InstrumentController m_instrumentControlRef = null;
	
	protected bool m_selected = false;
	public bool selected{ get { return m_selected; }}
	
	public virtual void ToggleSelected(){ 
		SetSelected(!m_selected); 
	}
	
	public virtual void SetSelected(bool state)
	{
		m_selected = state;
	}

	// Use this for initialization
	protected virtual void Start () {
		m_instrumentControlRef = GameObject.Find("__InstrumentSpawner").GetComponent<InstrumentController>();	
	}	
	
	// Update is called once per frame
	void Update () {
	
	}
}
