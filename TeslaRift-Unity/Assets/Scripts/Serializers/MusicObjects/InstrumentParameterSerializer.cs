using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using MusicIO;


public class InstrumentParameterSerializer : JsonConverter
{
    public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
    {
        var musicRef = value as InstrumentParameter;
        writer.WriteNull();
        //writer.WriteStartObject();
        //writer.WritePropertyName("name");
        //writer.WriteValue(musicRef.name);
        //writer.WriteEndObject();
    }

    public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
    {
        JObject jsonObject = JObject.Load(reader);
        string name = jsonObject.SelectToken("name").Value<string>(); 
        return new InstrumentParameter(name);
    }

    public override bool CanConvert(Type objectType)
    {
        return typeof(InstrumentParameter).IsAssignableFrom(objectType);
    }
}