using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class BufferFrame : MonoBehaviour {
	
	/*
	 * Frame objects
	 */
	protected ParameterType m_paramType;
	protected List<GameObject> m_frameComponents;
	protected Object m_guiQuadPrefab;
	
	/*
	 * Externally set dimensions
	 */
	public float m_frameThickness = 0.01f;
	public float m_easeTime = 0.5f;
	public float m_braceLength = 0.01f;
	public float m_frameHeight = 1.0f;
	public float m_frameWidth = 1.0f;
	
	/*
	 * Debug toggles
	 */
	public bool m_toggleUpdate = false;
	public bool m_toggleHorizontal = false;
	public bool m_toggleVertical = false;
	
	/*
	 * Active dimensions
	 */
	private float m_currentWidth;
	private float m_currentHeight;
	private float m_lastWidth;
	private float m_lastHeight;
	private bool bRotated = false;
	
	
	void Awake () {
		m_frameComponents = new List<GameObject>();
		
		//Get the panel group and add to the list
		Transform panels = transform;
		for(int i = 0; i < transform.childCount; i++){
			if(transform.GetChild(i).gameObject.name == "Panels")
				panels = transform.GetChild(i);
		}
				
		for(int i = 0; i < panels.childCount; i++)
			m_frameComponents.Add(panels.GetChild(i).gameObject);
		
		m_lastWidth = m_frameWidth;
		m_lastHeight = m_frameHeight;
				
		UpdatePanel();
	}
	
	
	void Update () {
		//Toggles to test frame animations
		if(m_toggleUpdate){
			m_toggleUpdate = false;
			AnimateSize(m_frameWidth, m_frameHeight);
		}
		
		if(m_toggleVertical){
			m_toggleVertical = false;
			RotateToVertical();
		}
		
		if(m_toggleHorizontal){
			m_toggleHorizontal = false;
			RotateToHorizontal();
		}
	}
	
	
	/*
	 * Updates a quad panel transform by x/y/width/height
	 */
	protected void UpdateQuadTransform(GameObject quad, float x, float y, float width, float height, bool mirrored){
		if(mirrored){
			quad.transform.localRotation = Quaternion.Euler( new Vector3(0.0f, 0.0f, 180.0f) );
			quad.transform.localPosition = new Vector3(x, y, 0.0f);
			quad.transform.localScale = new Vector3(width, height, 0.0f);
		} else {
			quad.transform.localRotation = Quaternion.Euler( new Vector3(0.0f, 0.0f, 0.0f) );
			quad.transform.localPosition = new Vector3(x - m_frameThickness, y - height, 0.0f);
			quad.transform.localScale = new Vector3(width, height, 0.0f);
		}
	}
	
	
	/*
	 * Updates the whole quad frame
	 */
	protected void UpdatePanel(){
		UpdateQuadTransform(m_frameComponents[0], -m_currentWidth*0.5f,  m_currentHeight*0.5f,  m_braceLength,    m_frameThickness, false);					//Top brace
		UpdateQuadTransform(m_frameComponents[1], -m_currentWidth*0.5f,  m_currentHeight*0.5f,  m_frameThickness, m_currentHeight,  false);					//Side
		UpdateQuadTransform(m_frameComponents[2], -m_currentWidth*0.5f, -m_currentHeight*0.5f,  m_braceLength, 	 m_frameThickness, false);		//Bottom brace
		UpdateQuadTransform(m_frameComponents[3], m_currentWidth*0.5f,   m_currentHeight*0.5f,  m_braceLength, 	 m_frameThickness, true);			//Top brace mirrored
		UpdateQuadTransform(m_frameComponents[4], m_currentWidth*0.5f,   m_currentHeight*0.5f,  m_frameThickness, m_currentHeight,  true);			//Side mirrored
		UpdateQuadTransform(m_frameComponents[5], m_currentWidth*0.5f,  -m_currentHeight*0.5f,  m_braceLength, 	 m_frameThickness, true);	//Bottom brace mirrored
	}
	
	
	/*
	 * Rotates the frame vertically
	 */
	public void RotateToVertical(){
		bRotated = true;
		
		iTween.RotateTo(gameObject, iTween.Hash(
			"rotation", new Vector3(0.0f, 0.0f, 90.0f),
			"time", m_easeTime,
			"easetype", "easeInOutSine"
		));
		AnimateSize(m_frameWidth, m_frameHeight);
	}
	
	
	/*
	 * Rotates the frame horizontally
	 */
	public void RotateToHorizontal(){
		bRotated = false;
		
		iTween.RotateTo(gameObject, iTween.Hash(
			"rotation", new Vector3(0.0f, 0.0f, 0.0f),
			"time", m_easeTime,
			"easetype", "easeInOutSine"
		));
		AnimateSize(m_frameWidth, m_frameHeight);
	}
	
	
	/*
	 * Animates the panel size
	 */
	public void AnimateSize(float width, float height){
		float targetHeight = (bRotated) ? width : height;
		float targetWidth = (bRotated) ? height : width;
		
		iTween.ValueTo(gameObject, iTween.Hash(
			"from", m_lastWidth, 
			"to", targetWidth, 
			"time", m_easeTime,
			"onupdate", "SetWidth", 
			"onupdatetarget", gameObject, 
			"oncomplete", "AnimationComplete",
			"easetype", "easeInOutSine"
		));
		iTween.ValueTo(gameObject, iTween.Hash(
			"from", m_lastHeight, 
			"to", targetHeight, 
			"time", m_easeTime,
			"onupdate", "SetHeight", 
			"onupdatetarget", gameObject, 
			"oncomplete", "AnimationComplete",
			"easetype", "easeInOutSine"
		));
	}
	
	
	/*
	 * Size animation callback
	 */
	private void AnimationComplete(){
		m_lastWidth = m_currentWidth;
		m_lastHeight = m_currentHeight;
	}
	
	
	
	//Setters
	//----------------------------
	
	/*
	 * Set thickness of quad panels
	 */
	public void SetThickness(float thickness){
		m_frameThickness = thickness;
		UpdatePanel();
	}
	
	
	/*
	 * Sets width of frame
	 */
	public void SetWidth(float width){
		m_currentWidth = width;
		UpdatePanel();
	}
	
	
	/*
	 * Sets height of frame
	 */
	public void SetHeight(float height){
		m_currentHeight = height;
		UpdatePanel();
	}
}
