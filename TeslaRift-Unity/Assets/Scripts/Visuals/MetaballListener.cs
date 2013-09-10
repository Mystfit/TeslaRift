using UnityEngine;
using System.Collections;

public class MetaballListener : OSCListener {
	
	private enum Param : int { 
		SCALE = 0, 
		POWER, 
		POLEA, 
		POLEB, 
		POLEC, 
		BLOBA_POSX, 
		BLOBA_POSY, 
		BLOBB_POSX, 
		BLOBB_POSY,
	};
	
	public float bandScale = 10.0f;
	public float powerScale = 25.0f;
	public float poleScale = 10.0f;
	public float blobScale = 10.0f;

	// Use this for initialization
	protected override void Start () {
		base.Start();
	}
	
	// Update is called once per frame
	protected override void Update () {
		base.Update();
		
		if(m_isDirty){
			//this.renderer.material.SetFloat("_Scale", 5.0f);
			this.renderer.material.SetFloat("_Scale", m_paramValues[(int)Param.SCALE] * bandScale);
			this.renderer.material.SetFloat("_Power", m_paramValues[(int)Param.POWER] * powerScale);
			this.renderer.material.SetVector("_PointA", new Vector4( m_paramValues[(int)Param.POLEA] * poleScale, 0.0f, 0.0f, 0.0f));
			this.renderer.material.SetVector("_PointB", new Vector4( 0.0f, m_paramValues[(int)Param.POLEB] * poleScale, 0.0f, 0.0f ));
			this.renderer.material.SetVector("_PointC", new Vector4( m_paramValues[(int)Param.POLEB] * poleScale, 0.0f, 0.0f, 0.0f));
			
			
			MCBlob blob = this.GetComponent<MCBlob>();
			blob.m_blobPositions[0] = new Vector4(
				m_paramValues[(int)Param.BLOBA_POSX] * blobScale,
				m_paramValues[(int)Param.BLOBA_POSY] * blobScale,
				0.0f,
				blob.m_blobPositions[0].w
			);
			blob.m_blobPositions[1] = new Vector4(
				(m_paramValues[(int)Param.BLOBB_POSX] * blobScale) - (blobScale * 0.5f),
				(m_paramValues[(int)Param.BLOBB_POSY] * blobScale) - (blobScale * 0.5f),
				0.0f,
				blob.m_blobPositions[1].w
			);
			
			SetClean();
		}
	}
}
