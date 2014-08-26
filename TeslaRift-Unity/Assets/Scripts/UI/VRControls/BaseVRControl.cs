using UnityEngine;
using System.Collections;
using System.Linq;
using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using MusicIO;
using VRControls;
using UI;

namespace VRControls
{
    /*
     * Static Ids for the singleton controls
     */
    public static class StaticIds{
        public static string INSTRUMENT_DOCK = "instrumentDock";
        public static string EDITOR_DOCK = "editorDock";
    }

    [JsonConverter(typeof(BaseVRControlSerializer))]
    public abstract class BaseVRControl : MonoBehaviour
    {

        //Public vars for setting behaviour from Unity
        public bool isCloneable;
        public bool isDraggable;
        public bool isDockable;
        public bool isDock;
        public bool isSaveable;
        public bool isSerializeable = true;
        public bool isTemplate = false;
        public bool isFacingPerformer;
        public bool m_toggleControls;

        public virtual void Awake()
        {
            if(m_id == string.Empty)
                m_id = UIFactory.GetNewId;
            
            //Set states based on public vars
            SetIsDraggable(isDraggable);
            SetCloneable(isCloneable);
            SetIsDockable(isDockable);
            SetAsDock(isDock);
            SetIsSaveable(isSaveable);
            SetIsSerializeable(isSerializeable);
            SetAsTemplate(isTemplate);
            SetFacingPerformer(isFacingPerformer);

            m_acceptedTypes = new List<System.Type>();
            m_childDockables = new List<BaseVRControl>();
            m_childControls = new List<BaseVRControl>();
            SetCollideable(m_doesCollide);

            //m_maximizedScale = (transform.localScale.x + transform.localScale.y + transform.localScale.z) / 3.0f;

            UIController.Instance.AddControl(this);
        }

        /*
         * Unity overrides
         */
        public virtual void Start() { }
        public virtual void Update()
        {
            //Editor boolean toggles
            if (m_toggleControls)
            {
                m_toggleControls = false;
                ToggleControls();
            }

            //Updates states for Unity inspector
            isCloneable = m_isCloneable;
            isDockable = m_isDockable;
            isDock = m_acceptsDockables;
            isDraggable = m_isDraggable;
            isSaveable = m_isSaveable;
            isSerializeable = m_isSerializeable;
            isTemplate = m_isTemplate;
            isFacingPerformer = m_facePerformer;

            FacePerformer();
        }

        public virtual void FacePerformer()
        {
            //Rotate to face player eyes
            if (m_facePerformer && !IsDragging)
            {
                // Look at and dampen the rotation
                //Vector3 targetVec = Quaternion.LookRotation(this.interiorCollider.bounds.center - HydraController.Instance.EyeCenter, Vector3.up).eulerAngles;
                Vector3 targetVec = Quaternion.LookRotation(transform.position - HydraController.Instance.EyeCenter, Vector3.up).eulerAngles;
                targetVec.x = 0.0f;
                targetVec.z = 0.0f;
                transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.Euler(targetVec), (float)Time.deltaTime * 10.0f);
            }
        }
        public void SetFacingPerformer(bool state) { m_facePerformer = state; }
        private bool m_facePerformer;

        /// <summary>
        /// Override the id of this VRControl
        /// </summary>
        /// <param name="id"></param>
        public void SetId(string id) { m_id = id; }
        private string m_id = "";

        /// <summary>
        /// Get the unique id of this VRControl
        /// </summary>
        public string id { get { return m_id; } }

        /// <summary>
        /// Id of the json parent this object should be docked into. Used when loading VRControl from JSON
        /// </summary>
        public string jsonParentId;

        /// <summary>
        /// Position of this control when loaded from JSON
        /// </summary>
        public Vector3 jsonPosition;

        /// <summary>
        /// Rotation of this control when loaded from JSON
        /// </summary>
        public Quaternion jsonRotation;


        /*
         * Unity status setters
         */
        
        /// <summary>
        /// Set gameobject as active
        /// </summary>
        public void SetActive() { gameObject.SetActive(true); }

        /// <summary>
        /// Set gameobject as inactive
        /// </summary>
        public void SetInactive() { gameObject.SetActive(false); }


        /*
         * Toolmode filters
         */

