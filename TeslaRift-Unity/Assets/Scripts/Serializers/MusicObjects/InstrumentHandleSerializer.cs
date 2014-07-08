using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using MusicIO;


public class InstrumentHandleSerializer : JsonConverter
{
    public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
    {
        var instrumentHandle = value as InstrumentHandle;

        writer.WriteStartObject();
        writer.WritePropertyName("trackindex");
        writer.WriteValue(instrumentHandle.trackIndex); 
        writer.WriteEndObject();
    }

    public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
    {
        JObject jsonObject = JObject.Load(reader);
        var properties = jsonObject.Properties().ToList();

        int trackIndex = Convert.ToInt32(properties.Find(x => x.Name == "trackindex").Value.ToString());

        return InstrumentController.Instance.GetInstrumentByTrackindex(trackIndex);
    }

    public override bool CanConvert(Type objectType)
    {
        return typeof(InstrumentHandle).IsAssignableFrom(objectType);
    }
}