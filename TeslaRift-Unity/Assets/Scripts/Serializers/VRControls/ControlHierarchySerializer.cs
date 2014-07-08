using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
using Newtonsoft.Json;
using VRControls;


public class ControlHierarchySerializer : JsonConverter
{
    public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
    {
        List<BaseVRControl> controlHierarchy = value as List<BaseVRControl>;

        writer.WriteStartArray();
        foreach(BaseVRControl attach in controlHierarchy){
            writer.WriteStartObject();
            writer.WritePropertyName("id");
            writer.WriteValue(attach.id);
            writer.WritePropertyName("control");
            serializer.Serialize(writer, attach);
            writer.WriteEndObject();
        }
        writer.WriteEndArray();
    }

    public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
    {
        return null;
    }

    public override bool CanConvert(Type objectType)
    {
        return typeof(List<BaseVRControl>).IsAssignableFrom(objectType);
    }

}

