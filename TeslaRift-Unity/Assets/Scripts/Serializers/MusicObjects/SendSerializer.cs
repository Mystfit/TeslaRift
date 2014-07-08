using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using MusicIO;


public class SendSerializer : JsonConverter
{
    public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
    {
        var musicRef = value as SendParameter;

        writer.WriteStartObject();
        writer.WritePropertyName("trackindex");
        serializer.Serialize(writer, musicRef.owner.trackIndex);
        writer.WritePropertyName("sendindex");
        serializer.Serialize(writer, musicRef.sendIndex);
        writer.WriteEndObject();
    }

    public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
    {
        JObject jsonObject = JObject.Load(reader);
        var properties = jsonObject.Properties().ToList();

        int trackIndex = Convert.ToInt32(properties.Find(x => x.Name == "trackindex").Value.ToString());
        int sendIndex = Convert.ToInt32(properties.Find(x => x.Name == "sendindex").Value.ToString());

        return InstrumentController.Instance.FindSendParameter(trackIndex, sendIndex);
    }

    public override bool CanConvert(Type objectType)
    {
        return typeof(SendSerializer).IsAssignableFrom(objectType);
    }
}