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
            m_prefabLookup[typeof(RBFSphereVRControl)]  = Instance.rbfSpherePrefab;
            m_prefabLookup[typeof(ControlMatrix)] = Instance.rbfSpherePrefab;
            m_prefabLookup[typeof(ClipCube)] = Instance.clipCubePrefab;
            m_prefabLookup[typeof(TetrahedronBlenderVRControl)] = Instance.tetrahedronBlenderPrefab;
            m_prefabLookup[typeof(ValueTriggerVRControl)] = Instance.rbfSphereTrainingPrefab;
            m_prefabLookup[typeof(RBFTrainingSpawnerVRControl)] = Instance.rbfSphereTrainingPrefab;
            m_prefabLookup[typeof(ScrollerVRControl)] = Instance.paramScrollerPrefab;
            m_prefabLookup[typeof(InstrumentVRControl)] = Instance.instrumentPrefab;
            m_prefabLookup[typeof(SliderVRControl)] = Instance.sliderPrefab;
            m_prefabLookup[typeof(RotaryVRControl)] = Instance.rotaryPrefab;
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


        public static BaseVRControl CreatePrefabAttachment(Type attachType)
        {
            return CreatePrefabAttachment(attachType, null, null);
        }

        public static BaseVRControl CreatePrefabAttachment(BaseVRControl clone)
        {
            return CreatePrefabAttachment(clone.GetType(), null, clone);
        }

        public static BaseVRControl CreatePrefabAttachment(Type attachType, BaseMusicObject musicRef)
        {
            return CreatePrefabAttachment(attachType, musicRef, null);
        }

        public static BaseVRControl CreatePrefabAttachment(Type attachType, BaseMusicObject musicRef, BaseVRControl clone)
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
                        //Check to see if clone object has a musicRef we need to copy
                        if (clone.HasMusicRef)
                        {
                            if(clone is MusicVRControl<Instrument>)
                                musicRef = ((InstrumentVRControl)clone).musicRef;
                            if (clone is InstrumentVRControl)
                                musicRef = ((InstrumentVRControl)clone).musicRef;
                            else if (clone is SliderVRControl)
                                musicRef = ((SliderVRControl)clone).musicRef;
                            else if (clone is ClipCube)
                                musicRef = ((ClipCube)clone).musicRef;
                            else if (clone is RotaryVRControl)
                                musicRef = ((RotaryVRControl)clone).musicRef;
                        }
                    }

                    //Initialize musicref objects
                    if (musicRef != null)
                    {

                        if (musicRef is Instrument){
                            MusicVRControl<Instrument> cast = attach as MusicVRControl<Instrument>;
                            cast.Init((Instrument)musicRef);
                        } 
                        else if (musicRef is ClipParameter){
                            MusicVRControl<ClipParameter> cast = (MusicVRControl<ClipParameter>)attach;
                            cast.Init((ClipParameter)musicRef);
                        } 
                        else if (musicRef is NoteParameter){
                            MusicVRControl<InstrumentParameter> cast = (MusicVRControl<InstrumentParameter>)attach;
                            cast.Init((InstrumentParameter)musicRef);
                        } 
                        else if (musicRef is InstrumentParameter){
                            MusicVRControl<InstrumentParameter> cast = (MusicVRControl<InstrumentParameter>)attach;
                            cast.Init((InstrumentParameter)musicRef);
                        } else {
                            throw new Exception("MusicRef type not recognised");
                        }
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

