using UnityEngine;
using System.Collections;

public class WebcamView : MonoBehaviour {
    
    private WebCamTexture m_camTexture;
    public int deviceIndex;

    // Use this for initialization
    void Start () {
        //foreach(WebCamDevice device in WebCamTexture.devices)
            //Debug.Log(device.name);
    
        m_camTexture = new WebCamTexture(WebCamTexture.devices[deviceIndex].name, 640, 480, 30);
        renderer.material.SetTexture("_MainTex", m_camTexture);
        m_camTexture.Play();
    }
    
    // Update is called once per frame
    void Update () {
    }
}
