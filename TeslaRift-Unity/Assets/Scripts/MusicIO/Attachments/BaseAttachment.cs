using UnityEngine;
using System.Collections;
using MusicIO;


public enum ParameterType {
		CLIP = 0,
		PARAM,
		CLOSED
}


public class BaseAttachment<T> : MonoBehaviour {

	/*
	 * First gesture states
	 */
	protected bool bIsFirstGesture = true;
	public bool IsFirstGesture{ get { return bIsFirstGesture; }}
	
	
	/*
	 * Active tool hand
	 */
	protected BaseTool.ToolHand m_hand;
	public BaseTool.ToolHand ActiveHand{ get { return m_hand; }}
	public void SetActiveHand(BaseTool.ToolHand hand){ m_hand = hand; }
	
	
	/*
	 * Active tool modes
	 */
	protected BaseTool.ToolMode m_mode;
	public BaseTool.ToolMode mode{ get { return m_mode; }}
	public virtual void SetToolMode(BaseTool.ToolMode mode){ m_mode = mode; }
	
	protected T m_musicRef;
	public virtual T GetMusicRef(){
		return default(T);
	}
	
	
	/*
	 * Selection
	 */
	protected bool m_selected = false;
	public bool selected{ get { return m_selected; }}
	
	public virtual void ToggleSelected(){ 
		SetSelected(!m_selected); 
	}
	
	public virtual void SetSelected(bool state)
	{
		m_selected = state;
	}
	
	
	/*
	 * Initialization
	 */
	public virtual void Start () {
	}	
	
	public virtual void Update () {
	
	}
	
	public virtual void Init(T managedReference){
		m_musicRef = managedReference;
	}
	
	
	/*
	 * Gesture implementations
	 */
	public virtual void Gesture_First(){
		bIsFirstGesture = false;
	}
	
	public virtual void Gesture_IdleInterior(){
	}
	
	public virtual void Gesture_IdleProximity(){
	}
	
	public virtual void Gesture_IdleExterior(){
	}
	
	public virtual void Gesture_ExitIdleInterior(){
	}
	
	public virtual void Gesture_ExitIdleProximity(){
	}
	
	public virtual void Gesture_ExitIdleExterior(){
	}
	
	public virtual void Gesture_PushIn(){
	}
	
	public virtual void Gesture_PullOut(){
	}
	
	public virtual void Gesture_Twist(float amount){
	}
	
	public virtual void Gesture_Exit(){
		bIsFirstGesture = true;
		SetToolMode(BaseTool.ToolMode.PRIMARY);	//Reset tool modes in case we forget to intialize
	}
}
