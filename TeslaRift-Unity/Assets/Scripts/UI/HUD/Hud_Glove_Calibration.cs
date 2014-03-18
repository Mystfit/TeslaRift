using UnityEngine;
using System.Collections;

public class Hud_Glove_Calibration : MonoBehaviour {

	protected TextMesh m_text;

	// Use this for initialization
	void Start () {
		m_text = GetComponent<TextMesh>();
	}
	
	// Update is called once per frame
	void Update () {
	}	

	public void SetCalibrationReady(float time){
		m_text.text = "GLOVES CALIBRATING IN " + time.ToString();
	}

	public void SetCalibrationTime(float time){
		m_text.text = "GLOVES CALIBRATING... " + time.ToString();
	}

	public void Finished(){
		m_text.text = "GLOVES CALIBRATION COMPLETE";
		iTween.FadeTo(this.gameObject, iTween.Hash("alpha", 0, "time", 2.0f, "oncomplete", ""));
	}

	public void Hide(){
		this.gameObject.SetActive(false);
	}
}
