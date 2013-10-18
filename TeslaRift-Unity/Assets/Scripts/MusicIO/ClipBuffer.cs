using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class ClipBuffer {
	
	protected Dictionary<BaseInstrument,InstrumentClip> m_clips;
	public bool bIsReadOnlyBuffer = false;
	public bool IsReadOnlyBuffer{ get { return bIsReadOnlyBuffer; }}
	
	public ClipBuffer(bool readOnly){
		Init(readOnly, null );
	}
	
	public ClipBuffer(Dictionary<BaseInstrument,InstrumentClip> clips, bool readOnly){
		Init(readOnly, clips );
	}
	
	private void Init(bool readOnly, Dictionary<BaseInstrument,InstrumentClip> clips){
		bIsReadOnlyBuffer = readOnly;
		
		if(clips == null){
			m_clips = new Dictionary<BaseInstrument, InstrumentClip>();
		} else {
			foreach(KeyValuePair<BaseInstrument, InstrumentClip> pair in clips)
				m_clips.Add(pair.Key, pair.Value);
		}
	}
	
	public void AddClipToBuffer(InstrumentClip clip){
		if(!bIsReadOnlyBuffer) m_clips[clip.owner] = clip;
	}
	
	public void RemoveClipFromBuffer(InstrumentClip clip){
		if(!bIsReadOnlyBuffer) m_clips[clip.owner] = null;
	}
	
	public InstrumentClip GetInstrumentClip(BaseInstrument instrument){
		return m_clips[instrument];
	}
	
	public Dictionary<BaseInstrument,InstrumentClip> GetAllBufferClips(){
		return m_clips;
	}
	
	public void ClearBuffer(){
		if(!bIsReadOnlyBuffer) m_clips.Clear();
	}

}
