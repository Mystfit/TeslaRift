using UnityEngine;
using UI;
using System.Collections;
using System.Collections.Generic;

public class TetrahedronBlenderAttachment : BaseAttachment {

    public InstrumentAttachment[] m_returns = new InstrumentAttachment[4];
    public float m_radius = 1.0f;

    protected Mesh m_mesh;
    protected InstrumentAttachment m_currentInstrument;
    protected InstrumentAttachment m_lastInstrument;
    protected Vector3 m_lastPosition;

	// Use this for initialization
    public override void Awake()
    {
		base.Awake();
        SetAsDock(true);
	    AddAcceptedDocktype(typeof(InstrumentAttachment));
        m_mesh = BuildTetrahedronMesh(m_radius);
        GetComponent<MeshFilter>().mesh = m_mesh;
	}

    public Vector3 GetCorner(int index)
    {
        return m_mesh.vertices[index];
    }



    public Mesh BuildTetrahedronMesh(float radius)
    {
        Mesh mesh = new Mesh();
        mesh.vertices = GeometryUtils.BuildTetrahedronVertices(radius);
        mesh.triangles = GeometryUtils.tetrahedronindices;
        mesh.uv = new Vector2[4];
        mesh.RecalculateNormals();
        return mesh;
    }

    public void AddReturnInstrument(InstrumentAttachment returnInstrument, int index)
    {
        if (index <= m_returns.Length)
        {
			returnInstrument.EnableControls();
			returnInstrument.SetToolmodeResponse(new BaseTool.ToolMode[1]{BaseTool.ToolMode.PRIMARY});
            returnInstrument.transform.parent = transform;
            returnInstrument.transform.localPosition = GetCorner(index);
            m_returns[index] = returnInstrument;
        }
    }

    public override bool AddDockableAttachment(BaseAttachment attach)
    {
        if (base.AddDockableAttachment(attach))
        {
            if (m_currentInstrument != null)
            {
                if (m_currentInstrument != attach)
                {
                    m_currentInstrument.SetTransient(true);
                    m_currentInstrument.Undock();
                    m_currentInstrument.SetFloating();
                }
            }

            if (attach == m_lastInstrument)
            {
                attach.transform.localPosition = m_lastPosition;
            }
            else
            {
                iTween.MoveTo(attach.gameObject, iTween.Hash("position", Vector3.zero, "time", 0.2f, "islocal", true));
            }

            ShowControls();
            m_currentInstrument = attach as InstrumentAttachment;
            return true;
        }
        return false;
    }

    public override void RemoveDockableAttachment(BaseAttachment attach)
    {
        if (attach == m_currentInstrument)
        {
            m_lastPosition = m_currentInstrument.transform.localPosition;
            m_lastInstrument = m_currentInstrument;
        }
        base.RemoveDockableAttachment(attach);
    }

    public override void Gesture_IdleInterior()
    {
        if(mode == BaseTool.ToolMode.PRIMARY){
            float[] sendVals = GeometryUtils.BarycentricTetrahedronLerp(
                GetCorner(0), 
                GetCorner(1), 
                GetCorner(2), 
                GetCorner(3), 
                transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(m_hand)) );

			if(m_currentInstrument){
				for(int i = 0; i < 4; i++){
					m_currentInstrument.musicRef.getSendByName(m_returns[i].musicRef.Name).setVal(sendVals[i]);
				}
			}
        }

        base.Gesture_IdleInterior();
    }

    public override void Gesture_Exit()
    {
        HideControls();
        base.Gesture_Exit();
    }

    public override void ShowControls()
    {
        //SetActive();
        base.ShowControls();
    }

    public override void HideControls()
    {
        //SetInactive();
        base.HideControls();
    }
}
