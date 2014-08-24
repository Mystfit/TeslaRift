using UnityEngine;
using UI;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace VRControls
{
    [JsonConverter(typeof(ControlMatrixSerializer))]
    public class ControlMatrix : BaseVRControl
    {
        public bool m_generateGrid = false;

        public Transform m_cubeParent;
        public int m_cubeWidth = 4;
        public int m_cubeHeight = 4;
        public int m_cubeDepth = 4;
        public float m_cubeSpacingMultiplier = 1.0f;
        protected ClipCubeHolder[, ,] m_cubeHolders;

        public GameObject m_vertLine;
        public GameObject m_depthLine;
        public int[] m_lastMatrixPosition;

        // Use this for initialization
        public override void Awake()
        {
            base.Awake();

            SetAsDock(true);
            SetCollideable(true);
            SetFacingPerformer(true);
            AddAcceptedDocktype(typeof(ClipCube));
            AddAcceptedDocktype(typeof(ValueTrigger));

            m_cubeHolders = new ClipCubeHolder[m_cubeDepth, m_cubeHeight, m_cubeWidth];

            //Build anchors
            for (int x = 0; x < m_cubeDepth; x++)
            {
                for (int y = 0; y < m_cubeHeight; y++)
                {
                    for (int z = 0; z < m_cubeWidth; z++)
                    {
                        Transform cubePlaceholder;
                        if (m_generateGrid)
                        {
                            cubePlaceholder = UIFactory.CreateClipPlaceholder().transform;
                            cubePlaceholder.position = m_cubeParent.position;
                            cubePlaceholder.parent = m_cubeParent;
                            cubePlaceholder.localPosition = new Vector3(x * m_cubeSpacingMultiplier, y * m_cubeSpacingMultiplier, z * m_cubeSpacingMultiplier);
                        }
                        else
                        {
                            cubePlaceholder = m_cubeParent.GetChild((x * m_cubeDepth * m_cubeHeight) + (y * m_cubeHeight) + z);
                        }
                        ClipCubeHolder holder = new ClipCubeHolder();
                        holder.placeholder = cubePlaceholder;
                        holder.x = x;
                        holder.y = y;
                        holder.z = z;
                        m_cubeHolders[x, y, z] = holder;
                    }
                }
            }
        }

        public ClipCubeHolder[, ,] GetCubeArray { get { return m_cubeHolders;} }

        public ClipCubeHolder GetCubeHolder(int x, int y, int z)
        {
            //return m_cubePlaceholders[(z * m_cubeWidth * m_cubeHeight) + (y * m_cubeHeight) + x];
            return m_cubeHolders[x, y, z];
        }

        public ClipCubeHolder FindClosestHolder(Vector3 position)
        {
            float closestDist = -1.0f;
            ClipCubeHolder closestHolder = null;

            foreach (ClipCubeHolder holder in m_cubeHolders)
            {
                float dist = Vector3.Distance(holder.placeholder.position, position);
                if (closestDist < 0 || dist < closestDist)
                {
                    closestHolder = holder;
                    closestDist = dist;
                }
            }
            //return m_cubeHolders[Mathf.RoundToInt(position.z), Mathf.RoundToInt(position.y), Mathf.RoundToInt(position.x)];
            return closestHolder;
        }

        public ClipCubeHolder FindAttachmentHolder(BaseVRControl attach)
        {
            foreach (ClipCubeHolder holder in m_cubeHolders)
            {
                if (holder.attach == attach)
                    return holder;
            }
            return null;
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            if (base.AddDockableAttachment(attach))
            {
                ClipCubeHolder holder = FindClosestHolder(attach.transform.position);
                if (holder.attach == null)
                {
                    attach.SetCloneable(false);
                    holder.attach = attach;
                    attach.transform.parent = holder.placeholder;
                    iTween.MoveTo(attach.gameObject, iTween.Hash("position", Vector3.zero, "islocal", true, "time", 0.5f));
                    attach.transform.rotation = holder.placeholder.rotation;
                    return true;
                }
            }
            return false;
        }

        public override void Undock()
        {
            base.Undock();
            SetAsDock(true);
            SetTransient(false);
        }

        public override void RemoveDockableAttachment(BaseVRControl attach)
        {
            base.RemoveDockableAttachment(attach);
            attach.transform.parent = null;
            ClipCubeHolder holder = FindAttachmentHolder(attach);
            if (holder != null)
                holder.attach = null;
        }

        public override void Maximize()
        {
            base.Maximize();
            SetAsDock(true);
            SetToolmodeResponse(new BaseTool.ToolMode[]{
                BaseTool.ToolMode.PLAY1,
                BaseTool.ToolMode.PLAY2,
                BaseTool.ToolMode.PLAY3,
                BaseTool.ToolMode.PLAY4,
                BaseTool.ToolMode.GRABBING,
                BaseTool.ToolMode.HOVER
            });
        }

        public override void Minimize()
        {
            base.Minimize();
            SetAsDock(false);   
            SetToolmodeResponse(new BaseTool.ToolMode[]{
                BaseTool.ToolMode.GRABBING,
                BaseTool.ToolMode.HOVER
            });
        }

        public override void Gesture_First()
        {
            base.Gesture_First();
            if (mode == BaseTool.ToolMode.GRABBING)
                StartDragging(HydraController.Instance.GetHand(ActiveHand));
            
            UpdateMatrixPosition();

            if (mode == BaseTool.ToolMode.PLAY1)
                TriggerClip(m_lastMatrixPosition, 0);
            else if (mode == BaseTool.ToolMode.PLAY2)
                TriggerClip(m_lastMatrixPosition, 1);
            else if (mode == BaseTool.ToolMode.PLAY3)
                TriggerClip(m_lastMatrixPosition, 2);
            else if (mode == BaseTool.ToolMode.PLAY4)
                TriggerClip(m_lastMatrixPosition, 3);
            
        }


        public override void Gesture_IdleInterior()
        {
            base.Gesture_IdleInterior();
            UpdateMatrixPosition();
        }

        public void UpdateMatrixPosition()
        {
            int[] matrixPos = GetPositionInMatrix(HydraController.Instance.GetHandColliderPosition(ActiveHand));
            
			if (!Enumerable.SequenceEqual(matrixPos, m_lastMatrixPosition))
			{
				Vector3 vertPos = new Vector3(-0.15f, ((float)matrixPos[0]) / (float)(m_cubeSpacingMultiplier * m_cubeWidth), 0.1f);
				Vector3 depthPos = new Vector3(-0.15f, -0.4f, ((float)matrixPos[2]) / (float)(m_cubeSpacingMultiplier * m_cubeDepth));

                iTween.MoveTo(m_vertLine, iTween.Hash("position", vertPos, "time", 0.1f, "easetype", "easeOutCubic", "islocal", true));
                iTween.MoveTo(m_depthLine, iTween.Hash("position", depthPos, "time", 0.1f, "easetype", "easeOutCubic", "islocal", true));

                for (int x = 0; x < m_cubeDepth; x++)
                {
                    for (int y = 0; y < m_cubeHeight; y++)
                    {
                        for (int z = 0; z < m_cubeWidth; z++)
                        {
							ClipCubeHolder holder = GetCubeHolder(x, matrixPos[1], matrixPos[2]);

                            if (x == matrixPos[0])
                            {
                                if (holder.attach != null)
                                    holder.attach.SetSelected(true);
                            }
                            else
                            {
                                if (holder.attach != null)
                                    holder.attach.SetSelected(false);
                            }
                        }
                    }
                }
				m_lastMatrixPosition = matrixPos;
            }
        }

        public void TriggerClip(int[] coords, int trigger)
        {
            Debug.Log("Firing " + trigger + "," + coords[1] + "," + coords[2]);
            ClipCubeHolder holder = GetCubeHolder(trigger, coords[1], coords[2]);
            if (holder.attach != null)
				holder.attach.Fire();
        }

        protected int[] GetPositionInMatrix(Vector3 hand)
        {
            int[] triggered = new int[3];
            Vector3 handLocal = transform.InverseTransformPoint(hand);

            triggered[0] = Mathf.RoundToInt(
                    Mathf.Clamp(
                        Utils.Remap(handLocal.x, interiorTrigger.GetSize().x * -0.5f, interiorTrigger.GetSize().x * 0.5f, 0.0f, 1.0f) * m_cubeWidth,
                        0.0f,
                        m_cubeWidth-1)
            );
			triggered[1] = Mathf.RoundToInt(
                    Mathf.Clamp(
                        Utils.Remap(handLocal.y, interiorTrigger.GetSize().y * -0.5f, interiorTrigger.GetSize().y * 0.5f, 0.0f, 1.0f) * m_cubeHeight,
                        0.0f,
                        m_cubeHeight-1)
            );
			triggered[2] = Mathf.RoundToInt(
                        Mathf.Clamp(
                            Utils.Remap(handLocal.z, interiorTrigger.GetSize().z * -0.5f, interiorTrigger.GetSize().x * 0.5f, 0.0f, 1.0f) * m_cubeWidth,
                            0.0f,
                            m_cubeDepth-1)
                );
			Debug.Log("x:" + triggered[0] + "y:" + triggered[1] + "z:" + triggered[2]);
            return triggered;
        }
    }


    public class ClipCubeHolder
    {
        public Transform placeholder;
        public BaseVRControl attach;
        public int x;
        public int y;
        public int z;
    }
}