using UnityEngine;
using UnityEditor;

namespace Nicrom {


    [ExecuteInEditMode]
    public class WindManager : MonoBehaviour
    {
        private float cl1_DirAngle = 0;
        private float cl2_DirAngle = 0;
        private float cl3_DirAngle = 0;

        private float cl1_SpeedScale = 1;
        private float cl2_SpeedScale = 1;
        private float cl3_SpeedScale = 1;

        private Vector2 cl1_UVOffset = Vector2.zero;
        private Vector2 cl2_UVOffset = Vector2.zero;
        private Vector2 cl3_UVOffset = Vector2.zero;

        private Vector2 cl1_DirVector = Vector2.zero;
        private Vector2 cl2_DirVector = Vector2.zero;
        private Vector2 cl3_DirVector = Vector2.zero;

        private Vector2 cs_SL1_UVOffset = Vector2.zero;
        private Vector2 cs_SL2_UVOffset = Vector2.zero;
        private Vector2 cs_SL3_UVOffset = Vector2.zero;

        private float cs_SL1_SpeedScale = 1;
        private float cs_SL2_SpeedScale = 1;
        private float cs_SL3_SpeedScale = 1;

        private Vector2 cs_SL1_DirVector = Vector2.zero;
        private Vector2 cs_SL2_DirVector = Vector2.zero;
        private Vector2 cs_SL3_DirVector = Vector2.zero;

        private Vector2 waterN_UVOffset1 = Vector2.zero;
        private Vector2 waterN_UVOffset2 = Vector2.zero;

        private Vector2 waterN_DirVector1 = Vector2.zero;
        private Vector2 waterN_DirVector2= Vector2.zero;

        private float waterN_DirAngle1 = 0;
        private float waterN_DirAngle2 = 0;

        private float waterN_SpeedScale1 = 0;
        private float waterN_SpeedScale2 = 0;

        private Vector2 waterF_UVOffset1 = Vector2.zero;
        private Vector2 waterF_UVOffset2 = Vector2.zero;

        private Vector2 waterF_DirVector1 = Vector2.zero;
        private Vector2 waterF_DirVector2 = Vector2.zero;

        private float waterF_DirAngle1 = 0;
        private float waterF_DirAngle2 = 0;

        private float waterF_SpeedScale1 = 0;
        private float waterF_SpeedScale2 = 0;

        private Vector2 grassCM2_UVOffset = Vector2.zero;
        private float sunYAxisRot = 0;

        private float mmTimeCounterGrass = 0;
        private float mmTimeCounterVegetation = 0;
        private float dmTimeCounterVegetation = 0;
        private float mmTimeCounterFlower = 0;
        private float dmTimeCounterFlower = 0;
        private float mmTimeCounterWSP = 0;
        private float dmTimeCounterWSP = 0;

        public GizmosVisibility gizmosVisibility = GizmosVisibility.WhenSelected;

        public bool showGearGroup = true;
        public bool showMainGroup = true;
        public bool showWindGroup = true;
        public bool drawFooterButtons = true;

        public Transform mainLight;
        public float windDirection = 0.0f;
        public float windStrength = 1;
        [Range(1, 6)]
        public int sliderMaxValue = 3;

        public WindProfile gWindProfile;

        void Update()
        {
            UpdateWind();
        }

        public void UpdateWind()
        {
            if (gWindProfile != null)
            {
                UpdateTimeCounters();
                UpdateGrassMask();
                UpdateSkybox();
                UpdateCloudShadows();
                UpdateWater();

                SetShaderGlobalVariables();
            }
        }

        public void SetWindScale(float scale)
        {
            windStrength = Mathf.Clamp(scale, 0, 2);
        }

