using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class BaseTool : MonoBehaviour {
	
	protected HydraController m_hydraRef = null;
	
	//Variables
	protected List<object> m_targets = null;
	protected BaseInstrument m_instrumentRef = null;
	
	public enum ToolHand {BOTH = 0, LEFT, RIGHT };
	protected ToolHand m_hand;
	public ToolHand Hand{get { return m_hand; }}
	
	//Hand states
	public enum HandState{ IDLE = 0, SEARCHING, HOLDING, RELEASING};
	protected HandState m_toolHandState = HandState.IDLE;
	public HandState handState{ get { return m_toolHandState; }}
	
	//Constructor
	public BaseTool(){
	}
	
	public void Start(){
		m_hydraRef = GameObject.Find("__HydraController").GetComponent<HydraController>();
		m_targets = new List<object>();		
	}
	
	public void Init(ToolHand hand){
		m_hand = hand;
	}
	
	//Instrument tools
	public void setInstrument(BaseInstrument instrument){
		m_instrumentRef = instrument;
	}
	
	//Transitions
	public virtual void TransitionIn(){
	}
	
	public virtual void TransitionOut(){
	}
	
	//Accessors
	public List<object> targets { get { return m_targets; }}
	
	public void setTargets<T>(T target){
		List<object> valueList = new List<object>();
		valueList.Add(target);
		this.setTargets(valueList);
	}
	
	public void setTargets(List<object> targets){
		m_targets = targets;
	}
	
	// Update is called once per frame
	public virtual void Update () {
	}
}
