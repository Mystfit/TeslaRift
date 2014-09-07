using UnityEngine;
using System.Text;
using System.Collections;
using System;
using System.Collections.Generic;
using VRControls;

public enum HydraStates
{
    LEFT_IDLE = 0,
    LEFT_HOLDING,
    RIGHT_IDLE,
    RIGHT_HOLDING
}

public enum ProximityType
{
    INSTRUMENT_INTERIOR = 0,
    INSTRUMENT_PROXIMITY
}

public class HydraController : MonoBehaviour
{
    private static HydraController m_instance;
    public static HydraController Instance { get { return m_instance; } }

    //Member variables
    //-----------------------
    private SixenseInput.Controller m_leftHandController;
    private SixenseInput.Controller m_rightHandController;
    public GameObject m_leftHand;
    public GameObject m_rightHand;
    protected HydraHand m_leftHandHydra;
    protected HydraHand m_rightHandHydra;
    protected Vector3 m_leftHandVelocity;
    protected Vector3 m_rightHandVelocity;
    private Vector3 m_lastLeftHandPos;
    private Vector3 m_lastRightHandPos;
    protected BaseVRControl m_leftHandDragTarget;
    protected BaseVRControl m_rightHandDragTarget;
    private Queue<KeyCode> m_pressedKeys;

    public Transform m_leftHandTip;
    public Transform m_rightHandTip;
    public GameObject m_performer;
    public OVRCamera m_leftCamera;
    public OVRCamera m_rightCamera;
    public GloveCalibrator m_gloveCalibrator;

    //Collision lists
    //---------------
    private Dictionary<BaseVRControl, bool> m_leftInstrumentProximity;
    private Dictionary<BaseVRControl, bool> m_rightInstrumentProximity;
    private Dictionary<BaseVRControl, bool> m_leftInstrumentInterior;
    private Dictionary<BaseVRControl, bool> m_rightInstrumentInterior;
    private List<BaseVRControl> m_cleanupCollisions;

    private GloveController m_leftGlove;
    private GloveController m_rightGlove;

    // Initialization
    //------------------
    void Awake()
    {
        m_instance = this;

        //Collision lists
        m_leftInstrumentProximity = new Dictionary<BaseVRControl, bool>();
        m_rightInstrumentProximity = new Dictionary<BaseVRControl, bool>();
        m_leftInstrumentInterior = new Dictionary<BaseVRControl, bool>();
        m_rightInstrumentInterior = new Dictionary<BaseVRControl, bool>();
        m_leftHandHydra = m_leftHand.GetComponent<HydraHand>();
        m_rightHandHydra = m_rightHand.GetComponent<HydraHand>();
        m_leftHandController = SixenseInput.GetController(SixenseHands.LEFT);
        m_rightHandController = SixenseInput.GetController(SixenseHands.RIGHT);
        m_leftGlove = m_leftHand.GetComponent<GloveController>();
        m_rightGlove = m_rightHand.GetComponent<GloveController>();
        m_cleanupCollisions = new List<BaseVRControl>();
        m_pressedKeys = new Queue<KeyCode>();
    }


    /*
     * Returns left/right hand controllers
     */
    public SixenseInput.Controller GetHandController(BaseTool.ToolHand hand)
    {
        if (hand == BaseTool.ToolHand.LEFT)
            return m_leftHandController;
        return m_rightHandController;
    }


    /*
     * Gets the left/right hand gameObject
     */
    public GameObject GetHand(BaseTool.ToolHand hand)
    {
        if (hand == BaseTool.ToolHand.LEFT)
            return m_leftHand;
        return m_rightHand;
    }

    /*
     * Gets the left/right hand gameObject
     */
    public Transform GetHandTip(BaseTool.ToolHand hand)
    {
        if (hand == BaseTool.ToolHand.LEFT)
            return m_leftHandTip;
        return m_rightHandTip;
    }

    public Vector3 GetHandVelocity(BaseTool.ToolHand hand)
    {
        if (hand == BaseTool.ToolHand.LEFT)
            return m_leftHandVelocity;
        return m_rightHandVelocity;
    }


    /*
     * Gets sets hand dragging state
     */
    public bool IsHandDragging(BaseTool.ToolHand hand)
    {
        if (hand == BaseTool.ToolHand.LEFT)
        {
            if (m_leftHandDragTarget != null)
                return true;
            return false;
        }
        else
        {
            if (m_rightHandDragTarget != null)
                return true;
            return false;
        }
    }

