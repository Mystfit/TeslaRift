using UnityEngine;
using System.Collections;

public class LTreeController : MonoBehaviour {

  /*
  the LTree is an L-System-based tree object that creates a tree structure from simple rules.
  */
  private int t = 0;
  public float initial_length = 1;
  public float initial_radius = 0.1f;
  private LTree rootNode;
  public static PrimitiveType limbType = PrimitiveType.Cube;
  public static float yScale = 1f;
  
  void Start () {
    rootNode = new LTree();
    rootNode.construct(null,initial_length,initial_radius);
    
  }
  
  void OnGUI()
  {
    t++;
    rootNode.do_rotate(0.1f*Mathf.Cos(0.03f*t));
    rootNode.pivot();
    if (GUI.Button(new Rect(10,70,100,20), "reset")) {
      rootNode.reset(initial_length,initial_radius);
    }
    if (GUI.Button(new Rect(10,90,100,20), "Cubes")) {
      limbType = PrimitiveType.Cube;
      yScale = 1;
      rootNode.reset(initial_length,initial_radius);
    }
    if (GUI.Button(new Rect(10,110,100,20), "Cylinders")) {
      limbType = PrimitiveType.Cylinder;
      yScale = 2;
      rootNode.reset(initial_length,initial_radius);
    }
    if (GUI.Button(new Rect(10,130,100,20), "Capsules")) {
      limbType = PrimitiveType.Capsule;
      yScale = 2;
      rootNode.reset(initial_length,initial_radius);
    }
    //------

    GUI.Label (new Rect (10, 150, 200, 20), "Start length:"+(Mathf.Round(initial_length*100)/100));
    
    if (GUI.Button(new Rect(10,170,50,20), "-")) {
      initial_length*=0.9f;
      rootNode.reset(initial_length,initial_radius);
    }
    if (GUI.Button(new Rect(60,170,50,20), "+")) {
      initial_length/=0.9f;
      rootNode.reset(initial_length,initial_radius);
    }
    //------

    GUI.Label (new Rect (10, 190, 200, 20), "Start radius:"+(Mathf.Round(initial_radius*100)/100));
    
    if (GUI.Button(new Rect(10,210,50,20), "-")) {
      initial_radius*=0.9f;
      rootNode.reset(initial_length,initial_radius);
    }
    if (GUI.Button(new Rect(60,210,50,20), "+")) {
      initial_radius/=0.9f;
      rootNode.reset(initial_length,initial_radius);
    }
  }
  
  
  // Update is called once per frame
  void Update () {
  
  }
}