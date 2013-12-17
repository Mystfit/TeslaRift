using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class OSCListener : MonoBehaviour {
	
	public string[] m_address;

	protected float[] m_paramValues;
	protected bool m_isDirty = false;
	protected void SetClean(){ m_isDirty = false; }
	
	// Use this for initialization
	public virtual void Start () {
		m_paramValues = new float[m_address.Length];
	}

	public virtual void Init(){
		OSCcontroller.Instance.AddListener(this);
	}
	
	// Update is called once per frame
	public virtual void Update () {
	}
	
	public virtual void SendUpdate(UnityOSC.OSCPacket message){
		if(m_paramValues != null){
			for(int i = 0; i < m_address.Length; i++){
				if(m_address[i] == message.Address){
					m_paramValues[i] = (float)message.Data[0];
					Debug.Log("Matched " + message.Address + ", " + m_paramValues[i] );
					m_isDirty= true;
				}
			}
		}
	}
}
