using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class BufferFrame : MonoBehaviour {
	
	/*
	 * Frame objects
	 */
	protected ParameterType m_paramType;
	protected List<GameObject> m_frameComponents;
	protected List<GameObject> m_outlineFrameComponents;
	protected List<GameObject> m_gridColumns;
	protected List<GameObject> m_gridRows;
	protected GameObject m_gridParent;

	public Object m_guiQuadPrefab;
	public Transform m_guiPanels;
	public Transform m_selectGuiPanels;
	public Transform m_backgroundQuad;
	
	/*
	 * Externally set dimensions
	 */
	public float m_frameThickness = 0.01f;
	public float m_easeTime = 0.5f;
	public float m_braceLength = 0.01f;
	public float m_frameHeight = 1.0f;
	public float m_frameWidth = 1.0f;
	public float m_outlineOffset = 0.5f;
	public float m_outlineDepth = -0.5f;
	
	/*
	 * Background and grid parameters
	 */
	public Color m_backgroundColor = new Color(1.0f, 1.0f, 1.0f, 0.5f);
	public bool m_hasGrid = false;
	public int m_numGridColumns = 8;
	public int m_numGridRows = 8;
	public float m_gridLineWidth = 0.01f;
	
	/*
	 * Debug toggles
	 */
	public bool m_toggleUpdate = false;
	public bool m_toggleHorizontal = false;
	public bool m_toggleVertical = false;
	public bool m_toggleOutline = false;
	
	/*
	 * Active dimensions
	 */
	private float m_currentOutlineOffset;
	private float m_currentWidth;
	private float m_currentHeight;
	private float m_lastWidth;
	private float m_lastHeight;
	private bool bRotated = false;
	private bool bIsOutlineVisible = false;
	
	
	void Awake () {
		m_frameComponents = new List<GameObject>();
		m_outlineFrameComponents = new List<GameObject>();
		m_gridColumns = new List<GameObject>();
		m_gridRows = new List<GameObject>();
				
		for(int i = 0; i < m_guiPanels.childCount; i++)
			m_frameComponents.Add(m_guiPanels.GetChild(i).gameObject);
		
		for(int i = 0; i < m_selectGuiPanels.childCount; i++)
			m_outlineFrameComponents.Add(m_selectGuiPanels.GetChild(i).gameObject);
		
		m_lastWidth = m_frameWidth;
		m_lastHeight = m_frameHeight;
				
		AnimateSize(m_frameWidth, m_frameHeight);
		
		CreateGrid(m_numGridRows, m_numGridColumns);
		UpdateGridLines();
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
		
		if(m_toggleOutline){
			m_toggleOutline = false;
			bIsOutlineVisible = !bIsOutlineVisible;
			ShowOutline(bIsOutlineVisible);
		}
	}
	
	
	/*
	 * Creates a grid of lines
	 */
	public void CreateGrid(int numRows, int numCols){
		
		int i = 0;
		m_gridParent = new GameObject("grid");
		m_gridParent.transform.parent = transform;
		
		//Rows
		for(i = 1; i < numRows; i++){
			GameObject gridLine = GameObject.Instantiate(m_guiQuadPrefab) as GameObject;
			m_gridRows.Add ( gridLine );
			gridLine.transform.parent = m_gridParent.transform;
		}
		
		//Columns
		for(i = 1; i < numCols; i++){
			GameObject gridLine = GameObject.Instantiate(m_guiQuadPrefab) as GameObject;
			m_gridColumns.Add ( gridLine );
			gridLine.transform.parent = m_gridParent.transform;
		}
	}
	
	
	/*
	 * Updates grid line positions and scales to fill the frame
	 */
	protected void UpdateGridLines(){
		int i = 0;
		float colSpacing = m_frameWidth / (m_gridColumns.Count+1);
		float rowSpacing = m_frameHeight / (m_gridRows.Count+1);
		m_gridParent.transform.localPosition = new Vector3(-(m_currentWidth*0.5f), -(m_currentHeight*0.5f), 0.0f);
		
		for(i = 0; i < m_gridRows.Count; i++){
			m_gridRows[i].transform.localPosition = new Vector3( 0.0f, (i+1) * rowSpacing, 0.0f);
			m_gridRows[i].transform.localScale = new Vector3(m_currentWidth, m_gridLineWidth, 0.0f);
		}
		
		for(i = 0; i < m_gridColumns.Count; i++){
			m_gridColumns[i].transform.localPosition = new Vector3( (i+1)*colSpacing, 0.0f, 0.0f);
			m_gridColumns[i].transform.localScale = new Vector3(m_gridLineWidth, m_currentHeight , 0.0f);
		}
	}
	
	
	/*
	 * Updates a quad panel transform by x/y/width/height
	 */
	protected void UpdateQuadTransform(GameObject quad, float x, float y, float z, float width, float height, bool mirrored){
		if(mirrored){
			quad.transform.localRotation = Quaternion.Euler( new Vector3(0.0f, 0.0f, 180.0f) );
			quad.transform.localPosition = new Vector3(x, y, z);
			quad.transform.localScale = new Vector3(width, height, 0.0f);
		} else {
			quad.transform.localRotation = Quaternion.Euler( new Vector3(0.0f, 0.0f, 0.0f) );
			quad.transform.localPosition = new Vector3(x - m_frameThickness, y - height, z);
			quad.transform.localScale = new Vector3(width, height, 0.0f);
		}
	}
	
	protected void UpdateBackground(float width, float height){
		if(m_backgroundQuad != null){
			m_backgroundQuad.localScale = new Vector3(width, height - (m_frameThickness*2));
			m_backgroundQuad.localPosition = new Vector3(-(m_frameThickness*0.5f), -(m_frameThickness*0.5f), 0.0f);
		}
	}
	
	
	/*
	 * Updates the whole quad frame
	 */
	protected void UpdatePanel(){
		//Inner shapes
		UpdateQuadTransform(m_frameComponents[0], -m_currentWidth*0.5f - (m_frameThickness*0.5f),   m_currentHeight*0.5f - (m_frameThickness*0.5f), 0.0f,  m_braceLength,    m_frameThickness, false);		//Top brace
		UpdateQuadTransform(m_frameComponents[1], -m_currentWidth*0.5f - (m_frameThickness*0.5f),   m_currentHeight*0.5f - (m_frameThickness*0.5f), 0.0f,  m_frameThickness, m_currentHeight,  false);		//Side
		UpdateQuadTransform(m_frameComponents[2], -m_currentWidth*0.5f - (m_frameThickness*0.5f),  -m_currentHeight*0.5f + (m_frameThickness*0.5f), 0.0f,  m_braceLength, 	 m_frameThickness, false);		//Bottom brace
		UpdateQuadTransform(m_frameComponents[3],  m_currentWidth*0.5f + (m_frameThickness*0.5f),   m_currentHeight*0.5f - (m_frameThickness*0.5f), 0.0f,  m_braceLength, 	 m_frameThickness, true);		//Top brace mirrored
		UpdateQuadTransform(m_frameComponents[4],  m_currentWidth*0.5f + (m_frameThickness*0.5f),   m_currentHeight*0.5f - (m_frameThickness*0.5f), 0.0f,  m_frameThickness, m_currentHeight,  true);		//Side mirrored
		UpdateQuadTransform(m_frameComponents[5],  m_currentWidth*0.5f + (m_frameThickness*0.5f),  -m_currentHeight*0.5f + (m_frameThickness*0.5f), 0.0f,  m_braceLength, 	 m_frameThickness, true);		//Bottom brace mirrored
		UpdateBackground(m_currentWidth, m_currentHeight);
		UpdateGridLines();
	}
	
	
	/*
	 * Updates the outer selection outline
	 */
	protected void UpdatePanelOutline(){
		UpdateQuadTransform(m_outlineFrameComponents[0], -(m_currentWidth*0.5f) - m_currentOutlineOffset - (m_frameThickness*0.5f),   (m_currentHeight*0.5f) + m_currentOutlineOffset - (m_frameThickness*0.5f),  m_outlineDepth,  m_braceLength,    m_frameThickness, 					   false);		//Top brace
		UpdateQuadTransform(m_outlineFrameComponents[1], -(m_currentWidth*0.5f) - m_currentOutlineOffset - (m_frameThickness*0.5f),   (m_currentHeight*0.5f) + m_currentOutlineOffset - (m_frameThickness*0.5f),  m_outlineDepth,  m_frameThickness, m_currentHeight + m_currentOutlineOffset*2.0f,  false);		//Side
		UpdateQuadTransform(m_outlineFrameComponents[2], -(m_currentWidth*0.5f) - m_currentOutlineOffset - (m_frameThickness*0.5f),  -(m_currentHeight*0.5f) - m_currentOutlineOffset + (m_frameThickness*0.5f),  m_outlineDepth,  m_braceLength, 	  m_frameThickness, 					   false);		//Bottom brace
		UpdateQuadTransform(m_outlineFrameComponents[3],  (m_currentWidth*0.5f) + m_currentOutlineOffset + (m_frameThickness*0.5f),   (m_currentHeight*0.5f) + m_currentOutlineOffset - (m_frameThickness*0.5f), m_outlineDepth,  m_braceLength, 	  m_frameThickness, 					   true);		//Top brace mirrored
		UpdateQuadTransform(m_outlineFrameComponents[4],  (m_currentWidth*0.5f) + m_currentOutlineOffset + (m_frameThickness*0.5f),   (m_currentHeight*0.5f) + m_currentOutlineOffset - (m_frameThickness*0.5f), m_outlineDepth,  m_frameThickness, m_currentHeight + m_currentOutlineOffset*2.0f,  true);		//Side mirrored
		UpdateQuadTransform(m_outlineFrameComponents[5],  (m_currentWidth*0.5f) + m_currentOutlineOffset + (m_frameThickness*0.5f),  -(m_currentHeight*0.5f) - m_currentOutlineOffset + (m_frameThickness*0.5f), m_outlineDepth,  m_braceLength, 	  m_frameThickness, 					   true);		//Bottom brace mirrored
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
	 * Animates outline in and out
	 */
	public void ShowOutline(bool state){
		float fromVal = 0.0f;
		float toVal = 0.0f;
		
		bIsOutlineVisible = state;
		
		if(state){
			fromVal = 0.0f;
			toVal = m_outlineOffset;
			m_selectGuiPanels.gameObject.SetActive(bIsOutlineVisible);
		} else {
			fromVal = m_outlineOffset;
			toVal = 0.0f;
		}
		
		iTween.ValueTo(gameObject, iTween.Hash(
			"from", fromVal, 
			"to", toVal, 
			"time", m_easeTime,
			"onupdate", "SetOutlineOffset", 
			"onupdatetarget", gameObject, 
			"oncomplete", "OutlineAnimationComplete",
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
	
	
	/*
	 * Outline animation callback
	 */
	private void OutlineAnimationComplete(){
		if(!bIsOutlineVisible){
			m_selectGuiPanels.gameObject.SetActive(bIsOutlineVisible);
		}
	}
	
	
	
	//Setters
	//----------------------------
	
	/*
	 * Set thickness of quad panels
	 */
	public void SetThickness(float thickness){
		m_frameThickness = thickness;
		UpdatePanel();
		UpdatePanelOutline();
	}
	
	
	/*
	 * Sets width of frame
	 */
	public void SetWidth(float width){
		m_currentWidth = width;
		UpdatePanel();
		UpdatePanelOutline();
	}
	
	
	/*
	 * Sets height of frame
	 */
	public void SetHeight(float height){
		m_currentHeight = height;
		UpdatePanel();
		UpdatePanelOutline();
	}
	
	/*
	 * Sets outline offset
	 */
	public void SetOutlineOffset(float offset){
		m_currentOutlineOffset = offset;
		UpdatePanelOutline();
	}
	
	
	//Getters
	public float width{ get { return m_frameWidth; }}
	public float height{ get { return m_frameHeight; }}
}
