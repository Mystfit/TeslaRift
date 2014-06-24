using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using MusicIO;

namespace UI
{
	public class UIFactory : MonoBehaviour
	{
		//Singletons
		private static UIFactory m_instance;
		public static UIFactory Instance{ get { return m_instance; }}

		//Prefab objects
		public GameObject sliderPrefab;
		public GameObject framePrefab;
		public GameObject clipButtonPrefab;
        public GameObject clipCubePrefab;
		public GameObject clipPlaceholderPrefab;
		public GameObject rotaryPrefab;
		public GameObject paramScrollerPrefab;
		public GameObject instrumentPrefab;
        public GameObject guiQuadPrefab;
        public GameObject volumetricCylinderPrefab;
        public Texture2D whiteTexturePrefab;

        public Dictionary<Type, GameObject> prefabs { get { return m_prefabLookup; } }
        private Dictionary<Type, GameObject> m_prefabLookup;

        public Dictionary<Type, Type> musicTypes { get { return m_musicTypeLookup; } }
        private Dictionary<Type, Type> m_musicTypeLookup;


        //Fissure control prefabs
        public GameObject rbfSpherePrefab;
        public GameObject rbfSphereTrainingPrefab;
        public GameObject clipMatrixPrefab;
        public GameObject tetrahedronBlenderPrefab;


		//Slider localscale amount
		public float m_sliderScale = 0.1f;
		public static Vector3 sliderScale{get {return new Vector3(Instance.m_sliderScale, Instance.m_sliderScale, Instance.m_sliderScale); }}

        [Range(0.0f, 0.03f)]
        public float m_outlineSelectedSize;
        public static float outlineSelectedSize { get { return Instance.m_outlineSelectedSize; } }

        [Range(0.0f, 0.03f)]
        public float m_outlineHoverSize;
        public static float outlineHoverSize { get { return Instance.m_outlineHoverSize; } }

        public Color m_outlineSelectedColor;
        public static Color outlineSelectedColor { get { return Instance.m_outlineSelectedColor; } }

        public Color m_outlineHoverColor;
        public static Color outlineHoverColor { get { return Instance.m_outlineHoverColor; } }

        public Color m_outlineDeselectedColor;
        public static Color outlineDeselectedColor { get { return Instance.m_outlineDeselectedColor; } }

        public Color m_textLabelSelectedColor;
        public static Color textLabelSelectedColor { get { return Instance.m_textLabelSelectedColor; } }

        public Color m_textLabelDeselectedColor;
        public static Color textLabelDeselectedColor { get { return Instance.m_textLabelDeselectedColor; } }

		void Awake(){
			m_instance = this;
            whiteTexturePrefab = (Texture2D)Resources.Load("whiteTex.png");

            m_prefabLookup = new Dictionary<Type, GameObject>();
            m_prefabLookup[typeof(RBFSphereAttachment)]  = Instance.rbfSpherePrefab;
            m_prefabLookup[typeof(ClipMatrixAttachment)] = Instance.rbfSpherePrefab;
            m_prefabLookup[typeof(ClipCubeAttachment)] = Instance.clipCubePrefab;
            m_prefabLookup[typeof(ClipButtonAttachment)] = Instance.clipButtonPrefab;
            m_prefabLookup[typeof(TetrahedronBlenderAttachment)] = Instance.tetrahedronBlenderPrefab;
            m_prefabLookup[typeof(RBFTrainingAttachment)] = Instance.rbfSphereTrainingPrefab;
            m_prefabLookup[typeof(ScrollerAttachment)] = Instance.paramScrollerPrefab;
            m_prefabLookup[typeof(InstrumentAttachment)] = Instance.instrumentPrefab;
            m_prefabLookup[typeof(SliderAttachment)] = Instance.sliderPrefab;
            m_prefabLookup[typeof(RotaryAttachment)] = Instance.rotaryPrefab;
		}


        /*
         * Creates a flat white texture
         */
        public static Texture2D CreateWhiteTexture()
        {
            return Instance.whiteTexturePrefab;
        }


		/*
		 * UIFrame
		 * A generic UI frame
		 */
		public static UIFrame CreateFrame(){
			GameObject frame = Instantiate(Instance.framePrefab) as GameObject;
			UIFrame attach = frame.GetComponent<UIFrame>();

			return attach;
		}


		/*
         * ClipPlaceholder
         * Draggable clip cube
         */
		public static GameObject CreateClipPlaceholder()
		{
			GameObject cubePlaceholder = Instantiate(Instance.clipPlaceholderPrefab) as GameObject;
			return cubePlaceholder;
		}
		

        /*
         * Qui quad prefab
         * Creates a quad for gui items
         */
        public static GameObject CreateGuiQuad()
        {
            GameObject quad = Instantiate(Instance.guiQuadPrefab) as GameObject;
            return quad;
        }


        /*
         * Qui quad prefab
         * Creates a quad for gui items
         */
        public static GameObject CreateVolumetricCylinder()
        {
            GameObject cylinder = Instantiate(Instance.volumetricCylinderPrefab) as GameObject;
            return cylinder;
        }


        public static BaseAttachment CreatePrefabAttachment(Type attachType)
        {
            return CreatePrefabAttachment(attachType, null, null);
        }

        public static BaseAttachment CreatePrefabAttachment(BaseAttachment clone)
        {
            return CreatePrefabAttachment(clone.GetType(), null, clone);
        }

        public static BaseAttachment CreatePrefabAttachment<T>(Type attachType, BaseMusicObject musicRef)
        {
            return CreatePrefabAttachment(attachType, musicRef, null);
        }

        public static BaseAttachment CreatePrefabAttachment(Type attachType, BaseMusicObject musicRef, BaseAttachment clone)
        {
            GameObject prefab = null;

            if (Instance.m_prefabLookup.Keys.Contains(attachType))
                prefab = Instance.prefabs[attachType];

            if (prefab != null)
            {
                GameObject copy = Instantiate(prefab) as GameObject;
                var attach = copy.GetComponent<BaseAttachment>();
                if (attach != null)
                {
                    if (clone != null && musicRef == null)
                    {
                        //Check to see if clone object has a musicRef we need to copy
                        if (clone.HasMusicRef)
                        {
                            Type cloneType = clone.GetType();
                            if (cloneType == typeof(BaseAttachmentIO<InstrumentClip>))
                                musicRef = ((BaseAttachmentIO<InstrumentClip>)clone).musicRef;
                            else if (cloneType == typeof(BaseAttachmentIO<BaseInstrument>))
                                musicRef = ((BaseAttachmentIO<InstrumentClip>)clone).musicRef;
                            else if (cloneType == typeof(BaseAttachmentIO<BaseInstrumentParam>))
                                musicRef = ((BaseAttachmentIO<InstrumentClip>)clone).musicRef;
                        }
                    }

                    //Initialize musicref objects
                    if (musicRef != null)
                    {
                        Type musicType = musicRef.GetType();
                        if(musicType == typeof(BaseInstrument))
                            ((BaseAttachmentIO<BaseInstrument>)attach).Init((BaseInstrument)musicRef);
                        else if (musicType == typeof(BaseInstrumentParam))
                            ((BaseAttachmentIO<BaseInstrumentParam>)attach).Init((BaseInstrumentParam)musicRef);
                    }
                }

                if (clone != null)
                {
                    attach.transform.parent = clone.transform;
                    attach.transform.position = clone.transform.position;
                    attach.transform.parent = null;
                    attach.SetTransient(true);
                    attach.SetCloneable(false);
                }
                return attach;
            }
            return null;
        }
	}
}

