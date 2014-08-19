using UnityEngine;
using System.Collections;

namespace VRControls
{
    public class RBFTrainingSpawner : BaseVRControl
    {

        public RBFSphere m_rbfSphere1;
        public RBFSphere m_rbfSphere2;
        public Color m_editingColor;
        public Color m_performingColor;
        public GameObject m_centerLight;

        public override void Awake()
        {
            base.Awake();

            SetIsDraggable(true);
            SetCloneable(true);

            ShowControls();
        }

        public override void Gesture_First()
        {
            if (mode == BaseTool.ToolMode.GRABBING)
                StartDragging(HydraController.Instance.GetHand(ActiveHand));
            if (mode == BaseTool.ToolMode.PRIMARY)
                ToggleControls();

            base.Gesture_First();
        }

        public override void ShowControls()
        {
            base.ShowControls();
            if (m_rbfSphere1 != null)
                m_rbfSphere1.ShowControls();
            if (m_rbfSphere2 != null)
                m_rbfSphere2.ShowControls();
            iTween.ColorTo(m_centerLight, iTween.Hash("color", m_editingColor, "time", 0.2f));
        }

        public override void HideControls()
        {
            base.HideControls();
            if (m_rbfSphere1 != null)
                m_rbfSphere1.HideControls();
            if (m_rbfSphere2 != null)
                m_rbfSphere2.HideControls();
            iTween.ColorTo(m_centerLight, iTween.Hash("color", m_performingColor, "time", 0.2f));
        }
    }
}
