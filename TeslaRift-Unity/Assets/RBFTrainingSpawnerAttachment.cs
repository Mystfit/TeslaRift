using UnityEngine;
using System.Collections;

public class RBFTrainingSpawnerAttachment : BaseAttachment {

    public RBFSphereAttachment m_rbfSphere;

    public override void Awake()
    {
        base.Awake();

        SetIsDraggable(true);
        SetCloneable(true);
    }

    public override void Gesture_First()
    {
        if (m_mode == BaseTool.ToolMode.GRABBING)
            StartDragging(HydraController.Instance.GetHand(m_hand));
        if (m_mode == BaseTool.ToolMode.PRIMARY)
        {
            if(m_rbfSphere.controlsVisible)
                m_rbfSphere.HideControls();
            else
                m_rbfSphere.ShowControls();
        }
        base.Gesture_First();
    }
}
