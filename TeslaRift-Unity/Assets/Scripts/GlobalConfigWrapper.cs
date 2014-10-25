using UnityEngine;
using System.IO;
using VRControls;
using Newtonsoft.Json;
using System.Collections;
using System.Collections.Generic;
using DotNumerics.LinearAlgebra;

[JsonObject(MemberSerialization.OptIn)]

public class GlobalConfigWrapper : MonoBehaviour
{
    public string m_configFile = "config.json";
    public bool m_useConfigFile = true;
    public bool m_buildConfigTemplate = false;
    
    private GlobalConfig m_config;

    void Awake()
    {
        m_config = new GlobalConfig();
        if (m_useConfigFile)
            m_config.LoadConfig(m_configFile);        
    }

    void Update()
    {
        if (m_buildConfigTemplate)
        {
            m_buildConfigTemplate = false;
            m_config.WriteConfig(m_configFile);
        }
    }
}

public class GlobalConfig  {

    //Active cameras
    [JsonProperty]
    public bool UseRiftCamera;
    [JsonProperty]
    public bool UseKinectCamera;
    [JsonProperty]
    public bool UseWebcam;
    
    //Kinect tracking
    [JsonProperty]
    public float KinectHeight;
    [JsonProperty]
    public float KinectFOV;
    [JsonProperty]
    public float KinectXFromCenter;
    [JsonProperty]
    public float KinectZFromCenter;
    [JsonProperty]
    public bool CameraRotatesUsingShoulders;
    [JsonProperty]
    public bool CameraFacesCenter;

    //Remote camera
    [JsonProperty]
    public float RemoteCameraFOV;
    [JsonProperty]
    public float RemoteCameraX;
    [JsonProperty]
    public float RemoteCameraY;
    [JsonProperty]
    public float RemoteCameraZ;
    [JsonProperty]
    public float RemoteCameraPitch;
    [JsonProperty]
    public float RemoteCameraYaw;

    //Rendering
    [JsonProperty]
    public bool Fullscreen;
    [JsonProperty]
    public int NumScreens;
    [JsonProperty]
    public float ScreenWidthMeters;
    [JsonProperty]
    public float ScreenHeightMeters;
    [JsonProperty]
    public float ScreenHeightFromGround;
    [JsonProperty]
    public float ScreenAngle;
    [JsonProperty]
    public int ScreenRenderWidth;
    [JsonProperty]
    public int ScreenRenderHeight;
    public int ProjectionWidth { get { return ScreenRenderWidth * NumScreens; } }
    public int ProjectionHeight { get { return ScreenRenderHeight; } }
    public float Aspect { get { return (float)ScreenRenderWidth / (float)ScreenRenderHeight; } }
    
    //Showtime
    [JsonProperty]
    public string ShowtimeStageAddress;
    [JsonProperty]
    public int ShowtimeStagePort;
    [JsonProperty]
    public string InputSource = "";
    [JsonProperty]
    public bool UseRemoteInput;
    
    //Glove Input
    [JsonProperty]
    public string LeftComPort;
    [JsonProperty]
    public string RightComPort;

    //Misc
    [JsonProperty]
    public bool DebugCollisions;
    [JsonProperty]
    public bool EnableAnimations;
    [JsonProperty]
    public bool ShowTestRoom;

    public static GlobalConfig m_instance;
    public static GlobalConfig Instance{ get { return m_instance; }}

    public GlobalConfig()
    {
        if (m_instance == null)
            m_instance = this;
    }
    
    public void WriteConfig(string path)
    {
        StreamWriter writer = new StreamWriter(path);
        writer.WriteLine(JsonConvert.SerializeObject(this, Formatting.Indented));
        writer.Close();
    }

    public void LoadConfig(string path)
    {
        StreamReader reader = new StreamReader(path);
        string configStr = reader.ReadToEnd();
        GlobalConfig tempConfig = JsonConvert.DeserializeObject<GlobalConfig>(configStr);
        m_instance = tempConfig;
        reader.Close();
    }
}
