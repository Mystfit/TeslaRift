using UnityEngine;
using System.Collections;

public class ProjecterWarpUVs : MonoBehaviour {

    private Mesh m_mesh;
    private Vector2[] m_uvs;
    public GameObject m_remoteQuad;
    private Mesh m_remoteMesh;
    public Camera m_projectorCaptureCam;

    private Vector3 m_topLeftWorld;
    private Vector3 m_topRightWorld;
    private Vector3 m_bottomLeftWorld;
    private Vector3 m_bottomRightWorld;

	// Use this for initialization
	void Start () {
        m_mesh = GetComponent<MeshFilter>().mesh;
        m_remoteMesh = m_remoteQuad.GetComponent<MeshFilter>().mesh;
        m_uvs = new Vector2[4];
	}
	
	// Update is called once per frame
	void Update () {
        m_topLeftWorld = m_remoteQuad.transform.TransformPoint(m_remoteMesh.vertices[3]);
        m_topRightWorld = m_remoteQuad.transform.TransformPoint(m_remoteMesh.vertices[1]);
        m_bottomLeftWorld = m_remoteQuad.transform.TransformPoint(m_remoteMesh.vertices[0]);
        m_bottomRightWorld = m_remoteQuad.transform.TransformPoint(m_remoteMesh.vertices[2]);

        Vector3 topLeft = m_projectorCaptureCam.WorldToViewportPoint(m_topLeftWorld);
        Vector3 topRight = m_projectorCaptureCam.WorldToViewportPoint(m_topRightWorld);
        Vector3 bottomLeft = m_projectorCaptureCam.WorldToViewportPoint(m_bottomLeftWorld);
        Vector3 bottomRight = m_projectorCaptureCam.WorldToViewportPoint(m_bottomRightWorld);

        renderer.material.SetVector("_BL", bottomLeft);
        renderer.material.SetVector("_BR", bottomRight);
        renderer.material.SetVector("_TL", topLeft);
        renderer.material.SetVector("_TR", topRight);
	}
}
