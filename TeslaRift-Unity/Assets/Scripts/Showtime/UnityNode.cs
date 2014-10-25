using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using ZST;
using UnityEngine;


public class UnityNode : MonoBehaviour
{
    private static string MASTER_SUFFIX = "_master";
    private static string SLAVE_SUFFIX = "_slave";

    public ZstNode node { get { return m_node; } }
    protected ZstNode m_node;
    public string m_nodeName = "UnityNode";

    public Dictionary<string, ZstPeerLink> peers { get { return m_peers; } }
    protected Dictionary<string, ZstPeerLink> m_peers;

    public virtual void Awake()
    {
        if (!GlobalConfig.Instance.UseRemoteInput)
            m_nodeName += MASTER_SUFFIX;
        else
            m_nodeName += SLAVE_SUFFIX;

        m_node = new ZstNode(m_nodeName, "tcp://" + GlobalConfig.Instance.ShowtimeStageAddress + ":" + GlobalConfig.Instance.ShowtimeStagePort.ToString());
        m_node.requestRegisterNode();
        m_peers = m_node.requestNodePeerlinks();
    }

    /*
     * Exit and cleanup
     */
    public void OnApplicationQuit()
    {
        Close();
    }

    public virtual void Close()
    {
        bool result = m_node.close();
        Debug.Log("Network cleanup: " + result);
    }
}

