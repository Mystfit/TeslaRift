using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class BaseTool {
	
	protected List<object> m_targets = null;
	
	public BaseTool(){
		m_targets = new List<object>();
	}
	
	public List<object> targets {
		get {
			return m_targets;
		}
	}
	
	public void setTargets<T>(T target){
		List<object> valueList = new List<object>();
		valueList.Add(target);
		this.setTargets(valueList);
	}
	
	public void setTargets(List<object> targets){
		m_targets = targets;
	}
	
	// Update is called once per frame
	public virtual void Update () {
	}
}
