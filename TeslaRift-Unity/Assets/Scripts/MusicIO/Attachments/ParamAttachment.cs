using UnityEngine;
using System.Collections;
using MusicIO;

public class ParamAttachment : BaseAttachment<BaseInstrumentParam> {
	
	public bool isHovering = false;
		
	
	/*
	 * Initialization
	 */
	public override void Start () {
		base.Start();
	}
	
	
	public override void Update () {
		if( musicRef != null){
			if(!musicRef.enabled)
				SetSelected(false);
			base.Update();
		}
	}
	
	
	/*
	 * Assigned generators
	 */
	public void AddGenerator(BaseGenerator gen){
		musicRef.attachGenerator(gen);
	}
	
	public void DisconnectGenerators(){
		musicRef.removeGenerators();
	}
	
	
	/*
	 * Selection controls
	 */
	public override void ToggleSelected(){
		SetSelected(!m_selected);
	}

	public override void SetSelected (bool state)
	{
		base.SetSelected (state);
		
		if(state){
			InstrumentController.Instance.SelectParameter( musicRef );
			gameObject.GetComponent<PanelToggle>().Toggle(true);
		} else{ 
			gameObject.GetComponent<PanelToggle>().Toggle(false);
		}
	}
	
	public void SetHovering(bool state){
		if(state)
			gameObject.GetComponent<PanelToggle>().HoverToggle(true);
		else
			gameObject.GetComponent<PanelToggle>().HoverToggle(false);
	}
	
	
	/*
	 * Gesture overrides
	 */
}
