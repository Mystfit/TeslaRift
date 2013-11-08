using System;
using System.Collections;
using System.Collections.Generic;

using DotNumerics.LinearAlgebra;

namespace RBF{
	public class RBFCore{
		
		private int m_numInputDimensions;
		private int m_numOutputDimensions;
		private float m_sigma;
		
		private List<RBFTraining> m_trainingPoints;
		private List<float> m_weights;
		
		public enum DimensionType{ INPUT = 0, OUTPUT};
		
		public RBFCore(int numInputDimensions, int numOutputDimensions){
			m_numInputDimensions = numInputDimensions;
			m_numOutputDimensions = numOutputDimensions;
			m_trainingPoints = new List<RBFTraining>();
			m_weights = new List<float>();
		}
		
		public void reset(){
			m_numInputDimensions = 0;
			m_numOutputDimensions = 0;
			m_trainingPoints.Clear();
			m_weights.Clear();
		}
		
		public void setSigma(float sigma){
			m_sigma = sigma;
		}
		
		public void setDimensions(int numInputDimensions, int numOutputDimensions){
			m_numInputDimensions = numInputDimensions;
			m_numOutputDimensions = numOutputDimensions;
		}
		
		public void addTrainingPoint(float[] inputDimensions, float[] outputDimensions){
			if(inputDimensions.Length != m_numInputDimensions)
				return;
			if(outputDimensions.Length != m_numOutputDimensions)
				return;
			m_trainingPoints.Add( new RBFTraining(inputDimensions, outputDimensions) );
		}
		
		private float[] getDimensionFromGroup(List<RBFTraining> dimGroup, DimensionType dimensionType, int index){
			float[] dimensionValues = new float[dimGroup.Count];
			
			for(int i = 0; i < dimGroup.Count; i++){
				if(dimensionType == DimensionType.INPUT)
					dimensionValues[i] = dimGroup[i].inputDim[index];
				if(dimensionType == DimensionType.OUTPUT)
					dimensionValues[i] = dimGroup[i].outputDim[index];
			}
			
			return dimensionValues;
		}
	}
	
	/*
	 * Class representing a training point
	 */
	public class RBFTraining{
		float[] m_inputDimensions;
		float[] m_outputDimensions;
		
		public RBFTraining(float[] inputDimensions, float[] outputDimensions){
			m_inputDimensions = inputDimensions;
			m_outputDimensions = outputDimensions;
		}
		
		public float[] inputDim{ get { return m_inputDimensions; }}
		public float[] outputDim{ get { return m_outputDimensions; }}
	}
}
		
		
