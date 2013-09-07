using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class GridTerrain : MonoBehaviour {
	
	public int m_terrainCellSize = 256;
	public GameObject m_terrainCellPrefab;
	
	private GameObject[] m_terrainCells;

	// Use this for initialization
	void Start () {
		
		m_terrainCells = new GameObject[m_terrainCellSize * m_terrainCellSize];
		
		for(int i = 0; i < m_terrainCellSize; i++){
			for(int j = 0; j < m_terrainCellSize; j++){
				Vector3 pos = new Vector3((float)(i + ((i % 2) * 0.5)), 0.0f, j);
				m_terrainCells[i * m_terrainCellSize + j] = Instantiate(m_terrainCellPrefab, pos, Quaternion.identity) as GameObject;
				m_terrainCells[i * m_terrainCellSize + j].transform.rotation = Quaternion.Euler(new Vector3(90.0f, 0.0f, 0.0f));
				m_terrainCells[i * m_terrainCellSize + j].transform.localScale = new Vector3(1.0f, 1.0f, 1.0f);
			}
		}
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
