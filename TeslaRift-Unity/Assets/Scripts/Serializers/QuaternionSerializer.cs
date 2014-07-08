using UnityEngine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using VRControls;


public class QuaternionSerializer : JsonConverter
{
    public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
    {
        var q = (Quaternion)value;
        writer.WriteStartObject();
        writer.WritePropertyName("x");
        serializer.Serialize(writer, q.x);
        writer.WritePropertyName("y");
        serializer.Serialize(writer, q.y);
        writer.WritePropertyName("z");
        serializer.Serialize(writer, q.z);
        writer.WritePropertyName("w");
        serializer.Serialize(writer, q.w);
        writer.WriteEndObject();
    }

    public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
    {
        var quaternion = new Quaternion();
        serializer.Populate(reader, quaternion);
        return quaternion;
    }

    public override bool CanConvert(Type objectType)
    {
        return typeof(Quaternion).IsAssignableFrom(objectType);
    }
}