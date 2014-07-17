using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UI;
using VRControls;
using UnityEngine;

namespace UI
{
    class UIController : MonoBehaviour
    {
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
    }
}
