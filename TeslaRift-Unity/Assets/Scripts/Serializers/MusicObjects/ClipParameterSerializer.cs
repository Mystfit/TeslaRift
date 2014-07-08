using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using MusicIO;


public class ClipSerializer : JsonConverter
{
    public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
    {
        var musicRef = value as ClipParameter;

        writer.WriteStartObject();
        writer.WritePropertyName("trackindex");
        serializer.Serialize(writer, musicRef.owner.trackIndex);
        writer.WritePropertyName("clipindex");
        serializer.Serialize(writer, musicRef.scene);
        writer.WriteEndObject();
    }

    public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
    {
        JObject jsonObject = JObject.Load(reader);
        var properties = jsonObject.Properties().ToList();

        int trackIndex = Convert.ToInt32(properties.Find(x => x.Name == "trackindex").Value.ToString());
        int clipIndex = Convert.ToInt32(properties.Find(x => x.Name == "clipindex").Value.ToString());

        return InstrumentController.Instance.FindClip(trackIndex, clipIndex);
    }

    public override bool CanConvert(Type objectType)
    {
        return typeof(ClipParameter).IsAssignableFrom(objectType);
    }
}