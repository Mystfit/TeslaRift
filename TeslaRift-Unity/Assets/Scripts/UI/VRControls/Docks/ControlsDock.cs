using UnityEngine;
using UI;
using MusicIO;
using System.Collections;
using System.Collections.Generic;

namespace VRControls
{
    public class ControlsDock : RadialDock
    {
        public override void Awake()
        {
            base.Awake();
            AddAcceptedDocktype(typeof(CubeButton));
            AddAcceptedDocktype(typeof(ControlLayout));
            AddAcceptedDocktype(typeof(Picker));
            AddAcceptedDocktype(typeof(DestroyButton));

            DockChildTransforms();

            foreach (BaseVRControl control in DockedChildren)
                control.HideControls();
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            if (base.AddDockableAttachment(attach))
            {
                attach.SetToolmodeResponse(new BaseTool.ToolMode[]{BaseTool.ToolMode.HOVER, BaseTool.ToolMode.SECONDARY});
                return true;
            }
            return false;
        }
    }
}