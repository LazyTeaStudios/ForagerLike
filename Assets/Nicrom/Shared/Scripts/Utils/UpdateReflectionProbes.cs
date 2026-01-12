using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Nicrom
{
    public class UpdateReflectionProbes : MonoBehaviour
    {
        public List<ReflectionProbe> reflectionProbesList = new List<ReflectionProbe>();

        void Start()
        {
            UpdateRPs();
        }

        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.U))
                UpdateRPs();
        }

        public void UpdateRPs()
        {
            int n = reflectionProbesList.Count;

            for (int i = 0; i < n; i++)
            { 
                if(reflectionProbesList[i] != null)
                    reflectionProbesList[i].RenderProbe();
            }
        }
    }
}
