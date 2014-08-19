using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using VRControls;
using MusicIO;
using UI;
using UnityEngine;


public class ValueTriggerSerializer : BaseVRControlSerializer
{
    public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
    {
        ValueTrigger attach = value as ValueTrigger;

        writer.WriteStartObject();
        base.WriteJson(writer, value, serializer);

        writer.WritePropertyName("savedValues");
        writer.WriteStartArray();
        foreach (KeyValuePair<InstrumentParameter, float> param in attach.storedValues)
        {
            writer.WriteStartObject();
            writer.WritePropertyName("musicRefType");
            writer.WriteValue(param.Key.GetType().ToString());
            writer.WritePropertyName("musicRefProperties");
            serializer.Serialize(writer, param.Key);
            writer.WritePropertyName("value");
            serializer.Serialize(writer, param.Value);
            writer.WriteEndObject();
        }
        writer.WriteEndArray();        
        writer.WriteEndObject();
    }

    public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
    {
        return base.ReadJson(reader, objectType, existingValue, serializer) as ValueTrigger;
    }

    public static void CreateFromJson(JObject jsonObject, ValueTrigger trigger)
    {
        //var savedValueObjects = JsonConvert.DeserializeObject<List<object>>(savedValueArray);

        var musicRefs = jsonObject["savedValues"];
        trigger.SetAsDock(true);
		trigger.SetIsSaveable(true);

        foreach (JToken o in musicRefs)
        {
            var musicRefType = o["musicRefType"].Value<string>();
            var musicRef = BaseVRControlSerializer.FindExistingMusicRef(Type.GetType(musicRefType), o["musicRefProperties"]);
            var musicRefValue = o["value"].Value<float>();

			if(musicRef != null){
            	Slider slider = UIFactory.CreateMusicRefAttachment(typeof(Slider), musicRef) as Slider;
            	musicRef.setVal(musicRefValue, true);
				slider.DockInto(trigger);
			}
		}
	}

    public override bool CanConvert(Type objectType)
    {
        return typeof(ValueTrigger).IsAssignableFrom(objectType);
    }
}