        /// <summary>
        /// Sets the toolmodes this control will react to.
        /// </summary>
        /// <param name="modes">Array of toolmodes</param>
        public void SetToolmodeResponse(BaseTool.ToolMode[] modes) { m_respondsToToolMode = modes; }
        public BaseTool.ToolMode[] m_respondsToToolMode;

        /// <summary>
        /// Check if this VRControl will react to a given toolmode
        /// </summary>
        /// <param name="mode"></param>
        /// <returns>True is control reacts to given toolmode</returns>
        public bool respondsToToolMode(BaseTool.ToolMode mode)
        {
			if(m_respondsToToolMode != null){
	            if (m_respondsToToolMode.Length > 0)
	            {
	                foreach (BaseTool.ToolMode responder in m_respondsToToolMode)
	                {
	                    if (responder == mode)
	                        return true;
	                }
	            }
			}
            return false;
        }


        /*
         * Collider references
         */
        /// <summary>
        /// Check if VRControl is collidable with input hand
        /// </summary>
        public bool IsCollideable { get { return m_doesCollide; } }
        private bool m_doesCollide = true;

        /// <summary>
        /// Set if VRControl will react to collisions from input devices
        /// </summary>
        /// <param name="state"></param>
        public void SetCollideable(bool state)
        {
            m_doesCollide = state;
            if (m_interiorTrigger == null || m_proximityTrigger == null)
            {
                Transform area = transform.Find("areaTrigger");
                if (area != null)
                {
                    Transform interior = area.Find("interiorTrigger");
                    Transform proximity = area.Find("proximityTrigger");
                    m_interiorTrigger = interior.GetComponent<HandProximityTrigger>();
                    m_proximityTrigger = proximity.GetComponent<HandProximityTrigger>();
                    m_interiorTrigger.isActive = m_doesCollide;
                    m_proximityTrigger.isActive = m_doesCollide;
                }
            }
        }
        private HandProximityTrigger m_interiorTrigger;
        private HandProximityTrigger m_proximityTrigger;

        /// <summary>
        /// Get the interior hand trigger associated with this VRControl
        /// </summary>
        public HandProximityTrigger interiorTrigger { get { return m_interiorTrigger; } }

        /// <summary>
        /// Get the proximity hand trigger associated with this VRControl
        /// </summary>
        public HandProximityTrigger proximityTrigger { get { return m_proximityTrigger; } }

        /// <summary>
        /// Gets the collider component of the interior hand trigger
        /// </summary>
        public virtual Collider interiorCollider { get { return m_interiorTrigger.collider; } }

        /// <summary>
        /// Gets the collider component of the exterior hand trigger
        /// </summary>
        public virtual Collider proximityCollider { get { return m_proximityTrigger.collider; } }

        /// <summary>
        /// Disable all child colliders in this VRControl
        /// </summary>
        public virtual void DisableChildColliders()
        {
            foreach (BaseVRControl attach in m_childDockables)
                attach.DisableColliders();
        }

        /// <summary>
        /// Enable all child colliders in this VRControl
        /// </summary>
        public virtual void EnableChildColliders()
        {
            foreach (BaseVRControl attach in m_childDockables)
                attach.EnableColliders();
        }

        /// <summary>
        /// Disable colliders associated with this VRControl
        /// </summary>
        public void DisableColliders()
        {
            interiorCollider.gameObject.SetActive(false);
            proximityCollider.gameObject.SetActive(false);
        }

        /// <summary>
        /// Enable colliders associated with this VRControl
        /// </summary>
        public void EnableColliders()
        {
            interiorCollider.gameObject.SetActive(true);
            proximityCollider.gameObject.SetActive(true);
        }


        /*
         * Collider size updaters
         */
        /// <summary>
        /// Update position and size of colliders associated with this VRControl
        /// </summary>
        /// <param name="position">Positon of collider</param>
        /// <param name="size">Size of Collider</param>
        public void UpdateColliders(Vector3 position, Vector3 size)
        {
            UpdateColliders(position, size, 1.2f);
        }

        /// <summary>
        /// Update position and size of colliders associated with this VRControl
        /// </summary>
        /// <param name="position">Positon of collider</param>
        /// <param name="size">Size of Collider</param>
        public void UpdateColliders(Vector3 position, float size)
        {
            UpdateColliders(position, new Vector3(size, size, size), 1.2f);
        }

