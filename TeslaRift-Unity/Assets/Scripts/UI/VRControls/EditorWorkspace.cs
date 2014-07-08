using UnityEngine;
using UI;
using MusicIO;
using System.Collections;

namespace VRControls
{
    public class EditorWorkspace : BaseVRControl
    {
        public override void Awake()
        {
            m_id = (int)VRControls.StaticIds.EDITOR_DOCK;

            base.Awake();

            SetIsSerializeable(false);
            SetAsDock(true);
            SetIsDraggable(false);
            SetIsDockable(false);
            SetIsSaveable(true);
            AddAcceptedDocktype(typeof(ValueTrigger));
            AddAcceptedDocktype(typeof(RBFSphere));
            AddAcceptedDocktype(typeof(TetrahedronBlender));
            AddAcceptedDocktype(typeof(ControlMatrix));
            AddAcceptedDocktype(typeof(InstrumentDock));

            //Dock existing children in at runtime
            for(int i = 0; i < transform.childCount; i++)
            {
                BaseVRControl attach = transform.GetChild(i).GetComponent<BaseVRControl>();    
                if(attach != null)
                    attach.DockInto(this);
            }

        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            if(base.AddDockableAttachment(attach))
            {
                attach.SetIsSaveable(true);
                return true;
            }
            return false;
        }
        public override void Update()
        {
            base.Update();
            if (Input.GetKeyDown(KeyCode.S))
            {
                Debug.Log(BuildJsonHierarchy());
            }
        }
    }
}