    public void SetHandDragging(BaseTool.ToolHand hand, BaseVRControl target)
    {
        if (hand == BaseTool.ToolHand.LEFT)
            m_leftHandDragTarget = target;
        m_rightHandDragTarget = target;
    }

    public BaseVRControl GetHandDragging(BaseTool.ToolHand hand)
    {
        if (hand == BaseTool.ToolHand.LEFT)
            return m_leftHandDragTarget;
        return m_rightHandDragTarget;
    }

    /*
     * Gets the OVR performer
     */
    public GameObject GetPerformer { get { return m_performer; } }
    public Vector3 EyeCenter
    {
        get
        {
            return Vector3.Lerp(m_leftCamera.transform.position, m_rightCamera.transform.position, 0.5f);
        }
    }

    /*
     * Checks distance between hand, performer, and a target object
     */
    public bool IsHandCloserThanObject(Transform t, BaseTool.ToolHand hand)
    {
        float a = Vector3.Distance(t.position, m_performer.transform.position);
        float b = Vector3.Distance(GetHandTip(hand).position, m_performer.transform.position);
        if (a > b)
            return true;
        return false;
    }

    /*
     * Returns left/right glove controllers
     */
    public GloveController GetGloveController(BaseTool.ToolHand hand)
    {
        if (hand == BaseTool.ToolHand.LEFT)
            return m_leftGlove;
        return m_rightGlove;
    }

    /*
     * Returns left/right hydrahands controllers
     */
    public HydraHand GetHydraHand(BaseTool.ToolHand hand)
    {
        if (hand == BaseTool.ToolHand.LEFT)
            return m_leftHandHydra;
        return m_rightHandHydra;
    }

    public Vector3 GetHandColliderPosition(BaseTool.ToolHand hand)
    {
        GameObject handObj;
        if (hand == BaseTool.ToolHand.LEFT)
            handObj = m_leftHand;
        else
            handObj = m_rightHand;

        if (handObj.collider != null)
        {
            if (handObj.collider.GetType() == typeof(BoxCollider))
            {
                BoxCollider coll = handObj.collider as BoxCollider;
                return coll.bounds.center;
            }
        }

        return Vector3.zero;
    }



    /*
     * Returns the the closest object to the hand in a specific proximity list
     */

    public BaseVRControl HandTarget(BaseTool.ToolHand hand, ProximityType proximityTarget, BaseTool.ToolMode mode)
    {
        Dictionary<BaseVRControl, bool> targetList = GetCollisionList(proximityTarget, BaseTool.ToolHandToSixenseHand(hand));

        float closestDistance = -1.0f;
        BaseVRControl closestObject = null;

        if (targetList != null && GetHand(hand) != null)
        {
            foreach (KeyValuePair<BaseVRControl, bool> obj in targetList)
            {
                if (obj.Key != null)
                {
                    if (!obj.Key.proximityCollider.bounds.Intersects(GetHand(hand).collider.bounds))
                    {
                        m_cleanupCollisions.Add(obj.Key);                        
                        Debug.LogWarning("Control " + obj.Key.name + " shouldn't be colliding!");
                        continue;
                    }
                    float dist = Vector3.Distance(obj.Key.transform.position, GetHand(hand).transform.position);
                    if (dist < closestDistance || closestDistance < 0)
                    {
                        if (obj.Key.respondsToToolMode(mode))
                        {
                            closestDistance = dist;
                            closestObject = obj.Key;
                        }
                    }
                }
            }
        }

        return closestObject;
    }


    public void CleanupMisplacedCollisions()
    {
        if (m_cleanupCollisions.Count > 0)
        {
            foreach (BaseVRControl control in m_cleanupCollisions)
                RemoveFromAllCollisionLists(control);
            m_cleanupCollisions.Clear();
        }
    }


    /*
     * Remove all instances of 
     */
    public void RemoveFromAllCollisionLists(BaseVRControl target)
    {
        GetCollisionList(ProximityType.INSTRUMENT_INTERIOR, SixenseHands.LEFT).Remove(target);
        GetCollisionList(ProximityType.INSTRUMENT_INTERIOR, SixenseHands.RIGHT).Remove(target);
        GetCollisionList(ProximityType.INSTRUMENT_PROXIMITY, SixenseHands.LEFT).Remove(target);
        GetCollisionList(ProximityType.INSTRUMENT_PROXIMITY, SixenseHands.RIGHT).Remove(target);
    }



    /*
     * Adds a proximity target to a list of active colliders with a hand 
     */
    public void AddCollision(BaseVRControl proximityTarget, SixenseHands hand, ProximityType proximityType)
    {
        Dictionary<BaseVRControl, bool> targetList = GetCollisionList(proximityType, hand);
        targetList[proximityTarget] = true;
    }


