using UnityEngine;
using UnityEditor;
using System.Collections;

public class BuildExternal : MonoBehaviour {

	// Build the standalone Windows demo and place into main project folder
	[MenuItem ("Fissure/Build - Debug")]	
	static void BuildFissureExternalDebug ()
	{
		if(Application.isEditor)
		{
			string[] scenes = { EditorApplication.currentScene };
			BuildPipeline.BuildPlayer(scenes, "fissure_d.exe", BuildTarget.StandaloneWindows, BuildOptions.Development | BuildOptions.AllowDebugging | BuildOptions.AutoRunPlayer);
		}
	}

	// Build the standalone Windows demo and place into main project folder
	[MenuItem ("Fissure/Build")]	
	static void BuildFissureExternal ()
	{
		if(Application.isEditor)
		{
			string[] scenes = { EditorApplication.currentScene };
			BuildPipeline.BuildPlayer(scenes, "fissure.exe", BuildTarget.StandaloneWindows, BuildOptions.AutoRunPlayer);
		}
	}
}
