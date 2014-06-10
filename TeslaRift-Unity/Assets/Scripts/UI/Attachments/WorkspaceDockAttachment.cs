using UnityEngine;
using UI;
using System.Collections;
using System.Collections.Generic;

public class WorkspaceDockAttachment : BaseAttachment {

	public float m_carouselRadius = 1.0f;
	public float m_arcSize = Mathf.PI / 2;
	public float m_minAngle = Mathf.PI * 0.1f;
    public float m_volumetricYOffset = 0.0f;

    protected BaseAttachment m_activeAttachment;
    protected Dictionary<BaseAttachment, GameObject> m_volumetrics;

	// Use this for initialization
	public override void Awake () {
        base.Awake();

		SetAsDock(true);
        AddAcceptedDocktype(typeof(InstrumentAttachment));

        m_volumetrics = new Dictionary<BaseAttachment, GameObject>();
	}

	public override bool AddDockableAttachment (BaseAttachment attach)
	{
        if (base.AddDockableAttachment(attach))
        {
            //attach.rigidbody.velocity = Vector3.zero;
            attach.rigidbody.isKinematic = true;

            InstrumentAttachment instrument = attach as InstrumentAttachment;
			attach.SetToolmodeResponse(new BaseTool.ToolMode[]{
				BaseTool.ToolMode.PRIMARY, 
				BaseTool.ToolMode.GRABBING
			});
            instrument.EnableControls();
			instrument.SetCloneable(false);

            GameObject volumetric = UIFactory.CreateVolumetricCylinder();
            volumetric.transform.position = new Vector3(attach.transform.position.x, m_volumetricYOffset, attach.transform.position.z);
            volumetric.transform.parent = transform;

            iTween.ColorTo(volumetric, iTween.Hash("color", new Color(1.0f, 1.0f, 1.0f, 0.2f), "time", 0.8f));
            m_volumetrics[instrument] = volumetric;

            PlaceObjects();
            //iTween.MoveTo(attach.gameObject, iTween.Hash("position", transform.localPosition, "uselocal", true ));
            return true;
        }
        return false;
	}

	public override void RemoveDockableAttachment (BaseAttachment attach)
	{
		base.RemoveDockableAttachment (attach);
		attach.SetToolmodeResponse(new BaseTool.ToolMode[]{
			BaseTool.ToolMode.GRABBING
		});

        Destroy(m_volumetrics[attach]);

        attach.DisableControls();
		attach.rigidbody.isKinematic = false;
		PlaceObjects();
	}

	public void PlaceObjects(){
		Vector3[] points = Utils.BuildArcPositions(m_carouselRadius, m_arcSize, m_childDockables.Count, m_minAngle, true);
		for(int i = 0; i < points.Length; i++){
			points[i].z = points[i].y;
			points[i].y = 0.0f;
		}

        for (int i = 0; i < m_childDockables.Count; i++)
        {
            iTween.MoveTo(m_childDockables[i].gameObject, iTween.Hash("position", points[i], "time", 0.5f, "islocal", true));
            iTween.MoveTo(m_volumetrics[m_childDockables[i]], iTween.Hash("position", points[i] + new Vector3(0.0f, m_volumetricYOffset, 0.0f), "time", 0.5f, "islocal", true));
        }
	}

    public void InstrumentControlsAreVisible(BaseAttachment attach)
    {
		if (m_activeAttachment != null && attach != m_activeAttachment)
    		m_activeAttachment.HideControls();
        m_activeAttachment = attach;
    }
	
	// Update is called once per frame
	public override void Update () {
	
	}
}
