using UnityEngine;
using System.Collections;

public class BaseGenerator : MonoBehaviour {
	
	protected bool m_hasInput = false;	//Are we expecting input? flag
	protected BaseGenerator m_output;	//Next target in generator chain
	
	public GameObject externalInputs;	//Gameobject containing external data sources (audio/clock)
	protected Clock m_clock;			//Source clock generator used for cycle timing
	
	protected float m_value;					//Internal processed value
	protected float m_incomingValue = 0.0f;		//Externally processed value
	protected bool m_isDirty = false;
	
	// Use this for initialization
	public virtual void Start () {
		m_clock = externalInputs.GetComponent<Clock>();
	}
	
	// Update is called once per frame
	void Update () {
		bool signalReady = true;
		
		if(m_hasInput){
			if(m_isDirty)
				signalReady = true;
			else
				signalReady = false;
		}
		
		if(signalReady){
			//Value processing in here
			m_value = SignalProcessing();
			m_value += m_incomingValue;
			
			//Send output value to connected 
			if(m_output != null){
				m_output.SendValue(m_value);
			}
		}
		
		//Debug visual feedback. Will be replaced with some appropriate level
		//transform.localScale = new Vector3(m_value, m_value, m_value);
	}
	
	//Overriden class specific signal processor
	public virtual float SignalProcessing(){
		return 0.0f;
	}
	
	public void SetRecievesInput(bool state){
		m_hasInput = state;
	}
	
	public void SetOutputTarget(BaseGenerator gen){
		m_output = gen;
		m_output.SetRecievesInput(true);
	}
	
	//Provides a modified value for additive generators
	public void SendValue(float val){
		m_incomingValue = val;
		m_isDirty = true;
	}
	
	public float val{ get { return m_value; }}
	
	public void SetClean(){
		m_isDirty = false;
	}
}
