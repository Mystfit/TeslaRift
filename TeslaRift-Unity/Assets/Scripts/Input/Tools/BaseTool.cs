using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using MusicIO;

public class BaseTool : MonoBehaviour {
		
	public GloveController glove{ get { return m_gloveController; }}
	protected GloveController m_gloveController = null;

	//For inspector previewing of active states
	public HandState activeGestureState;
	public ToolMode toolMode;

		
	//Variables
	protected List<object> m_targets = null;
	protected BaseInstrument m_instrumentRef = null;
	
	public enum ToolHand {BOTH = 0, LEFT, RIGHT };
	protected ToolHand m_hand;
	public ToolHand Hand{get { return m_hand; }}
	
	//Tool modes
	public enum ToolMode{PRIMARY = 0, SECONDARY, TERTIARY, GRABBING, PLAY1, PLAY2, PLAY3, PLAY4, HOVER};
	protected ToolMode m_mode = ToolMode.PRIMARY;
	public ToolMode mode{ get { return m_mode; }}

	//Hand states
	public enum HandState{ HOLDING = 0, SEARCHING, RELEASING};
	protected HandState m_toolHandState = HandState.SEARCHING;
	public HandState handState{ get { return m_toolHandState; }}
	
	//Constructor
	public BaseTool(){
	}
	
	public virtual void Awake(){
		m_toolHandState = BaseTool.HandState.SEARCHING;
		m_gloveController = GetComponent<GloveController>();
		m_targets = new List<object>();	
	}
	
	public virtual void Update () {
		activeGestureState = m_toolHandState;	//Inspector level previewing of state
		toolMode = m_mode;
	}
	
	public static SixenseHands ToolHandToSixenseHand(BaseTool.ToolHand hand){
		if(hand == ToolHand.LEFT)
			return SixenseHands.LEFT;
		if(hand == ToolHand.RIGHT)
			return SixenseHands.RIGHT;
		return SixenseHands.UNKNOWN;
	}
	
	//Initializer
	public virtual void Init(ToolHand hand, BaseTool.ToolMode mode){
		m_hand = hand;
		m_mode = mode;

		//Set collider model for hand based on active gesture
        glove.SetCollider(glove.activeGestureIndex);

		//Trigger the transition
		TransitionIn();
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

	public virtual void LeavingProximity(){
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

	public static Vector3 HandToObjectSpace(Vector3 worldPosition, Transform objectSpace){
		return objectSpace.InverseTransformPoint(worldPosition);
	}
}


/*
 * String enum class defining interactable tag types
 */
public static class InteractableTypes
{
    public const string GENERATOR = "Generator"; 
    public const string INSTRUMENT = "Instrument"; 
    public const string RBFPOINT = "RBFPoint";
	public const string MUSICGROUP = "MusicGroup";
}
