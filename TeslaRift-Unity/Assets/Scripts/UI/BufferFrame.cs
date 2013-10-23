using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class BufferFrame : MonoBehaviour {
	
	protected BaseAttachment.ParameterType m_paramType;
	protected List<GameObject> m_frameComponents;
	protected Object m_guiQuadPrefab;
	
	public float m_frameThickness = 0.01f;
	public float m_braceLength = 0.01f;
	public float m_frameHeight = 1.0f;

	// Use this for initialization
	void Start () {
		
		m_guiQuadPrefab = Resources.LoadAssetAtPath("Assets/Prefabs/GuiFrameQuad.prefab", typeof(GameObject)) as GameObject;
		m_frameComponents = new List<GameObject>();
		
		m_frameComponents.Add( CreateGuiFramePanel(0.0f, 0.0f, m_braceLength, m_frameThickness, false) );
		m_frameComponents.Add( CreateGuiFramePanel(0.0f, 0.0f, m_frameThickness, m_frameHeight, false) );
		m_frameComponents.Add( CreateGuiFramePanel(0.0f, -m_frameHeight, m_braceLength, m_frameThickness, false) );
		
		m_frameComponents.Add( CreateGuiFramePanel(0.0f, 0.0f, m_braceLength, m_frameThickness, true) );
		m_frameComponents.Add( CreateGuiFramePanel(0.0f, 0.0f, m_frameThickness, m_frameHeight, true) );
		m_frameComponents.Add( CreateGuiFramePanel(0.0f, -m_frameHeight, m_braceLength, m_frameThickness, true) );
	}
	
	protected GameObject CreateGuiFramePanel(float x, float y, float width, float height, bool mirror){
		
		GameObject guiPanel = GameObject.Instantiate( m_guiQuadPrefab, Vector3.zero, Quaternion.Euler( new Vector3 ( 0.0f, 0.0f, 0.0f ) ) ) as GameObject;
		guiPanel.transform.position = transform.position;
		guiPanel.transform.parent = transform;
		
		if(mirror){
			guiPanel.transform.localRotation = Quaternion.Euler( new Vector3(0.0f, 0.0f, 180.0f) );
			guiPanel.transform.localPosition = new Vector3(x, y, 0.0f);
			guiPanel.transform.localScale = new Vector3(width, height, 0.0f);
		} else {
			guiPanel.transform.localRotation = Quaternion.Euler( new Vector3(0.0f, 0.0f, 0.0f) );
			guiPanel.transform.localPosition = new Vector3(x - m_frameThickness, y - height, 0.0f);
			guiPanel.transform.localScale = new Vector3(width, height, 0.0f);
		}

		return guiPanel;
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	public void RotateToVertial(){
	}
	
	public void RotateToHorizontal(){
	}
	
	public void SetThickness(float thickness){
	}
	
	public void SetWidth(float width){
	}
	
	public void SetHeight(float height){
	}
}


class ScalingFrameEdge {
	
	void ScalingFrame(){
	}
	
	public void SetHeight(float height){
	}
	
	public void SetBracketLength(float length){
	}
	
	public void SetThickness(float thickness){
	}
}
