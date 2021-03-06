﻿using UnityEngine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using VRControls;


public class Vector3Serializer : JsonConverter
{
    public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
    {
        var vector = (Vector3)value;
        writer.WriteStartObject();
        writer.WritePropertyName("x");
        writer.WriteValue(vector.x);
        writer.WritePropertyName("y");
        writer.WriteValue(vector.y);
        writer.WritePropertyName("z");
        writer.WriteValue(vector.z);
        writer.WriteEndObject();
    }

    public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
    {
        var vector = new Vector3();
        serializer.Populate(reader, vector);
        return vector;
    }

    public override bool CanConvert(Type objectType)
    {
        return typeof(Vector3).IsAssignableFrom(objectType);
    }
}