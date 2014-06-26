using UnityEngine;
using System.Collections.Generic;
using System.Collections;
using ZST;



namespace MusicIO
{
	public class BaseMusicObject {
        protected ZstMethod m_remoteMethod;
        public ZstMethod remoteMethod { get { return m_remoteMethod; } }

        protected Dictionary<string, object> m_remoteMethodArgs;
        public void SetRemoteArg(string key, object val) { m_remoteMethod.args[key] = val; }
        
        protected string m_name;
        public string name { get { return m_name; } }

        public BaseMusicObject(string name, ZstMethod remoteMethod)
        {
            m_remoteMethod = remoteMethod;
            m_name = name;
        }

        protected bool m_isDirty = false;
        public bool isDirty { get { return m_isDirty; } }
        public void setClean() { m_isDirty = false; }

        public void Send(){ Send(false); }
        public virtual void Send(bool force)
        {
            if (isDirty || force)
            {
                ZmqMusicNode.Instance.node.updateRemoteMethod(
                   m_remoteMethod,
                   m_remoteMethod.args
                );
            }
            setClean();
        }
	}
	
}
