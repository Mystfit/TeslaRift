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

public class oscControl : MonoBehaviour {
	
	public string targetIp = "127.0.0.1";
	public string targetPort = "2345";
	
	private Dictionary<string, ServerLog> servers;
	
	private SixenseInput.Controller m_leftHandController;
	private SixenseInput.Controller m_rightHandController;
	private GameObject m_leftHand;
	private GameObject m_rightHand;
	
	private GameObject m_leftCollisionTarget = null;
	private GameObject m_rightCollisionTarget = null;
	
	private bool m_isLeftGrabbingObject = false;
	private bool m_isRightGrabbingObject = false;
	
	private int m_noteTimer = 0;
	private bool m_isPlayingManualNote = false;
	
	// Script initialization
	void Start() {	
		OSCHandler.Instance.Init(); //init OSC
		OSCHandler.Instance.CreateClient("Live", System.Net.IPAddress.Parse(targetIp), int.Parse(targetPort));
		servers = new Dictionary<string, ServerLog>();
		
		m_leftHand = GameObject.Find("hand_left");
		m_rightHand = GameObject.Find("hand_right");
	}
	
	void CollidedWith(HandCollisionParams collisionParams){
		
		if(collisionParams.hand == SixenseHands.LEFT)
			m_leftCollisionTarget = collisionParams.target;
		else
			m_rightCollisionTarget = collisionParams.target;
		
		//Debug.Log(String.Format("{0} HIT HAND {1}", collisionParams.target, collisionParams.hand));
	}
	
	void UnCollidedWith(HandCollisionParams collisionParams){
		
		if(collisionParams.hand == SixenseHands.LEFT)
			m_leftCollisionTarget = null;
		else
			m_rightCollisionTarget = null;
		
		//Debug.Log(String.Format("{0} LEFT HAND {1}", collisionParams.target, collisionParams.hand));
	}
	
	void OnApplicationQuit() {
		
	}

	// NOTE: The received messages at each server are updated here
    // Hence, this update depends on your application architecture
    // How many frames per second or Update() calls per frame?
	void Update() {
		
		if(m_leftHandController == null)
			m_leftHandController = SixenseInput.GetController( SixenseHands.LEFT );
			
		if(m_rightHandController == null)
			m_rightHandController = SixenseInput.GetController( SixenseHands.RIGHT );
		
		HandleInput();
		
		//Update the note being sent
		OSCHandler.Instance.UpdateLogs();
		servers = OSCHandler.Instance.Servers;
		
	    foreach( KeyValuePair<string, ServerLog> item in servers )
		{
			// If we have received at least one packet,
			// show the last received from the log in the Debug console
			if(item.Value.log.Count > 0) 
			{
				int lastPacketIndex = item.Value.packets.Count - 1;
				
				UnityEngine.Debug.Log(String.Format("SERVER: {0} ADDRESS: {1} VALUE 0: {2}", 
				                                    item.Key, // Server name
				                                    item.Value.packets[lastPacketIndex].Address, // OSC address
				                                    item.Value.packets[lastPacketIndex].Data[0].ToString())); //First data value
			}
	    }
	}
	
	
	void HandleInput()
	{
		HandleGrabbing();
		HandleButtons();
	}
	
	
	void HandleButtons()
	{
		if(m_leftHandController != null){
			
			if(m_leftHandController.GetButton(SixenseButtons.BUMPER)){
				
				
			
				float[] testNote = {0.0f, 0.0f};
				
				float yDist = m_leftHandController.Position.y;
				float range = 400.0f;
				
				
				testNote[0] = (Math.Min( Math.Max(yDist, 0.0f), range)) / range;
								
				//Debug.Log(testNote[0]);

				testNote[1] = 0.8f;
				List<float> testNoteParams = new List<float>(testNote);
				OSCHandler.Instance.SendMessageToClient("Live", "/tesla/noteOn", 1);
				OSCHandler.Instance.SendMessageToClient("Live", "/tesla/noteparams", testNoteParams);
				OSCHandler.Instance.SendMessageToClient("Live", "/tesla/noteOn", 0);

			} else {
				if(m_isPlayingManualNote){
					OSCHandler.Instance.SendMessageToClient("Live", "/tesla/noteOn", 0);
					m_isPlayingManualNote = false;
				}
			}
		}
	}
	
	
	//Handle trigger events. At the moment this is limited to grabbing physics objects.
	//--------------------------------------------------
	void HandleGrabbing()
	{
		
		if(m_leftHandController != null){
			
			//Attach
			if(m_leftCollisionTarget && m_leftHandController.GetButton(SixenseButtons.TRIGGER)){
				m_leftCollisionTarget.GetComponent<EffectCube>().AddGrabber(m_leftHand);				
				m_isLeftGrabbingObject = true;
			}
		
			//Release
			if(!m_leftHandController.GetButton(SixenseButtons.TRIGGER) && m_isLeftGrabbingObject && m_leftCollisionTarget){
				m_leftCollisionTarget.GetComponent<EffectCube>().RemoveGrabber(m_leftHand);				
				m_isLeftGrabbingObject = false;
			}
		}
		
		if(m_rightHandController != null){
			//Attach 
			if(m_rightCollisionTarget && m_rightHandController.GetButton(SixenseButtons.TRIGGER)){
				m_rightCollisionTarget.GetComponent<EffectCube>().AddGrabber(m_rightHand);				
				m_isRightGrabbingObject = true;
			}
		
			//Release
			if(!m_rightHandController.GetButton(SixenseButtons.TRIGGER) && m_isRightGrabbingObject && m_rightCollisionTarget){
				m_rightCollisionTarget.GetComponent<EffectCube>().RemoveGrabber(m_rightHand);				
				m_isRightGrabbingObject = false;
			}
		}
	}
}