        /// <summary>
        /// Update position and size of colliders associated with this VRControl 
        /// </summary>
        /// <param name="position"></param>
        /// <param name="size"></param>
        /// <param name="extMultiplier"></param>
        public void UpdateColliders(Vector3 position, Vector3 size, float extMultiplier)
        {
            m_interiorTrigger.UpdateCollider(position, size);
            m_proximityTrigger.UpdateCollider(position, size * extMultiplier);
        }


        /*
         * Cloneable control states
         */

        /// <summary>
        /// Set this VRControl as temporary
        /// </summary>
        /// <param name="state"></param>
        public void SetTransient(bool state) { m_isTransient = state; }

        /// <summary>
        /// Check if this VRControl is temporary
        /// </summary>
        public bool IsTransient { get { return m_isTransient; } }
        private bool m_isTransient;

        /// <summary>
        /// Set this VRControl as being cloneable
        /// </summary>
        /// <param name="state"></param>
        public void SetCloneable(bool state) { m_isCloneable = state; isCloneable = state; }

        /// <summary>
        /// Check if this VRControl is cloneable
        /// </summary>
        public bool IsCloneable { get { return m_isCloneable; } }
        private bool m_isCloneable;


        /*
         * First gesture states
         */

        /// <summary>
        /// Check if this is the first gesture running on this VRControl after an interaction was triggered
        /// </summary>
        public bool IsFirstGesture { get { return bIsFirstGesture; } }

        /// <summary>
        /// Reset first gesture flag
        /// </summary>
        public void ResetFirstGesture() { bIsFirstGesture = false; }
        private bool bIsFirstGesture = true;


        /*
         * Active tool hand
         */

        /// <summary>
        /// Gets the active hand object manipulating for this control
        /// </summary>
        public BaseTool.ToolHand ActiveHand { get { return m_hand; } }

        /// <summary>
        /// Sets the active hand object manipulating for this control
        /// </summary>
        /// <param name="hand"></param>
        public void SetActiveHand(BaseTool.ToolHand hand) { m_hand = hand; }
        private BaseTool.ToolHand m_hand;


        /*
         * Active tool modes
         */
        
        /// <summary>
        /// Gets toolmode of the hand controlling this object
        /// </summary>
        public BaseTool.ToolMode mode { get { return m_mode; } }

        /// <summary>
        /// Sets toolmode of the hand controlling this obejct
        /// </summary>
        /// <param name="mode"></param>
        public virtual void SetToolMode(BaseTool.ToolMode mode) { m_mode = mode; }
        private BaseTool.ToolMode m_mode;


        /*
         * Selection
         */

        /// <summary>
        /// Gets selected state of this VRControl
        /// </summary>
        public bool selected { get { return m_selected; } }
        private bool m_selected;

        /// <summary>
        /// Toggel selected state of this VRControl
        /// </summary>
        public virtual void ToggleSelected() { SetSelected(!m_selected); }

        /// <summary>
        /// Set selected state of this VRControl
        /// </summary>
        /// <param name="state"></param>
        public virtual void SetSelected(bool state)
        {
            if (m_outlineMat != null)
            {
                if (!selected && state)
                {
                    SetOutlineColor(UIFactory.outlineSelectedColor);
                    SetOutlineSize(UIFactory.outlineSelectedSize);
                }
                else if (selected && !state)
                {
                    SetOutlineColor(UIFactory.outlineDeselectedColor);
                    SetOutlineSize(0.0f);
                }
            }

            if (state)
            {
                if (m_dockedInto != null)
                    m_dockedInto.ChildAttachmentSelected(this);
            }

            m_selected = state;
        }
        /// <summary>
        /// Overrideable function called by child VRControls being selected
        /// </summary>
        /// <param name="attach"></param>
        public virtual void ChildAttachmentSelected(BaseVRControl attach) { }


        /*
         * Outline and hovering
         */

        /// <summary>
        /// Set the outline shader material that will be animated when this VRControl is selected
        /// </summary>
        /// <param name="mat"></param>
        public void SetOutlineMat(Material mat) { m_outlineMat = mat; }
        private Material m_outlineMat;

        /// <summary>
        /// Set size scale of the outline shader
        /// </summary>
        /// <param name="size"></param>
        public void SetOutlineSize(float size)
        {
            SetOutlineSize(size, true);
        }

