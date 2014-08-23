using UnityEngine;
using System.Collections;

public class RBFSpike : MonoBehaviour {

    private Transform m_interiorSpike;

    public float maxPointDistance = 1.0f;

	// Use this for initialization
	void Awake () {
        m_interiorSpike = transform.FindChild("scaleSpike");
	}

    public void SetScale(float scale)
    {
		if(m_interiorSpike != null)
		   m_interiorSpike.localScale = new Vector3(1.0f, scale, 1.0f);
    }
}
