using UnityEngine;
using UI;
using System.Collections;
using System.Collections.Generic;

namespace VRControls
{
    public class ControlMatrix : BaseVRControl
    {
        public Transform m_cubeParent;
        public int m_cubeWidth = 4;
        public int m_cubeHeight = 4;
        public int m_cubeDepth = 4;
        public float m_cubeSpacingMultiplier = 1.0f;
        protected ClipCubeHolder[, ,] m_cubeHolders;

        // Use this for initialization
        public override void Awake()
        {
            base.Awake();

            SetAsDock(true);
            SetCollideable(true);
            AddAcceptedDocktype(typeof(ClipCube));
            AddAcceptedDocktype(typeof(ValueTrigger));

            m_cubeHolders = new ClipCubeHolder[m_cubeDepth, m_cubeHeight, m_cubeWidth];

            for (int x = 0; x < m_cubeDepth; x++)
            {
                for (int y = 0; y < m_cubeHeight; y++)
                {
                    for (int z = 0; z < m_cubeWidth; z++)
                    {
                        Transform cubePlaceholder = UIFactory.CreateClipPlaceholder().transform;
                        cubePlaceholder.position = m_cubeParent.position;
                        cubePlaceholder.parent = m_cubeParent;
                        cubePlaceholder.localPosition = new Vector3(x * m_cubeSpacingMultiplier, y * m_cubeSpacingMultiplier, z * m_cubeSpacingMultiplier);

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

        public override void RemoveDockableAttachment(BaseVRControl attach)
        {
            base.RemoveDockableAttachment(attach);
            attach.transform.parent = null;
            ClipCubeHolder holder = FindAttachmentHolder(attach);
            if (holder != null)
                holder.attach = null;
        }

        public override void Gesture_First()
        {
            base.Gesture_First();
            int[] matrixPosition = GetPositionInMatrix(HydraController.Instance.GetHandColliderPosition(m_hand));

            if (mode == BaseTool.ToolMode.PLAY1)
            {
                TriggerClip(matrixPosition, 0);
            }
            else if (mode == BaseTool.ToolMode.PLAY2)
            {
                TriggerClip(matrixPosition, 1);
            }
            else if (mode == BaseTool.ToolMode.PLAY3)
            {
                TriggerClip(matrixPosition, 2);
            }
            else if (mode == BaseTool.ToolMode.PLAY4)
            {
                TriggerClip(matrixPosition, 3);
            }
        }

        public void TriggerClip(int[] coords, int trigger)
        {
            ClipCubeHolder holder = GetCubeHolder(trigger, coords[1], coords[2]);
            if (holder.attach != null)
				holder.attach.musicRef.Send();
        }


        public override void Gesture_IdleInterior()
        {
            base.Gesture_IdleInterior();
        }

        protected int[] GetPositionInMatrix(Vector3 hand)
        {
            int[] triggered = new int[3];
            Vector3 handLocal = transform.InverseTransformPoint(hand);

            triggered[0] = Mathf.FloorToInt(
                    Mathf.Clamp(
                        Utils.Remap(handLocal.x, interiorTrigger.GetSize().x * -0.5f, interiorTrigger.GetSize().x * 0.5f, 0.0f, 1.0f) * m_cubeWidth,
                        0.0f,
                        m_cubeWidth)
            );
            triggered[1] = Mathf.FloorToInt(
                    Mathf.Clamp(
                        Utils.Remap(handLocal.y, interiorTrigger.GetSize().y * -0.5f, interiorTrigger.GetSize().y * 0.5f, 0.0f, 1.0f) * m_cubeHeight,
                        0.0f,
                        m_cubeHeight)
            );
            triggered[2] = Mathf.FloorToInt(
                        Mathf.Clamp(
                            Utils.Remap(handLocal.z, interiorTrigger.GetSize().z * -0.5f, interiorTrigger.GetSize().x * 0.5f, 0.0f, 1.0f) * m_cubeWidth,
                            0.0f,
                            m_cubeDepth)
                );

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