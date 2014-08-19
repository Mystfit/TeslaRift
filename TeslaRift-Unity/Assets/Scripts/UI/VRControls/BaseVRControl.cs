using UnityEngine;
//using UnityEditor;
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

    public static class StaticIds{
        public static string INSTRUMENT_DOCK = "instrumentDock";
        public static string EDITOR_DOCK = "editorDock";
    }

    [JsonConverter(typeof(BaseVRControlSerializer))]
    public abstract class BaseVRControl : MonoBehaviour
    {
        public bool isCloneable;
        public bool isDraggable;
        public bool isDockable;
        public bool isDock;
        public bool isSaveable;
        public bool isSerializeable = true;

        public virtual void Awake()
        {
            if(m_id == string.Empty)
                m_id = UIFactory.GetNewId;
            m_maximizedScale = (transform.localScale.x + transform.localScale.y + transform.localScale.z) / 3.0f;
            SetIsDraggable(isDraggable);
            SetCloneable(isCloneable);
            SetIsDockable(isDockable);
            SetAsDock(isDock);
            SetIsSaveable(isSaveable);
            SetIsSerializeable(isSerializeable);

            m_acceptedTypes = new List<System.Type>();
            m_childDockables = new List<BaseVRControl>();
            m_childControls = new List<BaseVRControl>();
            SetCollideable(m_doesCollide);

            UIController.Instance.AddControl(this);
        }
        public virtual void Start() { }
        public virtual void Update()
        {
            //Editor boolean toggles
            if (m_toggleControls)
            {
                m_toggleControls = false;
                ToggleControls();
            }

            //Exposing states to inspector
            isCloneable = m_isCloneable;
            isDockable = m_isDockable;
            isDock = m_acceptsDockables;
            isDraggable = m_isDraggable;
            isSaveable = m_isSaveable;
            isSerializeable = m_isSerializeable;
        }


        /*
         * Serialization
         */
        public void SetIsSaveable(bool state) { m_isSaveable = state; }
        public bool IsSaveable { get { return m_isSaveable; } }
        protected bool m_isSaveable = false;

        public void SetIsSerializeable(bool state) { m_isSerializeable = state; }
        public bool IsSerializeable { get { return m_isSerializeable; } }
        protected bool m_isSerializeable;

        public void SetId(string id) { m_id = id; }
        protected string m_id = "";
        public string id { get { return m_id; } }

        //Id of the json parent this object should be docked into. Only reliable at creation time
        public string jsonParentId;


        /*
         * Unity status setters
         */
        public void SetActive() { gameObject.SetActive(true); }
        public void SetInactive() { gameObject.SetActive(false); }


        /*
         * Filter to only respond to defined tool modes
         */
        public void SetToolmodeResponse(BaseTool.ToolMode[] modes) { m_respondsToToolMode = modes; }
        public BaseTool.ToolMode[] m_respondsToToolMode;
        public bool respondsToToolMode(BaseTool.ToolMode mode)
        {
            if (m_respondsToToolMode.Length > 0)
            {
                foreach (BaseTool.ToolMode responder in m_respondsToToolMode)
                {
                    if (responder == mode)
                        return true;
                }
            }

            return false;
        }


        /*
         * Collider references
         */
        public bool m_doesCollide = true;
        public bool IsCollideable { get { return m_doesCollide; } }
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
        protected HandProximityTrigger m_interiorTrigger;
        protected HandProximityTrigger m_proximityTrigger;
        public HandProximityTrigger interiorTrigger { get { return m_interiorTrigger; } }
        public HandProximityTrigger proximityTrigger { get { return m_proximityTrigger; } }
        public virtual Collider interiorCollider { get { return m_interiorTrigger.collider; } }
        public virtual Collider proximityCollider { get { return m_proximityTrigger.collider; } }

        public virtual void DisableChildColliders()
        {
            foreach (BaseVRControl attach in m_childDockables)
                attach.DisableColliders();
        }

        public virtual void EnableChildColliders()
        {
            foreach (BaseVRControl attach in m_childDockables)
                attach.EnableColliders();
        }

        public void DisableColliders()
        {
            interiorCollider.gameObject.SetActive(false);
            proximityCollider.gameObject.SetActive(false);
        }

        public void EnableColliders()
        {
            interiorCollider.gameObject.SetActive(true);
            proximityCollider.gameObject.SetActive(true);
        }


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
        public void SetCloneable(bool state) { m_isCloneable = state; isCloneable = state; }
        public bool IsCloneable { get { return m_isCloneable; } }
        protected bool m_isCloneable;

        /*
         * Music reference state
         */
        protected bool bHasMusicRef;
        public bool HasMusicRef { get { return bHasMusicRef; } }


        /*
         * First gesture states
         */
        protected bool bIsFirstGesture = true;
        public bool IsFirstGesture { get { return bIsFirstGesture; } }
        public void ResetFirstGesture() { bIsFirstGesture = false; }


        /*
         * Active tool hand
         */
        protected BaseTool.ToolHand m_hand;
        public BaseTool.ToolHand ActiveHand { get { return m_hand; } }
        public void SetActiveHand(BaseTool.ToolHand hand) { m_hand = hand; }


        /*
         * Active tool modes
         */
        protected BaseTool.ToolMode m_mode;
        public BaseTool.ToolMode mode { get { return m_mode; } }
        public virtual void SetToolMode(BaseTool.ToolMode mode) { m_mode = mode; }


        /*
         * Selection
         */
        protected bool m_selected;
        public bool selected { get { return m_selected; } }
        public bool m_toggleControls;
        public virtual void ToggleSelected() { SetSelected(!m_selected); }
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
        public virtual void ChildAttachmentSelected(BaseVRControl attach) { }


        /*
         * Outline and hovering
         */
        protected Material m_outlineMat;
        public void SetOutlineMat(Material mat) { m_outlineMat = mat; }

        public void SetOutlineSize(float size)
        {
            SetOutlineSize(size, true);
        }
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
        public void SetOutlineColor(Color color)
        {
            SetOutlineColor(color, true);
        }
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

        public virtual void StartHover()
        {
            if (!selected)
            {
                SetOutlineSize(UIFactory.outlineHoverSize);
                SetOutlineColor(UIFactory.outlineHoverColor);
            }
        }
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
        protected bool m_isDragging;
        protected void SetIsDragging(bool state) { m_isDragging = (IsDraggable) ? state : false; isDraggable = state; }
        public bool IsDragging { get { return (IsDraggable) ? m_isDragging : false; } }

        protected bool m_isDraggable;
        public bool IsDraggable
        {
            get { return m_isDraggable; }
        }
        public void SetIsDraggable(bool state)
        {
            m_isDraggable = state;
            if (!m_isDraggable) m_isDragging = false;
        }

        public virtual void StartDragging(GameObject target)
        {
            if (IsDraggable)
            {
                //StartDragging(HydraController.Instance.GetHand(m_hand));
                if (!HydraController.Instance.IsHandDragging(m_hand))
                {
                    //Clone instrument here
                    if (IsCloneable)
                    {
                        BaseVRControl attach = UI.UIFactory.CreateMusicRefAttachment(this);
                        attach.StartDragging(HydraController.Instance.GetHand(m_hand));
                        attach.SetIsSaveable(true);
                    }
                    else
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
        }

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
        protected bool m_acceptsDockables;
        protected bool m_isDockable;
        public void SetAsDock(bool state) { m_acceptsDockables = state; }
        public void SetIsDockable(bool state) { m_isDockable = state; }
        public bool IsDock { get { return m_acceptsDockables; } }
        public bool IsDockable { get { isDockable = true; return m_isDockable; } }

        public float m_minimizedScale = 0.1f;
        public float m_maximizedScale = 1.0f;
        public float minimizedScale { get { return m_minimizedScale; } }
        public float maximizedScale { get { return m_maximizedScale; } }

        public virtual void Minimize()
        {
            transform.localScale = new Vector3(minimizedScale, minimizedScale, minimizedScale);
            //iTween.ScaleTo(gameObject, iTween.Hash("scale", new Vector3(minimizedScale, minimizedScale, minimizedScale), "time", 0.15f, "easetype", "easeOutCubic"));
        }

        public virtual void Maximize()
        {
            transform.localScale = new Vector3(maximizedScale, maximizedScale, maximizedScale);
            //iTween.ScaleTo(gameObject, iTween.Hash("scale", new Vector3(maximizedScale, maximizedScale, maximizedScale), "time", 0.15f, "easetype", "easeOutCubic"));
        }

        public virtual void ScaleFinished()
        {

        }


        /*
         * Docked children / owner accessors
         */
        protected BaseVRControl m_dockedInto;
        protected BaseVRControl m_dockedIntoLast;
        public BaseVRControl DockedInto { get { return m_dockedInto; } }
        protected List<BaseVRControl> m_childDockables;
        public List<BaseVRControl> DockedChildren { get { return m_childDockables; } }


        /*
         * Dockable object modifiers
         */
        public virtual void DockInto(BaseVRControl attach)
        {
            if (attach.IsDock)
            {
                m_dockedInto = attach;
                attach.AddDockableAttachment(this);
                m_dockedIntoLast = attach;
            }
            if (IsDraggable) SetIsDragging(false);
        }

        public virtual void Undock()
        {
            if (m_dockedInto != null)
            {
                m_dockedInto.RemoveDockableAttachment(this);
                m_dockedInto = null;
            }
        }

        public virtual void DockIntoClosest()
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

        public virtual void SetFloating()
        {
            if (IsTransient)
            {
                if (DockedInto == null)
                {
                    UIController.Instance.DestroyControl(this);
                    return;
                }
            }

            HydraController.Instance.RemoveFromAllCollisionLists(gameObject);

            //if (m_dockedIntoLast != null)
            //    DockInto(m_dockedIntoLast);
        }


        /*
         * Dock modifiers
         */
        public virtual bool AddDockableAttachment(BaseVRControl attach)
        {
            if (m_childDockables == null)
                m_childDockables = new List<BaseVRControl>();

            if (DockAcceptsType(attach.GetType()))
            {
                m_childDockables.Add(attach);
                attach.transform.parent = transform;

                if(attach.rigidbody != null)
                    attach.rigidbody.isKinematic = true;

                return true;
            }
            else
            {
                Debug.LogError(this + " can't dock with a " + attach.GetType());
            }
            return false;
        }
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
        protected List<System.Type> m_acceptedTypes;
        public virtual void AddAcceptedDocktype(System.Type type) { m_acceptedTypes.Add(type); }
        public bool DockAcceptsType(System.Type type)
        {
            foreach (System.Type acceptedType in m_acceptedTypes)
            {
                if (type == acceptedType)
                    return true;
            }
            return false;
        }
        public void AddGroupDocktype(Type[] types)
        {
            foreach(Type t in types){
                AddAcceptedDocktype(t);
            }
        }

        public float dockingRange = 1.5f;
        public virtual bool IsInDockingRange(BaseVRControl attach, float range)
        {
            if (attach == null)
                return false;
            return (Vector3.Distance(transform.position, attach.transform.position) < range) ? true : false;
        }

        /*
         * Child UI controls
         */
        //Child controls are any controls that aren't added by docking, usually permanent
        protected List<BaseVRControl> m_childControls;
        public List<BaseVRControl> ChildControls { get { return m_childControls; } }
        public void AddChildControl(BaseVRControl control) { m_childControls.Add(control); }
        public void RemoveChildControl(BaseVRControl control) { m_childControls.Remove(control); }
        
		public bool controlsEnabled { get { return m_controlsEnabled; } }
        protected bool m_controlsEnabled = true;

        public bool controlsVisible { get { return m_controlsVisible; } }
        protected bool m_controlsVisible;

        public void EnableControls() { m_controlsEnabled = true; }
        public void DisableControls()
        {
            m_controlsEnabled = false;
            HideControls();
        }
        public virtual void ShowControls()
        {
            m_controlsVisible = true;

            if (m_dockedInto != null)
                m_dockedInto.ChildAttachmentOpeningControls(this);
        }
        public virtual void HideControls() { m_controlsVisible = false; }
        public void ToggleControls()
        {
            if (controlsVisible)
                HideControls();
            else
                ShowControls();
        }

        // Needs to be implememented if this control has a generic fire command, like a button
        public virtual void Fire() {}

        public virtual void ChildAttachmentOpeningControls(BaseVRControl attach)
        {
            if (SoloChildControlsVisible)
            {
                if (m_visibleAttachmentControls != null && attach != m_visibleAttachmentControls)
                    m_visibleAttachmentControls.HideControls();
                m_visibleAttachmentControls = attach;
            }
        }
        private BaseVRControl m_visibleAttachmentControls;

        public void SetSoloChildControlsVisible(bool state) { m_soloChildControlsVisible = state; }
        public bool SoloChildControlsVisible { get { return m_soloChildControlsVisible; } }
        private bool m_soloChildControlsVisible;


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
        private InstrumentParameter m_musicRef;
        private InstrumentParameter m_frozenMusicRef;
        public virtual void Init(InstrumentParameter managedReference)
        {
            m_musicRef = managedReference;
            m_frozenMusicRef = new InstrumentParameter(m_musicRef.name, m_musicRef.owner, m_musicRef.min, m_musicRef.max);
            bHasMusicRef = true;

            //Set default tool filter if not set
            if (m_respondsToToolMode == null)
                m_respondsToToolMode = new BaseTool.ToolMode[] { BaseTool.ToolMode.PRIMARY, BaseTool.ToolMode.SECONDARY };
        }
        public InstrumentParameter musicRef { get { return m_musicRef; } }

        protected bool bIsFrozen;
        public void Freeze() { bIsFrozen = true; }
        public void Unfreeze() { bIsFrozen = false; }

        /*
         * Transformation references for serialization
         */
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

        public string BuildJsonHierarchy(){
            return BuildJsonHierarchy(null);
        }

        public string BuildJsonHierarchy(List<BaseVRControl> attachments)
        {
            if (!IsSaveable)
                return string.Empty;

            if (attachments == null)
                attachments = new List<BaseVRControl>();
            
            if(this.IsSerializeable)
                attachments.Add(this);

            foreach (BaseVRControl attach in DockedChildren)
                attach.BuildJsonHierarchy(attachments);
            foreach (BaseVRControl control in ChildControls)
                control.BuildJsonHierarchy(attachments);

			return JsonConvert.SerializeObject(attachments, new Formatting(), new ControlHierarchySerializer());
		}
	}
}