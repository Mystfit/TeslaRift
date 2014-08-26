using UnityEngine;
using UI;
using MusicIO;
using System.Collections;
using System.Collections.Generic;

namespace VRControls
{
    public class RadialDock : BaseVRControl
    {
        public float m_carouselRadius = 1.0f;
        public float m_arcSize = Mathf.PI / 2;
        public float m_minAngle = Mathf.PI * 0.1f;
        public float m_volumetricYOffset = 0.0f;
        public float m_minimumHandDistance = 0.2f;
        public bool m_hideControlsWhenLeaving = true;
        protected Dictionary<BaseVRControl, GameObject> m_volumetrics;

        // Use this for initialization
        public override void Awake()
        {
            base.Awake();
            SetIsDockable(true);
            SetAsDock(true);
            SetSoloChildControlsVisible(true);

            m_volumetrics = new Dictionary<BaseVRControl, GameObject>();
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            if (base.AddDockableAttachment(attach))
            {
                attach.EnableControls();
                attach.SetCloneable(false);

                GameObject volumetric = UIFactory.CreateVolumetricCylinder();
                volumetric.transform.position = new Vector3(attach.transform.position.x, m_volumetricYOffset, attach.transform.position.z);
                volumetric.transform.parent = transform;
                
                Vector3 scaleVec = volumetric.transform.localScale;
                scaleVec.y = 0.0f;
                volumetric.transform.localScale = scaleVec;
                volumetric.SetActive(false);

                iTween.ColorTo(volumetric, iTween.Hash("color", new Color(1.0f, 1.0f, 1.0f, 0.2f), "time", 0.8f));
                m_volumetrics[attach] = volumetric;

                PlaceObjects();
                return true;
            }
            attach.SetFloating();
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
            PlaceObjects();
        }

        public override void ChildAttachmentOpeningControls(BaseVRControl attach)
        {
            HideVolumetric(visibleControls);
            base.ChildAttachmentOpeningControls(attach);
            ShowVolumetric(visibleControls);
        }


        private void ShowVolumetric(BaseVRControl attach)
        {
            if (attach != null)
            {
                if (m_volumetrics.ContainsKey(attach))
                {
                    m_volumetrics[attach].SetActive(true);
                    iTween.ScaleTo(m_volumetrics[attach], iTween.Hash("scale", UIFactory.VolumetricCylinderScale, "time", 0.3f));
                }
            }
        }


        private void HideVolumetric(BaseVRControl attach)
        {
            if (attach != null)
            {
                if (m_volumetrics.ContainsKey(attach))
                {
                    iTween.ScaleTo(m_volumetrics[attach], iTween.Hash(
                        "scale", new Vector3(m_volumetrics[attach].transform.localScale.x,0.0f,m_volumetrics[attach].transform.localScale.z),
                        "time", 0.3f,
                        "oncomplete", "HideVolumetricComplete",
                        "oncompletetarget", this.gameObject,
                        "oncompleteparams", m_volumetrics[attach]));
                }
            }
        }

        private void HideVolumetricComplete(Object param)
        {
            ((GameObject)param).SetActive(false);
        }

        public void PlaceObjects()
        {
            Vector3[] points = GeometryUtils.BuildArcPositions(m_carouselRadius, m_arcSize, DockedChildren.Count, m_minAngle, -Mathf.PI * 0.5f, true);
            for (int i = 0; i < points.Length; i++)
            {
                points[i].z = points[i].y;
                points[i].y = 0.0f;
            }

            for (int i = 0; i < DockedChildren.Count; i++)
            {
                iTween.MoveTo(DockedChildren[i].gameObject, iTween.Hash("position", points[i], "time", 0.5f, "islocal", true));
                //iTween.ScaleTo(m_volumetrics[DockedChildren[i]], iTween.Hash("scale", UIFactory.VolumetricCylinderScale, "time", 0.5f));
                m_volumetrics[DockedChildren[i]].transform.localPosition = points[i] + new Vector3(0.0f, m_volumetricYOffset, 0.0f);
                //iTween.MoveTo(m_volumetrics[m_childDockables[i]], iTween.Hash("position", points[i] + new Vector3(0.0f, m_volumetricYOffset, 0.0f), "time", 0.5f, "islocal", true));
            }
        }

        public override void Update()
        {
 	        base.Update();
            if(m_hideControlsWhenLeaving)
                HideInactiveMenuControls();
        }

        protected void HideInactiveMenuControls()
        {
            Vector3 handPosition = HydraController.Instance.GetHandColliderPosition(ActiveHand);
            Vector3 controlPosition;
            if (visibleControls != null)
            {
                controlPosition = visibleControls.transform.position;

                //Flatten control and hand positions so we're only checking distance on a 2D plane
                handPosition.y = 0.0f;
                controlPosition.y = 0.0f;

                float distance = Vector3.Distance(handPosition, controlPosition);

                if (distance > m_minimumHandDistance)
                {
                    HideChildControls();
                    HideVolumetric(visibleControls);
                }
            }
        }
    }
}