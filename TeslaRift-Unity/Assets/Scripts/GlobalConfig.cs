using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using DotNumerics.LinearAlgebra;

public class GlobalConfig : MonoBehaviour {
    
    public bool IsClient = false;
    public bool ShowtimeEnabled = true;
    public string ProjectSourceName;

    public static GlobalConfig m_instance;

    // Use this for initialization
    void Awake () {
        m_instance = this;
    }

    public static GlobalConfig Instance{ get { return m_instance; }}
    
    // Update is called once per frame
    void Update () {
        if(Input.GetKeyDown(KeyCode.Escape))
            Application.Quit();
        
        if(Input.GetKeyDown(KeyCode.R)){
            Application.LoadLevel(Application.loadedLevel);
        }
    }
}
