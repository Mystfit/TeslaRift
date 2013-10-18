using UnityEngine;
using System.Collections;

public class BaseAttachment : MonoBehaviour {
	
	protected InstrumentController m_instrumentControlRef = null;
	
	protected bool m_selected = false;
	public bool selected{ get { return m_selected; }}
	
	protected bool bIsFirstGesture = true;
	public bool IsFirstGesture{ get { return bIsFirstGesture; }}
	
	protected BaseTool.ToolHand m_hand;
	public BaseTool.ToolHand ActiveHand{ get { return m_hand; }}
	public void SetActiveHand(BaseTool.ToolHand hand){ m_hand = hand; }
	
	protected BaseTool.ToolMode m_mode;
	public BaseTool.ToolMode mode{ get { return m_mode; }}
	public void SetToolMode(BaseTool.ToolMode mode){ m_mode = mode; }
	
	public virtual void ToggleSelected(){ 
		SetSelected(!m_selected); 
	}
	
	public virtual void SetSelected(bool state)
	{
		m_selected = state;
	}
	
	public virtual void Gesture_First(){
		bIsFirstGesture = false;
	}
	
	public virtual void Gesture_IdleProximity(){
	}
	
	public virtual void Gesture_PullOutPushIn(){
	}
	
	public virtual void Gesture_PullOut(){
	}
	
	public virtual void Gesture_Twist(float amount){
	}
	
	public virtual void Gesture_Exit(){
		bIsFirstGesture = true;
		SetToolMode(BaseTool.ToolMode.PRIMARY);
	}

	// Use this for initialization
	protected virtual void Start () {
		m_instrumentControlRef = InstrumentController.Instance;	
	}	
	
	// Update is called once per frame
	void Update () {
	
	}
}
