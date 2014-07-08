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

        private Dictionary<int, BaseVRControl> m_controls;

        public void Awake()
        {
            m_instance = this;
            m_controls = new Dictionary<int, BaseVRControl>();
        }

        public void DestroyControl(int index)
        {
            DestroyControl(GetControl(index));
        }

        public void DestroyControl(BaseVRControl control)
        {
            if (control != null)
            {
                m_controls.Remove(control.id);
                GameObject.Destroy(control);
            }
        }

        public void AddControl(BaseVRControl control)
        {
            m_controls[control.id] = control;
        }

        public BaseVRControl GetControl(int index)
        {
            if (m_controls.Keys.Contains(index))
                return m_controls[index];
            return null;
        }
    }
}
