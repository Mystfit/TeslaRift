using UnityEngine;
using UI;
using System.Collections;
using System.Collections.Generic;

public class UIFrame : MonoBehaviour {
    
    /*
     * Frame objects
     */
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
    public Vector3 m_frameOffset;
    public float m_frameThickness = 0.01f;
    public float m_easeTime = 0.5f;
    public float m_braceLength = 0.01f;
    public float m_frameHeight = 1.0f;
    public float m_frameWidth = 1.0f;
    public float m_frameCollisionDepth = 0.5f;
    public float m_outlineOffset = 0.5f;
    public float m_outlineDepth = -0.5f;
    public enum AnchorLocation {
        LEFT = 0, 
        TOP,
        RIGHT, 
        BOTTOM,
        TOP_LEFT,
        TOP_RIGHT,
        BOTTOM_LEFT,
        BOTTOM_RIGHT,
        CENTER
    }
    public AnchorLocation m_anchorPoint;
    
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
    public bool toggleUpdate = false;
    public bool toggleHorizontal = false;
    public bool toggleVertical = false;
    public bool toggleOutline = false;
    public bool toggleBackground = false;
    public bool toggleHideFrame = false;
    
    /*
     * Active dimensions
     */
    private float m_currentOutlineOffset;
    public float currentWidth { get { return m_currentWidth; } }
    private float m_currentWidth;
    public float currentHeight { get { return m_currentHeight; } }
    private float m_currentHeight;
    private float m_lastWidth = 0.0f;
    private float m_lastHeight = 0.0f;
    public bool isAnimating { get { return bIsAnimating; } }
    private bool bIsAnimating;
    private bool bRotated = false;
    private bool bIsOutlineVisible = false;
    private bool bIsFrameVisible = true;
    
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
		m_currentWidth = m_frameWidth;
        m_lastHeight = m_frameHeight;
		m_currentHeight = m_frameHeight;
                        
        if(m_hasGrid)
            CreateGrid(m_numGridRows, m_numGridColumns);

