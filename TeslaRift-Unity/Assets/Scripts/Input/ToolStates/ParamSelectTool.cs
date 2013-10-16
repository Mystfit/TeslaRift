using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class ParamSelectTool : BaseTool {
	
	public GameObject m_heldObject = null;
	private BaseGenerator m_selectedGenerator;
	private bool m_disconnectGenerators = false;
	
	private List<ParamAttachment> m_selectedParams;
	
	public ParamSelectTool() {
	}
	
	public override void Awake(){
		base.Awake();
		m_selectedParams = new List<ParamAttachment>();
		m_toolHandState = BaseTool.HandState.SEARCHING;
	}
	
	public override void Update(){
	
		//Select parameter
		switch(m_toolHandState){
		case HandState.SEARCHING:
			CheckForSelection();
			break;
		case HandState.RELEASING:	
			break;
		case HandState.HOLDING:
			break;
		}
		base.Update();
	}
	
	public override void TransitionOut ()
	{
		m_toolControlRef.SetSelectedGenerator(null);	//Deselect any active generators
		base.TransitionOut ();
	}
	
	public void SetSelectedGenerator(BaseGenerator gen){
		m_selectedGenerator = gen;
	}
	
	public void CheckForSelection(){
		
		//Param selections happen inside the proximity range
		if(HydraController.Instance.HandTarget(m_hand, ProximityType.INSTRUMENT_PROXIMITY)){
			
			//Only look for selections if we have something to search on!
			//TODO: Replace with collision/distance based checking
			if(m_instrumentControlRef.LastSelectedGameInstrument != null)
			{
				//Check for panel collisions
				RaycastHit hit;
				int mask = ~LayerMask.NameToLayer("ParamSelectable");
				Vector3 dir = m_instrumentControlRef.LastSelectedGameInstrument.transform.position - m_hydraRef.GetHand(m_hand).transform.position;
				if(Physics.Raycast(m_hydraRef.GetHand(m_hand).transform.position, dir, out hit, dir.magnitude, mask )){
					
					//Toggle the panel and attach any generators if required
					ParamAttachment attach = hit.collider.gameObject.GetComponent<ParamAttachment>();
					if(attach != null){
						if( m_selectedParams.IndexOf(attach) < 0){
							m_selectedParams.Add(attach);
							attach.ToggleSelected();
							
							//Attach the selected generator to the parameter
							if(!m_disconnectGenerators){
								if(m_selectedGenerator != null){
	
									//Reattach line between param and generator
									attach.AddGenerator(m_selectedGenerator);
									m_toolControlRef.SetSelectedGenerator(null);
									attach.gameObject.AddComponent<GeneratorLine>()
										.CreateConnection(m_selectedGenerator.transform, attach.transform);
								}
							} else {
								//Remove all generators from panel
								Debug.Log ("Disconnecting generators from " + attach);
								attach.DisconnectGenerators();
								GeneratorLine[] lines =  attach.gameObject.GetComponents<GeneratorLine>();
								foreach(GeneratorLine line in lines){
									line.Remove();
								}
							}						
						}
					}
					
					m_toolHandState = BaseTool.HandState.HOLDING;
				}
				
				Debug.DrawRay(m_hydraRef.GetHand(m_hand).transform.position, dir, Color.red);
			}
			
		}
	}
	
	public void SetDisconnectGenerators(bool state){
		m_disconnectGenerators = state;
	}
}
