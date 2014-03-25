using UnityEngine;
using System.Collections;
using System.Net;
using System.Xml;


public class SessionSyncer : MonoBehaviour {

	public int m_liveServerPort = 2350;
	public string m_liveServerUrl;

	protected WebClient m_sessionClient;
	protected InstrumentFactory m_insFactory;
	protected bool bDownloadComplete;
	protected string m_syncedSessionString;
	
	void Awake () {
		//Create web client
		m_insFactory = GetComponent<InstrumentFactory>();
		m_sessionClient = new WebClient();

		//If we don't set a URL in the component, grab the OSCclient URL.
		string url = "http://";
		if(m_liveServerUrl == ""){
			url += OSCcontroller.Instance.targetIp + ":" + m_liveServerPort;
		} else {
			url += m_liveServerUrl + ":" + m_liveServerPort;
		}

		//Set download callback
		m_sessionClient.DownloadStringCompleted += (sender, e) => 
		{
			if(e.Error != null){
				Debug.Log(e.Error);
			}
			bDownloadComplete = true;
			m_syncedSessionString = e.Result;
		};

		System.Uri uri = new System.Uri(url);
		m_sessionClient.DownloadStringAsync(uri);
	}

	
	void Update () {
		if(bDownloadComplete){
			bDownloadComplete = false;
			m_insFactory.LoadLiveSessionXml(m_syncedSessionString);
			m_sessionClient.Dispose();
		}
	}
}
