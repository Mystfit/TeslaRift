using UnityEngine;
using System.Collections;
using Uniduino;
 
public class ArduinoController : MonoBehaviour {
 
    private Arduino arduino;
	
	public enum Finger{
		ONE = 0,
		TWO,
		THREE,
		FOUR
	}
     
	private enum ButtonState {ON = 0, OFF};
	
	private bool[] m_buttonState;
	private bool[] m_buttonStateDown;
	private bool[] m_buttonStateUp;
	private bool[] m_buttonStateLast;
	private BendSensor[] m_bendSensors;
	

	private int[] m_pins = {6,7};
	private int[] m_analogPins = {14,15,16,17};

     
    void Start( )
    {		
        arduino = Arduino.global;
        arduino.Setup(ConfigurePins);
		
		m_buttonState = new bool[m_analogPins.Length];
		m_buttonStateLast = new bool[m_analogPins.Length];
		m_buttonStateDown = new bool[m_analogPins.Length];
		m_buttonStateUp = new bool[m_analogPins.Length];
		m_bendSensors = new BendSensor[m_analogPins.Length];
    }
	
	void Update () 
	{       
		/*for(int i = 0; i < m_bendSensors.Length; i++){
			//Invert the result due to pullup resistors inverting the button
			//m_buttonState[i] = arduino.digitalRead(m_analogPins[i]) == 0 ? true : false;	
			
			BendSensor finger = m_bendSensors[i];
			finger.buttonState = GetAnalogToBool(m_analogPins[i]);
			
			//Set button deltas
			if(m_buttonStateLast[i] != m_buttonState[i]){
				if(m_buttonState[i])
					finger.down[i] = true;
				else
					m_buttonStateUp[i] = true;
			} else {
				if(m_buttonState[i])
					m_buttonStateDown[i] = false;
				else
					m_buttonStateUp[i] = false;
			}
			
			m_buttonStateLast[i] = m_buttonState[i];
		}*/
		
		for(int i = 0; i < m_bendSensors.Length; i++){
			//Invert the result due to pullup resistors inverting the button
			//m_buttonState[i] = arduino.digitalRead(m_analogPins[i]) == 0 ? true : false;	
			
			BendSensor finger = m_bendSensors[i];
			finger.analogVal = arduino.analogRead(m_analogPins[i]);
			
			//Set button deltas
			if(finger.last != finger.state){
				if(finger.state)
					finger.down = true;
				else
					finger.up = true;
			} else {
				if(finger.state)
					finger.down = false;
				else
					finger.up = false;
			}
			
			finger.last = finger.state;
		}
	}
	
	
	/*
	 * Set up pins
	 */
	protected void ConfigurePins( )
    {
		//Enables pullup digital pins
		/*
		for(int i = 0; i < m_pins.Length; i++){
			arduino.pinMode(m_pins[i], PinMode.INPUT);
			arduino.digitalWrite(m_pins[i], Arduino.HIGH);
    		arduino.reportDigital((byte)(m_pins[i]/8), 1);
		}
		*/
		for(int i = 0; i < m_analogPins.Length; i++){
			arduino.pinMode(m_analogPins[i], PinMode.ANALOG);
			arduino.reportAnalog((byte)(m_pins[i]/8), 1);
		}
    }
	
	
	/*
	 * Get max/min values of analog bend sensors
	 */
	public void CalibrateAnalalog(){
	
	}
	
	public bool GetButton(Finger button){
		return m_buttonState[(int)button];
	}
	
	public bool GetButtonDown(Finger button){
		return m_buttonStateDown[(int)button];
	}
	
	public bool GetButtonUp(Finger button){
		return m_buttonStateUp[(int)button];
	}
}

public class BendSensor {
	public int analogMax;
	public int analogMin;
	public int analogVal;
	public float scaledVal;
	public bool down;
	public bool up;
	public bool last;
	
	public BendSensor(){
	}
	
	public bool state{ 
		get {
			return true;
		}
	}
	
}