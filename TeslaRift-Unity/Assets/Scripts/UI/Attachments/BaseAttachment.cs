using UnityEngine;
//using UnityEditor;
using System.Collections;
using System.Linq;
using System.Collections.Generic;
using MusicIO;

public abstract class BaseAttachment : MonoBehaviour{

	public virtual void Awake(){ 
		m_acceptedTypes = new List<System.Type>(); 
		SetCollideable(m_doesCollide);
	}
	public virtual void Start(){}
	public virtual void Update(){}

	/*
	 * Unity status setters
	 */
	public void SetActive(){gameObject.SetActive(true);}
	public void SetInactive(){gameObject.SetActive(false);}


	/*
	 * Filter to only respond to defined tool modes
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
	 * Collider references
	 */
	public bool m_doesCollide = false;
	public bool IsCollideable{ get { return m_doesCollide; }}
	public void SetCollideable(bool state){ 
		m_doesCollide = state; 
		if(m_doesCollide){
			if(m_interiorTrigger == null || m_proximityTrigger == null){
				Transform area = transform.Find("areaTrigger");
				Transform interior = area.Find("interiorTrigger");
				Transform proximity = area.Find("proximityTrigger");
				m_interiorTrigger = interior.GetComponent<HandProximityTrigger>();
				m_proximityTrigger = proximity.GetComponent<HandProximityTrigger>();
			}
		}
	}
	protected HandProximityTrigger m_interiorTrigger;
	protected HandProximityTrigger m_proximityTrigger;
    public HandProximityTrigger interiorTrigger { get { return m_interiorTrigger; } }
    public HandProximityTrigger proximityTrigger { get { return m_proximityTrigger; } }
	public virtual Collider interiorCollider{ get {return m_interiorTrigger.collider; }}
	public virtual Collider proximityCollider{ get {return m_proximityTrigger.collider; }}


	/*
	 * Collider size updaters
	 */
    public void UpdateColliders(Vector3 position, Vector3 size)
    {
        UpdateColliders(position, size, 1.2f);
    }

    public void UpdateColliders(Vector3 position, float size)
    {
        UpdateColliders(position, new Vector3(size, size, size), 1.2f);
    }

    public void UpdateColliders(Vector3 position, Vector3 size, float extMultiplier)
    {
        m_interiorTrigger.UpdateCollider(position, size);
        m_proximityTrigger.UpdateCollider(position, size * extMultiplier);
    }

    /*
     * Transient states
     */
    public void SetTransient(bool state) { m_isTransient = state; }
    public bool IsTransient { get { return m_isTransient; } }
    protected bool m_isTransient;


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
	public virtual void ToggleSelected(){ SetSelected(!m_selected); }
    public virtual void SetSelected(bool state){m_selected = state;}


	/*
	 * Dragging states
	 */
	protected bool m_isDragging;
	protected void SetIsDragging(bool state){ m_isDragging = (IsDraggable) ? state : false; }
	public bool IsDragging{ get { return (IsDraggable) ? m_isDragging : false; }}

	protected bool m_isDraggable;
	public bool IsDraggable{ 
		get { return m_isDraggable; } 
	}
	public void SetIsDraggable(bool state){
		m_isDraggable = state; 
		if(!m_isDraggable) m_isDragging = false;
	}

	public virtual void StartDragging(GameObject target){
        if (!HydraController.Instance.IsHandDragging(m_hand))
        {
            if (IsDraggable)
            {
                if (IsDragging) StopDragging();
                SetIsDragging(true);
                Undock();
                FixedJoint joint = gameObject.AddComponent<FixedJoint>();
                joint.connectedBody = target.GetComponent<Rigidbody>();
				rigidbody.isKinematic = false;
                HydraController.Instance.SetHandDragging(m_hand, this);
            }
        }
	}


	public virtual void StopDragging(){
        if (IsDragging)
        {
		    FixedJoint[] jointList = gameObject.GetComponents<FixedJoint>(); 
		    for(int i = 0 ; i < jointList.Length; i++){
			    Destroy( jointList[i] );
		    }
			rigidbody.isKinematic = true;

			SetIsDragging(false);
	
		    //If we're a dockable object, we need to find something to slot into.
		    if(IsDockable) DockIntoClosest();
            HydraController.Instance.SetHandDragging(m_hand, null);
        }
	}


	/*
	 * Docking states
	 */
	protected bool m_acceptsDockables;
	protected bool m_isDockable;
	public void SetAsDock(bool state){ m_acceptsDockables = state;}
	public void SetIsDockable(bool state){ m_isDockable = state;}
	public bool IsDock{ get { return m_acceptsDockables;}}
	public bool IsDockable{ get { return m_isDockable; }}


