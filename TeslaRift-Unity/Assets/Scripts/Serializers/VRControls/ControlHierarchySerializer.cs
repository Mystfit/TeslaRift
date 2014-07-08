using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using VRControls;


public class ControlHierarchySerializer : JsonConverter
{
    public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
    {
        List<BaseVRControl> controlHierarchy = value as List<BaseVRControl>;

        writer.WriteStartArray();
        foreach(BaseVRControl attach in controlHierarchy){
			serializer.Serialize(writer, attach);
        }
        writer.WriteEndArray();
    }

    public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
    {
		var jsonObjects = JArray.Load(reader);
		List<BaseVRControl> controls = new List<BaseVRControl>();
      
        foreach (JObject o in jsonObjects)
			controls.Add(JsonConvert.DeserializeObject<BaseVRControl>(o.ToString(), new BaseVRControlSerializer()));

		return controls;
    }

    public override bool CanConvert(Type objectType)
    {
        return typeof(List<BaseVRControl>).IsAssignableFrom(objectType);
    }

}

