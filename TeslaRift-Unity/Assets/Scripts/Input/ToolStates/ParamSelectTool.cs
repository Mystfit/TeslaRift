using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class ParamSelectTool : BaseTool {
	
	public GameObject m_heldObject = null;
	private BaseGenerator m_selectedGenerator;
	
	private List<ParamAttachment> m_selectedParams;
	
	public ParamSelectTool() {
	}
	
	public override void Start(){
		base.Start();
		m_selectedParams = new List<ParamAttachment>();
		m_toolHandState = BaseTool.HandState.SEARCHING;
	}
	
	public override void Update(){
		CheckForSelection();
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
		if(m_hydraRef != null){
			
			RaycastHit hit;
			int mask = ~LayerMask.NameToLayer("ParamSelectable");
			Vector3 dir = m_instrumentControlRef.LastSelectedGameInstrument.transform.position - m_hydraRef.GetHand(m_hand).transform.position;
			if(Physics.Raycast(m_hydraRef.GetHand(m_hand).transform.position, dir, out hit, dir.magnitude, mask )){
				Debug.Log("Ray hit " + hit.collider);
				
				ParamAttachment attach = hit.collider.gameObject.GetComponent<ParamAttachment>();
				if(attach != null){
					if( m_selectedParams.IndexOf(attach) < 0){
						m_selectedParams.Add(attach);
						attach.ToggleSelected();
						
						//Attach the selected generator to the parameter
						if(m_selectedGenerator != null){
							attach.AddGenerator(m_selectedGenerator);
							m_selectedGenerator.gameObject.GetComponent<GeneratorLine>()
								.CreateConnection(m_selectedGenerator.transform, attach.transform);
						}
						
					}
				}
				
				m_toolHandState = BaseTool.HandState.HOLDING;
			}
			
			Debug.DrawRay(m_hydraRef.GetHand(m_hand).transform.position, dir, Color.red);

			//Select parameter
			switch(m_toolHandState){
			case HandState.SEARCHING:
				//if(m_hydraRef.HandTarget(m_hand)){
					//if(m_hydraRef.HandTarget(m_hand) != m_heldObject){
						
						//if(m_hydraRef.HandTarget(m_hand).CompareTag("ParamPanel")){
							//m_heldObject = m_hydraRef.HandTarget(m_hand);
							//m_heldObject.GetComponent<ParamAttachment>().ToggleSelected();
							//m_toolHandState = BaseTool.HandState.HOLDING;
						//}
					//}
				//}
				break;
			case HandState.RELEASING:	
				if(m_heldObject != null){
					m_heldObject = null;
				}
				break;
			case HandState.HOLDING:
				break;
			}
		}
	}
}