        private void UpdateTimeCounters()
        {
            mmTimeCounterGrass          += Lerp(gWindProfile.mmGrassSpeedMin, gWindProfile.mmGrassSpeedMax, windStrength) * Time.deltaTime;
            mmTimeCounterFlower         += Lerp(gWindProfile.mmFlowerSpeedMin, gWindProfile.mmFlowerSpeedMax, windStrength) * Time.deltaTime;
            mmTimeCounterVegetation     += Lerp(gWindProfile.mmVegetationSpeedMin, gWindProfile.mmVegetationSpeedMax, windStrength) * Time.deltaTime;
            mmTimeCounterWSP            += Lerp(gWindProfile.mmWSPSpeedMin, gWindProfile.mmWSPSpeedMax, windStrength) * Time.deltaTime;

            dmTimeCounterFlower         += Lerp(gWindProfile.dmFlowerSpeedMin, gWindProfile.dmFlowerSpeedMax, windStrength) * Time.deltaTime;
            dmTimeCounterVegetation     += Lerp(gWindProfile.dmVegetationSpeedMin, gWindProfile.dmVegetationSpeedMax, windStrength) * Time.deltaTime;
            dmTimeCounterWSP            += Lerp(gWindProfile.dmWSPSpeedMin, gWindProfile.dmWSPSpeedMax, windStrength) * Time.deltaTime;
        }

        private void UpdateGrassMask()
        {
            float angle = -Mathf.Deg2Rad * (windDirection + 90);
            Vector2 windDirVector = new Vector2(Mathf.Cos(angle), Mathf.Sin(angle));
            grassCM2_UVOffset += windDirVector * Lerp(gWindProfile.grassColorMask2SpeedMin, gWindProfile.grassColorMask2SpeedMax, windStrength) * Time.deltaTime;
        }

        private void UpdateSkybox()
        {
            cl1_DirAngle = -Mathf.Deg2Rad * (windDirection + gWindProfile.cloud1DirOffset + 90);
            cl2_DirAngle = -Mathf.Deg2Rad * (windDirection + gWindProfile.cloud2DirOffset + 90);
            cl3_DirAngle = -Mathf.Deg2Rad * (windDirection + gWindProfile.cloud3DirOffset + 90);
            
            cl1_DirVector = new Vector2(Mathf.Cos(cl1_DirAngle), Mathf.Sin(cl1_DirAngle));
            cl2_DirVector = new Vector2(Mathf.Cos(cl2_DirAngle), Mathf.Sin(cl2_DirAngle));
            cl3_DirVector = new Vector2(Mathf.Cos(cl3_DirAngle), Mathf.Sin(cl3_DirAngle));


            if (gWindProfile.combinedCloudSpeed)
            {
                float speed = Lerp(gWindProfile.cloudSpeedMin, gWindProfile.cloudSpeedMax, windStrength);

                cl1_SpeedScale = speed;
                cl2_SpeedScale = speed;
                cl3_SpeedScale = speed;

                cl1_UVOffset += cl1_DirVector * speed * Time.deltaTime;
                cl2_UVOffset += cl2_DirVector * speed * Time.deltaTime;
                cl3_UVOffset += cl3_DirVector * speed * Time.deltaTime;
            }
            else
            {
                cl1_SpeedScale = Lerp(gWindProfile.cloud1SpeedMin, gWindProfile.cloud1SpeedMax, windStrength);
                cl2_SpeedScale = Lerp(gWindProfile.cloud2SpeedMin, gWindProfile.cloud2SpeedMax, windStrength);
                cl3_SpeedScale = Lerp(gWindProfile.cloud3SpeedMin, gWindProfile.cloud3SpeedMax, windStrength);

                cl1_UVOffset += cl1_DirVector * cl1_SpeedScale * Time.deltaTime;
                cl2_UVOffset += cl2_DirVector * cl2_SpeedScale * Time.deltaTime;
                cl3_UVOffset += cl3_DirVector * cl3_SpeedScale * Time.deltaTime;
            }
        }

