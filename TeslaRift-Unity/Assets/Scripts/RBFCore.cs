using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using DotNumerics.LinearAlgebra;

namespace RBF{
	public class RBFCore{
		
		private int m_numInputDimensions;
		private int m_numOutputDimensions;
		private double m_sigma;
		
		private List<RBFTraining> m_trainingPoints;
		private List<Matrix> m_weights;
		
		public enum DimensionType{ INPUT = 0, OUTPUT};
		
		
		public RBFCore(int numInputDimensions, int numOutputDimensions){
			m_numInputDimensions = numInputDimensions;
			m_numOutputDimensions = numOutputDimensions;
			m_trainingPoints = new List<RBFTraining>();
			m_weights = new List<Matrix>();
		}
		
		
		public void reset(){
			m_numInputDimensions = 0;
			m_numOutputDimensions = 0;
			m_trainingPoints.Clear();
			m_weights.Clear();
		}
		
		
		public void setSigma(double sigma){
			m_sigma = sigma;
		}
		
		
		public void setDimensions(int numInputDimensions, int numOutputDimensions){
			reset ();
			m_numInputDimensions = numInputDimensions;
			m_numOutputDimensions = numOutputDimensions;
		}
		
		
		public void addTrainingPoint(double[] inputDimensions, double[] outputDimensions){
			if(inputDimensions.Length != m_numInputDimensions)
				return;
			if(outputDimensions.Length != m_numOutputDimensions)
				return;
			m_trainingPoints.Add( new RBFTraining(inputDimensions, outputDimensions) );
		}
		
		
		private double[] getDimensionFromGroup(List<RBFTraining> dimGroup, DimensionType dimensionType, int index){
			double[] dimensionValues = new double[dimGroup.Count];
			
			for(int i = 0; i < dimGroup.Count; i++){
				if(dimensionType == DimensionType.INPUT)
					dimensionValues[i] = dimGroup[i].inputDim[index];
				if(dimensionType == DimensionType.OUTPUT)
					dimensionValues[i] = dimGroup[i].outputDim[index];
			}
			
			return dimensionValues;
		}
		
		
		public List<Matrix> calculateWeights(){
			Matrix A = new Matrix(m_trainingPoints.Count);
			
			int i = 0;
			int j = 0;
			
			for(i = 0; i < m_trainingPoints.Count; i++){
				for(j = 0; j < m_trainingPoints.Count; j++){
					double[] distPoints = new double[m_numInputDimensions];
					
					for(int inputIndex = 0; inputIndex < m_numInputDimensions; inputIndex++)
						distPoints[inputIndex] = m_trainingPoints[i].inputDim[inputIndex] - m_trainingPoints[j].inputDim[inputIndex];

					A[i,j] = RBFFunctions.gaussKernel(summedDistance(distPoints) , m_sigma );
				}
			}
			
			Matrix Ainv = A.Inverse();						
			
			for(i = 0; i < m_numOutputDimensions; i++){
				Matrix col = doubleArrayToMatrixColumn(getDimensionFromGroup(m_trainingPoints, DimensionType.OUTPUT, i));
				Matrix mult = Ainv.Multiply( col );
				m_weights.Add( mult );
			}
			
			return m_weights;
		}
		
		
		public Matrix doubleArrayToMatrixColumn(double[] arr){
			Matrix col = new Matrix( m_trainingPoints.Count, 1 );
			for(int i = 0; i < arr.Length; i++)
				col[i,0] = arr[i];
			return col;
		}
		
		public Matrix matrixRotate( Matrix m){
			Matrix outM = new Matrix(m.ColumnCount, m.RowCount);
			for(int i = 0; i < m.RowCount; i++){
				for(int j = 0; j < m.ColumnCount; j++){
					outM[j,i] = m[i,j];
				}
			}
			return outM;
		}
			
		
		public double[] calculateOutput(double[] inputDimValues){
			
			if(inputDimValues.Length != m_numInputDimensions)
				throw new ArgumentOutOfRangeException();
			
			double[] outputValues = new double[m_numOutputDimensions];
			Matrix A = new Matrix( 1, m_trainingPoints.Count);
			
			for(int outputIndex = 0; outputIndex < m_numOutputDimensions; outputIndex++){
				for(int trainingIndex = 0; trainingIndex < m_trainingPoints.Count; trainingIndex++){
					double[] distPoints = new double[m_numInputDimensions];
					
					for(int inputIndex = 0; inputIndex < m_numInputDimensions; inputIndex++)
						distPoints[inputIndex] = inputDimValues[inputIndex] - m_trainingPoints[trainingIndex].inputDim[inputIndex];
					
					A[0,trainingIndex] = RBFFunctions.gaussKernel( summedDistance(distPoints), m_sigma);
				}
								
				Matrix dot = A.Multiply( m_weights[outputIndex] );
				outputValues[outputIndex] = dot[0,0];
			}
			
			return outputValues;
		}
		
		
		public double summedDistance(double[] points){
			double dist = 0.0f;
			
			for(int i = 0; i < points.Length; i++)
				dist += points[i]*points[i];
			
			return Math.Sqrt(dist);
		}
	}
	
	/*
	 * Class representing a training point
	 */
	public class RBFTraining{
		double[] m_inputDimensions;
		double[] m_outputDimensions;
		
		public RBFTraining(double[] inputDimensions, double[] outputDimensions){
			m_inputDimensions = inputDimensions;
			m_outputDimensions = outputDimensions;
		}
		
		public double[] inputDim{ get { return m_inputDimensions; }}
		public double[] outputDim{ get { return m_outputDimensions; }}
	}
	
	
	public static class RBFFunctions{
		public static double gaussKernel(double input, double sigma){
			return Math.Exp( -Math.Pow(input, 2.0) / Math.Pow(sigma,2.0) );
		}
	}
}
		
		
