using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Xml;
using System;
using MusicIO;
using System.IO;
using UI;

public class MusicgroupFactory : MonoBehaviour {
	
	public string m_musicProfilePath;
	public bool m_toggleWriteMusicgroup;
	public bool m_toggleLoadMusicgroups;
	public Transform UIFacingTarget;

	protected MusicgroupSpawnerAttachment m_musicSpawner;
	
	void Start () {
		m_musicSpawner = GetComponent<MusicgroupSpawnerAttachment>();
		//LoadMusicgroupXML();
	}

	void Update(){
		if(m_toggleWriteMusicgroup){
			m_toggleWriteMusicgroup = false;
			WriteMusicGroupsToFile(InstrumentController.Instance.MusicGroups);
		}

		if(m_toggleLoadMusicgroups){
			LoadMusicgroupXML();
			m_toggleLoadMusicgroups = false;
		}
	}
	
	/*
	 * Creates instruments from Live's dumped session xml
	 */
	private void LoadMusicgroupXML(){


		string filepath = Application.dataPath + "/Resources/" + m_musicProfilePath;
		XmlDocument xmlDoc = new XmlDocument();
		
		if(File.Exists (filepath))
			xmlDoc.Load(filepath);

		//Get mGroup, return, master information
		XmlNodeList mGroupList = xmlDoc.GetElementsByTagName("MusicGroup"); 
		CreateGroupFromXmlList(mGroupList);
		//WriteMusicGroupsToFile();
	}

	public void RemoveAllGroups(){
		foreach(Transform obj in transform){
			if(obj.name != "AreaTrigger")
				GameObject.Destroy(obj.gameObject);
		}
	}
	
	
	/*
	 * Creates instruments from xml lists
	 */
	private void CreateGroupFromXmlList(XmlNodeList xmlList){

		//Remove existing music groups
		RemoveAllGroups();

		foreach(XmlNode mGroup in xmlList){	
			//Color color = Utils.intToColor( int.Parse(mGroup.Attributes["color"].Value) );		

			MusicControllerAttachment attach = m_musicSpawner.SpawnMusicgroup();
			attach.rigidbody.isKinematic = true;
			attach.transform.position = new Vector3( 
			    Convert.ToSingle(mGroup.Attributes["x"].Value),
				Convert.ToSingle(mGroup.Attributes["y"].Value),
				Convert.ToSingle(mGroup.Attributes["z"].Value)
			);
			attach.rigidbody.isKinematic = false;

			//Get devices present in mGroup
			XmlNodeList clipList = mGroup.SelectNodes("clip"); //clip array	
			foreach(XmlNode clip in clipList){
				string ownerName = clip.Attributes["owner"].Value as String;
				int index = int.Parse(clip.Attributes["index"].Value);
				InstrumentClip clipObj = InstrumentController.Instance.GetInstrumentByName(ownerName).GetClipByIndex(index-1);

				if(clipObj != null)
					attach.clipBuffer.AddClipToBuffer(clipObj);
				else 
					throw new Exception("Mgroup - Couldn't find clip!");
			}

			XmlNodeList trainingList = mGroup.SelectNodes("rbfPoint"); //clip array	
			foreach(XmlNode point in trainingList){
				float x = Convert.ToSingle(point.Attributes["x"].Value);
				float y = Convert.ToSingle(point.Attributes["y"].Value);
				float twist = Convert.ToSingle(point.Attributes["twist"].Value);
				RBF.RBFTrainingPointAttachment rbfPoint = attach.rbfPanel.CreateTrainingPoint(x,y,twist);

				XmlNodeList paramList = point.SelectNodes("rbfValue"); //clip array	

				foreach(XmlNode rbfVal in paramList){
					string paramName = rbfVal.Attributes["paramName"].Value as String;
					string ownerName = rbfVal.Attributes["owner"].Value as String;
					BaseInstrument instrument = InstrumentController.Instance.GetInstrumentByName(ownerName);
					BaseInstrumentParam param = instrument.getParamByName(paramName);

					rbfPoint.SetParameterValue((GenericMusicParam) param, Convert.ToSingle(rbfVal.InnerXml) );

					//Create slider if parameter hasn't been created yet
					if(!attach.paramControls.HasParameter(param))
						attach.paramControls.CreateSlider(param);

				}
				attach.paramControls.QueueSort();
			}

			if(attach.paramControls.GetParametersFromSliders().Count > 0)
				attach.rbfPanel.ResetRBF(attach.paramControls.GetParametersFromSliders().Count);
		}
	}

	public void WriteMusicGroupsToFile(List<MusicControllerAttachment> musicGroupList){

		string filepath = Application.dataPath + "/Resources/" + m_musicProfilePath;
		XmlDocument xmlDoc = new XmlDocument();
		
		if(File.Exists (filepath))
		{

			/* 	<MusicGroupList>
					<MusicGroup name="TestGroup" color="163452">
						<clip name="IntroSwell" index="1" owner="M-Traveller"></clip>
						<rbfPoint x="0.2" y="0.3" twist="0.0">
							<rbfValue paramName="Filter_Rate" owner="M-Traveller">0.0</rbfValue>
							<rbfValue paramName="Hi_Cut_Filter" owner="M-Traveller">0.7</rbfValue>
						</rbfPoint>
					</MusicGroup>
				</MusicGroupList>
			*/

			xmlDoc.Load(filepath);
			
			XmlElement elmRoot = xmlDoc.DocumentElement;
			
			elmRoot.RemoveAll(); // remove all inside the transforms node.
			
			XmlElement elmNew = xmlDoc.CreateElement("MusicGroupList");

			foreach(MusicControllerAttachment mGroup in musicGroupList){
				XmlElement mGroupElem = xmlDoc.CreateElement("MusicGroup");
				mGroupElem.SetAttribute("x", mGroup.transform.position.x.ToString());
				mGroupElem.SetAttribute("y", mGroup.transform.position.y.ToString());
				mGroupElem.SetAttribute("z", mGroup.transform.position.z.ToString());

				//Add clips
				foreach(InstrumentClip clip in mGroup.clipBuffer.GetClips()){
					XmlElement clipElem = xmlDoc.CreateElement("clip");
					clipElem.SetAttribute("name", clip.name);
					clipElem.SetAttribute("index", clip.scene.ToString());
					clipElem.SetAttribute("owner", clip.owner.Name);
					mGroupElem.AppendChild(clipElem);
				}

				foreach(RBF.RBFTrainingPointAttachment rbfPoint in mGroup.rbfPanel.points){
					XmlElement rbfPointElem = xmlDoc.CreateElement("rbfPoint");
					rbfPointElem.SetAttribute("x", rbfPoint.transform.localPosition.x.ToString());
					rbfPointElem.SetAttribute("y", rbfPoint.transform.localPosition.y.ToString());
					rbfPointElem.SetAttribute("twist", rbfPoint.twist.ToString());

					foreach(KeyValuePair<BaseInstrumentParam,float> pair in rbfPoint.paramValues){
						XmlElement rbfValElem = xmlDoc.CreateElement("rbfValue");

						rbfValElem.SetAttribute("paramName", pair.Key.name);
						rbfValElem.SetAttribute("owner", pair.Key.owner.Name);
						rbfValElem.InnerText = pair.Value.ToString();
						rbfPointElem.AppendChild(rbfValElem);
					}
					mGroupElem.AppendChild(rbfPointElem);
				}

				elmNew.AppendChild(mGroupElem);
			}
			elmRoot.AppendChild(elmNew); // make the transform node the parent.
			
			xmlDoc.Save(filepath); // save file.
		}
	}
}