        /// <summary>
        /// Set size of the outline shader and optionally animate it to the target size
        /// </summary>
        /// <param name="size"></param>
        public void SetOutlineSize(float size, bool animate)
        {
            if (animate)
            {
                if (m_outlineMat != null)
                    iTween.ValueTo(gameObject, iTween.Hash("from", m_outlineMat.GetFloat("_Outline"), "to", size, "time", 0.1f, "onupdate", "SetOutlineUpdate", "easetype", iTween.EaseType.easeOutExpo));

            }
            else
            {
                SetOutlineUpdate(size);
            }
        }

        /// <summary>
        /// Set colour of the outline material
        /// </summary>
        /// <param name="color"></param>
        public void SetOutlineColor(Color color)
        {
            SetOutlineColor(color, true);
        }

        /// <summary>
        /// Set colour of the outline material
        /// </summary>
        /// <param name="color"></param>
        /// <param name="animate"></param>
        public void SetOutlineColor(Color color, bool animate)
        {
            if (animate)
            {
                if (m_outlineMat != null)
                    iTween.ValueTo(gameObject, iTween.Hash("from", m_outlineMat.GetColor("_OutlineColor"), "to", color, "time", 0.1f, "onupdate", "SetOutlineColorUpdate", "easetype", iTween.EaseType.easeOutExpo));

            }
            else
            {
                SetOutlineColorUpdate(color);
            }
        }
        private void SetOutlineUpdate(float size) { m_outlineMat.SetFloat("_Outline", size); }
        private void SetOutlineColorUpdate(Color color) { m_outlineMat.SetColor("_OutlineColor", color); }

        /// <summary>
        /// Set the outline shader to the specified colour and size set by the global UI settings when hovering
        /// </summary>
        public virtual void StartHover()
        {
            if (!selected)
            {
                SetOutlineSize(UIFactory.outlineHoverSize);
                SetOutlineColor(UIFactory.outlineHoverColor);
            }
        }

        /// <summary>
        /// Reset the outline shader to hidden
        /// </summary>
        public virtual void StopHover()
        {
            if (!selected)
            {
                SetOutlineSize(0.0f);
                SetOutlineColor(UIFactory.outlineDeselectedColor);
            }
        }


        /*
         * Dragging states
         */

        /// <summary>
        /// Set current dragging status of this VRControl
        /// </summary>
        /// <param name="state"></param>
        private void SetIsDragging(bool state) { m_isDragging = (IsDraggable) ? state : false; isDraggable = state; }

        /// <summary>
        /// Gets dragging status of this VRControl
        /// </summary>
        public bool IsDragging { get { return (IsDraggable) ? m_isDragging : false; } }
        private bool m_isDragging;
        
        /// <summary>
        /// Check if VRControl is draggable
        /// </summary>
        public bool IsDraggable { get { return m_isDraggable; } }

        /// <summary>
        /// Set set draggable state of VRControl
        /// </summary>
        /// <param name="state"></param>
        public void SetIsDraggable(bool state)
        {
            m_isDraggable = state;
            if (!m_isDraggable) m_isDragging = false;
        }
        private bool m_isDraggable;

        /// <summary>
        /// Make this VRControl follow a target gameobject
        /// </summary>
        /// <param name="target">GameObject to attach VRControl to</param>
        public virtual void StartDragging(GameObject target)
        {
            if (IsDraggable)
            {
                //if (HydraController.Instance.IsHandDragging(m_hand)) { 
                //    HydraController.Instance.GetHandDragging(m_hand).StopDragging();
                //}

                //Clone instrument here
                if (IsCloneable)
                {
                    BaseVRControl attach = UI.UIFactory.CreateMusicRefAttachment(this);
                    attach.SetAsTemplate(false);
                    attach.StartDragging(HydraController.Instance.GetHand(m_hand));
                    attach.SetIsSaveable(true);
                }
                else
                {
                    //if (IsDragging) StopDragging();
                    SetIsDragging(true);
                    Undock();
                    FixedJoint joint = gameObject.AddComponent<FixedJoint>();
                    joint.connectedBody = target.GetComponent<Rigidbody>();
                    rigidbody.isKinematic = false;
                    HydraController.Instance.SetHandDragging(m_hand, this);
                }
            }
        }

