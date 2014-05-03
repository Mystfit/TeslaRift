using UnityEngine;
using ZST;
using System;
using System.Collections;
using System.Collections.Generic;
using Newtonsoft.Json;
using MusicIO;

public class ZmqMusicNode : MonoBehaviour {

	public InstrumentFactory m_instrumentSpawner;

	public string m_stageAddress = "127.0.0.1";
	public string m_port = "6000";

	public ZstNode node { get { return m_node; }}
	protected ZstNode m_node;
	protected Dictionary<string, ZstPeerLink> m_peers;
	protected ZstPeerLink m_livePeer;

	private static ZmqMusicNode m_instance;	
	public static ZmqMusicNode Instance { get { return m_instance; }}

	// Use this for initialization
	void Start () {
		m_instance = this;
		string address = "tcp://" + m_stageAddress + ":" + m_port;
		Debug.Log(address);
		m_node = new ZstNode("UnityNode", address);
		m_node.requestRegisterNode();
		m_peers = m_node.requestNodePeerlinks();

		m_livePeer = m_peers["LiveNode"];
		m_node.subscribeToNode(m_livePeer);
		m_node.connectToPeer(m_livePeer);
		ZstMethod response = m_node.updateRemoteMethod(m_livePeer.methods["get_song_layout"]);
        string output = response.output.ToString();
        m_instrumentSpawner.LoadLiveSessionXml(output);

        //Subscribe to value updates
        m_node.subscribeToMethod(m_livePeer.methods["value_updated"], instrumentValueUpdated);
	}

    public object instrumentValueUpdated(ZstMethod methodData)
    {
        Debug.Log(methodData.output);
        Dictionary<string, object> output = JsonConvert.DeserializeObject<Dictionary<string, object>>(methodData.output.ToString());
        BaseInstrumentParam param = InstrumentController.Instance.findParameter(Convert.ToInt32(output["trackindex"]), Convert.ToInt32(output["deviceindex"]), Convert.ToInt32(output["parameterindex"]));
        if (param != null)
            param.setScaledVal(Convert.ToSingle(output["value"]), true);
        return null;
    }

	public void updateInstrumentValue(int trackIndex, int deviceIndex, int parameterIndex, int value){
		m_node.updateRemoteMethod(
			m_livePeer.methods["set_value"], 
			new Dictionary<string, object>(){
				{"deviceindex", deviceIndex},
				{"trackindex", trackIndex},
				{"parameterindex", parameterIndex},
				{"value", value}
		});
	}

	public void fireClip(int trackIndex, int clipIndex){
		m_node.updateRemoteMethod(
			m_livePeer.methods["fire_clip"], 
			new Dictionary<string, object>(){
			{"trackindex", trackIndex},
			{"clipindex", clipIndex}
		});
	}

	
	// Update is called once per frame
	void Update () {

	}


	public void OnApplicationQuit(){
		bool result = m_node.close();
		Debug.Log("Network cleanup: " + result);
	}
}
