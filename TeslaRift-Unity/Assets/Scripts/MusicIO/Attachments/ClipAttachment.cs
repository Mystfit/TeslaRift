using UnityEngine;
using System.Collections;
using MusicIO;
	
public class FloatingAttachment : BaseAttachment<BaseInstrumentParam> {
	
	void Update () {
	}
	
	public override void Init (BaseInstrumentParam managedReference)
	{
		base.Init (managedReference);
	}

	
	//Tool interface implementations
	//-----------------------------------
	
	/*
	 * Handles code for the mode of the interacting tool
	 */
	public override void SetToolMode(BaseTool.ToolMode mode){
		base.SetToolMode(mode);
	}
}
	
	
	