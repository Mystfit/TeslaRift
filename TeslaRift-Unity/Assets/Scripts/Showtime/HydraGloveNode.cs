using ZST;
using System;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Newtonsoft.Json;
using MusicIO;

public class HydraGloveNode : UnityNode
{
    private static string MASTER_SUFFIX = "_master";
    private static string SLAVE_SUFFIX = "_slave";
    private static string KEYBOARD_EVENT = "keyboard_event";
    private static string GLOVE_EVENT = "glove_event";

    private static HydraGloveNode m_instance;
    public static HydraGloveNode Instance { get { return m_instance; } }

    private SixenseInput.Controller[] m_controllers = new SixenseInput.Controller[2];
    private GloveController[] m_gloves = new GloveController[2];
    private float[] m_gloveData;

    public Vector3 handPosition(SixenseHands hand) { return m_handPositions[((int)hand)-1]; }
    public Quaternion handRotation(SixenseHands hand) { return m_handRotations[((int)hand) - 1]; }
    public double[] gloveBendValues(SixenseHands hand) { return m_gloveBendValues[((int)hand) - 1]; }

    private Vector3[] m_handPositions;
    private Quaternion[] m_handRotations;
    private double[][] m_gloveBendValues;

    // Use this for initialization
    public override void Awake()
    {
        m_instance = this;

        if (GlobalConfig.Instance.MasterInputNode == string.Empty)
            m_nodeName += MASTER_SUFFIX;
        else
            m_nodeName += SLAVE_SUFFIX;

        base.Awake();

        m_handPositions = new Vector3[2];
        m_handRotations = new Quaternion[2];
        m_gloveBendValues = new double[2][];
        for (int i = 0; i < 2; i++) 
            m_gloveBendValues[i] = new double[4];

        m_controllers = new SixenseInput.Controller[2];
        m_gloves = new GloveController[2];
        m_gloveData = new float[(3+4+4)*2];
        m_gloves[0] = HydraController.Instance.GetGloveController(BaseTool.ToolHand.LEFT);
        m_gloves[1] = HydraController.Instance.GetGloveController(BaseTool.ToolHand.RIGHT);

        if (GlobalConfig.Instance.UseRemoteGloves)
        {
            if (peers.ContainsKey(GlobalConfig.Instance.MasterInputNode))
                ConnectToRemoteGloves(peers[GlobalConfig.Instance.MasterInputNode]);
        }
        else
        {
            m_node.requestRegisterMethod(KEYBOARD_EVENT, ZstMethod.READ);
            m_node.requestRegisterMethod(GLOVE_EVENT, ZstMethod.READ);
        }
    }

    public void Update()
    {
        if (m_controllers[0] == null || m_controllers[1] == null)
        {
            m_controllers[0] = HydraController.Instance.GetHandController(BaseTool.ToolHand.LEFT);
            m_controllers[1] = HydraController.Instance.GetHandController(BaseTool.ToolHand.RIGHT);
        }
        else
        {
            if (!GlobalConfig.Instance.UseRemoteGloves)
            {
                SendGloveUpdate();
                SendKeyboardUpdate();
            }
        }
    }

    public void ConnectToRemoteGloves(ZstPeerLink hydraNode)
    {
        m_node.subscribeToNode(hydraNode);
        m_node.connectToPeer(hydraNode);
        m_node.subscribeToMethod(hydraNode.methods[GLOVE_EVENT], ReceiveGloveUpdate);
        m_node.subscribeToMethod(hydraNode.methods[KEYBOARD_EVENT], ReceivedKeyboardUpdate);
    }

    public void SendKeyboardUpdate()
    {
        int e = System.Enum.GetNames(typeof(KeyCode)).Length;
        for (int i = 0; i < e; i++)
        {
            int keyStatus = -1;
            if (Input.GetKeyDown((KeyCode)i))
                keyStatus = 1;
            if (Input.GetKeyUp((KeyCode)i))
                keyStatus = 0;
            if (keyStatus > -1)
                m_node.updateLocalMethod(m_node.methods[KEYBOARD_EVENT], new int[] { keyStatus, i });
        }
    }

    public object ReceivedKeyboardUpdate(ZstMethod methodData)
    {
        int[] keyStatus = JsonConvert.DeserializeObject<int[]>(methodData.output.ToString());
        if (keyStatus[0] == 1)
            HydraController.Instance.QueueKeyPress((KeyCode)keyStatus[1]);
        return null;
    }

    public object ReceiveGloveUpdate(ZstMethod methodData)
    {
        float[] output = JsonConvert.DeserializeObject<float[]>(methodData.output.ToString());
        if (m_controllers[0] == null || m_controllers[1] == null)
        {
            m_controllers[0] = HydraController.Instance.GetHandController(BaseTool.ToolHand.LEFT);
            m_controllers[1] = HydraController.Instance.GetHandController(BaseTool.ToolHand.RIGHT);
        }
        if (m_controllers[0] != null && m_controllers[1] != null)
        {
            for (int i = 0; i < 2; i++)
            {
                int offset = i * 11;
                m_handPositions[i].x = output[offset++];
                m_handPositions[i].y = output[offset++];
                m_handPositions[i].z = output[offset++];
                m_handRotations[i].x = output[offset++];
                m_handRotations[i].y = output[offset++];
                m_handRotations[i].z = output[offset++];
                m_handRotations[i].w = output[offset++];
                m_gloveBendValues[i][0] = output[offset++];
                m_gloveBendValues[i][1] = output[offset++];
                m_gloveBendValues[i][2] = output[offset++];
                m_gloveBendValues[i][3] = output[offset++];
            }
        }
        return null;
    }

    public void SendGloveUpdate()
    {
        for(int i = 0; i < 2; i++){
            int offset = i*11;
            m_gloveData[offset++] = m_controllers[i].Position.x;
            m_gloveData[offset++] = m_controllers[i].Position.y;
            m_gloveData[offset++] = m_controllers[i].Position.z;
            m_gloveData[offset++] = m_controllers[i].Rotation.x;
            m_gloveData[offset++] = m_controllers[i].Rotation.y;
            m_gloveData[offset++] = m_controllers[i].Rotation.z;
            m_gloveData[offset++] = m_controllers[i].Rotation.w;
            m_gloveData[offset++] = (float)m_gloves[i].bendValues[0];
            m_gloveData[offset++] = (float)m_gloves[i].bendValues[1];
            m_gloveData[offset++] = (float)m_gloves[i].bendValues[2];
            m_gloveData[offset++] = (float)m_gloves[i].bendValues[3];
        }
        
        float[] gloveData = new float[22];
        m_node.updateLocalMethod(m_node.methods[GLOVE_EVENT], m_gloveData);
    }
}
