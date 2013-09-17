using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class OSCListener : MonoBehaviour {
	
	public GameObject OSCsource;
	public string[] m_address;
	
	protected float[] m_paramValues;
	protected bool m_isDirty = false;
	protected void SetClean(){ m_isDirty = false; }
	
	// Use this for initialization
	protected virtual void Start () {
		if(OSCsource != null)
			OSCsource.GetComponent<OSCcontroller>().AddListener(this);
		
		foreach(string address in m_address){
			
			m_paramValues = new float[m_address.Length];
		}
	}
	
	// Update is called once per frame
	protected virtual void Update () {
	}
	
	public void SendUpdate(UnityOSC.OSCPacket message){
		
		for(int i = 0; i < m_address.Length; i++){
			if(m_address[i] == message.Address){
				m_paramValues[i] = (float)message.Data[0];
				//Debug.Log("Matched " + message.Address + ", " + m_paramValues[i] );
				m_isDirty= true;
			}
		
		}
		
		
	}
}
