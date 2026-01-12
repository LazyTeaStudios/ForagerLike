using UnityEngine;

namespace Nicrom
{
#if UNITY_EDITOR
    [ExecuteInEditMode]
#endif
    public class SGPManager : MonoBehaviour
    {
        public bool showBlendWithTerrainGroup = true;
        public bool blendWithTerrain = true;
        public Texture2D terrainColorMap;
        public Vector2 terrainPosition = new Vector2(-500, -500);
        public float terrainSize = 1000f;

        public bool showGrassGroup = true;
        [Range(0, 2000)]
        public float grassDistanceFadeStart = 30f;
        [Range(0, 2000)]
        public float grassDistanceFadeLength = 70f;
        [Range(0, 1000)]
        public float flowerDistanceFadeStart = 30f;
        [Range(0, 1000)]
        public float flowerDistanceFadeLength = 70f;

        public bool showFlowerGroup = true;
        [Range(0, 4)]
        public float grassMask2Tiling = 0.1f;
        [Range(0, 3)]
        public float grassMask2Speed = 1f;
        [Range(0, 1)]
        public float grassMask2SharpMin = 0f;
        [Range(0, 1)]
        public float grassMask2SharpMax = 1f;
        [Range(0, 1)]
        public float grassMask2Opacity = 1f;

        [Range(0, 4)]
        public float flowerMask2Tiling = 0.1f;
        [Range(0, 3)]
        public float flowerMask2Speed = 1f;
        [Range(0, 1)]
        public float flowerMask2SharpMin = 0f;
        [Range(0, 1)]
        public float flowerMask2SharpMax = 1f;
        [Range(0, 1)]
        public float flowerMask2Opacity = 1f;

        private void Start()
        {
            SetShaderGlobalProperties();
        }

        private void OnEnable()
        {
            SetShaderGlobalProperties();
        }

        private void OnDisable()
        {
            Shader.SetGlobalTexture("Nicrom_TerrainColorMap", null);
        }

        public void SetShaderGlobalProperties()
        {
            SetBWTGlobalProperties();
            SetGrassGlobalProperties();
            SetFlowerGlobalProperties();
        }

        private void SetBWTGlobalProperties()
        {
            if (terrainColorMap != null && blendWithTerrain)
                Shader.SetGlobalTexture("Nicrom_TerrainColorMap", terrainColorMap);
            else
                Shader.SetGlobalTexture("Nicrom_TerrainColorMap", null);

            Shader.SetGlobalFloat("Nicrom_TerrainSize", terrainSize);
            Shader.SetGlobalVector("Nicrom_TerrainPosition", terrainPosition);
        }

        private void SetGrassGlobalProperties()
        {
            Shader.SetGlobalFloat("Nicrom_Grass_DF_Start", grassDistanceFadeStart);
            Shader.SetGlobalFloat("Nicrom_Grass_DF_Length", grassDistanceFadeLength);

            Shader.SetGlobalFloat("Nicrom_Grass_CM2_Tilling", grassMask2Tiling);
            Shader.SetGlobalFloat("Nicrom_Grass_CM2_Speed", grassMask2Speed);
            Shader.SetGlobalFloat("Nicrom_Grass_CM2_SharpMin", grassMask2SharpMin);
            Shader.SetGlobalFloat("Nicrom_Grass_CM2_SharpMax", grassMask2SharpMax);
            Shader.SetGlobalFloat("Nicrom_Grass_CM2_Opacity", grassMask2Opacity);
        }

        private void SetFlowerGlobalProperties()
        {
            Shader.SetGlobalFloat("Nicrom_Flower_DF_Start", flowerDistanceFadeStart);
            Shader.SetGlobalFloat("Nicrom_Flower_DF_Length", flowerDistanceFadeLength);

            Shader.SetGlobalFloat("Nicrom_Flower_CM2_Tilling", flowerMask2Tiling);
            Shader.SetGlobalFloat("Nicrom_Flower_CM2_SharpMin", flowerMask2SharpMin);
            Shader.SetGlobalFloat("Nicrom_Flower_CM2_SharpMax", flowerMask2SharpMax);
            Shader.SetGlobalFloat("Nicrom_Flower_CM2_Opacity", flowerMask2Opacity);
        }
    }
}
