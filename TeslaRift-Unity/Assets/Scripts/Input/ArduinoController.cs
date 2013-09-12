using UnityEngine;
using System.Collections;
using Uniduino;
 
public class ArduinoController : MonoBehaviour {
 
    private Arduino arduino;
     
    public enum GloveButton { 
		ONE = 0, 
		TWO
	}
	
	private enum ButtonState {ON = 0, OFF};
	private bool[] m_buttonState;
	
	private bool[] m_buttonStateDown;
	private bool[] m_buttonStateUp;
	private bool[] m_buttonStateLast;


	private int[] m_pins = {5,6,7};
     
    void Start( )
    {
        arduino = Arduino.global;
        arduino.Setup(ConfigurePins);
		
		m_buttonState = new bool[m_pins.Length];
		m_buttonStateLast = new bool[m_pins.Length];
		m_buttonStateDown = new bool[m_pins.Length];
		m_buttonStateUp = new bool[m_pins.Length];
    }
 
    void ConfigurePins( )
    {
		for(int i = 0; i < m_pins.Length; i++){
			arduino.pinMode(m_pins[i], PinMode.INPUT);
			arduino.digitalWrite(m_pins[i], Arduino.HIGH);
    		arduino.reportDigital((byte)(m_pins[i]/8), 1);
		}
    }
	
	void Update () 
	{       
		for(int i = 0; i < m_pins.Length; i++){
			//Invert the result due to pullup resistors inverting the button
			m_buttonState[i] = arduino.digitalRead(m_pins[i]) == 0 ? true : false;	
			
			//Set button deltas
			if(m_buttonStateLast[i] != m_buttonState[i]){
				if(m_buttonState[i])
					m_buttonStateDown[i] = true;
				else
					m_buttonStateUp[i] = true;
			} else {
				if(m_buttonState[i])
					m_buttonStateDown[i] = false;
				else
					m_buttonStateUp[i] = false;
			}
			
			m_buttonStateLast[i] = m_buttonState[i];
		}
	}
	
	public bool GetButton(GloveButton button){
		return m_buttonState[(int)button];
	}
	
	public bool GetButtonDown(GloveButton button){
		return m_buttonStateDown[(int)button];
	}
	
	public bool GetButtonUp(GloveButton button){
		return m_buttonStateUp[(int)button];
	}
}