        if(m_label != null){
            SetLabel(m_sliderLabel);
            m_label.transform.localPosition = m_frameOffset * 2.0f + new Vector3(0.0f, 0.0f, -0.002f);
            SetTextAsDeselected();
        }
    }
    
    
    void Update () {
        //Toggles to test frame animations
        if(toggleUpdate){
            toggleUpdate = false;
            AnimateSize(m_frameWidth, m_frameHeight);
            SetLabel(m_sliderLabel);
        }
        
        if(toggleVertical){
            toggleVertical = false;
            RotateToVertical();
        }
        
        if(toggleHorizontal){
            toggleHorizontal = false;
            RotateToHorizontal();
        }
        
        if(toggleOutline){
            toggleOutline = false;
            bIsOutlineVisible = !bIsOutlineVisible;
            ShowOutline(bIsOutlineVisible);
        }
        
        if(toggleBackground){
            toggleBackground = false;
            AnimateBackgroundColor(m_backgroundColor);
        }

        if (toggleHideFrame)
        {
            toggleHideFrame = false;
            bIsFrameVisible = !bIsFrameVisible;
            FrameVisible(bIsFrameVisible);
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
            gridLine.transform.rotation = m_gridParent.transform.rotation;
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
        float targetHeight = (bRotated) ? m_frameWidth : m_frameHeight;
        float targetWidth = (bRotated) ? m_frameHeight : m_frameWidth;
        
        int i = 0;
        float colSpacing = targetWidth / (m_gridColumns.Count+1);
        float rowSpacing = targetHeight / (m_gridRows.Count+1);
        m_gridParent.transform.localPosition = GetAnchorOffset(m_currentWidth, m_currentHeight, m_anchorPoint) + m_frameOffset;
        
        for(i = 0; i < m_gridRows.Count; i++){
            m_gridRows[i].transform.localPosition = new Vector3( -m_currentWidth*0.5f, ((i+1) * rowSpacing) - m_currentHeight*0.5f, 0.0f);
            m_gridRows[i].transform.localScale = new Vector3(targetWidth, m_gridLineWidth, 0.0f);
        }
        
        for(i = 0; i < m_gridColumns.Count; i++){
            m_gridColumns[i].transform.localPosition = new Vector3( ((i+1)*colSpacing) - m_currentWidth*0.5f, -m_currentHeight*0.5f, 0.0f);
            m_gridColumns[i].transform.localScale = new Vector3(m_gridLineWidth, targetHeight , 0.0f);
        }
    }
    
    
    /*
     * Updates a quad panel transform by x/y/width/height
     */
    protected void UpdateQuadTransform(GameObject quad, float x, float y, float z, float width, float height, bool mirrored){
        if(mirrored){
            quad.transform.localRotation = Quaternion.Euler( new Vector3(0.0f, 0.0f, 180.0f) );
            quad.transform.localPosition = new Vector3(x, y, z) + m_frameOffset;
            quad.transform.localScale = new Vector3(width, height, 0.0f);
        } else {
            quad.transform.localRotation = Quaternion.Euler( new Vector3(0.0f, 0.0f, 0.0f) );
            quad.transform.localPosition = new Vector3(x - m_frameThickness, y - height, z) + m_frameOffset;
            quad.transform.localScale = new Vector3(width, height, 0.0f);
        }
    }
    
    protected void UpdateBackground(float width, float height){
        if(m_backgroundQuad != null){
            m_backgroundQuad.localScale = new Vector3(width, height - (m_frameThickness*2));
            Vector3 borderOffset = new Vector3(-(m_frameThickness*0.5f), -(m_frameThickness*0.5f), 0.0f);
            m_backgroundQuad.localPosition = GetAnchorOffset(width, height, m_anchorPoint) + borderOffset + m_frameOffset * 2.0f;
        }
    }
    
    
    /*
     * Updates the whole quad frame
     */
    protected void UpdatePanel(){
        //Inner shapes
        UpdateQuadTransform(m_frameComponents[0], -m_currentWidth*0.5f - (m_frameThickness*0.5f),   m_currentHeight*0.5f - (m_frameThickness*0.5f), 0.0f,  m_braceLength,    m_frameThickness, false);      //Top brace
        UpdateQuadTransform(m_frameComponents[1], -m_currentWidth*0.5f - (m_frameThickness*0.5f),   m_currentHeight*0.5f - (m_frameThickness*0.5f), 0.0f,  m_frameThickness, m_currentHeight,  false);      //Side
        UpdateQuadTransform(m_frameComponents[2], -m_currentWidth*0.5f - (m_frameThickness*0.5f),  -m_currentHeight*0.5f + (m_frameThickness*0.5f), 0.0f,  m_braceLength,    m_frameThickness, false);      //Bottom brace
        UpdateQuadTransform(m_frameComponents[3],  m_currentWidth*0.5f + (m_frameThickness*0.5f),   m_currentHeight*0.5f - (m_frameThickness*0.5f), 0.0f,  m_braceLength,    m_frameThickness, true);       //Top brace mirrored
        UpdateQuadTransform(m_frameComponents[4],  m_currentWidth*0.5f + (m_frameThickness*0.5f),   m_currentHeight*0.5f - (m_frameThickness*0.5f), 0.0f,  m_frameThickness, m_currentHeight,  true);       //Side mirrored
        UpdateQuadTransform(m_frameComponents[5],  m_currentWidth*0.5f + (m_frameThickness*0.5f),  -m_currentHeight*0.5f + (m_frameThickness*0.5f), 0.0f,  m_braceLength,    m_frameThickness, true);       //Bottom brace mirrored
        
        if(m_hasGrid)
            UpdateGridLines();

        m_guiPanels.localPosition = GetAnchorOffset(m_currentWidth, m_currentHeight, m_anchorPoint) + m_frameOffset;
        m_selectGuiPanels.localPosition = GetAnchorOffset(m_currentWidth, m_currentHeight, m_anchorPoint) + m_frameOffset;
        
        UpdateBackground(m_currentWidth, m_currentHeight);
    }


    /*
     * Gets the position of the top left corner of this object relative to the anchor point. Default is center
     */
    public Vector3 GetAnchorOffset(float width, float height, AnchorLocation anchor){
        Vector3 position = new Vector3();

        switch(m_anchorPoint){
        case AnchorLocation.LEFT:
            position.x  = (bRotated) ? 0.0f : width*0.5f;
            position.y = (bRotated) ? -height*0.5f : 0.0f;
            break;
        case AnchorLocation.TOP:
            position.x  = (bRotated) ? -width*0.5f : 0.0f;
            position.y = (bRotated) ? 0.0f : -height*0.5f;
            break;
        case AnchorLocation.RIGHT:
            position.x  = (bRotated) ? 0.0f : -width*0.5f;
            position.y = (bRotated) ? height*0.5f : 0.0f;
            break;
        case AnchorLocation.BOTTOM:
            position.x  = (bRotated) ? width*0.5f : 0.0f;
            position.y = (bRotated) ? 0.0f : height*0.5f;
            break;
        case AnchorLocation.TOP_LEFT:
            position.x  = (bRotated) ? -width*0.5f : width*0.5f;
            position.y = (bRotated) ? -height*0.5f : -height*0.5f;
            break;
        case AnchorLocation.TOP_RIGHT:
            position.x  = (bRotated) ? -width*0.5f : -width*0.5f;
            position.y = (bRotated) ? height*0.5f : -height*0.5f;
            break;
        case AnchorLocation.BOTTOM_LEFT:
            position.x  = (bRotated) ? width*0.5f : width*0.5f;
            position.y = (bRotated) ? -height*0.5f : height*0.5f;
            break;
        case AnchorLocation.BOTTOM_RIGHT:
            position.x  = (bRotated) ? width*0.5f : -width*0.5f;
            position.y = (bRotated) ? height*0.5f : height*0.5f;
            break;
        case AnchorLocation.CENTER:
            position.x = 0.0f;
            position.y = 0.0f;
            break;
        }

        return position;
    }
    
    
    /*
     * Updates the outer selection outline
     */
    protected void UpdatePanelOutline(){
        UpdateQuadTransform(m_outlineFrameComponents[0], -(m_currentWidth*0.5f) - m_currentOutlineOffset - (m_frameThickness*0.5f),   (m_currentHeight*0.5f) + m_currentOutlineOffset - (m_frameThickness*0.5f),  m_outlineDepth,  m_braceLength,    m_frameThickness,                     false);      //Top brace
        UpdateQuadTransform(m_outlineFrameComponents[1], -(m_currentWidth*0.5f) - m_currentOutlineOffset - (m_frameThickness*0.5f),   (m_currentHeight*0.5f) + m_currentOutlineOffset - (m_frameThickness*0.5f),  m_outlineDepth,  m_frameThickness, m_currentHeight + m_currentOutlineOffset*2.0f,  false);        //Side
        UpdateQuadTransform(m_outlineFrameComponents[2], -(m_currentWidth*0.5f) - m_currentOutlineOffset - (m_frameThickness*0.5f),  -(m_currentHeight*0.5f) - m_currentOutlineOffset + (m_frameThickness*0.5f),  m_outlineDepth,  m_braceLength,     m_frameThickness,                        false);      //Bottom brace
        UpdateQuadTransform(m_outlineFrameComponents[3],  (m_currentWidth*0.5f) + m_currentOutlineOffset + (m_frameThickness*0.5f),   (m_currentHeight*0.5f) + m_currentOutlineOffset - (m_frameThickness*0.5f), m_outlineDepth,  m_braceLength,      m_frameThickness,                        true);       //Top brace mirrored
        UpdateQuadTransform(m_outlineFrameComponents[4],  (m_currentWidth*0.5f) + m_currentOutlineOffset + (m_frameThickness*0.5f),   (m_currentHeight*0.5f) + m_currentOutlineOffset - (m_frameThickness*0.5f), m_outlineDepth,  m_frameThickness, m_currentHeight + m_currentOutlineOffset*2.0f,  true);      //Side mirrored
        UpdateQuadTransform(m_outlineFrameComponents[5],  (m_currentWidth*0.5f) + m_currentOutlineOffset + (m_frameThickness*0.5f),  -(m_currentHeight*0.5f) - m_currentOutlineOffset + (m_frameThickness*0.5f), m_outlineDepth,  m_braceLength,      m_frameThickness,                        true);       //Bottom brace mirrored
    }
    
    
    /*
     * Rotates the frame vertically
     */
    public void RotateToVertical(){
        bRotated = true;
        transform.rotation = Quaternion.Euler( new Vector3(transform.rotation.eulerAngles.x, transform.rotation.eulerAngles.y, 90.0f) );
        AnimateSize(m_frameWidth, m_frameHeight);
    }
    
    
    /*
     * Rotates the frame horizontally
     */
    public void RotateToHorizontal(){
        bRotated = false;
        transform.rotation = Quaternion.Euler( new Vector3(transform.rotation.eulerAngles.x, transform.rotation.eulerAngles.y, 0.0f) );
        AnimateSize(m_frameWidth, m_frameHeight);
    }
    
    
    /*
     * Animates the panel size
     */
    public void AnimateSize(float width, float height)
    {
        float targetHeight = (bRotated) ? width : height;
        float targetWidth = (bRotated) ? height : width;
        bIsAnimating = true;

        SetWidth(targetWidth);
        SetHeight(targetHeight);
        AnimationComplete();
    }
    
    public void AnimateBackgroundColor(Color color){
        if (GlobalConfig.Instance.EnableAnimations)
        {
            iTween.ColorTo(m_backgroundQuad.gameObject, iTween.Hash(
                "color", color,
                "time", m_easeTime,
                "includechildren", true,
                "onupdatetarget", gameObject,
                "oncomplete", "AnimationComplete",
                "easetype", "easeInOutSine"
            ));
        }
        else
        {
            m_backgroundQuad.renderer.material.SetColor("_Color", color);
        }
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

        if (GlobalConfig.Instance.EnableAnimations)
        {
            iTween.ValueTo(gameObject, iTween.Hash(
                "from", fromVal,
                "to", toVal,
                "time", m_easeTime,
                "onupdate", "SetOutlineOffset",
                "onupdatetarget", gameObject,
                "oncomplete", "OutlineAnimationComplete",
                "easetype", "easeInOutSine"
            ));
        } else {
            SetOutlineOffset(toVal);
            OutlineAnimationComplete();
        }
    }


    /*
     * Shows or hides frame components
     */
    public void FrameVisible(bool state)
    {
        foreach (GameObject o in m_frameComponents)
            o.SetActive(state);
    }
    
    
    /*
     * Size animation callback
     */
    private void AnimationComplete(){
        m_lastWidth = m_currentWidth;
        m_lastHeight = m_currentHeight;
        bIsAnimating = false;
    }
    
    
    /*
     * Outline animation callback
     */
    private void OutlineAnimationComplete(){
        if(!bIsOutlineVisible){
            m_selectGuiPanels.gameObject.SetActive(bIsOutlineVisible);
        }
    }

    /*
     * Set text color
     */
    public void SetTextAsSelected()
    {
        if (GlobalConfig.Instance.EnableAnimations)
        {
            iTween.ColorTo(m_label.gameObject, iTween.Hash("color", UIFactory.textLabelSelectedColor, "time", 0.15f, "easetype", "easeOutCubic"));
        }
        else
        {
            m_label.renderer.material.SetColor("_Color", UIFactory.textLabelSelectedColor);
        }
    }

    public void SetTextAsDeselected()
    {
        if (GlobalConfig.Instance.EnableAnimations)
        {
            iTween.ColorTo(m_label.gameObject, iTween.Hash("color", UIFactory.textLabelDeselectedColor, "time", 0.15f, "easetype", "easeOutCubic"));
        }
        else
        {
            m_label.renderer.material.SetColor("_Color", UIFactory.textLabelDeselectedColor);
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

		if(m_valueLabel != null)
        	m_valueLabel.transform.localPosition = new Vector3(m_currentWidth, 0.0f, -0.02f);
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


    /*
     * Sets anchor point for frame
     */
    public void SetAnchor(AnchorLocation anchor){
        m_anchorPoint = anchor;
        toggleUpdate = true;
    }


    /*
     * Text label
     */
    public TextMesh label { get { return m_label; } }
    public TextMesh m_label;
    public TextMesh m_valueLabel;
    public string m_sliderLabel = "";
	public int m_maxChars = 10;

    public void SetMatchTextWidth(bool state) { m_matchTextWidth = state; }
    public bool m_matchTextWidth = false;

    public void SetLabel(string label)
    {
        m_sliderLabel = label;
        if(m_label != null){
            m_label.anchor = FrameAnchorToTextAnchor(m_anchorPoint);

			if(label.Length > m_maxChars){
				string shortLabel = "";
				for(int i = 0; i < m_maxChars; i++)
					shortLabel += label[i];
				shortLabel += "...";
				m_label.text = shortLabel;
			} else {
				m_label.text = label;
			}

            if(m_matchTextWidth)
                AnimateSize(m_label.renderer.bounds.size.x, m_frameHeight);
            //toggleUpdate = true;
        }
    }

    public void SetValueLabel(string value)
    {
        m_valueLabel.text = value;
    }

    /*
     * Converts frame anchors to text anchors
     */
    public static TextAnchor FrameAnchorToTextAnchor(UIFrame.AnchorLocation anchor)
    {
        switch (anchor)
        {
            case UIFrame.AnchorLocation.BOTTOM:
                return TextAnchor.LowerCenter;
            case UIFrame.AnchorLocation.BOTTOM_LEFT:
                return TextAnchor.LowerLeft;
            case UIFrame.AnchorLocation.BOTTOM_RIGHT:
                return TextAnchor.LowerRight;
            case UIFrame.AnchorLocation.CENTER:
                return TextAnchor.MiddleCenter;
            case UIFrame.AnchorLocation.LEFT:
                return TextAnchor.MiddleLeft;
            case UIFrame.AnchorLocation.RIGHT:
                return TextAnchor.MiddleRight;
            case UIFrame.AnchorLocation.TOP:
                return TextAnchor.UpperCenter;
            case UIFrame.AnchorLocation.TOP_LEFT:
                return TextAnchor.UpperLeft;
            case UIFrame.AnchorLocation.TOP_RIGHT:
                return TextAnchor.UpperRight;
        }
        return TextAnchor.MiddleCenter;
    }
    

    //Getters
    public float width{ get { return m_frameWidth; }}
    public float height{ get { return m_frameHeight; }}
    public bool isRotated{ get { return bRotated; }}
    public Transform background{ get { return m_backgroundQuad; }}
}
