using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Experimental.GlobalIllumination;
using UnityEngine.Rendering.Universal;

namespace Nicrom
{
    public partial class LightUtils
    {
        public static void SetLightCookieSize(Light light, float lightCookieSize)
        {
            UniversalAdditionalLightData lightData = light.GetComponent<UniversalAdditionalLightData>();
            lightData.lightCookieSize = new Vector2(lightCookieSize, lightCookieSize);
        }

        //public static void SetLightCookieSize(Light light, float lightCookieSize)
        //{
        //    light.cookieSize = lightCookieSize;
        //}
    }
}
