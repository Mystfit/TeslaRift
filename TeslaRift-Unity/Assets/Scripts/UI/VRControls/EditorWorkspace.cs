using UnityEngine;
using UI;
using System;
using System.IO;
using MusicIO;
using System.Collections;
using System.Collections.Generic;


namespace VRControls
{
    public class EditorWorkspace : BaseVRControl
    {
        public static Type[] EditorTypes = new Type[] { 
            typeof(InstrumentDock),
            typeof(ValueTrigger),
            typeof(RBFSphere),
            typeof(TetrahedronBlender),
            typeof(ControlMatrix)
        };

		public string m_layoutsPath = "Assets/Resources/savedLayouts/";
        protected ControlLayout m_activeLayout;
        public Picker m_controlStateMenu;

        public override void Awake()
        {
            //Set the ID before the superclass to override it
            SetId(VRControls.StaticIds.EDITOR_DOCK);

            base.Awake();

            SetIsSerializeable(false);
            SetAsDock(true);
            SetIsDraggable(false);
            SetIsDockable(false);
            SetIsSaveable(true);

            AddGroupDocktype(VRControls.EditorWorkspace.EditorTypes);

            //Dock existing children in at runtime -- Needs to be moved to BaseVRControl
            for (int i = 0; i < transform.childCount; i++)
            {
                BaseVRControl attach = transform.GetChild(i).GetComponent<BaseVRControl>();
                if(attach != null)
                    attach.DockInto(this);
            }
        
            //Create default layout
			m_activeLayout = CreateControlLayout(m_layoutsPath + "layout_0.json");

            //Add existing controls to default layout
            for (int i = 0; i < transform.childCount; i++)
            {
                GameObject child = transform.GetChild(i).gameObject;
                if (child.name != "AreaTrigger" && child.name != "dockTag")
                {
                    BaseVRControl attach = child.GetComponent<BaseVRControl>();
                    m_activeLayout.AddControl(attach);
                }
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
				SaveWorkspace();
            }
			if (Input.GetKeyDown(KeyCode.L))
			{
				OpenWorkspaceFiles();
                if (m_controlStateMenu.DockedChildren.Count > 0)
					m_controlStateMenu.DockedChildren[m_controlStateMenu.DockedChildren.Count - 1].Fire();
			}
            
            if (Input.GetKeyDown(KeyCode.Alpha0))
            {
                if (m_controlStateMenu.DockedChildren.Count > 0)
					m_controlStateMenu.DockedChildren[0].Fire();
            }
            
            if (Input.GetKeyDown(KeyCode.Alpha1))
            {
                if (m_controlStateMenu.DockedChildren.Count > 1)
					m_controlStateMenu.DockedChildren[1].Fire();
            }

            if (Input.GetKeyDown(KeyCode.Alpha2))
            {
                if (m_controlStateMenu.DockedChildren.Count > 2)
					m_controlStateMenu.DockedChildren[2].Fire();
            }
        }


        public void OpenWorkspaceFiles()
        {
			string[] files = Directory.GetFiles(m_layoutsPath);
            foreach (string path in files)
            {
                if (path.EndsWith(".json"))
                {
					ControlLayout page = CreateControlLayout(path);
                    page.ReadLayout();
                    page.SetInactive();
				}
            }
        }

		public ControlLayout CreateControlLayout(string path){
            ControlLayout layout = UIFactory.CreateMusicRefAttachment(typeof(ControlLayout)) as ControlLayout;
            layout.Init(this);
            layout.SetJsonPath(path);
            layout.DockInto(m_controlStateMenu);
            return layout;
		}

        public void SaveWorkspace()
        {
            string path = m_layoutsPath + "layout_" + (Directory.GetFiles(m_layoutsPath).Length + 1) + ".json";
            ControlLayout.WriteLayout(this, path);
        }

        public void SetActiveWorkspace(ControlLayout layout)
        {
            if (m_activeLayout != null)
            {
                foreach (BaseVRControl attach in m_activeLayout.LoadedControls)
                {
                    attach.Undock();
                    attach.DockInto(m_activeLayout);
                }
                m_activeLayout.SetInactive();
            }

            //Dock layout controls
            foreach (BaseVRControl attach in layout.DockedChildren)
            {
                attach.DockInto(this);
            }

            m_activeLayout = layout;
        }
    }
}