    /*
     * Removes a proximity target from a list of active colliders with a hand 
     */
    public void RemoveCollision(BaseVRControl proximityTarget, SixenseHands hand, ProximityType proximityType)
    {
        Dictionary<BaseVRControl, bool> targetList = GetCollisionList(proximityType, hand);
        targetList.Remove(proximityTarget);

        //Debug.Log("Removing " + proximityTarget.name);
    }


    /*
     * Gets a secific proximity collider list
     */
    public Dictionary<BaseVRControl, bool> GetCollisionList(ProximityType proximityType, SixenseHands hand)
    {
        Dictionary<BaseVRControl, bool> targetList = null;

        switch (proximityType)
        {
            case ProximityType.INSTRUMENT_INTERIOR:
                if (hand == SixenseHands.LEFT)
                    targetList = m_leftInstrumentInterior;
                else if (hand == SixenseHands.RIGHT)
                    targetList = m_rightInstrumentInterior;
                break;
            case ProximityType.INSTRUMENT_PROXIMITY:
                if (hand == SixenseHands.LEFT)
                    targetList = m_leftInstrumentProximity;
                else if (hand == SixenseHands.RIGHT)
                    targetList = m_rightInstrumentProximity;
                break;
        }

        return targetList;
    }



    /*
     * Updaters
     */
    void Update()
    {
        CleanupMisplacedCollisions();

        if (m_leftHandController == null)
            m_leftHandController = SixenseInput.GetController(SixenseHands.LEFT);

        if (m_rightHandController == null)
            m_rightHandController = SixenseInput.GetController(SixenseHands.RIGHT);

        //Hand velocities
        m_leftHandVelocity = m_leftHand.transform.position - m_lastLeftHandPos;
        m_rightHandVelocity = m_rightHand.transform.position - m_lastRightHandPos;
        m_lastLeftHandPos = m_leftHand.transform.position;
        m_lastRightHandPos = m_rightHand.transform.position;

        SetCommonTools(BaseTool.ToolHand.LEFT);
        SetCommonTools(BaseTool.ToolHand.RIGHT);

        if (GlobalConfig.Instance.DebugCollisions)
        {
            //Debugging proximity lists
            if (m_gloveCalibrator.m_leftHandActive)
            {
                Debug.Log("Left Proximity:");
                foreach (KeyValuePair<BaseVRControl, bool> control in m_leftInstrumentProximity)
                    Debug.Log(control.Key.name);
                Debug.Log("Left Interior:");
                foreach (KeyValuePair<BaseVRControl, bool> control in m_leftInstrumentInterior)
                    Debug.Log(control.Key.name);
            }

            if (m_gloveCalibrator.m_rightHandActive)
            {
                Debug.Log("Left Proximity:");
                foreach (KeyValuePair<BaseVRControl, bool> control in m_rightInstrumentProximity)
                    Debug.Log(control.Key.name);
                Debug.Log("Left Interior:");
                foreach (KeyValuePair<BaseVRControl, bool> control in m_rightInstrumentInterior)
                    Debug.Log(control.Key.name);
            }
        }

        ////Keyboard inputs
        //if (Input.GetKeyDown(KeyCode.Space)) {
        //    FreezeHands();
        //    if (!m_gloveCalibrator.isCalibrated)
        //        m_gloveCalibrator.StartCalibration();
        //}

        //if (Input.GetKeyDown(KeyCode.Escape))
        //    Application.Quit();

        //if (Input.GetKeyDown(KeyCode.R))
        //{
        //    MusicNode.Instance.OnApplicationQuit();
        //    Application.LoadLevel(Application.loadedLevel);
        //}

        //if (Input.GetKeyDown(KeyCode.D))
        //{
        //    if(m_leftGlove != null)
        //        m_leftGlove.ToggleDebugText();
        //    if (m_rightGlove != null)
        //        m_rightGlove.ToggleDebugText();
        //}

        //if (Input.GetKeyDown(KeyCode.P))
        //{
        //    bool leftLoaded = false;
        //    bool rightLoaded = false;
        //    if (m_leftGlove != null)
        //    {
        //        if (m_leftGlove.gameObject.activeInHierarchy)
        //            leftLoaded = m_leftGlove.LoadRBF();
        //    }
        //    if (m_rightGlove != null) {
        //        if (m_rightGlove.gameObject.activeInHierarchy)
        //            rightLoaded = m_rightGlove.LoadRBF();
        //    }

        //    if (leftLoaded || rightLoaded)
        //        m_gloveCalibrator.StartCalibration();  
        //}

        

        int e = System.Enum.GetNames(typeof(KeyCode)).Length;
        for (int i = 0; i < e; i++)
        {
            if (Input.GetKeyDown((KeyCode)i))
                QueueKeyPress((KeyCode)i);
        }

        while (m_pressedKeys.Count > 0)
            TriggerKeyDown(m_pressedKeys.Dequeue());
    }

