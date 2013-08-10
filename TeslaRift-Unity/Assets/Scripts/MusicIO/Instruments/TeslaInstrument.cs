using UnityEngine;
using System.Collections;

public class TeslaInstrument : BaseInstrument {
	
	public TeslaInstrument(string instrumentName, string instrumentOwner, string instrumentClient) 
		: base(instrumentName, instrumentOwner, instrumentClient)
	{
	}
	
	public override void processParameters(){
		base.processParameters();
	}

}
