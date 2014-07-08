using UnityEngine;
using UI;
using System.IO;
using MusicIO;
using System.Collections;
using System.Collections.Generic;


namespace VRControls
{
    public class EditorWorkspace : BaseVRControl
    {
		public string m_layoutsPath = "Assets/Resources/savedLayouts/";
        protected List<ControlLayout> m_layouts;

        public override void Awake()
        {
            m_id = VRControls.StaticIds.EDITOR_DOCK;

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

            m_layouts = new List<ControlLayout>();

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
				SaveWorkspace();
            }
			if (Input.GetKeyDown(KeyCode.L))
			{
				OpenWorkspaceFiles();
			}
        }


        public void OpenWorkspaceFiles()
        {
			string[] files = Directory.GetFiles(m_layoutsPath);
            foreach (string i in files)
            {
				if(i.EndsWith(".json")){
					ControlLayout layout = new ControlLayout(i);
					layout.ReadLayout();
					m_layouts.Add(layout);
				}
            }
        }

        public void SaveWorkspace()
        {
			ControlLayout layout = new ControlLayout(m_layoutsPath + "test.json");
            layout.WriteLayout(this);
        }
    }
}
