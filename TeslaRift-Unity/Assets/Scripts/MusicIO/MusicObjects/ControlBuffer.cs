using UnityEngine;
using System.Collections;
using System.Collections.Generic;

namespace MusicIO
{
	public class ControlBuffer : BaseMusicObject {
		
		//Parameters sorted into instrument specific lists
		protected Dictionary<BaseInstrument, List<BaseInstrumentParam> > m_bufferedParameters;
		
		
		//Intialization
		//-----------------------
		public ControlBuffer(){
			Init( null );
		}
		
		public ControlBuffer(Dictionary<BaseInstrument, List<BaseInstrumentParam> > parameters){
			Init( parameters );
		}
		
		private void Init(Dictionary<BaseInstrument, List<BaseInstrumentParam> > parameters){			
			if( parameters == null ){
				m_bufferedParameters = new Dictionary<BaseInstrument, List<BaseInstrumentParam> >();
			} else {
				foreach( KeyValuePair<BaseInstrument, List<BaseInstrumentParam> > pair in parameters )
					m_bufferedParameters.Add(pair.Key, pair.Value);
			}
		}
		
		
		//Param Accessors
		//--------------------------

		/*
		 * Adds a parameter to the buffer
		 */
		public void AddParamToBuffer( BaseInstrumentParam param ){
			m_bufferedParameters[param.owner].Add(param);
		}
		
		
		/*
		 * Removes a parameter from the buffer
		 */
		public void RemoveParamFromBuffer(BaseInstrumentParam param){
			m_bufferedParameters[param.owner].Remove(param);
		}
		
		
		/*
		 * Gets all the parameters for an instrument
		 */
		public List<BaseInstrumentParam> GetInstrumentParams(BaseInstrument instrument){
			return m_bufferedParameters[instrument];
		}
		
		
		/*
		 * Gets all the parameters in this buffer
		 */
		public Dictionary<BaseInstrument, List<BaseInstrumentParam> > GetAllBufferparameters(){
			return m_bufferedParameters;
		}
		
		
		/*
		 * Clears the buffer
		 */
		public void ClearBuffer(){
			m_bufferedParameters.Clear();
		}
		
		
		/*
		 * Modifies all selected parameters
		 */
		public void SetSelectedParameterValues(float value){
			foreach( KeyValuePair<BaseInstrument, List<BaseInstrumentParam> > pair in m_bufferedParameters){
				foreach(BaseInstrumentParam param in pair.Value){
				
				/*
				 * Legacy parameter type specifics
				 * 
				 * if(param.GetType() == typeof(NoteParam)){
					NoteParam chord = param as NoteParam;
					chord.setNote(value, 1.0f, 0, 1);
				}else if(param.GetType() == typeof(ToggleParam)){
					ToggleParam toggle = param as ToggleParam;
					toggle.setOverrideVal(value);
					toggle.setVal(value);
					Debug.Log ("Override is:" + value + " Clamped is:" + param.val);
				}
				*/
				
					param.setOverrideVal(value);
					param.setVal(value);
				}
			}
		}
	}
}
