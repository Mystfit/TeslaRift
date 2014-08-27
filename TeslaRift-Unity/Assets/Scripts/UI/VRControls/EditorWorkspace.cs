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
            typeof(RBFPlug),
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
            AddAcceptedDocktype(typeof(ControlLayout));
			DockChildTransforms();

            ControlLayout defaultLayout = CreateControlLayout(-1);
            defaultLayout.SetIsSaveable(false);
            defaultLayout.DockInto(m_controlStateMenu);
			defaultLayout.SetAsDock(true);
			defaultLayout.gameObject.name = "defaultLayout";

            //List<BaseVRControl> defaultControls = new List<BaseVRControl>();
            //foreach (BaseVRControl control in DockedChildren){
            //    control.name = "default_" + control.name;
            //    defaultControls.Add(control);
            //}
            //defaultLayout.ApplyControlHierarchy(defaultControls);
            SetActiveWorkspace(defaultLayout);

            //OpenWorkspaceFiles();
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            if(base.AddDockableAttachment(attach))
            {
                attach.SetIsSaveable(true);

                if(attach.GetType() == typeof(ControlLayout)){
                    //m_activeLayout = attach as ControlLayout;
                    SaveWorkspace((ControlLayout)attach);
                    attach.DockInto(m_controlStateMenu);
					attach.SetAsDock(true);
                    SetActiveWorkspace((ControlLayout)attach);
                }

                return true;
            }
            return false;
        }
        
        public override void Update()
        {
            base.Update();
            if (Input.GetKeyDown(KeyCode.S))
            {
                ControlLayout layout = UIFactory.CreateMusicRefAttachment(typeof(ControlLayout)) as ControlLayout;
                layout.SetTransient(true);
                layout.SetAsTemplate(false);
                layout.SetCloneable(false);
                layout.DockInto(this);
				//SaveWorkspace(m_activeLayout);
            }
			if (Input.GetKeyDown(KeyCode.L))
			{
				OpenWorkspaceFiles();
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

            //Pick up all free floating controls in range of the editor workspace.
            if (UIController.Instance.orphanedControls.Count > 0)
            {
                List<BaseVRControl> removedControls = new List<BaseVRControl>();
                foreach (BaseVRControl control in UIController.Instance.orphanedControls)
                {
                    control.DockInto(this);
                    removedControls.Add(control);
                }

                foreach (BaseVRControl control in removedControls)
                {
                    UIController.Instance.orphanedControls.Remove(control);
                }
            }
        }


        /// <summary>
        /// Removes all layouts from the scene
        /// </summary>
        public void DestroyLayouts()
        {
            //Remove all existing layouts except the default blank layout
            List<ControlLayout> layoutsToDestroy = new List<ControlLayout>();

            foreach (ControlLayout layout in m_controlStateMenu.DockedChildren)
            {
                if (layout.gameObject.name != "defaultLayout")
                    layoutsToDestroy.Add(layout);
            }

            foreach (ControlLayout layout in layoutsToDestroy)
                UIController.Instance.DestroyControl(layout);
        }


        /// <summary>
        /// Opens layouts from JSON
        /// </summary>
        public void OpenWorkspaceFiles()
        {
            DestroyLayouts();

            string[] files = Directory.GetFiles(m_layoutsPath);
            foreach (string path in files)
            {
                if (path.EndsWith(".json"))
                {
                    //ControlLayout page = CreateControlLayout(path);
                    //ControlLayout layout = UIFactory.CreateMusicRefAttachment(typeof(ControlLayout)) as ControlLayout;
                    //layout.Init(this);
                    //layout.SetJsonPath(path);
                    //layout.layoutIndex = int.Parse(path.Substring(path.Length - "#.json".Length, 1));
                    //layout.ReadLayout();

                    List<BaseVRControl> controls = ControlLayout.ReadLayout(path);
                    ControlLayout layout = ControlLayout.StripLayoutFromControlList(controls);


                    if(layout != null){
                        layout.Init(this);
                        layout.SetJsonPath(path);
                        layout.layoutIndex = int.Parse(path.Substring(path.Length - "#.json".Length, 1));
                        layout.ApplyControlHierarchy(controls);
                        layout.DockInto(m_controlStateMenu);
						layout.SetLocalControlsActive(false);
						layout.SetAsDock(true);
                    }
				}
            }
        }
       

        /// <summary>
        /// Creaate a ControlLayout for writing to a json file
        /// </summary>
        /// <param name="layoutIndex">Index of layout file to write</param>
        /// <returns></returns>
		public ControlLayout CreateControlLayout(int layoutIndex){
            string path = m_layoutsPath + "layout_" + layoutIndex + ".json";
            ControlLayout layout = UIFactory.CreateMusicRefAttachment(typeof(ControlLayout)) as ControlLayout;
            layout.Init(this);
            layout.SetJsonPath(path);
            layout.layoutIndex = layoutIndex;
            return layout;
		}

        public void SaveWorkspace(ControlLayout layout)
        {
            //Check if the layout has been saved yet
            if (layout.layoutIndex < 0)
            {
                int numLoadedLayouts = m_controlStateMenu.DockedChildren.Count;
                layout.layoutIndex = numLoadedLayouts + 1;
                layout.SetJsonPath(m_layoutsPath + "layout_" + layout.layoutIndex + ".json");
            }

            List<BaseVRControl> controls = BuildFlatHierarchy();
            //List<ControlLayout> layouts = layout.StripLayoutsFromControlList(controls);

            layout.ApplyControlHierarchy(controls);
                
            //foreach (ControlLayout l in layouts)
            //    controls.Add(l);
            controls.Add(layout);

            layout.WriteLayout(controls);
        }

        public void SetActiveWorkspace(ControlLayout layout)
        {
            if (m_activeLayout != null)
            {
				m_activeLayout.SetColour(Color.white);

                foreach (BaseVRControl attach in m_activeLayout.LoadedControls)
                {

                        attach.Undock();
                        attach.DockInto(m_activeLayout);
					    attach.SetInactive();
                    
                }
                //m_activeLayout.SetInactive();
            }

            layout.UnpackKeyedHierarchy(layout.GetKeyedHierarchy(layout.LoadedControls));

            //Dock layout controls
            foreach (BaseVRControl attach in layout.LoadedControls)
            {
	            attach.SetActive();
	            attach.transform.position = attach.jsonPosition;
	            attach.transform.rotation = attach.jsonRotation;
                //attach.DockInto(this);
            }

            m_activeLayout = layout;
            m_activeLayout.SetColour(Color.red);
        }
    }
}
