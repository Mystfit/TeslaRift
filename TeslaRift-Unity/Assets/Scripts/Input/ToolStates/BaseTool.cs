using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class BaseTool {
	
	protected List<BaseInstrumentParam> m_targetParameters = null;
	
	public BaseTool(){
	}
	
	public List<BaseInstrumentParam> targets {
		get {
			return m_targetParameters;
		}
	}
	
	public void setTargets<T>(T targetParam){
		List<object> valueList = new List<object>();
		valueList.Add(targetParam);
		this.setTargets(valueList);
	}
	
	public void setTargets(List<BaseInstrumentParam> targetParams){
		m_targetParameters = targetParams;
	}
	
	public BaseInstrumentParam getTargetByName(string name){
		BaseInstrumentParam result = null;
		foreach( BaseInstrumentParam param in m_targetParameters){
			if(param.name == name){
				result = param;
			}
		}
		return result;
	}

	
	// Update is called once per frame
	public virtual void update () {
	}
}