        private void UpdateCloudShadows()
        {
            if (mainLight != null)
                sunYAxisRot = mainLight.eulerAngles.y;

            float dirAngle = -Mathf.Deg2Rad * (windDirection - sunYAxisRot + 90);
            Vector2 dirVector = new Vector2(Mathf.Cos(dirAngle), Mathf.Sin(dirAngle));

            cs_SL1_DirVector = dirVector;
            cs_SL2_DirVector = dirVector;
            cs_SL3_DirVector = dirVector;

            if (gWindProfile.combinedCloudShadowSpeed)
            {
                float speed = Lerp(gWindProfile.cloudShadowSpeedMin, gWindProfile.cloudShadowSpeedMax, windStrength);

                cs_SL1_SpeedScale = speed;
                cs_SL2_SpeedScale = speed;
                cs_SL3_SpeedScale = speed;

                cs_SL1_UVOffset += dirVector * speed * Time.deltaTime;
                cs_SL2_UVOffset += dirVector * speed * Time.deltaTime;
                cs_SL3_UVOffset += dirVector * speed * Time.deltaTime;
            }
            else
            {
                cs_SL1_SpeedScale = Lerp(gWindProfile.cloudShadow1SpeedMin, gWindProfile.cloudShadow1SpeedMax, windStrength);
                cs_SL2_SpeedScale = Lerp(gWindProfile.cloudShadow2SpeedMin, gWindProfile.cloudShadow2SpeedMax, windStrength);
                cs_SL3_SpeedScale = Lerp(gWindProfile.cloudShadow3SpeedMin, gWindProfile.cloudShadow3SpeedMax, windStrength);

                cs_SL1_UVOffset += dirVector * cs_SL1_SpeedScale * Time.deltaTime;
                cs_SL2_UVOffset += dirVector * cs_SL2_SpeedScale * Time.deltaTime;
                cs_SL3_UVOffset += dirVector * cs_SL3_SpeedScale * Time.deltaTime;
            }
        }
        private void UpdateWater()
        {
            waterN_DirAngle1 = -Mathf.Deg2Rad * (windDirection + gWindProfile.waterNormalsDirOffset1 + 90);
            waterN_DirAngle2 = -Mathf.Deg2Rad * (windDirection + gWindProfile.waterNormalsDirOffset2 + 90);

            waterN_DirVector1 = new Vector2(Mathf.Cos(waterN_DirAngle1), Mathf.Sin(waterN_DirAngle1));
            waterN_DirVector2 = new Vector2(Mathf.Cos(waterN_DirAngle2), Mathf.Sin(waterN_DirAngle2));

            if (gWindProfile.combinedWaterSpeed)
            {
                waterN_SpeedScale1 = Lerp(gWindProfile.waterNormalsSpeedMin, gWindProfile.waterNormalsSpeedMax, windStrength);
                waterN_SpeedScale2 = waterN_SpeedScale1;

                waterN_UVOffset1 += waterN_DirVector1 * waterN_SpeedScale1 * Time.deltaTime;
                waterN_UVOffset2 += waterN_DirVector2 * waterN_SpeedScale2 * Time.deltaTime;
            }
            else
            {
                waterN_SpeedScale1 = Lerp(gWindProfile.waterNormalsSpeedMin, gWindProfile.waterNormalsSpeedMax, windStrength);
                waterN_SpeedScale2 = Lerp(gWindProfile.waterNormalsSpeed2Min, gWindProfile.waterNormalsSpeed2Max, windStrength);

                waterN_UVOffset1 += waterN_DirVector1 * waterN_SpeedScale1 * Time.deltaTime;
                waterN_UVOffset2 += waterN_DirVector2 * waterN_SpeedScale2 * Time.deltaTime;
            }

            waterF_DirAngle1 = -Mathf.Deg2Rad * (windDirection + gWindProfile.waterFoamDirOffset1 + 90);
            waterF_DirAngle2 = -Mathf.Deg2Rad * (windDirection + gWindProfile.waterFoamDirOffset2 + 90);

            waterF_DirVector1 = new Vector2(Mathf.Cos(waterF_DirAngle1), Mathf.Sin(waterF_DirAngle1));
            waterF_DirVector2 = new Vector2(Mathf.Cos(waterF_DirAngle2), Mathf.Sin(waterF_DirAngle2));

            if (gWindProfile.combinedWaterSpeed)
            {
                waterF_SpeedScale1 = Lerp(gWindProfile.waterFoamSpeedMin, gWindProfile.waterFoamSpeedMax, windStrength);
                waterF_SpeedScale2 = waterF_SpeedScale1;

                waterF_UVOffset1 += waterF_DirVector1 * waterF_SpeedScale1 * Time.deltaTime;
                waterF_UVOffset2 += waterF_DirVector2 * waterF_SpeedScale2 * Time.deltaTime;
            }
            else
            {
                waterF_SpeedScale1 = Lerp(gWindProfile.waterFoamSpeedMin, gWindProfile.waterFoamSpeedMax, windStrength);
                waterF_SpeedScale2 = Lerp(gWindProfile.waterFoamSpeed2Min, gWindProfile.waterFoamSpeed2Max, windStrength);

                waterF_UVOffset1 += waterF_DirVector1 * waterF_SpeedScale1 * Time.deltaTime;
                waterF_UVOffset2 += waterF_DirVector2 * waterF_SpeedScale2 * Time.deltaTime;
            }
        }

