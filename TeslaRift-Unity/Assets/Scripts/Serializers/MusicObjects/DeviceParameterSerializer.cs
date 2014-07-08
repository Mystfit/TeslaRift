using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using VRControls;
using UI;
using UnityEngine;
using MusicIO;


public class DeviceParameterSerializer : JsonConverter
{
    public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
    {
        var musicRef = value as DeviceParameter;

        writer.WriteStartObject();
        writer.WritePropertyName("trackindex");
        serializer.Serialize(writer, musicRef.owner.trackIndex);
        writer.WritePropertyName("deviceindex");
        serializer.Serialize(writer, musicRef.deviceIndex);
        writer.WritePropertyName("parameterindex");
        serializer.Serialize(writer, musicRef.parameterIndex);
        writer.WritePropertyName("category");
        serializer.Serialize(writer, musicRef.category);
        writer.WriteEndObject();
    }

    public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
    {
        JObject jsonObject = JObject.Load(reader);
        var properties = jsonObject.Properties().ToList();

        int trackIndex = Convert.ToInt32(properties.Find(x => x.Name == "trackindex").Value.ToString() );
        int deviceIndex = Convert.ToInt32(properties.Find(x => x.Name == "deviceindex").Value.ToString() );
        int parameterIndex = Convert.ToInt32(properties.Find(x => x.Name == "parameterindex").Value.ToString() );
        int category = Convert.ToInt32( properties.Find(x => x.Name == "category").Value.ToString() );

        return InstrumentController.Instance.FindParameter(trackIndex, deviceIndex, parameterIndex, category);
    }

    public override bool CanConvert(Type objectType)
    {
        return typeof(DeviceParameter).IsAssignableFrom(objectType);
    }
}