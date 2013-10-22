using UnityEngine;
using System.Collections;
using System.Collections.Generic;

namespace MusicIO
{
	
	public class ParamBuffer {
		
		protected Dictionary<BaseInstrument,BaseInstrumentParam> m_bufferedParameters;
		public bool bIsReadOnlyBuffer = false;
		public bool IsReadOnlyBuffer{ get { return bIsReadOnlyBuffer; }}
		
		public ParamBuffer(bool readOnly){
			Init(readOnly, null );
		}
		
		public ParamBuffer(Dictionary<BaseInstrument,BaseInstrumentParam> parameters, bool readOnly){
			Init(readOnly, parameters );
		}
		
		private void Init(bool readOnly, Dictionary<BaseInstrument,BaseInstrumentParam> parameters){
			bIsReadOnlyBuffer = readOnly;
			
			if(parameters == null){
				m_bufferedParameters = new Dictionary<BaseInstrument, BaseInstrumentParam>();
			} else {
				foreach(KeyValuePair<BaseInstrument, BaseInstrumentParam> pair in parameters)
					m_bufferedParameters.Add(pair.Key, pair.Value);
			}
		}
		
		public void AddParamToBuffer(BaseInstrumentParam param){
			if(!bIsReadOnlyBuffer) m_bufferedParameters[param.owner] = param;
		}
		
		public void RemoveParamFromBuffer(BaseInstrumentParam param){
			if(!bIsReadOnlyBuffer) m_bufferedParameters[param.owner] = null;
		}
		
		public BaseInstrumentParam GetInstrumentParam(BaseInstrument instrument){
			return m_bufferedParameters[instrument];
		}
		
		public Dictionary<BaseInstrument,BaseInstrumentParam> GetAllBufferparameters(){
			return m_bufferedParameters;
		}
		
		public void ClearBuffer(){
			if(!bIsReadOnlyBuffer) m_bufferedParameters.Clear();
		}
	
	}
}
