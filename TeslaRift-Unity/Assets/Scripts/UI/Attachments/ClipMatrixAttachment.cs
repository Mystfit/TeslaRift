using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class ClipMatrixAttachment : BaseAttachment {

    public Transform m_cubeParent;
    public int m_cubeWidth = 4;
    public int m_cubeHeight = 4;
    public int m_cubeDepth = 4;
    protected List<Transform> m_cubes;

	// Use this for initialization
	public override void Awake () {
        base.Awake();

        SetAsDock(true);
        SetCollideable(true);
        AddAcceptedDocktype(typeof(ClipButtonAttachment));

        m_cubes = new List<Transform>();
        for (int i = 0; i < transform.childCount; i++)
        {
            Transform cube = transform.GetChild(i);
            m_cubes.Add(cube);
            cube.gameObject.SetActive(false);
        }
	}

    public Transform GetCubeAtIndex(int x, int y, int z)
    {
        return m_cubes[(z * m_cubeWidth * m_cubeHeight) + (y * m_cubeHeight) + x];
    }

    public override bool AddDockableAttachment(BaseAttachment attach)
    {
        return base.AddDockableAttachment(attach);
    }

    public override void RemoveDockableAttachment(BaseAttachment attach)
    {
        base.RemoveDockableAttachment(attach);
    }
	
	// Update is called once per frame
	void Update () {
	
	}
}
