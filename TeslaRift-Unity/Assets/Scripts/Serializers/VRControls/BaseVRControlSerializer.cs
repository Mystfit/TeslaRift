using System.Collections.Generic;
using System.Collections;
using System;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using VRControls;
using MusicIO;
using UI;
using UnityEngine;


public class BaseVRControlSerializer : JsonConverter
{
    public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
    {
        var attach = value as BaseVRControl;
        string pos = JsonConvert.SerializeObject(attach.transform.position, new Formatting(), new Vector3Serializer());
        string rot = JsonConvert.SerializeObject(attach.transform.rotation, new Formatting(), new QuaternionSerializer());

        //If we're being overriden by another VRControl, don't write start/end for the object
        bool writeEnd = false;
        if (writer.WriteState != WriteState.Object)
        {
            writer.WriteStartObject();
            writeEnd = true;
        }
		writer.WritePropertyName("id");
		writer.WriteValue(attach.id);
        writer.WritePropertyName("worldPos");
        serializer.Serialize(writer, pos);
        writer.WritePropertyName("worldRot");
        serializer.Serialize(writer, rot);
        writer.WritePropertyName("controlType");
        serializer.Serialize(writer, attach.GetType().ToString());
        writer.WritePropertyName("musicRefType");
        if (attach.musicRef != null)
        {
            serializer.Serialize(writer, attach.musicRef.GetType().ToString());
            writer.WritePropertyName("musicRefProperties");
            serializer.Serialize(writer, attach.musicRef);
        } else if(attach is InstrumentOrb){
            serializer.Serialize(writer, typeof(InstrumentHandle).ToString());
            writer.WritePropertyName("musicRefProperties");
            serializer.Serialize(writer, ((InstrumentOrb)attach).instrumentRef);
        }
        else
        {
            writer.WriteNull();
        }

        writer.WritePropertyName("dockedInto");
        if (attach.DockedInto != null)
            writer.WriteValue(attach.DockedInto.id);
        else
            writer.WriteNull();

		if(writeEnd)
			writer.WriteEndObject();
    }

    public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
    {   
        JObject jsonObject = JObject.Load(reader);
        var controlType = jsonObject["controlType"].Value<string>();
        var musicRefType = jsonObject["musicRefType"].Value<string>();
        var musicRefProperties = jsonObject.Value<JObject>("musicRefProperties");
		
        BaseVRControl attach = null;

        if (musicRefType != null && musicRefProperties != null && musicRefType != typeof(InstrumentParameter).ToString())
        {
			/* 
             * We don't need to convert base InstrumentParameters, it's probably a special case 
			 * handled by control objects that own a parameter for tracking their internal values.
			 * (think like the valuetrigger and rbfplug cases)
			 */
            if (musicRefType == "MusicIO.InstrumentHandle")
            {
                int trackindex = musicRefProperties.Property("trackindex").ToObject<int>();
				InstrumentHandle instrumentHandle = InstrumentController.Instance.GetInstrumentByTrackindex(trackindex);
                if(instrumentHandle != null)
                    attach = UIFactory.CreateInstrumentRefAttachment(instrumentHandle);
            }
            else
            {
                InstrumentParameter param = FindExistingMusicRef(Type.GetType(musicRefType), musicRefProperties);
                if (param != null)
                    attach = UIFactory.CreateMusicRefAttachment(Type.GetType(controlType), param);
                else
                    attach = UIFactory.CreateMusicRefAttachment(Type.GetType(controlType));
            }
        }
        else
        {
            attach = UIFactory.CreateMusicRefAttachment(Type.GetType(controlType));
        }	

        if (attach != null)
        {
            Vector3 position = JsonConvert.DeserializeObject<Vector3>(jsonObject["worldPos"].Value<string>());
            Quaternion rotation = JsonConvert.DeserializeObject<Quaternion>(jsonObject["worldRot"].Value<string>());
            attach.transform.position = position;
            attach.transform.rotation = rotation;
            attach.jsonPosition = position;
            attach.jsonRotation = rotation;

            //Switch for incoming object types
            if (controlType == typeof(ValueTrigger).ToString())
            {
                ValueTriggerSerializer.CreateFromJson(jsonObject, (ValueTrigger)attach);
            }
            else if (controlType == typeof(ControlMatrix).ToString())
            {
                ControlMatrixSerializer.CreateFromJson(jsonObject, (ControlMatrix)attach);
            }

            attach.SetId(jsonObject["id"].Value<string>());
            attach.jsonParentId = jsonObject["dockedInto"].Value<string>();
        }



        return attach;
    }


    public static InstrumentParameter FindExistingMusicRef(Type musicRefType, JToken musicRefProperties)
    {
        InstrumentParameter param = null;

        if (musicRefType == typeof(ClipParameter))
            param = InstrumentController.Instance.FindClip(musicRefProperties["trackindex"].Value<int>(), musicRefProperties["clipindex"].Value<int>());
        else if (musicRefType == typeof(SendParameter))
            param = InstrumentController.Instance.FindSendParameter(musicRefProperties["trackindex"].Value<int>(), musicRefProperties["sendindex"].Value<int>());
        else if (musicRefType == typeof(DeviceParameter))
            param = InstrumentController.Instance.FindParameter(musicRefProperties["trackindex"].Value<int>(), musicRefProperties["deviceindex"].Value<int>(), musicRefProperties["parameterindex"].Value<int>(), musicRefProperties["category"].Value<int>());
        else if (musicRefType == typeof(NoteParameter)){
			var temp = musicRefProperties["trackindex"].Value<int>();
			param = InstrumentController.Instance.GetInstrumentByTrackindex(temp).noteChannel;
		}
        return param;
    }


    public override bool CanConvert(Type objectType)
    {
        return typeof(BaseVRControl).IsAssignableFrom(objectType);
    }
}