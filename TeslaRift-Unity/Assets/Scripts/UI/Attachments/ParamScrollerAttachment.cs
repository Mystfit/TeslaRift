using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UI;
using MusicIO;

public class ParamScrollerAttachment : BaseAttachment
{
    //Accepted dockable objects for this ui control
    public enum ScrollerDockTypes { INSTRUMENT, SLIDER, CLIP };
    public ScrollerDockTypes[] m_acceptedDockTypes;

    //Colliders
    public float m_faceDampening;
    public bool m_facePerformer;
    public float m_collisionDepth = 0.5f;

    public float m_overflow = 2.0f;
    public float m_dampening = 0.95f;
    public float m_scrollMultiplier = 1.2f;
    public float m_speedCutoff = 0.01f;
    public int m_displayedSliderCount = 6;
    public float m_upperVisibleBounds = 1.2f;
    public float m_lowerVisibleBounds = 0.0f;

    protected float m_scrollVel;		//Current scrolling velocity
    protected Vector3 m_offset;
    protected Vector3 m_lastPosition;
    protected float m_lastAttachHeight;
    protected bool bIsDragging;

    protected Transform m_controlHolder;
  
    // Use this for initialization
    public override void Awake()
    {
        base.Awake();
        m_childDockables = new List<BaseAttachment>();
        m_controlHolder = transform.Find("paramHolder");
        SetAsDock(true);

        for (int i = 0; i < m_acceptedDockTypes.Length; i++)
        {
            if (m_acceptedDockTypes[i] == ScrollerDockTypes.INSTRUMENT)
                AddAcceptedDocktype(typeof(InstrumentAttachment));

            if (m_acceptedDockTypes[i] == ScrollerDockTypes.SLIDER)
                AddAcceptedDocktype(typeof(SliderAttachment));

            if (m_acceptedDockTypes[i] == ScrollerDockTypes.CLIP)
                AddAcceptedDocktype(typeof(ClipButtonAttachment));
        }

        UpdateColliders( Vector3.zero, new Vector3(1.0f, m_upperVisibleBounds - m_lowerVisibleBounds, m_collisionDepth));
    }

    public override bool AddDockableAttachment(BaseAttachment attach)
    {
        if (base.AddDockableAttachment(attach))
        {
            attach.transform.parent = m_controlHolder.transform;
			attach.transform.localPosition = new Vector3(0.0f, m_childDockables.Count * attach.interiorTrigger.GetSize().y, 0.0f);
			//PlaceObjects();	
            m_lastAttachHeight = attach.interiorTrigger.GetSize().y;
			UpdateColliders( Vector3.zero, new Vector3(attach.interiorTrigger.GetSize().x, m_upperVisibleBounds - m_lowerVisibleBounds, m_collisionDepth));

            return true;
        }
        return false;
    }

	public override void RemoveDockableAttachment (BaseAttachment attach)
	{
		base.RemoveDockableAttachment (attach);
		attach.rigidbody.isKinematic = false;
		PlaceObjects();
	}

	public void PlaceObjects(){
		for(int i =0; i < m_childDockables.Count; i++){
			Vector3 pos = new Vector3(0.0f, i * m_childDockables[i].interiorTrigger.GetSize().y, 0.0f);
			iTween.MoveTo(m_childDockables[i].gameObject, iTween.Hash("position", pos, "time", 0.3f, "islocal", true));
		}
	}

    // Update is called once per frame
    public override void Update()
    {
        if (!bIsDragging)
        {
            if (m_scrollVel > m_speedCutoff || m_scrollVel < -m_speedCutoff)
            {
                m_scrollVel *= m_dampening;
                Vector3 vel = new Vector3(0.0f, m_scrollVel, 0.0f);
                m_controlHolder.localPosition += vel;

            }
            else
            {
                m_scrollVel = 0.0f;
                m_lastPosition = m_controlHolder.transform.localPosition;
            }
        }
        if (m_controlHolder.localPosition.y > 0.0f)
        {
            m_controlHolder.localPosition = new Vector3(m_controlHolder.transform.localPosition.x, 0.0f, m_controlHolder.transform.localPosition.z);
            m_scrollVel = 0.0f;
            m_lastPosition = m_controlHolder.localPosition;
        }
        else if (m_controlHolder.localPosition.y < (m_childDockables.Count - m_displayedSliderCount) * m_lastAttachHeight * -1.0f)
        {
            m_controlHolder.localPosition = new Vector3(m_controlHolder.transform.localPosition.x,
                                                        (m_childDockables.Count - m_displayedSliderCount) * m_lastAttachHeight * -1.0f,
                                                        m_controlHolder.transform.localPosition.z);
            m_scrollVel = 0.0f;
            m_lastPosition = m_controlHolder.localPosition;
        }

        MaskControls();
    }

