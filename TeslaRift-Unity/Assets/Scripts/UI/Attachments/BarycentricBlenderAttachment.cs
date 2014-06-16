using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class BarycentricBlenderAttachment : BaseAttachment {

    public string[] m_channelNames;
    protected List<Vector2> m_points;

	// Use this for initialization
    public override void Awake()
    {
		base.Awake();
        SetAsDock(true);
	    AddAcceptedDocktype(typeof(InstrumentAttachment));
	}

    public override bool AddDockableAttachment(BaseAttachment attach)
    {
        if (base.AddDockableAttachment(attach))
        {

            return true;
        }
        return false;
    }
}
