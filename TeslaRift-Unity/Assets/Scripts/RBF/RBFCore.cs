/*
 * RBF CORE
 * 
 * Radial Basis Function interpolator engine.
 * Uses training points of input/output values to interpolate between given inputs
 * Ported from python 
 * 
 * IMPLEMENTATION:
 *  
 *      RBF.RBFCore rbf = new RBF.RBFCore(3, 2);
 *      rbf.setSigma(2.0);
 *      rbf.addTrainingPoint( new double[3]{1.0,1.0,1.0}, new double[2]{1.0, 2.0} );
 *      rbf.addTrainingPoint( new double[3]{2.5,1.5,7}, new double[2]{2, 3.0} );
 *      rbf.addTrainingPoint( new double[3]{5,10,0}, new double[2]{10, 5.0} );
 *      rbf.addTrainingPoint( new double[3]{6,2,1}, new double[2]{10, 5.0});
 *      rbf.calculateWeights();
 *      double[] output = rbf.calculateOutput(new double[3]{1.0,1.0,1.0});
 */     

using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using DotNumerics.LinearAlgebra;

namespace RBF{
    public class RBFCore{
        
        private double m_sigma;                         //Sigma value for gaussian RBF function
        private List<RBFTraining> m_trainingPoints;     //Training points
        private List<Matrix> m_weights;                 //Weights for curve from training points
        private int m_numInputDimensions;       
        private int m_numOutputDimensions;      

        public enum DimensionType{ INPUT = 0, OUTPUT};  
        
        
        /*
         * Constructor
         */
        public RBFCore(int numInputDimensions, int numOutputDimensions){
            m_numInputDimensions = numInputDimensions;
            m_numOutputDimensions = numOutputDimensions;
            m_trainingPoints = new List<RBFTraining>();
            m_weights = new List<Matrix>();
        }
        
        
        /*
         * Reset the RBF
         */
        public void reset(int numInputDimensions, int numOutputDimensions){
            m_numInputDimensions = numInputDimensions;
            m_numOutputDimensions = numOutputDimensions;    
            m_trainingPoints.Clear();
            m_weights.Clear();
        }
                
        
        /*
         * Adds a new training point
         * Only accepts training points that match the current input/output dimensions of the RBF
         */
        public void addTrainingPoint(double[] inputDimensions, double[] outputDimensions){
            if(inputDimensions.Length != m_numInputDimensions)
                return;
            if(outputDimensions.Length != m_numOutputDimensions)
                return;
            m_trainingPoints.Add( new RBFTraining((double[])inputDimensions.Clone(), (double[])outputDimensions.Clone()) );
        }
        
        
        /*
         * Returns every specific index from an input/output list
         */
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
        
        
        /*
         * Calculate weight values from training points
         */
        public List<Matrix> calculateWeights(){
            Matrix A = new Matrix(m_trainingPoints.Count);
            
            int i = 0;
            int j = 0;
            
            //Constructs A matrix using RBF function (gaussian)
            for(i = 0; i < m_trainingPoints.Count; i++){
                for(j = 0; j < m_trainingPoints.Count; j++){
                    double[] distPoints = new double[m_numInputDimensions];
                    
                    for(int inputIndex = 0; inputIndex < m_numInputDimensions; inputIndex++)
                        distPoints[inputIndex] = m_trainingPoints[i].inputDim[inputIndex] - m_trainingPoints[j].inputDim[inputIndex];
                    
                    A[i,j] = RBFFunctions.gaussKernel(summedDistance(distPoints) , m_sigma );
                }
            }
            
            Matrix Ainv = A.Inverse();                      
            
            //Get weights from inverse A matrix and training outputs
            for(i = 0; i < m_numOutputDimensions; i++){
                double[] groupDim = getDimensionFromGroup(m_trainingPoints, DimensionType.OUTPUT, i);
                
                //Converts double array to single column matrix
                Matrix col = new Matrix( m_trainingPoints.Count, 1 );
                for(j = 0; j < groupDim.Length; j++)
                    col[j,0] = groupDim[j];
                
                Matrix mult = Ainv.Multiply( col );
                m_weights.Add( mult );
            }
                        
            return m_weights;
        }
        
        
        /*
         * Calculate outputs from given inputs using calculated weights
         */
        public double[] calculateOutput(double[] inputDimValues){
            
            //Only accepts the same number of input values as the RBF will take
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
        
        
        /*
         * Sums the distance between each point in a list of points
         */
        public double summedDistance(double[] points){
            double dist = 0.0f;
            
            for(int i = 0; i < points.Length; i++)
                dist += points[i]*points[i];
            
            return Math.Sqrt(dist);
        }
        
        
        //Getters
        //---------------------
        
        /*
         * Expected number of input dimensions
         */
        public int numInputs{ get { return m_numInputDimensions; }}
        
        /*
         * Expected number of output dimensions
         */
        public int numOutputs{ get { return m_numOutputDimensions; }}
        
        /*
         * Sigma value for gaussian interpolation
         */
        public void setSigma(double sigma){ 
            m_sigma = sigma; 
            if(m_trainingPoints.Count > 0)
                calculateWeights();
        }

        /*
         * Reference to training point list
         */
        public List<RBFTraining> trainingPoints{ get { return m_trainingPoints; }}
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
    
    
    /*
     * RBF functions
     */
    public static class RBFFunctions{
        public static double gaussKernel(double input, double sigma){
            return Math.Exp( -Math.Pow(input, 2.0) / Math.Pow(sigma,2.0) );
        }
    }
}
        
        
