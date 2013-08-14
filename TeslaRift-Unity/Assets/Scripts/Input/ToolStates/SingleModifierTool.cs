using System;
using System.Collections.Generic;


public class SingleModifierTool : BaseTool
{
	private float m_singleParameterValue = 0.0f;
	
	public SingleModifierTool () : base()
	{
		m_singleParameterValue = 0.5f;
	}
	
	public override void Update()
	{
		base.Update();
	}
}


