using UnityEngine;
using System.Collections;
using MusicIO;
using UI;

namespace VRControls
{
    public class DestroyButton : BaseVRControl
    {
        public override void Start()
        {
            base.Start();
            //UIController.Instance.SetUIContext(UIController.UIContext.EDITING);
            AddGroupDocktype(EditorWorkspace.EditorTypes);
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            if (base.AddDockableAttachment(attach))
            {
                UIController.Instance.DestroyControl(attach);
                return true;
            };
            return false;
        }

        public override void SetUIContextToEditor()
        {
            EnableControls();
        }

        public override void SetUIContextToPerformer()
        {
            DisableControls();
        }
    }
}