        /// <summary>
        /// Detach this VRControl from its dragging target and dock into the closest appropriate dock
        /// </summary>
        public virtual void StopDragging()
        {
            if (IsDragging)
            {
                FixedJoint[] jointList = gameObject.GetComponents<FixedJoint>();
                for (int i = 0; i < jointList.Length; i++)
                {
                    Destroy(jointList[i]);
                }
                rigidbody.isKinematic = true;

                SetIsDragging(false);

                //If we're a dockable object, we need to find something to slot into.
                if (IsDockable) DockIntoClosest();
                HydraController.Instance.SetHandDragging(m_hand, null);
            }
        }


        /*
         * Docking states
         */

        /// <summary>
        /// Check if this VRControl accepts child controls
        /// </summary>
        public bool IsDock { get { return m_acceptsDockables; } }

        /// <summary>
        /// Sets VRControl to accept child controls
        /// </summary>
        /// <param name="state"></param>
        public void SetAsDock(bool state) { m_acceptsDockables = state; }
        private bool m_acceptsDockables;

        /// <summary>
        /// Check if this VRControl can dock into appropriate docks
        /// </summary>
        public bool IsDockable { get { isDockable = true; return m_isDockable; } }

        /// <summary>
        /// Sets this VRControl ability to dock into appropriate docks
        /// </summary>
        /// <param name="state"></param>
        public void SetIsDockable(bool state) { m_isDockable = state; }
        private bool m_isDockable;
        
        /// <summary>
        /// Get minimized scale of this VRControl
        /// </summary>
        public float minimizedScale { get { return m_minimizedScale; } }

        /// <summary>
        /// Get maximized scale of this VRControl
        /// </summary>
        public float maximizedScale { get { return m_maximizedScale; } }

        public float m_minimizedScale = 0.1f;
        public float m_maximizedScale = 1.0f;

        /// <summary>
        /// Trigger VRControl to shift into its minimized state
        /// </summary>
        public virtual void Minimize()
        {
            transform.localScale = new Vector3(minimizedScale, minimizedScale, minimizedScale);
        }

        /// <summary>
        /// Trigger VRControl to shift into its maximized state
        /// </summary>
        public virtual void Maximize()
        {
            transform.localScale = new Vector3(maximizedScale, maximizedScale, maximizedScale);
        }


        /*
         * Docking methods
         */

        /// <summary>
        /// Dock all child VRControls of a type that are not currently docked.
        /// </summary>
        /// <param name="type"></param>
        public void DockChildTransforms()
        {
            List<BaseVRControl> children = new List<BaseVRControl>();
		
            for (int i = 0; i < transform.childCount; i++)
            {
                BaseVRControl control = transform.GetChild(i).GetComponent<BaseVRControl>();
                if (control != null)
                    children.Add(control);
            }

            List<BaseVRControl> sortedChildren = children.OrderBy(o => o.gameObject.name).ToList();
            foreach (BaseVRControl control in sortedChildren)
            {
                control.DockInto(this);
            }
        }

        /// <summary>
        /// Get the object this VRControl is docked into
        /// </summary>
        public BaseVRControl DockedInto { get { return m_dockedInto; } }
        private BaseVRControl m_dockedInto;

        /// <summary>
        /// Get the list of child VRControl docked into this one
        /// </summary>
        public List<BaseVRControl> DockedChildren { get { return m_childDockables; } }
        private List<BaseVRControl> m_childDockables;
        
        /// <summary>
        /// Dock this VRControl into a target
        /// </summary>
        /// <param name="attach">Target VRControl to dock into</param>
        public virtual void DockInto(BaseVRControl attach)
        {
            if (attach.IsDock)
            {
                m_dockedInto = attach;
                attach.AddDockableAttachment(this);
            }
            if (IsDraggable) SetIsDragging(false);
        }

        /// <summary>
        /// Remove this VRControl from its dock
        /// </summary>
        public virtual void Undock()
        {
            if (m_dockedInto != null)
            {
                m_dockedInto.RemoveDockableAttachment(this);
                m_dockedInto = null;
            }
        }

