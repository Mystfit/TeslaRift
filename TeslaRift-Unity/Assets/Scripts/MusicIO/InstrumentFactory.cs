using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Xml;
using System;
using MusicIO;
using UI;
using ZST;
using VRControls;
using System.IO;
using Newtonsoft.Json;

public class InstrumentFactory : MonoBehaviour {

    public static InstrumentFactory Instance{ get { return m_instance; }}
    private static InstrumentFactory m_instance;
    
    public string[] m_instrumentFilter;
    public GameObject instrumentPrefab = null;
    public GameObject paramPanelPrefab;
    public float m_radialInnerRadius = 0.05f;   
    public float m_radialOuterRadius = 0.5f;
    public float m_panelOrbitDistance = 0.2f;

    public Picker m_instrumentHolder;
    public Picker m_returnHolder;

    void Start () {
        m_instance = this;
    }

    /*
     * Creates instruments from Live's song info
     */
    public void LoadLiveSessionJson(string jsonString){
        Debug.Log (jsonString);

        Dictionary<string, object> song = JsonConvert.DeserializeObject<Dictionary<string, object>>(jsonString);

        object[] tracks = JsonConvert.DeserializeObject<object[]>(song["tracks"].ToString());
        foreach (object trackStr in tracks)
        {
            Dictionary<string, object> track = JsonConvert.DeserializeObject<Dictionary<string, object>>(trackStr.ToString());
            object[] devices = JsonConvert.DeserializeObject<object[]>(track["devices"].ToString());

            foreach(object deviceStr in devices){
                Dictionary<string, object> device = JsonConvert.DeserializeObject<Dictionary<string, object>>(deviceStr.ToString());
                object[] parameters = JsonConvert.DeserializeObject<object[]>(device["parameters"].ToString());

                foreach (object parameterStr in parameters)
                {
                    Dictionary<string, object> parameter = JsonConvert.DeserializeObject<Dictionary<string, object>>(parameterStr.ToString());
                    Debug.Log(parameter);
                }
            }
        }
    }
    
    
    /*
     * Creates instruments from Live's dumped session xml
     */
    public void LoadLiveSessionXml(ZstPeerLink peer){

        ZstMethod response = MusicNode.Instance.node.updateRemoteMethod(peer.methods["get_song_layout"]);
        string xmlString = "";
        try
        {
            xmlString = response.output.ToString();
        }
        catch (NullReferenceException e)
        {
            Debug.LogWarning("No response from Live. Check if it's running.");
            return;
        }

        XmlDocument sessionXml = new XmlDocument ();

        if(xmlString != null){
            sessionXml.LoadXml(xmlString);
        }
        else
        {
            Debug.LogWarning("No song layout in string");
            return;
        }


        //Get track, return, master information
        XmlNodeList trackList = sessionXml.GetElementsByTagName("track"); //instrument array    
        XmlNodeList returnList = sessionXml.GetElementsByTagName("trackReturn"); //instrument array 
        
        foreach(XmlNode track in trackList){
            
            InstrumentOrb instrument = CreateInstrumentFromXmlList(track, peer);
            if (instrument != null)
            {
                instrument.DockInto(m_instrumentHolder);
                InstrumentController.Instance.AddInstrument(instrument.instrumentRef);
            }
        }

        foreach (XmlNode returnTrack in returnList)
        {
            InstrumentOrb returnInstrument = CreateInstrumentFromXmlList(returnTrack, peer);
            if (returnInstrument != null)
            {
                InstrumentController.Instance.AddReturn(returnInstrument.instrumentRef);
                returnInstrument.DockInto(m_returnHolder);
            }
        }
    }
    
    
    /*
     * Creates instruments from xml lists
     */
    private InstrumentOrb CreateInstrumentFromXmlList(XmlNode track, ZstPeerLink peer)
    {
        //Get track definition
        Color color = Utils.intToColor( int.Parse(track.Attributes["color"].Value) );
        int trackIndex = -1;
        bool isReturn = false;

        if(track.Attributes["index"] != null){
            trackIndex = int.Parse(track.Attributes["index"].Value);
            isReturn = false;
        } else if(track.Attributes["returnTrackIndex"] != null){
            trackIndex = int.Parse(track.Attributes["returnTrackIndex"].Value);
            isReturn = true;
        } else {
            return null;
        }

        bool isMidi = false;

        if(!isReturn)
            isMidi = bool.Parse(track.Attributes["midi"].Value);
        
        InstrumentHandle instrumentDef = new InstrumentHandle(peer, track.Attributes["name"].Value, color, trackIndex, isMidi, isReturn);

        //Get devices present in track
        XmlNodeList deviceList = track.SelectNodes("device"); //device array    
        foreach(XmlNode device in deviceList){
            //Get params in device
            XmlNodeList paramList = device.SelectNodes("parameter"); //parameter array  
            int deviceIndex = int.Parse(device.Attributes["index"].Value);
                    
            foreach(XmlNode parameter in paramList){
                string name = parameter.Attributes["name"].Value as String;
                name = name.Replace("/", "-");
                name = name.Replace(" ", "_");
                string deviceName = device.Attributes["name"].Value as String;
                deviceName = deviceName.Replace("/", "-");
                deviceName = deviceName.Replace(" ", "_");
                int parameterIndex =int.Parse(parameter.Attributes["index"].Value);

                float min = Convert.ToSingle(parameter.Attributes["min"].Value);
                float max = Convert.ToSingle(parameter.Attributes["max"].Value);
                instrumentDef.AddParam(name, min, max, deviceName, deviceIndex, parameterIndex);
            }
                
        }
            
        //Get clips in track
        XmlNodeList clipList = track.SelectNodes("clip");
        foreach(XmlNode clip in clipList){
            string name = clip.Attributes["name"].Value as String;
            int index = int.Parse( clip.Attributes["index"].Value );
            instrumentDef.AddClip(name, true, index);
        }
            
        //Get sends in track
        XmlNodeList sendsList = track.SelectNodes("sends");
        foreach(XmlNode send in sendsList){
            string name = send.Attributes["name"].Value as String;
            int sendIndex = int.Parse( send.Attributes["index"].Value );
            name = name.Replace("/", "-");
            name = name.Replace(" ", "_");
            instrumentDef.AddSend(name, sendIndex);
        }

        InstrumentOrb instrument = UIFactory.CreateInstrumentRefAttachment(instrumentDef) as InstrumentOrb;
        instrument.SetAsTemplate(true);

        return instrument;
    }


    public void CreateKaossMidi(ZST.ZstPeerLink kaossNode, Color color)
    {
        InstrumentHandle kaossInstrumentHandle = new InstrumentHandle(
            kaossNode, kaossNode.name, color, -1, false, false);
        kaossInstrumentHandle.AddParam(new KaossParameter("touch_x", kaossInstrumentHandle, "x", 0, 127));
        kaossInstrumentHandle.AddParam(new KaossParameter("touch_y", kaossInstrumentHandle, "y", 0, 127));
        kaossInstrumentHandle.AddParam(new KaossParameter("touch_trigger", kaossInstrumentHandle, "trigger", 0, 1));
        kaossInstrumentHandle.AddParam(new KaossParameter("gate_hold", kaossInstrumentHandle, "value", 0, 1));
        kaossInstrumentHandle.AddParam(new KaossParameter("fader", kaossInstrumentHandle, "value", 0, 127));

        InstrumentOrb kaossInstrument = UIFactory.CreateInstrumentRefAttachment(kaossInstrumentHandle) as InstrumentOrb;
        kaossInstrument.DockInto(m_returnHolder);
    }
}
