//
//	  UnityOSC - Example of usage for OSC receiver
//
//	  Copyright (c) 2012 Jorge Garcia Martin
//
// 	  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
// 	  documentation files (the "Software"), to deal in the Software without restriction, including without limitation
// 	  the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
// 	  and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// 
// 	  The above copyright notice and this permission notice shall be included in all copies or substantial portions 
// 	  of the Software.
//
// 	  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
// 	  TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// 	  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
// 	  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// 	  IN THE SOFTWARE.
//

using UnityEngine;
using System;
using System.Net;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityOSC;

public class OSCcontroller : MonoBehaviour {
	
	public string targetIp = "127.0.0.1";
	public string targetPort = "2345";
	public string loopbackPort = "3000";
	public string clientName = "Live";
	public string loopbackName = "loopback";
	public bool loopback = false;
	public bool isServer = true;
	
	private Dictionary<string, ServerLog> servers;
	private List<OSCListener> m_listeners;
	
	private long lastTimeStamp;
	
	private static OSCcontroller m_instance;
	
	public static OSCcontroller Instance { get { return m_instance; }}
		
	// Script initialization
	void Awake() {	
		m_instance = this;
		
		OSCHandler.Instance.Init(); //init OSCs
		
		if(isServer)
			OSCHandler.Instance.CreateClient(clientName, System.Net.IPAddress.Parse(targetIp), int.Parse(targetPort));
		else
			OSCHandler.Instance.CreateServer(clientName, int.Parse(targetPort));
		
		if(loopback){
			OSCHandler.Instance.CreateClient(loopbackName, System.Net.IPAddress.Parse("127.0.0.1"), int.Parse(loopbackPort));
			OSCHandler.Instance.CreateServer(loopbackName, int.Parse(loopbackPort));
		}
		
		m_listeners = new List<OSCListener>();
		servers = new Dictionary<string, ServerLog>();
	}
	
	
	/*
	 * Adds a listener for the server to watch for incoming messages
	 */
	public void AddListener(OSCListener listener){
		foreach( KeyValuePair<string, ServerLog> item in OSCHandler.Instance.Servers )
			item.Value.server.AddListener(listener);
	}
	
	
	// NOTE: The received messages at each server are updated here
    // Hence, this update depends on your application architecture
    // How many frames per second or Update() calls per frame?
	void Update() {
		//Update the note being sent
		OSCHandler.Instance.UpdateLogs();
		servers = OSCHandler.Instance.Servers;
		
	    foreach( KeyValuePair<string, ServerLog> item in servers )
		{
			// If we have received at least one packet,
			// show the last received from the log in the Debug console
			if(item.Value.log.Count > 0) 
			{
				/*
				UnityEngine.Debug.Log(String.Format("SERVER: {0} ADDRESS: {1} VALUE 0: {2}", 
				                                    item.Key, // Server name
				                                    item.Value.packets[lastPacketIndex].Address, // OSC address
				                                    item.Value.packets[lastPacketIndex].Data[0].ToString())); //First data value

				*/
			}
	    }
	}
}