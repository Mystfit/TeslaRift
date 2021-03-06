﻿using UnityEngine;
using UI;
using Newtonsoft.Json;
using System.Collections;
using System.Collections.Generic;

namespace VRControls
{
    public class TetrahedronBlender : BaseVRControl
    {
        private int m_maxReturns = 4;
        public float m_radius = 1.0f;
        protected float m_closestRadius;

        protected Mesh m_mesh;
        protected GeometryUtils.BaryCentricDistance m_distanceCalculator;
        protected InstrumentOrb m_currentInstrument;
        protected InstrumentOrb m_lastInstrument;
        protected Vector3 m_lastPosition;

        //Get specified corner vertex
        public Vector3 GetCorner(int index) { return m_mesh.vertices[index]; }


        // Use this for initialization
        public override void Awake()
        {
            base.Awake();
            SetAsDock(true);
            SetSoloChildControlsVisible(true);
            SetIsDraggable(true);

            AddAcceptedDocktype(typeof(InstrumentOrb));

            //Mesh building
            m_mesh = BuildTetrahedronMesh(m_radius);
            MeshFilter filter = GetComponent<MeshFilter>();
            filter.mesh = m_mesh;
            MeshCollider col = GetComponent<MeshCollider>();
            col.sharedMesh = m_mesh;
            col.isTrigger = true;

            m_distanceCalculator = new GeometryUtils.BaryCentricDistance(filter);
            m_closestRadius = GeometryUtils.GetClosestTetrahedronDist(m_radius);
        }


        public Mesh BuildTetrahedronMesh(float radius)
        {
            Mesh mesh = new Mesh();
            mesh.vertices = GeometryUtils.BuildTetrahedronVertices(radius);
            mesh.triangles = GeometryUtils.tetrahedronindices;
            mesh.uv = new Vector2[4];
            mesh.RecalculateNormals();
            return mesh;
        }

        public void AddReturnInstrument(InstrumentOrb returnInstrument, int index)
        {
            if (index <= m_maxReturns)
            {
                returnInstrument.EnableControls();
                returnInstrument.SetToolmodeResponse(new BaseTool.ToolMode[1] { BaseTool.ToolMode.PRIMARY });
                returnInstrument.transform.parent = transform;
                returnInstrument.transform.localPosition = GetCorner(index);
                AddChildControl(returnInstrument);
            }
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            if (base.AddDockableAttachment(attach))
            {
                if (m_currentInstrument != null)
                {
                    if (m_currentInstrument != attach)
                    {
                        m_currentInstrument.SetTransient(true);
                        m_currentInstrument.Undock();
                        m_currentInstrument.SetFloating();
                    }
                }

                if (attach == m_lastInstrument)
                {
                    attach.transform.localPosition = m_lastPosition;
                }
                else
                {
                    if (GlobalConfig.Instance.EnableAnimations)
                        iTween.MoveTo(attach.gameObject, iTween.Hash("position", Vector3.zero, "time", 0.2f, "islocal", true));
                    else
                        attach.transform.localPosition = Vector3.zero;
                }

                ShowControls();
                m_currentInstrument = attach as InstrumentOrb;
                m_currentInstrument.SetToolmodeResponse(new BaseTool.ToolMode[0]);
                return true;
            }
            return false;
        }

        public override void RemoveDockableAttachment(BaseVRControl attach)
        {
            if (attach == m_currentInstrument)
            {
                m_lastPosition = m_currentInstrument.transform.localPosition;
                m_lastInstrument = m_currentInstrument;
            }
            base.RemoveDockableAttachment(attach);
        }

        /*
         * Make sure to mark this editor object as permanent
         */
        public override void Undock()
        {
            base.Undock();
            SetAsDock(true);
            SetTransient(false);
        }

        public override void Gesture_First()
        {
            base.Gesture_First();
            if(mode == BaseTool.ToolMode.SECONDARY)
                DisableChildColliders();
            else
                EnableChildColliders();
        }

        public override void Gesture_Exit()
        {
            if (mode == BaseTool.ToolMode.SECONDARY)
                EnableChildColliders();

            base.Gesture_Exit();
        }

        public override void DisableChildColliders()
        {
            base.DisableChildColliders();
            foreach (BaseVRControl attach in ChildControls)
                attach.DisableColliders();
        }

        public override void EnableChildColliders()
        {
            base.EnableChildColliders();
            foreach (BaseVRControl attach in ChildControls)
                attach.EnableColliders();
        }

        public override void Gesture_IdleInterior()
        {
            if (mode == BaseTool.ToolMode.SECONDARY)
                BlendValues();

            base.Gesture_IdleInterior();
        }

        protected void BlendValues()
        {
			if(m_currentInstrument)
			{
	            RaycastHit hit = new RaycastHit();
                Vector3 origin = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(MajorHand));
	            Vector3 dir = (origin * -1.0f).normalized;
	            Vector3 hitPos = origin;

                float dist = Vector3.Distance(HydraController.Instance.GetHandColliderPosition(MajorHand), transform.position);
	            Debug.Log(dist);

	            if (dist > m_closestRadius)
	            {
	                if (collider.Raycast(new Ray(transform.position + origin, dir), out hit, dist))
	                {
	                    Debug.DrawLine(transform.position + origin, hit.point, Color.red);

	                    if (hit.collider == collider)
	                    {
	                        hitPos = transform.InverseTransformPoint(hit.point);
	                        float distanceRatio = Vector3.Distance(origin, Vector3.zero) / m_radius;
	                        Vector3 closestVertex = GeometryUtils.GetClosestVertex(m_mesh, origin);
	                        hitPos = Vector3.Lerp(hitPos, closestVertex, distanceRatio);
	                    }
	                }
	            }
	            else
	            {
	                Debug.DrawLine(transform.position + origin, transform.position, Color.blue);
	            }

	            m_currentInstrument.transform.localPosition = hitPos;

	            //Get coordinate inside blender
	            float[] sendVals = GeometryUtils.BarycentricTetrahedronLerp(
	                GetCorner(0),
	                GetCorner(1),
	                GetCorner(2),
	                GetCorner(3),
	                hitPos);

                for (int i = 0; i < 4; i++)
                    m_currentInstrument.instrumentRef.getSendByName(((InstrumentOrb)ChildControls[i]).instrumentRef.name).setVal(sendVals[i]);	            
			}
        }
    }
}