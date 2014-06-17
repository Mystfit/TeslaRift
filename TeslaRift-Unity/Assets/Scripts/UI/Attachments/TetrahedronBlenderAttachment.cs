using UnityEngine;
using UI;
using System.Collections;
using System.Collections.Generic;

public class TetrahedronBlenderAttachment : BaseAttachment {

    public string[] m_channelNames;
    public GameObject[] m_returns = new GameObject[4];
    public float m_size = 1.0f;

    protected Mesh m_mesh;

	// Use this for initialization
    public override void Awake()
    {
		base.Awake();
        SetAsDock(true);
	    AddAcceptedDocktype(typeof(InstrumentAttachment));

        BuildTetrahedronMesh();
	}

    public void BuildTetrahedronMesh()
    {
        Mesh mesh = new Mesh();
        GetComponent<MeshFilter>().mesh = mesh;

        Vector3[] vertices = new Vector3[4]{
            new Vector3(0.0f, 0.0f, 0.0f),
            new Vector3(0.0f, 0.0f, 0.0f),
            new Vector3(0.0f, 0.0f, 0.0f),
            new Vector3(0.0f, 0.0f, 0.0f)
        };

        Vector2[] uvs = new Vector2[4]{
            new Vector2(0.0f, 0.0f),
            new Vector2(0.0f, 0.0f),
            new Vector2(0.0f, 0.0f),
            new Vector2(0.0f, 0.0f)
        };

        int[] indicies = new int[12]{ 0, 1, 2, 2, 1, 3, 3, 1, 0, 0, 2, 3 };

        mesh.vertices = vertices;
        mesh.uv = uvs;
        mesh.triangles = indicies;        
    }

    public override bool AddDockableAttachment(BaseAttachment attach)
    {
        if (base.AddDockableAttachment(attach))
        {

            return true;
        }
        return false;
    }
}
