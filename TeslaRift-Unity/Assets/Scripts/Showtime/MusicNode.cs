using ZST;
using System;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Newtonsoft.Json;
using MusicIO;

public class MusicNode : UnityNode {

    public InstrumentFactory m_instrumentSpawner;

    private static MusicNode m_instance; 
    public static MusicNode Instance { get { return m_instance; }}

    private ZstPeerLink m_liveNode;
    private ZstPeerLink m_kp3Node;
    private ZstPeerLink m_kaossNode;

    // Use this for initialization
    public override void Awake()
    {
        base.Awake();

        m_instance = this;

        if (m_peers.ContainsKey("LiveNode"))
        {
            m_liveNode = m_peers["LiveNode"];
            ConnectToLive(m_liveNode);
        }

        if (m_peers.ContainsKey("Kaoss"))
        {
            m_kaossNode = m_peers["Kaoss"];
            ConnectToKaosspad(m_kaossNode, Color.green);
        }

        if (m_peers.ContainsKey("KP3"))
        {
            m_kp3Node = m_peers["KP3"];
            ConnectToKaosspad(m_kp3Node, Color.red);
        }
    }

    public override void Close()
    {
        Dictionary<string, object> args = new Dictionary<string,object>();
        args["trigger"] = 0;
        if (!GlobalConfig.Instance.UseRemoteInput)
        {
            if (m_kp3Node != null)
                m_node.updateRemoteMethod(m_kp3Node.methods["touch_trigger"], args);
            if (m_kaossNode != null)
                m_node.updateRemoteMethod(m_kaossNode.methods["touch_trigger"], args);
        }

        base.Close();
    }

    public void ConnectToLive(ZstPeerLink liveNode)
    {
        m_node.subscribeToNode(liveNode);
        m_node.connectToPeer(liveNode);

        m_instrumentSpawner.LoadLiveSessionXml(liveNode);
        m_node.subscribeToMethod(liveNode.methods["value_updated"], instrumentValueUpdated);
        m_node.subscribeToMethod(liveNode.methods["send_updated"], sendValueUpdated);
        m_node.subscribeToMethod(liveNode.methods["fired_slot_index"], clipFired);
        m_node.subscribeToMethod(liveNode.methods["playing_slot_index"], clipPlaying);
        m_node.subscribeToMethod(liveNode.methods["meters_updated"], outputMeter);
    }

    public void ConnectToKaosspad(ZstPeerLink kaossPadNode, Color color)
    {
        m_node.subscribeToNode(kaossPadNode);
        m_node.connectToPeer(kaossPadNode);
        m_instrumentSpawner.CreateKaossMidi(kaossPadNode, color);
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
            if(clip != null)
				clip.SetClipState(ClipParameter.ClipState.IS_QUEUED);
        }

        return null;
    }

    public object clipPlaying(ZstMethod methodData)
    {
        Dictionary<string, object> output = JsonConvert.DeserializeObject<Dictionary<string, object>>(methodData.output.ToString());
        int trackIndex = Convert.ToInt32(output["trackindex"]);
        int slotIndex = Convert.ToInt32(output["slotindex"]);
        InstrumentHandle playingInstrument = InstrumentController.Instance.GetInstrumentByTrackindex(trackIndex);

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

    public object outputMeter(ZstMethod methodData)
    {
        Dictionary<string, object> output = JsonConvert.DeserializeObject<Dictionary<string, object>>(methodData.output.ToString());
        float[] meterOutput = JsonConvert.DeserializeObject<float[]>(output["meter"].ToString());

        for (int i = 0; i < meterOutput.Length; i++)
        {
            //float dbVal = Mathf.Clamp(Utils.Remap(20.0f * Mathf.Log(output[i]), -60.0f, 6.0f, 0.0f, 1.0f), 0.0f, 1.0f);
            InstrumentController.Instance.GetInstrumentByTrackindex(i).meterVolume = meterOutput[i];
        }
        return null;
    }
}
