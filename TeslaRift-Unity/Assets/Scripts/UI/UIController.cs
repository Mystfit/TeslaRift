using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UI;
using VRControls;
using UnityEngine;

namespace UI
{
    public class UIController : MonoBehaviour
    {
        public enum UIContext{ EDITING = 0, PERFORMING };


        public static UIController Instance { get { return m_instance; } }
        private static UIController m_instance;

        private Dictionary<string, BaseVRControl> m_controls;

        public void Awake()
        {
            m_instance = this;
            m_controls = new Dictionary<string, BaseVRControl>();
        }

        public void DestroyControl(string id)
        {
            DestroyControl(GetControl(id));
        }

        public void DestroyControl(BaseVRControl control)
        {
            if (control != null)
            {
                m_controls.Remove(control.id);
				HydraController.Instance.RemoveFromAllCollisionLists(control.gameObject);
                GameObject.Destroy(control.gameObject);
            }
        }

        public void AddControl(BaseVRControl control)
        {
            m_controls[control.id] = control;
        }

        public BaseVRControl GetControl(string id)
        {
            if (m_controls.Keys.Contains(id))
                return m_controls[id];
            return null;
        }


        public void ToggleNextUIContext()
        {
            int numContexts = Enum.GetNames(typeof(UIContext)).Length;
            int nextContext = ((int)m_uiContext + 1) % numContexts;
            SetUIContext((UIContext)nextContext);
        }

        public void TogglePreviousUIContext()
        {
            int numContexts = Enum.GetNames(typeof(UIContext)).Length;
            int nextContext = ((int)m_uiContext - 1) % numContexts;
            SetUIContext((UIContext)nextContext);
        }

        public void SetUIContext(UIContext mode)
        {
            foreach(KeyValuePair<string, BaseVRControl> control in m_controls){
                if(!control.Value.isTemplate)
                    control.Value.SwitchUIContext(mode);
            }

            m_uiContext = mode;
        }

        public UIContext GetUIContext
        {
            get
            {
                return m_uiContext;
            }
        }
        private UIContext m_uiContext;
    }
}