        private void SetShaderGlobalVariables()
        {
            if(Application.isPlaying)
                Shader.SetGlobalFloat("Nicrom_ApplicationIsPlaying", 1);
            else
                Shader.SetGlobalFloat("Nicrom_ApplicationIsPlaying", 0);

            Shader.SetGlobalFloat("Nicrom_WindDirAngle", windDirection);

            SetSkyboxGlobalVariables();
            SetCloudShadowsGlobalVariables();
            SetCloudVegetationGlobalVariables();
            SetWaterGlobalVariables();
        }

        private void SetSkyboxGlobalVariables()
        {
            Shader.SetGlobalVector("Nicrom_Clouds_UVOffset1", cl1_UVOffset);
            Shader.SetGlobalVector("Nicrom_Clouds_UVOffset2", cl2_UVOffset);
            Shader.SetGlobalVector("Nicrom_Clouds_UVOffset3", cl3_UVOffset);

            Shader.SetGlobalVector("Nicrom_Skybox_CL1_DirVector", cl1_DirVector);
            Shader.SetGlobalVector("Nicrom_Skybox_CL2_DirVector", cl2_DirVector);
            Shader.SetGlobalVector("Nicrom_Skybox_CL3_DirVector", cl3_DirVector);

            Shader.SetGlobalFloat("Nicrom_Skybox_CL1_SpeedScale", cl1_SpeedScale);
            Shader.SetGlobalFloat("Nicrom_Skybox_CL2_SpeedScale", cl2_SpeedScale);
            Shader.SetGlobalFloat("Nicrom_Skybox_CL3_SpeedScale", cl3_SpeedScale);
        }

        private void SetCloudShadowsGlobalVariables()
        {
            Shader.SetGlobalVector("Nicrom_CS_SL1_UVOffset", cs_SL1_UVOffset);
            Shader.SetGlobalVector("Nicrom_CS_SL2_UVOffset", cs_SL2_UVOffset);
            Shader.SetGlobalVector("Nicrom_CS_SL3_UVOffset", cs_SL3_UVOffset);

            Shader.SetGlobalVector("Nicrom_CS_SL1_DirVector", cs_SL1_DirVector);
            Shader.SetGlobalVector("Nicrom_CS_SL2_DirVector", cs_SL2_DirVector);
            Shader.SetGlobalVector("Nicrom_CS_SL3_DirVector", cs_SL3_DirVector);

            Shader.SetGlobalFloat("Nicrom_CS_SL1_SpeedScale", cs_SL1_SpeedScale);
            Shader.SetGlobalFloat("Nicrom_CS_SL2_SpeedScale", cs_SL2_SpeedScale);
            Shader.SetGlobalFloat("Nicrom_CS_SL3_SpeedScale", cs_SL3_SpeedScale);
        }

