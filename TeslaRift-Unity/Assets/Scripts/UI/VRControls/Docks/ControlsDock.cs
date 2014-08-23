using UnityEngine;
using UI;
using MusicIO;
using System.Collections;
using System.Collections.Generic;

namespace VRControls
{
    public class ControlsDock : RadialDock
    {
        public override void Awake()
        {
            base.Awake();
            AddAcceptedDocktype(typeof(CubeButton));
            AddAcceptedDocktype(typeof(ControlLayout));
            AddAcceptedDocktype(typeof(Picker));

            DockChildTransforms();
        }
    }
}