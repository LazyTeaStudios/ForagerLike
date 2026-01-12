using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Nicrom
{
    public class WindProfile : ScriptableObject
    {
        public int selectedToolBar = 0;

        public bool showGlobalGroup = true;
        public bool showMainGroup = true;
        public bool showVegetationGroup = true;
        public bool showGrassGroup = true;
        public bool showFlowerGroup = true;
        public bool showWSPGroup = true;
        public bool showSkyboxCloudsGroup = true;
        public bool showCloudShadowGroup = true;
        public bool showWaterGroup = true;
        public bool drawFooterButtons = true;

        public float mmGrassSpeedMin = 1.0f;
        public float mmGrassSpeedMax = 2.0f;
        public float mmGrassAmplitudeMin = 1.0f;
        public float mmGrassAmplitudeMax = 2.0f;
        public float mmGrassBendingMin = 0.0f;
        public float mmGrassBendingMax = 2.0f;
        public float grassColorMask2SpeedMin = 0.2f;
        public float grassColorMask2SpeedMax = 2.0f;

        public float mmFlowerSpeedMin = 1.0f;
        public float mmFlowerSpeedMax = 2.0f;
        public float mmFlowerAmplitudeMin = 1.0f;
        public float mmFlowerAmplitudeMax = 2.0f;
        public float mmFlowerBendingMin = 0.0f;
        public float mmFlowerBendingMax = 2.0f;
        public float dmFlowerSpeedMin = 1.0f;
        public float dmFlowerSpeedMax = 2.0f;
        public float dmFlowerAmplitudeMin = 1.0f;
        public float dmFlowerAmplitudeMax = 2.0f;

        public float mmVegetationSpeedMin = 1.0f;
        public float mmVegetationSpeedMax = 2.0f;
        public float mmVegetationAmplitudeMin = 1.0f;
        public float mmVegetationAmplitudeMax = 2.0f;
        public float mmVegetationBendingMin = 0.0f;
        public float mmVegetationBendingMax = 2.0f;
        public float dmVegetationSpeedMin = 1.0f;
        public float dmVegetationSpeedMax = 2.0f;
        public float dmVegetationAmplitudeMin = 1.0f;
        public float dmVegetationAmplitudeMax = 2.0f;

        public float mmWSPSpeedMin = 1.0f;
        public float mmWSPSpeedMax = 2.0f;
        public float mmWSPAmplitudeMin = 1.0f;
        public float mmWSPAmplitudeMax = 2.0f;
        public float dmWSPSpeedMin = 1.0f;
        public float dmWSPSpeedMax = 2.0f;
        public float dmWSPAmplitudeMin = 1.0f;
        public float dmWSPAmplitudeMax = 2.0f;

        public bool combinedCloudSpeed = false;
        public float cloudSpeedMin = 1.0f;
        public float cloudSpeedMax = 2.0f;
        public float cloud1SpeedMin = 1.0f;
        public float cloud1SpeedMax = 2.0f;
        public float cloud2SpeedMin = 1.0f;
        public float cloud2SpeedMax = 2.0f;
        public float cloud3SpeedMin = 1.0f;
        public float cloud3SpeedMax = 2.0f;

        public float cloud1DirOffset = 0;
        public float cloud2DirOffset = 0;
        public float cloud3DirOffset = 0;

        public bool combinedCloudShadowSpeed = false;
        public float cloudShadowSpeedMin = 1.0f;
        public float cloudShadowSpeedMax = 2.0f;
        public float cloudShadow1SpeedMin = 1.0f;
        public float cloudShadow1SpeedMax = 2.0f;
        public float cloudShadow2SpeedMin = 1.0f;
        public float cloudShadow2SpeedMax = 2.0f;
        public float cloudShadow3SpeedMin = 1.0f;
        public float cloudShadow3SpeedMax = 2.0f;

        public bool combinedWaterSpeed = false;
        public float waterNormalsSpeedMin = 1.0f;
        public float waterNormalsSpeedMax = 2.0f;
        public float waterNormalsSpeed1Min = 1.0f;
        public float waterNormalsSpeed1Max = 2.0f;
        public float waterNormalsSpeed2Min = 1.0f;
        public float waterNormalsSpeed2Max = 2.0f;
        public float waterNormalsDirOffset1 = 0;
        public float waterNormalsDirOffset2 = 0;

        public float waterFoamSpeedMin = 1.0f;
        public float waterFoamSpeedMax = 2.0f;
        public float waterFoamSpeed1Min = 1.0f;
        public float waterFoamSpeed1Max = 2.0f;
        public float waterFoamSpeed2Min = 1.0f;
        public float waterFoamSpeed2Max = 2.0f;

        public float waterFoamDirOffset1 = 0;
        public float waterFoamDirOffset2 = 0;
        
        [Range(1, 6)]
        public int sliderMaxValue = 6;
    }
}
