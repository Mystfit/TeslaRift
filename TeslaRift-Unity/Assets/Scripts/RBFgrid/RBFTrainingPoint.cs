using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using MusicIO;

namespace RBF{
	
	public class RBFTrainingPoint : MonoBehaviour {
		
		public float x;
		public float y;
		public float twist;
		
		Dictionary<BaseInstrumentParam, float> m_paramValues;
		
		void Start(){
			m_paramValues = new Dictionary<BaseInstrumentParam, float>();
		}
	
		/*
		 * Sets the input dimension values for this RBF training point
		 */
		public void SetInputValues(float x, float y, float twist){
			this.x = x;
			this.y = y;
			this.twist = twist;
		}
		
		
		/*
		 * Assigns a list of parameters to this training point
		 */
		public void AddParameters(List<BaseInstrumentParam> paramList, float[] existingValues){
			
			m_paramValues.Clear();
			
			if(existingValues.Length != paramList.Count)
				throw new IndexOutOfRangeException();
			
			for(int i = 0; i < paramList.Count; i++)
				m_paramValues[paramList[i]] = existingValues[i];				
		}
		
		
		/*
		 * Sets the expected value for a music parameter for this RBF
		 */
		public void SetParameterValue(GenericMusicParam param, float val){
			m_paramValues[param] = val;
		}
		
	}
}
