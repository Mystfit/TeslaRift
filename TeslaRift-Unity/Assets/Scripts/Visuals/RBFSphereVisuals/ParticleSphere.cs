using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class ParticleSphere : MonoBehaviour {

    public GameObject m_particlePrefab;
    public float m_radius = 20.0f;
    public int m_gridResolution = 10;
    public float m_randomOffset = 0.1f;
    public float m_maxScale = 0.3f;
    public float m_minScale = 0.05f;
    public float m_lightDist = 2.0f;
    public float m_baseOpacity = 0.05f;

    public bool m_toggleUpdate = true;

    protected List<GameObject> m_particles;
    protected List<Transform> m_lightTargets;

    // Use this for initialization
    void Start () {
        m_particles = new List<GameObject>();
        m_lightTargets = new List<Transform>();
    }

    public void AddLightTarget(Transform target)
    {
        m_lightTargets.Add(target);
    }

    public void RemoveLightTarget(Transform target)
    {
        m_lightTargets.Remove(target);
    }

    public void BuildParticles()
    {
        for (int i = 0; i <= m_gridResolution; i++)
        {
            for (int j = 0; j <= m_gridResolution; j++)
            {
                for (int k = 0; k <= m_gridResolution; k++)
                {
                    float posX = m_radius * (float)i / (float)m_gridResolution * 2 - m_radius;
                    float posy = m_radius * (float)j / (float)m_gridResolution * 2 - m_radius;
                    float posZ = m_radius * (float)k / (float)m_gridResolution * 2 - m_radius;
                    Vector3 pos = new Vector3(posX, posy, posZ);
                    pos += new Vector3(Random.value * m_randomOffset, Random.value * m_randomOffset, Random.value * m_randomOffset);

                    if (Vector3.Distance(pos, Vector3.zero) <= m_radius)
                    {
                        GameObject particle = GameObject.Instantiate(m_particlePrefab) as GameObject;
                        particle.transform.parent = transform;
                        float randomScale = Random.Range(m_minScale, m_maxScale);
                        particle.transform.localScale = new Vector3(randomScale, randomScale, randomScale);
                        particle.transform.localPosition = pos;
                        particle.renderer.material.SetColor("_Color", new Color(1.0f, 1.0f, 1.0f, m_baseOpacity));
                        m_particles.Add(particle);
                    }
                }
            }
        }
    }

    public void UpdateLightParticles()
    {
        foreach (Transform target in m_lightTargets)
        {
            foreach (KeyValuePair<GameObject, float> particle in GetPointsInRange(target.transform.position, m_lightDist))
            {
                particle.Key.renderer.material.SetColor("_Color", new Color(1.0f, 1.0f, 1.0f, m_baseOpacity + 0.5f - (particle.Value / m_lightDist) * 0.5f));
                iTween.ColorTo(particle.Key, iTween.Hash("time", 0.3f, "color", new Color(1.0f, 1.0f, 1.0f, m_baseOpacity)));
            }
        }
    }

    public Dictionary<GameObject, float> GetPointsInRange(Vector3 center, float range)
    {
        Dictionary<GameObject, float> points = new Dictionary<GameObject, float>();
        foreach (GameObject particle in m_particles)
        {
            float dist = Vector3.Distance(center, particle.transform.position);
            if (dist < range || range < 0)
                points[particle] = dist;
        }
        return points;
    }
    
    // Update is called once per frame
    void Update () {
        if (m_toggleUpdate)
        {
            m_toggleUpdate = false;
            for (int i = 0; i < transform.childCount; i++ )
            {
                m_particles.Remove(transform.GetChild(i).gameObject);
                GameObject.Destroy(transform.GetChild(i).gameObject);
            }
            BuildParticles();
        }

        UpdateLightParticles();
    }
}
