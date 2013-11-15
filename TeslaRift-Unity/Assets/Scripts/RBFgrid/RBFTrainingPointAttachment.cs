using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using MusicIO;

namespace RBF{
	
	public class RBFTrainingPointAttachment : BaseAttachment {
	
		protected float twistVal;		//Twist (w) input
		public enum UIState{
			DRAGGING = 0,
			STATIONARY
		}
		protected UIState m_pointState;
		public UIState uiState { get { return m_pointState; }}
		
		protected Transform m_parentContainer;		//Controlling panel for this training point
		protected float m_containerWidth;			//Controlling panel width
		protected float m_containerHeight;			//Controlling panel height
		protected Transform m_dragSource;
		protected Dictionary<BaseInstrumentParam, float> m_paramValues;
		
		/*
		 * Init
		 */
		void Start(){
			m_pointState = UIState.STATIONARY;
			m_paramValues = new Dictionary<BaseInstrumentParam, float>();
		}
		
		void Update(){
			if(uiState == UIState.DRAGGING)
				MoveRelativeToContainer(m_dragSource);
		}
	
		
		/*
		 * Sets the input dimension values for this RBF training point
		 */
		public void SetTwist(float twist){
			this.twistVal = twist;
		}


		/*
		 * Sets the target transform for this point to follow
		 */
		public void SetDragSource(Transform source){
			m_pointState = UIState.DRAGGING;
			m_dragSource = source;
		}


		/* 
		 * Removes the target drag source for this point
		 */
		public void RemoveDragSource(){
			m_pointState = UIState.STATIONARY;
			m_dragSource = null;
		}


		/*
		 * Visually selects this training point
		 */
		public override void SetSelected (bool state)
		{
			base.SetSelected (state);
			//Do something to the visuals or colour
		}
		

		/* 
		 * Getters for normalized position of training point inside controlling panel
		 */

		public float xNormalized {get { return Utils.Normalize(transform.localPosition.x, m_containerWidth*-0.5f, m_containerWidth*0.5f); }}
		public float yNormalized {get { return Utils.Normalize(transform.localPosition.y, m_containerHeight*-0.5f, m_containerHeight*0.5f); }}
		public float twist {get { return twistVal; }}
		
		
		/*
		 * Sets the controlling container for this RBF point.
		 */
		public void SetParentContainer(Transform parent, float width, float height){
			transform.position = parent.position;
			transform.rotation = parent.rotation;
			transform.parent = parent;
			m_parentContainer = parent;
			m_containerWidth = width;
			m_containerHeight = height;
		}
		
		
		/*
		 * Moves this point inside of the parent container
		 */
		public void MoveRelativeToContainer(Transform worldPos){
			if(m_parentContainer != null){
				Vector3 pos = m_parentContainer.transform.InverseTransformPoint(worldPos.transform.position);
				transform.localPosition = new Vector3(
					Mathf.Clamp(pos.x, m_containerWidth*-0.5f, m_containerHeight*0.5f ), 
					Mathf.Clamp(pos.y, m_containerWidth*-0.5f, m_containerHeight*0.5f ), 0.0f
				);		
			}
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
