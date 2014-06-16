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
		m_node = new ZstNode("UnityNode", "tcp://" + m_stageAddress + ":" + m_port);
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
		m_node.subscribeToMethod(m_livePeer.methods["send_updated"], sendValueUpdated);
		m_node.subscribeToMethod(m_livePeer.methods["fired_slot_index"], clipFired);
        m_node.subscribeToMethod(m_livePeer.methods["playing_slot_index"], clipPlaying);


		//m_node.subscribeToMethod(m_livePeer.methods["value_updated"], clipFired);
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

        BaseInstrumentParam param = InstrumentController.Instance.FindParameter(trackindex, deviceindex, parameterindex, category);

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
            InstrumentClip clip = InstrumentController.Instance.FindClip(trackIndex, slotIndex);
            clip.SetClipState(InstrumentClip.ClipState.IS_QUEUED);
        }

        return null;
    }

    public object clipPlaying(ZstMethod methodData)
    {
        Dictionary<string, object> output = JsonConvert.DeserializeObject<Dictionary<string, object>>(methodData.output.ToString());
        int trackIndex = Convert.ToInt32(output["trackindex"]);
        int slotIndex = Convert.ToInt32(output["slotindex"]);
		BaseInstrument playingInstrument = InstrumentController.Instance.GetInstrumentByTrackindex(trackIndex);

        if (slotIndex < 0)
        {
            //Stopping
            if (playingInstrument != null)
            {
                if (playingInstrument.playingClip != null)
                {
                    playingInstrument.playingClip.SetClipState(InstrumentClip.ClipState.IS_DISABLED);
                    playingInstrument.SetPlayingClip(null);
                }
            }
		}
        else
        {
			if(playingInstrument.playingClip != null)
				playingInstrument.playingClip.SetClipState(InstrumentClip.ClipState.IS_DISABLED);

            InstrumentClip clip = InstrumentController.Instance.FindClip(trackIndex, slotIndex);
            clip.SetClipState(InstrumentClip.ClipState.IS_PLAYING);
        }

        return null;
    }

    /* 
    * Outgoing methods
    */
	public void updateInstrumentValue(int trackIndex, int deviceIndex, int parameterIndex, float value, int category){
		m_node.updateRemoteMethod(
			m_livePeer.methods["set_value"], 
			new Dictionary<string, object>(){
				{"deviceindex", deviceIndex},
				{"trackindex", trackIndex},
				{"parameterindex", parameterIndex},
				{"value", value},
                {"category", category}
		});
	}

    public void updateSendValue(int trackIndex, int sendIndex, float value)
    {
        m_node.updateRemoteMethod(
            m_livePeer.methods["set_send"],
            new Dictionary<string, object>(){
				{"trackindex", trackIndex},
                {"sendindex", sendIndex},
				{"value", value}
		});
    }

    public void playNote(int trackIndex, int note, int velocity, int trigger)
    {
        m_node.updateRemoteMethod(
            m_livePeer.methods["play_note"],
            new Dictionary<string, object>(){
				{"trackindex", trackIndex},
				{"note", note},
				{"state", trigger},
				{"velocity", velocity}
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


    public void stopTrack(int trackIndex)
    {
        m_node.updateRemoteMethod(
            m_livePeer.methods["stop_track"],
            new Dictionary<string, object>(){
			{"trackindex", trackIndex}
		});
    }

    /*
     * Exit and cleanup
     */
	public void OnApplicationQuit(){
		bool result = m_node.close();
		Debug.Log("Network cleanup: " + result);
	}
}
