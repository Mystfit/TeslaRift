using UnityEngine;
using System.Collections;

public class InstrumentListener : OSCListener {

	public bool useProjectPrefix;
	protected string m_instrumentName;

	public void SetPrefixedOSCAddresses(string instrumentName){
		string[] prefixedAddress;
		
		if(useProjectPrefix){
			prefixedAddress = new string[m_address.Length];
			
			for(int i = 0; i < m_address.Length; i++)
				prefixedAddress[i] =  "/" + OSCcontroller.Instance.serverName + "/" + GlobalConfig.Instance.ProjectSourceName + "/" + instrumentName + "/" + m_address[i];
			
		} else {
			prefixedAddress = m_address;
		}
		
		m_address = prefixedAddress;

		Init();
	}
}
