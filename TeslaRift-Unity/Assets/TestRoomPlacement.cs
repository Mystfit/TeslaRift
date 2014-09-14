using UnityEngine;
using System.Collections;

public class TestRoomPlacement : MonoBehaviour {

	// Use this for initialization
	void Start () {
        if (!GlobalConfig.Instance.ShowTestRoom)
        {
            gameObject.SetActive(false);
        }
        //Test room sizes
        //Transform test_wall_left = transform.Find("left");
        //Vector3 wallPosLeft = test_wall_left.GetComponent<MeshFilter>().mesh.vertices[3];
        //wallPosLeft.y = GlobalConfig.Instance.ScreenHeightMeters * 0.5f;
        //test_wall_left.localScale = new Vector3(2.5f, GlobalConfig.Instance.ScreenHeightMeters, 0.5f);
        //test_wall_left.localPosition = wallPosLeft;
        //Debug.Log(wallPosLeft);

        //Transform test_wall_right = transform.Find("right");
        //Vector3 wallPosRight = test_wall_right.GetComponent<MeshFilter>().mesh.vertices[0];
        //wallPosRight.y = GlobalConfig.Instance.ScreenHeightMeters * 0.5f;
        //test_wall_right.localScale = new Vector3(2.5f, GlobalConfig.Instance.ScreenHeightMeters, 0.5f);
        //test_wall_right.localPosition = wallPosRight;

        //float dist = Vector3.Distance(wallPosRight, wallPosLeft);
        //Debug.Log(dist);
        //Transform test_wall_top = transform.Find("top");
        //test_wall_top.localScale = new Vector3(2.5f, dist, 0.5f);
        //test_wall_top.localPosition = new Vector3(0.0f, GlobalConfig.Instance.ScreenHeightMeters, 1.25f);

        //Transform test_wall_bottom = transform.Find("bottom");
        //test_wall_bottom.localScale = new Vector3(2.5f, dist, 0.5f);
        //test_wall_bottom.localPosition = new Vector3(0.0f, 0.0f, 1.25f);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
