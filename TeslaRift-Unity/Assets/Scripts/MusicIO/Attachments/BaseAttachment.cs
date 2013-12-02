using UnityEngine;
using UnityEditor;
using System.Collections;
using MusicIO;


public enum ParameterType {
		CLIP = 0,
		PARAM
}


public abstract class BaseAttachment : MonoBehaviour{

	public virtual void Awake(){}
	public virtual void Start(){}
	public virtual void Update(){}

	/*
	 * Filter for attachment to only respond to defined tool modes
	 */
	public BaseTool.ToolMode[] m_respondsToToolMode;
	public bool respondsToToolMode(BaseTool.ToolMode mode){
		if(m_respondsToToolMode.Length > 0){
			foreach(BaseTool.ToolMode responder in m_respondsToToolMode){
				if(responder == mode)
					return true;
			}
		}

		return false;
	}

	/*
	 * Music reference state
	 */
	protected bool bHasMusicRef;
	public bool HasMusicRef{ get { return bHasMusicRef; }}

	/*
	 * First gesture states
	 */
	protected bool bIsFirstGesture = true;
	public bool IsFirstGesture{ get { return bIsFirstGesture; }}
	public void ResetFirstGesture(){ bIsFirstGesture = false; }

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
		
	/*
	 * Selection
	 */
	protected bool m_selected;
	public bool selected{ get { return m_selected; }}
	
	public virtual void ToggleSelected(){ 
		SetSelected(!m_selected); 
	}
	
	public virtual void SetSelected(bool state)
	{
		m_selected = state;
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
		//SetToolMode(BaseTool.ToolMode.PRIMARY);	//Reset tool modes in case we forget to intialize
	}	
}


/*
 * Derived classes from BaseAttachment can specify what type of music specific object they are meant to represent
 */
public class BaseAttachment<T> : BaseAttachment {
	
	private T m_musicRef;
	public virtual void Init(T managedReference){
		m_musicRef = managedReference;
		bHasMusicRef = true;
	}
	public T musicRef{ get { return m_musicRef; }}
}


