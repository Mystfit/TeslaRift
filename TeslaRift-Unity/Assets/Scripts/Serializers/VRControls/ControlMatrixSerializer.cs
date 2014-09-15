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


public class ControlMatrixSerializer : BaseVRControlSerializer
{
    public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
    {



        ControlMatrix attach = value as ControlMatrix;

        writer.WriteStartObject();
        base.WriteJson(writer, value, serializer);

        writer.WritePropertyName("slots");
        writer.WriteStartArray();
        foreach (ClipCubeHolder holder in attach.GetCubeArray)
        {
            writer.WriteStartObject();
            writer.WritePropertyName("id");
            writer.WriteValue(holder.attach.id);
            writer.WritePropertyName("x");
            writer.WriteValue(holder.x);
            writer.WritePropertyName("y");
            writer.WriteValue(holder.y);
            writer.WritePropertyName("z");
            writer.WriteValue(holder.z);
            writer.WriteEndObject();
        }
        writer.WriteEndArray();
        writer.WriteEndObject();
    }

    public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
    {
        return base.ReadJson(reader, objectType, existingValue, serializer) as ValueTrigger;
    }

    public static void CreateFromJson(JObject jsonObject, ControlMatrix controlMatrix)
    {
        var musicRefs = jsonObject["slots"];
        controlMatrix.SetAsDock(true);
        controlMatrix.SetIsSaveable(true);

        foreach (JToken o in musicRefs)
        {
            string id = "";
            try
            {
                id = o["id"].Value<string>();
            }
            catch (ArgumentNullException e)
            {
                throw new Exception(e.ToString());
            }
            //var musicRef = BaseVRControlSerializer.FindExistingMusicRef(Type.GetType(musicRefType), o["musicRefProperties"]);
            var xIndex = o["x"].Value<int>();
            var yIndex = o["y"].Value<int>();
            var zIndex = o["z"].Value<int>();

            controlMatrix.StoreAnchorIndexes(id, xIndex, yIndex, zIndex);
        }


        //var musicRefs = jsonObject["savedValues"];
        //trigger.SetAsDock(true);
        //trigger.SetIsSaveable(true);

        //foreach (JToken o in musicRefs)
        //{
        //    var musicRefType = o["musicRefType"].Value<string>();
        //    var musicRef = BaseVRControlSerializer.FindExistingMusicRef(Type.GetType(musicRefType), o["musicRefProperties"]);
        //    var musicRefValue = o["value"].Value<float>();

        //    if (musicRef != null)
        //    {
        //        Slider slider = UIFactory.CreateMusicRefAttachment(typeof(Slider), musicRef) as Slider;
        //        musicRef.setVal(musicRefValue, true);
        //        slider.DockInto(trigger);
        //    }
        //}
    }

    public override bool CanConvert(Type objectType)
    {
        return typeof(ControlMatrix).IsAssignableFrom(objectType);
    }
}