        /// <summary>
        /// Dock this control into the closest valid dock based on the VRControl types this VRControl can dock into
        /// </summary>
        public void DockIntoClosest()
        {
            GameObject[] docks = GameObject.FindGameObjectsWithTag("ParentIsADock");
            BaseVRControl closestValidDock = null;
            float closestDist = 0.0f;

            foreach (GameObject dockTag in docks)
            {
                BaseVRControl dockAttach = dockTag.transform.parent.GetComponent<BaseVRControl>();

                if (dockAttach != null)
                {
                    if (dockAttach != this)
                    {
                        if (dockAttach.id != VRControls.StaticIds.EDITOR_DOCK)
                        {
                            if (dockAttach.DockAcceptsType(this.GetType()) && dockAttach.IsDock)
                            {
                                if (closestValidDock == null)
                                {
                                    closestDist = Vector3.Distance(dockAttach.transform.position, transform.position);
                                    closestValidDock = dockAttach;
                                }
                                float dist = Vector3.Distance(dockAttach.transform.position, transform.position);
                                if (dist < closestDist)
                                {
                                    closestValidDock = dockAttach;
                                    closestDist = dist;
                                }
                            }
                        }
                    }
                }
            }

            if (closestValidDock != null)
            {
                if (IsInDockingRange(closestValidDock, closestValidDock.dockingRange))
                    DockInto(closestValidDock);
                else
                    SetFloating();
            }
            else
            {
                SetFloating();
            }
        }

        /// <summary>
        /// Set this VRControl as floating without a parent dock. Deletes temporary transient VRControls.
        /// </summary>
        public virtual void SetFloating()
        {
            UIController.Instance.AddOrphanControl(this);
        }

        /// <summary>
        /// Adds a child dockable VRControl to this VRControl
        /// </summary>
        /// <param name="attach">VRControl to add</param>
        /// <returns></returns>
        public virtual bool AddDockableAttachment(BaseVRControl attach)
        {
            if (m_childDockables == null)
                m_childDockables = new List<BaseVRControl>();

            if (!DockAcceptsType(attach.GetType()))
                throw new Exception(this + " can't dock with a " + attach.GetType());
            
            m_childDockables.Add(attach);
            attach.transform.parent = transform;

            if(attach.rigidbody != null)
                attach.rigidbody.isKinematic = true;

            return true;			
        }

        /// <summary>
        /// Undock a child VRControl from this VRControl
        /// </summary>
        /// <param name="attach"></param>
        public virtual void RemoveDockableAttachment(BaseVRControl attach)
        {
            while (m_childDockables.Contains(attach))
                m_childDockables.Remove(attach);
            attach.transform.parent = null;
           
            if(attach.rigidbody != null)
                attach.rigidbody.isKinematic = false;
        }


        /*
         * Dock type / distance checking
         */

        /// <summary>
        /// Add a new type to the list of types this VRControl can dock into
        /// </summary>
        /// <param name="type"></param>
        public virtual void AddAcceptedDocktype(System.Type type) { m_acceptedTypes.Add(type); }

        /// <summary>
        /// Adds multiple types to the list of types this VRControl can dock into
        /// </summary>
        /// <param name="types"></param>
        public void AddGroupDocktype(Type[] types)
        {
            foreach (Type t in types)
            {
                AddAcceptedDocktype(t);
            }
        }
        private List<System.Type> m_acceptedTypes;

        /// <summary>
        /// Check if this VRControl can dock with the given type.
        /// </summary>
        /// <param name="type">Type to check docking validity against</param>
        /// <returns></returns>
        public bool DockAcceptsType(System.Type type)
        {
            foreach (System.Type acceptedType in m_acceptedTypes)
            {
                if (acceptedType.IsAssignableFrom(type))
                    return true;
            }
            return false;
        }
       
        /// <summary>
        /// Check if VRControl is within range of a target VRControl dock
        /// </summary>
        /// <param name="attach">VRControl to check distance of</param>
        /// <param name="range">Distance dock has to be within to be valid</param>
        /// <returns></returns>
        public virtual bool IsInDockingRange(BaseVRControl attach, float range)
        {
            if (attach == null)
                return false;
            return (Vector3.Distance(transform.position, attach.transform.position) < range) ? true : false;
        }
        public float dockingRange = 1.5f;


        /*
         * Child UI controls
         * 
         * Child controls are any controls that aren't added by docking.
         */

        /// <summary>
        /// Gets list of child docked VRControls
        /// </summary>
        public List<BaseVRControl> ChildControls { get { return m_childControls; } }

        /// <summary>
        /// Adds a new child VRControl
        /// </summary>
        /// <param name="control">VRControl to add</param>
        public void AddChildControl(BaseVRControl control) { m_childControls.Add(control); }

