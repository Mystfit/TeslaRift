﻿using System;
using System.Collections.Generic;
using System.Collections;
using System.IO;
using System.Linq;
using System.Text;
using UnityEngine;
using VRControls;
using Newtonsoft.Json;

namespace VRControls
{
    public class ControlLayout : CubeButton
    {
        public void SetOwner(EditorWorkspace workspace) { m_owner = workspace; }
        public EditorWorkspace owner { get { return m_owner; } }
        protected EditorWorkspace m_owner;

        public void SetJsonPath(string jsonPath) { m_path = jsonPath; }
        protected string m_path;
        public string path { get { return m_path; } }

        public List<BaseVRControl> LoadedControls { get { return m_loadedControls; } }
        protected List<BaseVRControl> m_loadedControls;

        public int layoutIndex = -1;

        public override void Awake()
        {
            base.Awake();
            SetAsDock(true);
            SetIsDockable(true);

            AddGroupDocktype(VRControls.EditorWorkspace.EditorTypes);
            m_loadedControls = new List<BaseVRControl>();
        }

        public void Init(EditorWorkspace owningWorkspace)
        {
            SetOwner(owningWorkspace);
        }

        public void AddControl(BaseVRControl control)
        {
            if (!m_loadedControls.Contains(control))
                m_loadedControls.Add(control);
        }

        public void SetLocalControls(List<BaseVRControl> controls)
        {
            m_loadedControls = controls;
            foreach (BaseVRControl control in m_loadedControls)
            {
                control.jsonPosition = control.transform.position;
                control.jsonRotation = control.transform.rotation;
                if (control.jsonParentId == string.Empty)
                {
                    control.jsonParentId = DockedInto.id;
                }
            }
        }

		public void SetLocalControlsActive(bool state){
			foreach(BaseVRControl control in m_loadedControls){
				if(state)
					control.SetActive();
				else
					control.SetInactive();
			}
		}

        public void WriteLayout(List<BaseVRControl> controls)
        {
            StreamWriter writer = new StreamWriter(m_path);
			writer.WriteLine(this.BuildJsonHierarchy(controls));
            writer.Close();
        }

        public override bool AddDockableAttachment(BaseVRControl attach)
        {
            if (base.AddDockableAttachment(attach))
            {
                AddControl(attach);
                return true;
            }
            return false;
        }

        public override void Fire()
        {
            owner.SetActiveWorkspace(this);
        }

        public static List<BaseVRControl> ReadLayout(string path)
        {
            StreamReader reader = new StreamReader(path);
            string json = reader.ReadToEnd();
            reader.Close();
            return JsonConvert.DeserializeObject<List<BaseVRControl>>(json, new ControlHierarchySerializer());
			//ApplyControlHierarchy(JsonConvert.DeserializeObject<List<BaseVRControl>>(json, new ControlHierarchySerializer()));
		}

        public void ApplyControlHierarchy(List<BaseVRControl> controlList)
        {
			Dictionary<string, BaseVRControl> keyedHierarchy = GetKeyedHierarchy(controlList);
            List<BaseVRControl> strippedControlList = UnpackKeyedHierarchy(keyedHierarchy);
			SetLocalControls(strippedControlList);
        }

		public Dictionary<string, BaseVRControl> GetKeyedHierarchy(List<BaseVRControl> controlList){
			Dictionary<string, BaseVRControl> keyedHierarchy = new Dictionary<string, BaseVRControl>();
			foreach (BaseVRControl attach in controlList)
			{
				if (attach != null)
					keyedHierarchy[attach.id] = attach;
			}

			return keyedHierarchy;
		}

        public List<BaseVRControl> UnpackKeyedHierarchy(Dictionary<string, BaseVRControl> keyedHierarchy)
		{
			List<BaseVRControl> controlList = new List<BaseVRControl>();

			foreach (KeyValuePair<string, BaseVRControl> pair in keyedHierarchy)
			{
				BaseVRControl control = pair.Value;

				string dockId;
				
				if(control.DockedInto != null){
					dockId = control.DockedInto.id;
				} else {
					dockId = control.jsonParentId;
				}
				
				
				if (dockId == VRControls.StaticIds.EDITOR_DOCK)
				{
					if (control.id.Equals(this.id)){
						//continue;
					}else {
						control.DockInto(this);
					}
				}

				if (keyedHierarchy.ContainsKey(dockId))
					control.DockInto(keyedHierarchy[dockId]);

				controlList.Add(control);
			}

			return controlList;
		}

        public static ControlLayout StripLayoutFromControlList(List<BaseVRControl> controlList)
        {
            ControlLayout layout = controlList.Find(x => x.GetType() == typeof(ControlLayout)) as ControlLayout; ;
            controlList.Remove(layout);
            return layout;
        }
    }
}