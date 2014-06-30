using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using MusicIO;
using VRControls;

namespace UI
{
    public class UIFactory : MonoBehaviour
    {
        //Singletons
        private static UIFactory m_instance;
        public static UIFactory Instance { get { return m_instance; } }

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

        //Fissure control prefabs
        public GameObject rbfSpherePrefab;
        public GameObject rbfSphereTrainingPrefab;
        public GameObject clipMatrixPrefab;
        public GameObject tetrahedronBlenderPrefab;


        //Slider localscale amount
        public float m_sliderScale = 0.1f;
        public static Vector3 sliderScale { get { return new Vector3(Instance.m_sliderScale, Instance.m_sliderScale, Instance.m_sliderScale); } }

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

        void Awake()
        {
            m_instance = this;
            whiteTexturePrefab = (Texture2D)Resources.Load("whiteTex.png");

            m_prefabLookup = new Dictionary<Type, GameObject>();
            m_prefabLookup[typeof(RBFSphere)] = Instance.rbfSpherePrefab;
            m_prefabLookup[typeof(ControlMatrix)] = Instance.rbfSpherePrefab;
            m_prefabLookup[typeof(ClipCube)] = Instance.clipCubePrefab;
            m_prefabLookup[typeof(TetrahedronBlender)] = Instance.tetrahedronBlenderPrefab;
            m_prefabLookup[typeof(ValueTrigger)] = Instance.rbfSphereTrainingPrefab;
            m_prefabLookup[typeof(RBFTrainingSpawner)] = Instance.rbfSphereTrainingPrefab;
            m_prefabLookup[typeof(Scroller)] = Instance.paramScrollerPrefab;
            m_prefabLookup[typeof(InstrumentOrb)] = Instance.instrumentPrefab;
            m_prefabLookup[typeof(Slider)] = Instance.sliderPrefab;
            m_prefabLookup[typeof(Rotary)] = Instance.rotaryPrefab;
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
        public static UIFrame CreateFrame()
        {
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

        public static BaseVRControl CreateMusicRefAttachment(Type attachType) { return CreateMusicRefAttachment(attachType, null, null); }
        public static BaseVRControl CreateMusicRefAttachment(BaseVRControl clone) { return CreateMusicRefAttachment(clone.GetType(), null, clone); }
        public static BaseVRControl CreateInstrumentRefAttachment(InstrumentHandle instrumentRef) { return CreateMusicRefAttachment(typeof(InstrumentOrb), instrumentRef, null); }
        public static BaseVRControl CreateMusicRefAttachment(Type attachType, InstrumentParameter musicRef) { return CreateMusicRefAttachment(attachType, musicRef, null); }
        public static BaseVRControl CreateMusicRefAttachment(Type attachType, object musicRef, BaseVRControl clone)
        {
            GameObject prefab = null;

            if (Instance.m_prefabLookup.Keys.Contains(attachType))
                prefab = Instance.prefabs[attachType];

            if (prefab != null)
            {
                GameObject copy = Instantiate(prefab) as GameObject;
                var attach = copy.GetComponent<BaseVRControl>();
                if (attach != null)
                {
                    if (clone != null && musicRef == null)
                    {
                        //InstrumentHandle specific clone initialization
                        if (clone is InstrumentOrb)
                     		musicRef = ((InstrumentOrb)clone).instrumentRef;
						else if (clone.HasMusicRef)
                            musicRef = clone.musicRef;
                    }

					//Initialize musicref objects
					if (attach is InstrumentOrb)
						((InstrumentOrb)attach).Init((InstrumentHandle)musicRef);
					else
	                    if (musicRef != null)
	                        attach.Init((InstrumentParameter)musicRef);
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