    public void QueueKeyPress(KeyCode key)
    {
        m_pressedKeys.Enqueue(key);
    }

    public void TriggerKeyDown(KeyCode key)
    {
        //Keyboard inputs
        if (key == KeyCode.Space)
        {
            FreezeHands();
            if (!m_gloveCalibrator.isCalibrated)
                m_gloveCalibrator.StartCalibration();
        }

        if (key == KeyCode.Escape)
            Application.Quit();

        if (key == KeyCode.R)
        {
            MusicNode.Instance.OnApplicationQuit();
            Application.LoadLevel(Application.loadedLevel);
        }

        if (key == KeyCode.D)
        {
            if (m_leftGlove != null)
                m_leftGlove.ToggleDebugText();
            if (m_rightGlove != null)
                m_rightGlove.ToggleDebugText();
        }

        if (key == KeyCode.P)
        {
            bool leftLoaded = false;
            bool rightLoaded = false;
            if (m_leftGlove != null)
            {
                if (m_leftGlove.gameObject.activeInHierarchy)
                    leftLoaded = m_leftGlove.LoadRBF();
            }
            if (m_rightGlove != null)
            {
                if (m_rightGlove.gameObject.activeInHierarchy)
                    rightLoaded = m_rightGlove.LoadRBF();
            }

            if (leftLoaded || rightLoaded)
                m_gloveCalibrator.StartCalibration();
        }

        if (key == KeyCode.S)
            EditorWorkspace.Instance.CreateManualLayout();
        
        if (key == KeyCode.L)
            EditorWorkspace.Instance.OpenWorkspaceFiles();
    }

    public void FreezeHands()
    {
        m_leftHandHydra.SetEnabled(false);
        m_rightHandHydra.SetEnabled(false);
    }

    public void UnfreezeHands()
    {
        m_leftHandHydra.ActivateHand(m_leftHandController);
        m_rightHandHydra.ActivateHand(m_rightHandController);
    }


    /*
     * Common tools for each hand
     */
    public void SetCommonTools(BaseTool.ToolHand hand)
    {

        GloveController glove = GetGloveController(hand);

        if (glove.GetGestureDown("CLOSED_HAND"))
            ToolController.Instance.PushTool(typeof(InstrumentGestureTool), hand, BaseTool.ToolMode.GRABBING);
        else if (glove.GetGestureDown("PINKY"))
            ToolController.Instance.PushTool(typeof(InstrumentGestureTool), hand, BaseTool.ToolMode.TERTIARY);
        else if (glove.GetGestureDown("INDEX_POINT"))
            ToolController.Instance.PushTool(typeof(InstrumentGestureTool), hand, BaseTool.ToolMode.PRIMARY);
        else if (glove.GetGestureDown("INDEX_MIDDLE"))
            ToolController.Instance.PushTool(typeof(InstrumentGestureTool), hand, BaseTool.ToolMode.SECONDARY);
        else if (glove.GetGestureDown("ROCK_ON"))
            ToolController.Instance.PushTool(typeof(InstrumentGestureTool), hand, BaseTool.ToolMode.TERTIARY);

        //FingerPlaying gestures
        if (glove.GetGestureDown("PLAY_1"))
            ToolController.Instance.PushTool(typeof(InstrumentGestureTool), hand, BaseTool.ToolMode.PLAY1);
        else if (glove.GetGestureDown("PLAY_2"))
            ToolController.Instance.PushTool(typeof(InstrumentGestureTool), hand, BaseTool.ToolMode.PLAY2);
        else if (glove.GetGestureDown("PLAY_3"))
            ToolController.Instance.PushTool(typeof(InstrumentGestureTool), hand, BaseTool.ToolMode.PLAY3);
        else if (glove.GetGestureDown("PLAY_4"))
            ToolController.Instance.PushTool(typeof(InstrumentGestureTool), hand, BaseTool.ToolMode.PLAY4);

        //Return to idle
        if (glove.GetGestureDown("IDLE_HAND"))
        {
            ToolController.Instance.PushTool(typeof(InstrumentGestureTool), hand, BaseTool.ToolMode.HOVER);
            glove.SetCollider(glove.activeGestureIndex);
        }
    }

}