	/*
	 * Docked children / owner accessors
	 */
	protected BaseAttachment m_dockedInto;
    protected BaseAttachment m_dockedIntoLast;
	public BaseAttachment DockedInto{ get { return m_dockedInto; }}
	protected List<BaseAttachment> m_childDockables;
	public List<BaseAttachment> DockedChildren{ get { return m_childDockables; }}


	/*
	 * Dockable object modifiers
	 */
	public virtual void DockInto(BaseAttachment attach){

		attach.AddDockableAttachment(this);
		m_dockedInto = attach;
        m_dockedIntoLast = attach;
		if(IsDraggable) SetIsDragging(false);
	}
	public virtual void Undock(){
		if(m_dockedInto != null){
			m_dockedInto.RemoveDockableAttachment(this);
			m_dockedInto = null;
		}
	}
	public virtual void DockIntoClosest(){
		GameObject[] docks = GameObject.FindGameObjectsWithTag("ParentIsADock");
		BaseAttachment closestValidDock = null;
		float closestDist = 0.0f;
		
		foreach(GameObject dockTag in docks){
			BaseAttachment dockAttach = dockTag.transform.parent.GetComponent<BaseAttachment>();		
			
			if(dockAttach.DockAcceptsType(this.GetType())){
				if(closestValidDock == null){
					closestDist = Vector3.Distance( dockAttach.transform.position, transform.position);
					closestValidDock = dockAttach;
				}
				float dist = Vector3.Distance( dockAttach.transform.position, transform.position);
				if( dist < closestDist ){
					closestValidDock = dockAttach;
					closestDist = dist;
				}
			}
		}

        if (IsInDockingRange(closestValidDock.transform.position, closestValidDock.dockingRange))
            DockInto(closestValidDock);
        else
            Floating();
	}

    public virtual void Floating()
    {
        DockInto(m_dockedIntoLast);
    }


	/*
	 * Dock modifiers
	 */
	public virtual bool AddDockableAttachment(BaseAttachment attach){
		if(m_childDockables == null)
			m_childDockables = new List<BaseAttachment>();

		if(DockAcceptsType(attach.GetType())){
			m_childDockables.Add(attach);
            return true;
		} else {
			Debug.LogError(this + " can't dock with a " + attach.GetType());
		}
        return false;
	}
	public virtual void RemoveDockableAttachment(BaseAttachment attach){
		while(m_childDockables.Contains(attach))
			m_childDockables.Remove(attach);	
		attach.transform.parent = null;
	}


	/*
	 * Dock type / distance checking
	 */
	protected List<System.Type> m_acceptedTypes;
	public void AddAcceptedDocktype(System.Type type){m_acceptedTypes.Add(type);}
	public bool DockAcceptsType(System.Type type){
		foreach(System.Type acceptedType in m_acceptedTypes){
			if(type == acceptedType)
				return true;
		}
		return false;
	}
    
	public float dockingRange = 1.5f;
	public virtual bool IsInDockingRange(Vector3 position, float range){
        return (Vector3.Distance(transform.position, position) < range) ? true : false;
	}

	/*
	 * Gesture implementations
	 */
	public virtual void Gesture_First(){ bIsFirstGesture = false; }
	public virtual void Gesture_Exit(){ bIsFirstGesture = true; }	
	public virtual void Gesture_IdleInterior(){}
	public virtual void Gesture_IdleProximity(){}
	public virtual void Gesture_IdleExterior(){}
	public virtual void Gesture_ExitIdleInterior(){}
	public virtual void Gesture_ExitIdleProximity(){}
	public virtual void Gesture_ExitIdleExterior(){}
	public virtual void Gesture_PushIn(){}
	public virtual void Gesture_PullOut(){}
	public virtual void Gesture_Twist(float amount){}
}


/*
 * Derived classes from BaseAttachment can specify what type of music specific object they are meant to represent
 */
public class BaseAttachment<T> : BaseAttachment {
	
	private T m_musicRef;
	public virtual void Init(T managedReference){
		m_musicRef = managedReference;
		bHasMusicRef = true;

		//Set default tool filter if not set
		if(m_respondsToToolMode == null)
			m_respondsToToolMode = new BaseTool.ToolMode[]{BaseTool.ToolMode.PRIMARY, BaseTool.ToolMode.SECONDARY};
	}
	public T musicRef{ get { return m_musicRef; }}
}


