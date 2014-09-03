using UnityEngine;
using System.Collections;
using MusicIO;
using UI;

namespace VRControls
{
    public class ModeSwitchButton : CubeButton
    {
        public Color m_performColor;
        public Color m_editColor;
        public GameObject m_centerSphere;
        public EditorWorkspace m_workspace;

        public override void Start()
        {
            base.Start();
            SetIsDraggable(false);
            UIController.Instance.SetUIContext(UIController.UIContext.EDITING);

            SetOutlineMat(renderer.material);
        }

        public override void Fire()
        {
            base.Fire();
            animation.Play("button_down");
            UIController.Instance.NextUIContext();
        }

        public override void DockInto(BaseVRControl attach)
        {
            base.DockInto(attach);
            SetToolmodeResponse(new BaseTool.ToolMode[]{BaseTool.ToolMode.PRIMARY, BaseTool.ToolMode.HOVER});
        }



        public override void SetUIContextToEditor()
        {
            if(m_centerSphere != null)
                m_centerSphere.renderer.material.SetColor("_Color", m_editColor);
        }

        public override void SetUIContextToPerformer()
        {
            if(m_centerSphere != null)
                m_centerSphere.renderer.material.SetColor("_Color", m_performColor);
        }
    }
}
