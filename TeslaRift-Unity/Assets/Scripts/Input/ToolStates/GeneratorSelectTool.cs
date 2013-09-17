using UnityEngine;
using System.Collections;

public class GeneratorSelectTool : BaseTool {
	
	public GameObject m_heldObject = null;
	
	private Vector3 m_lastHeldPosition;
	
	private BaseGenerator m_selectedGenerator;

	public GeneratorSelectTool() {
	}
	
	public override void Awake(){
		base.Awake();
		m_toolHandState = BaseTool.HandState.SEARCHING;
	}
	
	public override void Update(){
		CheckForSelection();
		base.Update();
	}
	
	public override void TransitionOut(){
		if(m_heldObject != null){
			m_heldObject = null;
			m_selectedGenerator = null;
			m_toolHandState = BaseTool.HandState.RELEASING;
		}
	}
	
	public void CheckForSelection(){
		if(m_hydraRef != null){

			//Attach
			switch(m_toolHandState){
			case HandState.SEARCHING:
				if(m_hydraRef.HandTarget(m_hand)){
					if(m_hydraRef.HandTarget(m_hand) != m_heldObject){
						if(m_toolControlRef.GetSelectedGenerator() == null){		//Only one attached generator at a time
							if(m_hydraRef.HandTarget(m_hand).CompareTag("Generator")){
								m_heldObject = m_hydraRef.HandTarget(m_hand);
								m_selectedGenerator = m_heldObject.GetComponent<BaseGenerator>();
								m_toolControlRef.SetSelectedGenerator(m_selectedGenerator);
								m_toolHandState = BaseTool.HandState.HOLDING;
								
								//Create a line between the hand and the generator
								GeneratorLine line = gameObject.AddComponent<GeneratorLine>();
								line.CreateConnection(m_selectedGenerator.transform, transform);
								Debug.Log("Selecting generator " + m_selectedGenerator);
							}
						}
					}
				}
				break;
			case HandState.RELEASING:
				break;
			case HandState.HOLDING:
				break;
			}
		}

	}
}
