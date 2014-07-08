using System;
using System.Collections.Generic;
using System.Collections;
using System.IO;
using System.Linq;
using System.Text;
using UnityEngine;
using VRControls;
using Newtonsoft.Json;


public class ControlLayout
{
    public string name;
    protected string m_path;

    protected List<BaseVRControl> m_loadedControls;

    public ControlLayout(string jsonPath)
    {
        m_path = jsonPath;
        m_loadedControls = new List<BaseVRControl>();
    }

    public void WriteLayout(BaseVRControl rootHierarchyControl)
    {
        StreamWriter writer = new StreamWriter(m_path);
        writer.WriteLine(rootHierarchyControl.BuildJsonHierarchy());
        writer.Close();
    }

    public void ReadLayout() {
        StreamReader reader = new StreamReader(m_path);
        string json = reader.ReadToEnd();
        reader.Close();

        List<BaseVRControl> m_loadedControls = JsonConvert.DeserializeObject<List<BaseVRControl>>(json, new ControlHierarchySerializer());
    	
		Dictionary<string, BaseVRControl> keyedHierarchy = new Dictionary<string, BaseVRControl>();
		foreach(BaseVRControl attach in m_loadedControls){
			keyedHierarchy[attach.id] = attach;
		}
		
		foreach(KeyValuePair<string, BaseVRControl> pair in keyedHierarchy){
			if(pair.Value.jsonParentId == VRControls.StaticIds.EDITOR_DOCK){
				//Dock into static editordock
			}
			if(pair.Value.jsonParentId == VRControls.StaticIds.INSTRUMENT_DOCK){
                //Dock into static instrumentdock
			}
			
			if( keyedHierarchy.ContainsKey(pair.Value.jsonParentId) ){
				pair.Value.DockInto(keyedHierarchy[pair.Value.jsonParentId]);
			}
		}
	}
}