        private void SetCloudVegetationGlobalVariables()
        {
            Shader.SetGlobalVector("Nicrom_Grass_CM2_UVOffset", grassCM2_UVOffset);

            Shader.SetGlobalFloat("Nicrom_MM_Time_Grass", mmTimeCounterGrass);
            Shader.SetGlobalFloat("Nicrom_MM_Time_Flower", mmTimeCounterFlower);
            Shader.SetGlobalFloat("Nicrom_MM_Time_Vegetation", mmTimeCounterVegetation);
            Shader.SetGlobalFloat("Nicrom_MM_Time_WSP", mmTimeCounterWSP);

            Shader.SetGlobalFloat("Nicrom_DM_Time_Flower", dmTimeCounterFlower);
            Shader.SetGlobalFloat("Nicrom_DM_Time_Vegetation", dmTimeCounterVegetation);
            Shader.SetGlobalFloat("Nicrom_DM_Time_WSP", dmTimeCounterWSP);

            Shader.SetGlobalFloat("Nicrom_MM_SpeedScale_Grass", Lerp(gWindProfile.mmGrassSpeedMin, gWindProfile.mmGrassSpeedMax, windStrength));
            Shader.SetGlobalFloat("Nicrom_MM_SpeedScale_Flower", Lerp(gWindProfile.mmFlowerSpeedMin, gWindProfile.mmFlowerSpeedMax, windStrength));
            Shader.SetGlobalFloat("Nicrom_MM_SpeedScale_Vegetation", Lerp(gWindProfile.mmVegetationSpeedMin, gWindProfile.mmVegetationSpeedMax, windStrength));
            Shader.SetGlobalFloat("Nicrom_MM_SpeedScale_WSP", Lerp(gWindProfile.mmWSPSpeedMin, gWindProfile.mmWSPSpeedMax, windStrength));

            Shader.SetGlobalFloat("Nicrom_DM_SpeedScale_Flower", Lerp(gWindProfile.dmFlowerSpeedMin, gWindProfile.dmFlowerSpeedMax, windStrength));
            Shader.SetGlobalFloat("Nicrom_DM_SpeedScale_Vegetation", Lerp(gWindProfile.dmVegetationSpeedMin, gWindProfile.dmVegetationSpeedMax, windStrength));
            Shader.SetGlobalFloat("Nicrom_DM_SpeedScale_WSP", Lerp(gWindProfile.dmWSPSpeedMin, gWindProfile.dmWSPSpeedMax, windStrength));

            Shader.SetGlobalFloat("Nicrom_MM_AmpScale_Grass", Lerp(gWindProfile.mmGrassAmplitudeMin, gWindProfile.mmGrassAmplitudeMax, windStrength));
            Shader.SetGlobalFloat("Nicrom_MM_AmpScale_Flower", Lerp(gWindProfile.mmFlowerAmplitudeMin, gWindProfile.mmFlowerAmplitudeMax, windStrength));
            Shader.SetGlobalFloat("Nicrom_MM_AmpScale_Vegetation", Lerp(gWindProfile.mmVegetationAmplitudeMin, gWindProfile.mmVegetationAmplitudeMax, windStrength));
            Shader.SetGlobalFloat("Nicrom_MM_AmpScale_WSP", Lerp(gWindProfile.mmWSPAmplitudeMin, gWindProfile.mmWSPAmplitudeMax, windStrength));

            Shader.SetGlobalFloat("Nicrom_DM_AmpScale_Flower", Lerp(gWindProfile.dmFlowerAmplitudeMin, gWindProfile.dmFlowerAmplitudeMax, windStrength));
            Shader.SetGlobalFloat("Nicrom_DM_AmpScale_Vegetation", Lerp(gWindProfile.dmVegetationAmplitudeMin, gWindProfile.dmVegetationAmplitudeMax, windStrength));
            Shader.SetGlobalFloat("Nicrom_DM_AmpScale_WSP", Lerp(gWindProfile.dmWSPAmplitudeMin, gWindProfile.dmWSPAmplitudeMax, windStrength));

            Shader.SetGlobalFloat("Nicrom_MM_BendScale_Grass", Lerp(gWindProfile.mmGrassBendingMin, gWindProfile.mmGrassBendingMax, windStrength));
            Shader.SetGlobalFloat("Nicrom_MM_BendScale_Flowers", Lerp(gWindProfile.mmFlowerBendingMin, gWindProfile.mmFlowerBendingMax, windStrength));
            Shader.SetGlobalFloat("Nicrom_MM_BendScale_Vegetation", Lerp(gWindProfile.mmVegetationBendingMin, gWindProfile.mmVegetationBendingMax, windStrength));
        }

