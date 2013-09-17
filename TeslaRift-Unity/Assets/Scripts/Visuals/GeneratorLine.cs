using UnityEngine;
using System.Collections;

public class GeneratorLine : MonoBehaviour {
	
	public Transform m_target;
	public Transform m_source;
	private LineRenderer m_lineRender;

	// Use this for initialization
	void Start () {
		m_lineRender = gameObject.AddComponent<LineRenderer>();
		m_lineRender.SetVertexCount(2);
		m_lineRender.SetWidth(0.01f, 0.01f);
		m_lineRender.SetColors(Color.blue, Color.cyan);
		m_lineRender.material = new Material (Shader.Find("Particles/Additive"));
	}
	
	public void CreateConnection(Transform target, Transform source){
		m_target = target;
		m_source = source;
	}
	
	public void Remove(){
		Destroy(m_lineRender);
		Destroy(this);
	}
	
	// Update is called once per frame
	void Update () {
		m_lineRender.SetPosition(0, m_source.transform.position);
		m_lineRender.SetPosition(1, m_target.transform.position);
	}	
}
