
//
// Copyright (C) 2013 Sixense Entertainment Inc.
// All Rights Reserved
//

using UnityEngine;
using System.Collections;

public class HydraHand : SixenseObjectController
{
    //Collision variables
    
    protected HydraController m_hydra= null;
    
    protected float             m_fLastTriggerVal = 0.0f;

    protected Animator m_animator;
    public Animator animator{ get { return m_animator; }}
    
    protected override void Start() 
    {
        m_animator = GetComponent<Animator>();
        m_hydra = GameObject.Find("__HydraController").GetComponent<HydraController>();
        base.Start();
    }
    
    public void SetEnabled(bool state){
        m_enabled = state;
    }
    
    protected override void UpdateObject( SixenseInput.Controller controller )
    {           
        base.UpdateObject(controller);
    }    
}