        /// <summary>
        /// Removes a child VRControl
        /// </summary>
        /// <param name="control">VRControl to remove</param>
        public void RemoveChildControl(BaseVRControl control) { m_childControls.Remove(control); }
        private List<BaseVRControl> m_childControls;

        /// <summary>
        /// Check if child VRControls are enabled
        /// </summary>
		public bool controlsEnabled { get { return m_controlsEnabled; } }
        private bool m_controlsEnabled = true;

        /// <summary>
        /// Check if child VRControls are visible
        /// </summary>
        public bool controlsVisible { get { return m_controlsVisible; } }
        private bool m_controlsVisible;

        /// <summary>
        /// Set controls active
        /// </summary>
        public void EnableControls() { m_controlsEnabled = true; }

        /// <summary>
        /// Set controls inactive
        /// </summary>
        public void DisableControls()
        {
            m_controlsEnabled = false;
            HideControls();
        }

        /// <summary>
        /// Show controls
        /// </summary>
        public virtual void ShowControls()
        {
            m_controlsVisible = true;

            if (m_dockedInto != null)
                m_dockedInto.ChildAttachmentOpeningControls(this);
        }

        /// <summary>
        /// Hide controls
        /// </summary>
        public virtual void HideControls() { m_controlsVisible = false; }
        public void ToggleControls()
        {
            if (controlsVisible)
                HideControls();
            else
                ShowControls();
        }

        /// <summary>
        /// If implememented, will allow for a set command to be triggered by a VRControl 
        /// </summary>
        public virtual void Fire() {}

        /// <summary>
        /// Called by a child attachment opening its controls
        /// </summary>
        /// <param name="attach">Child VRControl requesting open controls</param>
        public virtual void ChildAttachmentOpeningControls(BaseVRControl attach)
        {
            if (SoloChildControlsVisible)
            {
                if (m_visibleAttachmentControls != null && attach != m_visibleAttachmentControls)
                    m_visibleAttachmentControls.HideControls();
                m_visibleAttachmentControls = attach;
            }
        }

        /// <summary>
        /// Gets the active child control which has its controls visible
        /// </summary>
        public BaseVRControl visibleControls { get { return m_visibleAttachmentControls; } }
        private BaseVRControl m_visibleAttachmentControls;

        /// <summary>
        /// Closes all docked children controls
        /// </summary>
        public void HideChildControls()
        {
            foreach (BaseVRControl control in DockedChildren)
                control.HideControls();
        }

        /// <summary>
        /// Set this VRControl to only allow one child VRCOntrol to have its controls visible at a time
        /// </summary>
        /// <param name="state"></param>
        public void SetSoloChildControlsVisible(bool state) { m_soloChildControlsVisible = state; }

        /// <summary>
        /// Get state of this VRControl for having only a single VRControl controls visible
        /// </summary>
        public bool SoloChildControlsVisible { get { return m_soloChildControlsVisible; } }
        private bool m_soloChildControlsVisible;

        /// <summary>
        /// Mark this VRControl as being a template control. 
        /// Templates can't be serialized or deleted.
        /// </summary>
        /// <param name="state"></param>
        public void SetAsTemplate(bool state) { m_isTemplate = state; }
        public bool IsTemplate{ get { return m_isTemplate; }}
        private bool m_isTemplate;


        /*
         * Ui context switching
         */
        /// <summary>
        /// Switch between different UI context modes depending on the global state of the performance
        /// </summary>
        /// <param name="context"></param>
        public void SwitchUIContext(UIController.UIContext context)
        {
            if (context == UIController.UIContext.EDITING)
                SetUIContextToEditor();
            else if (context == UIController.UIContext.PERFORMING)
                SetUIContextToPerformer();
            m_uiContext = context;
        }

        /// <summary>
        /// Overrideable implementation that VRControl triggers when moving into Editor context
        /// </summary>
        public virtual void SetUIContextToEditor(){}

        /// <summary>
        /// Overrideable implementation that VRControl triggers when moving into Performance context
        /// </summary>
        public virtual void SetUIContextToPerformer(){}

        /// <summary>
        /// Get the current UI context this VRControl is using
        /// </summary>
        /// <returns></returns>
        public UIController.UIContext uiContext { get { return m_uiContext; } }
        private UIController.UIContext m_uiContext;


