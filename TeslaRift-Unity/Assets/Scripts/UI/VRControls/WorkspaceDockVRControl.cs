﻿using UnityEngine;
using UI;
using MusicIO;
using System.Collections;
using System.Collections.Generic;

namespace VRControls
{
    public class WorkspaceDockVRControl : BaseVRControl
    {

        public float m_carouselRadius = 1.0f;
        public float m_arcSize = Mathf.PI / 2;
        public float m_minAngle = Mathf.PI * 0.1f;
        public float m_volumetricYOffset = 0.0f;
        protected Dictionary<BaseVRControl, GameObject> m_volumetrics;

        // Use this for initialization
        public override void Awake()
        {
            base.Awake();

            SetAsDock(true);
            SetSoloChildControlsVisible(true);
            AddAcceptedDocktype(typeof(InstrumentVRControl));

            m_volumetrics = new Dictionary<BaseVRControl, GameObject>();
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            InstrumentVRControl instrument = attach as InstrumentVRControl;
            if (!DockContainsInstrument(instrument.musicRef))
            {
                if (base.AddDockableAttachment(instrument))
                {
                    //attach.rigidbody.velocity = Vector3.zero;
                    instrument.rigidbody.isKinematic = true;
                    instrument.SetToolmodeResponse(new BaseTool.ToolMode[]{
					        BaseTool.ToolMode.PRIMARY, 
					        BaseTool.ToolMode.GRABBING,
	                        BaseTool.ToolMode.HOVER,
	                        BaseTool.ToolMode.SECONDARY
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
            }
            instrument.SetFloating();
            return false;
        }

        public bool DockContainsInstrument(Instrument musicRef)
        {
            if (m_childDockables != null)
            {
                foreach (InstrumentVRControl attach in m_childDockables)
                {
                    if (attach.musicRef != null)
                    {
                        if (attach.musicRef == musicRef)
                            return true;
                    }
                }
            }
            return false;
        }

        public override void RemoveDockableAttachment(BaseVRControl attach)
        {
            base.RemoveDockableAttachment(attach);
            attach.SetToolmodeResponse(new BaseTool.ToolMode[]{
			    BaseTool.ToolMode.GRABBING
		    });

            Destroy(m_volumetrics[attach]);

            attach.DisableControls();
            attach.rigidbody.isKinematic = false;
            PlaceObjects();
        }

        public void PlaceObjects()
        {
            Vector3[] points = GeometryUtils.BuildArcPositions(m_carouselRadius, m_arcSize, m_childDockables.Count, m_minAngle, true);
            for (int i = 0; i < points.Length; i++)
            {
                points[i].z = points[i].y;
                points[i].y = 0.0f;
            }

            for (int i = 0; i < m_childDockables.Count; i++)
            {
                iTween.MoveTo(m_childDockables[i].gameObject, iTween.Hash("position", points[i], "time", 0.5f, "islocal", true));
                iTween.MoveTo(m_volumetrics[m_childDockables[i]], iTween.Hash("position", points[i] + new Vector3(0.0f, m_volumetricYOffset, 0.0f), "time", 0.5f, "islocal", true));
            }
        }
    }
}