using UnityEngine;

public class NoteblockTrigger : MonoBehaviour {

	/// The game object to affect. If none, the trigger work on this game object
	public Object target;
	public int triggerCount = 1;///
	public bool repeatTrigger = false;

	void OnTriggerEnter (Collider other) {
		
		Debug.Log("BANG");
		triggerCount--;

		if (triggerCount == 0 || repeatTrigger) {
			Object currentTarget = target != null ? target : gameObject;
			Behaviour targetBehaviour = currentTarget as Behaviour;
			GameObject targetGameObject = currentTarget as GameObject;
			
			targetGameObject = targetBehaviour.gameObject;
			targetGameObject.SendMessage("CollidedWith", other);
			
		}
	}
}