    /*
     * Hide and reveal sliders to keep them in range
     */
    protected void MaskControls()
    {
        for (int i = 0; i < m_childDockables.Count; i++)
        {
            float attachY = m_childDockables[i].transform.localPosition.y + m_controlHolder.localPosition.y;
            if (attachY < m_lowerVisibleBounds || attachY > m_upperVisibleBounds)
            {
                if (m_childDockables[i].gameObject.GetComponent<iTween>() == null && m_childDockables[i].transform.localScale.x != 0.0f)
                    iTween.ScaleTo(m_childDockables[i].gameObject, iTween.Hash("x", 0.0f, "time", 0.15f, "oncomplete", "SetInactive", "easetype", iTween.EaseType.easeOutQuad));
            }
            else
            {
                if (!m_childDockables[i].gameObject.activeSelf)
                {
                    if (m_childDockables[i].gameObject.GetComponent<iTween>() == null && m_childDockables[i].transform.localScale.x == 0.0f)
                        m_childDockables[i].SetActive();
                    iTween.ScaleTo(m_childDockables[i].gameObject, iTween.Hash("x", 1.0f, "time", 0.15f, "easetype", iTween.EaseType.easeInQuad));
                }
            }
        }
    }

    void FixedUpdate()
    {
        //Rotate to face player eyes
        if (m_facePerformer)
        {
            // Look at and dampen the rotation
            Quaternion rotation = Quaternion.LookRotation(this.interiorCollider.bounds.center - HydraController.Instance.EyeCenter);
            //transform.rotation = Quaternion.Slerp(transform.rotation, rotation, Time.deltaTime * m_faceDampening);
            //transform.rotation = rotation;
            transform.rotation = Quaternion.Euler(new Vector3(0.0f, rotation.eulerAngles.y, 0.0f));
        }
    }

    protected void DragScroller()
    {
        Vector3 inversePoint = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(m_hand));
        float posY = inversePoint.y;
        m_controlHolder.localPosition = m_offset + new Vector3(0.0f, posY, 0.0f);
        m_scrollVel = (m_controlHolder.localPosition - m_lastPosition).y;
        m_lastPosition = m_controlHolder.localPosition;
    }

    /*
     * Gesture overrides
     */
    public override void Gesture_IdleProximity()
    {
        if (m_mode == BaseTool.ToolMode.TERTIARY)
        {
            if (bIsDragging)
                DragScroller();
            else
            {
                Gesture_First();
            }
        }

        base.Gesture_IdleProximity();
    }

    public override void Gesture_IdleInterior()
    {
        if (bIsDragging)
            DragScroller();
        else
        {
            Gesture_First();
        }
        base.Gesture_IdleInterior();
    }

    public override void Gesture_IdleExterior()
    {
        if (!IsFirstGesture)
        {
            Debug.Log("EXITING SCROLLER");
            Gesture_Exit();
        }
        base.Gesture_IdleExterior();
    }

    public override void Gesture_ExitIdleExterior()
    {
        base.Gesture_ExitIdleExterior();
        Gesture_Exit();
    }


    public override void Gesture_First()
    {
        base.Gesture_First();
        if (m_mode == BaseTool.ToolMode.TERTIARY)
        {
            bIsDragging = true;
            m_scrollVel = 0.0f;
            Vector3 handPos = transform.InverseTransformPoint(HydraController.Instance.GetHandColliderPosition(m_hand));
            handPos.x = 0;
            handPos.z = 0;
            m_offset = m_controlHolder.localPosition - handPos;
        }
    }

    public override void Gesture_Exit()
    {
		bIsDragging = false;
		base.Gesture_Exit();
    }
}
