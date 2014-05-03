using UnityEngine;
using System.Collections;
using System.Collections.Generic;


namespace MusicIO
{

	//**
	//	Instrument Params class
	// 
	// - Definition of one parameter for an external instrument
	//
	//**
	public class BaseInstrumentParam : BaseMusicObject {
		
		protected string m_name = "";
		protected string m_deviceName = "";
		protected float m_fValue = 0.0f;
		protected float m_valMin = 0.0f;
		protected float m_valMax = 1.0f;
		protected float m_overrideValue = 0.0f;
		protected BaseInstrument m_owner = null;
		protected bool m_enabled = true;
		protected bool m_isMidiNoteParam = false;
		protected bool m_isDirty = false;
		protected int m_deviceIndex;
		protected int m_parameterIndex;
		
		protected BaseGenerator m_generatorInput;
	
		//OSC addresses
		protected bool m_expectingReturnMessage = false;
        
        //Initialization
        public BaseInstrumentParam(string name, BaseInstrument paramOwner, float min, float max)
        {
            init(name, paramOwner, min, max, -1, -1);
        }

		public BaseInstrumentParam(string name, BaseInstrument paramOwner, float min, float max, int deviceIndex, int parameterIndex){
            init(name, paramOwner, min, max, deviceIndex, parameterIndex);
		}

        private void init(string name, BaseInstrument paramOwner, float min, float max, int deviceIndex, int parameterIndex)
        {
            m_name = name;
            m_valMin = min;
            m_valMax = max;
            m_owner = paramOwner;
            m_deviceIndex = deviceIndex;
            m_parameterIndex = parameterIndex;
            m_generators = new List<BaseGenerator>();
        }
		
		//Getters / Setters
		public int deviceIndex{get {return m_deviceIndex;}}
		public int parameterIndex{ get {return m_parameterIndex; }}
		public string name{	get { return m_name; } }
		public string deviceName{ get { return m_deviceName; } }
		public void setDeviceName(string name){m_deviceName = name; }
		public BaseInstrument owner{ get { return m_owner; } }
		public float val { get { return m_fValue; }	}
		public float scaledVal{ get { return Utils.Remap(m_fValue, 0.0f, 1.0f, m_valMin, m_valMax); }}

        public void setScaledVal(float value) { setScaledVal(value, false); }
        public void setScaledVal(float value, bool silent) { setVal(Utils.Remap(value, m_valMin, m_valMax, 0.0f, 1.0f), silent); }

        public virtual void setVal(float value){ setVal(value, false); }
        public virtual void setVal(float value, bool silent){ 
            if(!silent)
			    m_isDirty = true;
			m_fValue = value; 
		}
		public void setOverrideVal(float val){
			m_isDirty = true;
			m_overrideValue = val;
		}
		public bool isDirty { get { return m_isDirty; } }
		public void setClean(){ m_isDirty = false; }
		public bool enabled{ get { return m_enabled; } }
		public virtual void setEnabled(bool value){	
			m_enabled = value;
		}
		
		
		//Generator references
		//--------------------
		protected List<BaseGenerator> m_generators;
		
		public void attachGenerator(BaseGenerator generator){
			m_generators.Add(generator);
		}
		
		public void removeGenerators(){
			for(int i = 0; i < m_generators.Count; i++){
				removeGenerator(m_generators[i]);
			}
		}
		public void removeGenerator(BaseGenerator generator){
			m_generators.Remove(generator);
		}
		
		public void UpdateGenerators(){
			float summedGenerators = 0.0f;
			
			foreach(BaseGenerator gen in m_generators)
				summedGenerators += gen.val;
			
			if(m_generators.Count > 0)
				setVal(summedGenerators * m_overrideValue);
		}	
	}
}