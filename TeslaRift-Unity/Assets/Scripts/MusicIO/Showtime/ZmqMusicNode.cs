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

	private static ZmqMusicNode m_instance;	
	public static ZmqMusicNode Instance { get { return m_instance; }}

	// Use this for initialization
	void Start () {
		m_instance = this;
		m_node = new ZstNode("UnityNode", "tcp://" + m_stageAddress + ":" + m_port);
		m_node.requestRegisterNode();
		m_peers = m_node.requestNodePeerlinks();

        ZstPeerLink liveNode = m_peers["LiveNode"];

        m_node.subscribeToNode(liveNode);
        m_node.connectToPeer(liveNode);

        m_instrumentSpawner.LoadLiveSessionXml(liveNode);

        //Subscribe to value updates
        m_node.subscribeToMethod(liveNode.methods["value_updated"], instrumentValueUpdated);
		m_node.subscribeToMethod(liveNode.methods["send_updated"], sendValueUpdated);
		m_node.subscribeToMethod(liveNode.methods["fired_slot_index"], clipFired);
        m_node.subscribeToMethod(liveNode.methods["playing_slot_index"], clipPlaying);
	}

    /* 
     * Incoming methods
     */
    public object instrumentValueUpdated(ZstMethod methodData)
    {
        Dictionary<string, object> output = JsonConvert.DeserializeObject<Dictionary<string, object>>(methodData.output.ToString());
        int trackindex = Convert.ToInt32(output["trackindex"]);
        int deviceindex = Convert.ToInt32(output["deviceindex"]);
        int parameterindex = Convert.ToInt32(output["parameterindex"]);
        int category = Convert.ToInt32(output["category"]);
        float sendvalue = Convert.ToSingle(output["value"]);

        DeviceParameter param = InstrumentController.Instance.FindParameter(trackindex, deviceindex, parameterindex, category);

        if (param != null)
            param.setScaledVal(sendvalue, true);
        return null;
    }

    public object sendValueUpdated(ZstMethod methodData)
    {
        Dictionary<string, object> output = JsonConvert.DeserializeObject<Dictionary<string, object>>(methodData.output.ToString());
        int trackindex = Convert.ToInt32(output["trackindex"]);
        int sendindex = Convert.ToInt32(output["sendindex"]);
        float sendvalue = Convert.ToSingle(output["value"]);

        SendParameter send = InstrumentController.Instance.FindSendParameter(trackindex, sendindex);
        if (send != null)
            send.setScaledVal(sendvalue, true);
        return null;
    }

    public object clipFired(ZstMethod methodData)
    {
        Dictionary<string, object> output = JsonConvert.DeserializeObject<Dictionary<string, object>>(methodData.output.ToString());
        int trackIndex = Convert.ToInt32(output["trackindex"]);
        int slotIndex = Convert.ToInt32(output["slotindex"]);

        if (slotIndex >= 0)
        {
            ClipParameter clip = InstrumentController.Instance.FindClip(trackIndex, slotIndex);
            clip.SetClipState(ClipParameter.ClipState.IS_QUEUED);
        }

        return null;
    }

    public object clipPlaying(ZstMethod methodData)
    {
        Dictionary<string, object> output = JsonConvert.DeserializeObject<Dictionary<string, object>>(methodData.output.ToString());
        int trackIndex = Convert.ToInt32(output["trackindex"]);
        int slotIndex = Convert.ToInt32(output["slotindex"]);
		Instrument playingInstrument = InstrumentController.Instance.GetInstrumentByTrackindex(trackIndex);

        if (slotIndex < 0)
        {
            //Stopping
            if (playingInstrument != null)
            {
                if (playingInstrument.playingClip != null)
                {
                    playingInstrument.playingClip.SetClipState(ClipParameter.ClipState.IS_DISABLED);
                    playingInstrument.SetPlayingClip(null);
                }
            }
		}
        else
        {
			if(playingInstrument.playingClip != null)
				playingInstrument.playingClip.SetClipState(ClipParameter.ClipState.IS_DISABLED);

            ClipParameter clip = InstrumentController.Instance.FindClip(trackIndex, slotIndex);
            clip.SetClipState(ClipParameter.ClipState.IS_PLAYING);
        }

        return null;
    }

    /*
     * Exit and cleanup
     */
	public void OnApplicationQuit(){
		bool result = m_node.close();
		Debug.Log("Network cleanup: " + result);
	}
}
