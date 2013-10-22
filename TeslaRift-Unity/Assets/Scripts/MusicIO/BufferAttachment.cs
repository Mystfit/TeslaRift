using UnityEngine;
using System.Collections;

public class BufferAttachment : BaseAttachment {
	
	MusicIO.ParamBuffer m_bufferRef;
	
	// Use this for initialization
	public override void Start () {
		base.Start();
	}
	
	public override void Init<T> (T buffer)
	{
		m_bufferRef = (MusicIO.ParamBuffer)(object)buffer;
	}
	
	// Update is called once per frame
	public override void Update () {
		base.Update();
	}
}
