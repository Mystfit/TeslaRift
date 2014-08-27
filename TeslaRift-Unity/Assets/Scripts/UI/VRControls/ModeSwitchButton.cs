using UnityEngine;
using System.Collections;
using MusicIO;
using UI;

namespace VRControls
{
    public class ModeSwitchButton : CubeButton
    {
        public EditorWorkspace m_workspace;

        public override void Awake()
        {
            base.Awake();
            SetIsDraggable(false);
        }

        public override void Fire()
        {
            base.Fire();
            animation.Play("button_down");
            UIController.Instance.NextUIContext();
        }
    }
}
