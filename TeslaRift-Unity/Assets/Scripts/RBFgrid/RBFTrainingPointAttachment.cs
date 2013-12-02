using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using MusicIO;
using UI;

namespace RBF{
	
	public class RBFTrainingPointAttachment : UIAttachment {
	
		protected float twistVal;		//Twist (w) input
		public enum UIState{
			DRAGGING = 0,
			STATIONARY
		}
		protected UIState m_pointState;
		public UIState uiState { get { return m_pointState; }}

		protected RBFControlAttachment m_rbfOwner;
		protected Transform m_parentContainer;		//Controlling panel for this training point
		protected float m_containerWidth;			//Controlling panel width
		protected float m_containerHeight;			//Controlling panel height
		protected Transform m_dragSource;
		protected Dictionary<BaseInstrumentParam, float> m_paramValues;
		public Dictionary<BaseInstrumentParam, float> paramValues{ get { return m_paramValues; }}
		
		/*
		 * Init
		 */
		public override void Awake(){
			m_pointState = UIState.STATIONARY;
			m_paramValues = new Dictionary<BaseInstrumentParam, float>();
		}
		
		public override void Update(){
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
		public void SetActive(Transform source){
			m_pointState = UIState.DRAGGING;
			m_dragSource = source;
			m_rbfOwner.SetActiveTrainingPoint(this);
			m_rbfOwner.owner.UpdateSlidersFromTrainingPoint(this);
		}


		/* 
		 * Removes the target drag source for this point
		 */
		public void SetInactive(){
			m_pointState = UIState.STATIONARY;
			m_dragSource = null;
			//m_rbfOwner.SetActiveTrainingPoint(null);
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

		public float xNormalized {get { return Utils.Scale(transform.localPosition.x, 0.0f, m_containerWidth); }}
		public float yNormalized {get { return Utils.Scale(transform.localPosition.y, 0.0f, m_containerHeight); }}
		public float twist {get { return twistVal; }}
		public RBFControlAttachment rbfOwner{ get { return m_rbfOwner; }}
		
		
		/*
		 * Sets the controlling container for this RBF point.
		 */
		public void SetParentContainer(RBFControlAttachment parent, float width, float height){
			transform.position = parent.transform.position;
			transform.rotation = parent.transform.rotation;
			transform.parent = parent.transform;
			m_parentContainer = parent.transform;
			m_rbfOwner = parent;
			m_containerWidth = width;
			m_containerHeight = height;
		}
		
		
		/*
		 * Moves this point inside of the parent container
		 */
		public void MoveRelativeToContainer(Transform worldPos){

			Vector3 pos = BaseTool.HandToObjectSpace(worldPos, m_parentContainer.transform);
			transform.localPosition = new Vector3(pos.x, pos.y, 0.0f);	
//			transform.localPosition = new Vector3(
//				Mathf.Clamp(pos.x, m_containerWidth*-0.5f, m_containerHeight*0.5f ), 
//				Mathf.Clamp(pos.y, m_containerWidth*-0.5f, m_containerHeight*0.5f ), 0.0f
//			);		
		}


		public void MoveRelativeToLocal(float x, float y){
			transform.localPosition = new Vector3(x, y, 0.0f);
		}


		/*
		 * Adds and sets the parameter values for this training point
		 */
		public void SetParameters(List<BaseInstrumentParam> paramList){
			m_paramValues.Clear();
			foreach(BaseInstrumentParam param in paramList){
				m_paramValues[param] = param.val;	
			}
		}
		
		
		/*
		 * Sets the expected value for a music parameter for this RBF
		 */
		public void SetParameterValue(GenericMusicParam param, float val){
			m_paramValues[param] = val;
		}


		/*
		 * Gesture overrides
		 */
	}
}
