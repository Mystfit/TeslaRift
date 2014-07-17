using System;
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
    public class ControlLayout : BaseVRControl
    {
        public void SetOwner(EditorWorkspace workspace) { m_owner = workspace; }
        public EditorWorkspace owner { get { return m_owner; } }
        protected EditorWorkspace m_owner;

        public void SetJsonPath(string jsonPath) { m_path = jsonPath; }
        protected string m_path;
        public string path { get { return m_path; } }

        public List<BaseVRControl> LoadedControls { get { return m_loadedControls; } }
        protected List<BaseVRControl> m_loadedControls;

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

        public static void WriteLayout(BaseVRControl rootHierarchyControl, string path)
        {
            StreamWriter writer = new StreamWriter(path);
            writer.WriteLine(rootHierarchyControl.BuildJsonHierarchy());
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

        public void ReadLayout()
        {
            StreamReader reader = new StreamReader(m_path);
            string json = reader.ReadToEnd();
            reader.Close();

            List<BaseVRControl> m_loadedControls = JsonConvert.DeserializeObject<List<BaseVRControl>>(json, new ControlHierarchySerializer());

            Dictionary<string, BaseVRControl> keyedHierarchy = new Dictionary<string, BaseVRControl>();
            foreach (BaseVRControl attach in m_loadedControls)
            {
                keyedHierarchy[attach.id] = attach;
            }

            foreach (KeyValuePair<string, BaseVRControl> pair in keyedHierarchy)
            {

                if (pair.Value.jsonParentId == VRControls.StaticIds.EDITOR_DOCK)
                {
                    pair.Value.DockInto(this);
                }

                if (keyedHierarchy.ContainsKey(pair.Value.jsonParentId))
                {
                    pair.Value.DockInto(keyedHierarchy[pair.Value.jsonParentId]);
                }
            }
        }
    }
}