        private void SetWaterGlobalVariables()
        {
            Shader.SetGlobalVector("Nicrom_WaterN_UVOffset1", waterN_UVOffset1);
            Shader.SetGlobalVector("Nicrom_WaterN_UVOffset2", waterN_UVOffset2);

            Shader.SetGlobalVector("Nicrom_WaterN_DirVector1", waterN_DirVector1);
            Shader.SetGlobalVector("Nicrom_WaterN_DirVector2", waterN_DirVector2);

            Shader.SetGlobalFloat("Nicrom_WaterN_SpeedScale1", waterN_SpeedScale1);
            Shader.SetGlobalFloat("Nicrom_WaterN_SpeedScale2", waterN_SpeedScale2);

            Shader.SetGlobalVector("Nicrom_Water_UVOffset1", waterF_UVOffset1);
            Shader.SetGlobalVector("Nicrom_Water_UVOffset2", waterF_UVOffset2);

            Shader.SetGlobalVector("Nicrom_WaterF_DirVector1", waterF_DirVector1);
            Shader.SetGlobalVector("Nicrom_WaterF_DirVector2", waterF_DirVector2);

            Shader.SetGlobalFloat("Nicrom_WaterF_SpeedScale1", waterF_SpeedScale1);
            Shader.SetGlobalFloat("Nicrom_WaterF_SpeedScale2", waterF_SpeedScale2);
        }

        private float Lerp(float min, float max, float t)
        {
            if (t < 1)
                return Mathf.Lerp(0, min, t);
            else
                return Mathf.Lerp(min, max, t - 1);
        }

#if UNITY_EDITOR
        void OnDrawGizmos()
        {
            if(gizmosVisibility == GizmosVisibility.AlwaysVisible)
                DrawWindDirectionGizmo(transform.position, 1);
        }

        public void DrawWindDirectionGizmo(Vector3 pos, float arrowHeadLength = 0.25f, float arrowHeadAngle = 20.0f)
        {
            Vector3 direction = Quaternion.Euler(0, windDirection, 0) * new Vector3(0, 0, 1) * 3;
            Vector3 right = Quaternion.LookRotation(direction) * Quaternion.Euler(0, 180 + arrowHeadAngle, 0) * new Vector3(0, 0, 1);
            Vector3 left = Quaternion.LookRotation(direction) * Quaternion.Euler(0, 180 - arrowHeadAngle, 0) * new Vector3(0, 0, 1);

            Handles.color = Color.green;
            Handles.DrawLine(pos, pos + direction);
            Handles.DrawLine(pos + direction, pos + direction + right * arrowHeadLength);
            Handles.DrawLine(pos + direction, pos + direction + left * arrowHeadLength);
        }
#endif

    }
}