        /*
         * Gesture implementations
         */
        public virtual void Gesture_First() { bIsFirstGesture = false; }
        public virtual void Gesture_Exit() { bIsFirstGesture = true; }
        public virtual void Gesture_IdleInterior() { }
        public virtual void Gesture_IdleProximity() { }
        public virtual void Gesture_IdleExterior() { }
        public virtual void Gesture_ExitIdleInterior() { }
        public virtual void Gesture_ExitIdleProximity() { }
        public virtual void Gesture_ExitIdleExterior() { }
        public virtual void Gesture_PushIn() { }
        public virtual void Gesture_PullOut() { }
        public virtual void Gesture_Twist(float amount) { }


        /*
         * MusicIO references
         */
       /// <summary>
       /// Initialization of this VRControl. Sets up musicIO reference this VRControl is meant to interact with or track.
       /// </summary>
       /// <param name="managedReference">MusicIO reference to attach to this VRControl</param>
        public virtual void Init(InstrumentParameter managedReference)
        {
            m_musicRef = managedReference;

            //Set default tool filter if not set
            if (m_respondsToToolMode == null)
                m_respondsToToolMode = new BaseTool.ToolMode[] { BaseTool.ToolMode.PRIMARY, BaseTool.ToolMode.SECONDARY };
        }

        /// <summary>
        /// MusicIO reference this VRControl is responisble for controlling or tracking
        /// </summary>
        public InstrumentParameter musicRef { get { return m_musicRef; } }
        private InstrumentParameter m_musicRef;

        /// <summary>
        /// Freezes MusicRef. Stops this VRControl frrom tracking the value of the attached MusicRef
        /// </summary>
        public void Freeze() { bIsFrozen = true; }

        /// <summary>
        /// Sets this VRControl to track MusicRef
        /// </summary>
        public void Unfreeze() { bIsFrozen = false; }
        protected bool bIsFrozen;


        /*
         * Serialization
         */

        /// <summary>
        /// Flag this VRControl as savable
        /// </summary>
        /// <param name="state"></param>
        public void SetIsSaveable(bool state) { m_isSaveable = state; }

        /// <summary>
        /// Check if VRControl is savable
        /// </summary>
        public bool IsSaveable { get { return m_isSaveable; } }
        private bool m_isSaveable = false;

        /// <summary>
        /// Flag this VRControl as serializable to JSON
        /// </summary>
        /// <param name="state"></param>
        public void SetIsSerializeable(bool state) { m_isSerializeable = state; }

        /// <summary>
        /// Check if VRControl is serializable to JSON
        /// </summary>
        public bool IsSerializeable { get { return m_isSerializeable; } }
        private bool m_isSerializeable;

        /// <summary>
        /// Builds JSON hierarchy of the VRCOntrol and all child VRControls that are serializable
        /// </summary>
        /// <param name="attachments">List of VRControls to serialize</param>
        /// <returns></returns>

        public string BuildJsonHierarchy(List<BaseVRControl> attachments)
        {
            return JsonConvert.SerializeObject(attachments, new Formatting(), new ControlHierarchySerializer());
        }

        public List<BaseVRControl> BuildFlatHierarchy()
        {
            return BuildFlatHierarchy(null);
        }

        public List<BaseVRControl> BuildFlatHierarchy(List<BaseVRControl> attachments)
        {
            if (!IsSaveable)
                return null;

            if (attachments == null)
                attachments = new List<BaseVRControl>();

            if (this.IsSerializeable && !IsTemplate)
            {
                attachments.Add(this);
            }

            if (DockedChildren != null)
            {
                foreach (BaseVRControl attach in DockedChildren){
					if(attach != null)
						attach.BuildFlatHierarchy(attachments);
				}
            }
            if (ChildControls != null)
            {
                foreach (BaseVRControl control in ChildControls){
					if(control != null)
						control.BuildFlatHierarchy(attachments);
				}
            }

            return attachments;
        }


        [JsonProperty]
        [JsonConverter(typeof(Vector3Serializer))]
        Vector3 worldPos
        {
            get { return transform.position; }
            set { transform.position = value; }
        }

        [JsonProperty]
        [JsonConverter(typeof(QuaternionSerializer))]
        Quaternion worldRot
        {
            get { return transform.rotation; }
            set { transform.rotation = value; }
        }     
	}
}
