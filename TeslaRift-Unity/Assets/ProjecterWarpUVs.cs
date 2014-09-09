using UnityEngine;
using System.Collections;

public class ProjecterWarpUVs : MonoBehaviour {

    private Mesh m_mesh;
    private Vector2[] m_uvs;
    public GameObject m_remoteQuad;
    private Mesh m_remoteMesh;
    public Camera m_projectorCaptureCam;

	// Use this for initialization
	void Start () {
        m_mesh = GetComponent<MeshFilter>().mesh;
        m_remoteMesh = m_remoteQuad.GetComponent<MeshFilter>().mesh;
        m_uvs = new Vector2[4];
	}
	
	// Update is called once per frame
	void Update () {

        Vector3 topLeftWorld = m_remoteQuad.transform.TransformPoint(m_remoteMesh.vertices[3]);
        Vector3 topRightWorld = m_remoteQuad.transform.TransformPoint(m_remoteMesh.vertices[1]);
        Vector3 bottomLeftWorld = m_remoteQuad.transform.TransformPoint(m_remoteMesh.vertices[0]);
        Vector3 bottomRightWorld = m_remoteQuad.transform.TransformPoint(m_remoteMesh.vertices[2]);

        Vector3 topLeft = m_projectorCaptureCam.WorldToViewportPoint(topLeftWorld);
        Vector3 topRight = m_projectorCaptureCam.WorldToViewportPoint(topRightWorld);
        Vector3 bottomLeft = m_projectorCaptureCam.WorldToViewportPoint(bottomLeftWorld);
        Vector3 bottomRight = m_projectorCaptureCam.WorldToViewportPoint(bottomRightWorld);

        //Debug.Log("topLeftWorld:" + topLeftWorld);
        //Debug.Log("topRightWorld:" + topRightWorld);
        //Debug.Log("bottomLeftWorld:" + bottomLeftWorld);
        //Debug.Log("bottomRightWorld:" + bottomRightWorld);

        //Debug.Log("topLeftScreen:" + topLeft);
        //Debug.Log("topRightScreen:" + topRight);
        //Debug.Log("bottomLeftScreen:" + bottomLeft);
        //Debug.Log("bottomRightScreen:" + bottomRight);

        //m_mesh.uv = new Vector2[4]{
        //    new Vector2(bottomLeft.x, bottomLeft.y),
        //    new Vector2(topRight.x, topRight.y),
        //    new Vector2(bottomRight.x, bottomRight.y),
        //    new Vector2(topLeft.x, topLeft.y)};

        renderer.material.SetVector("_BL", bottomLeft);
        renderer.material.SetVector("_BR", bottomRight);
        renderer.material.SetVector("_TL", topLeft);
        renderer.material.SetVector("_TR", topRight);
	}
}
