using UnityEngine;

namespace Nicrom
{
    public enum RenderTextureSize
    {
        _32 = 32,
        _64 = 64,
        _128 = 128,
        _256 = 256,
        _512 = 512,
        _1024 = 1024,
        _2048 = 2048,
        _4096 = 4096
    }

    public class CloudShadows : MonoBehaviour
    {
        public RenderTextureSize cloudShadowsRTSize = RenderTextureSize._512;
        public Light directionalLight;
        public CustomRenderTexture cloudShadowsRT;
        public Material cloudShadowsMaterial;
        public bool cloudShadowsState = true;
        public bool showCloudShadowsMI = false;

        [Range(0, 1000)]
        public int lightCookieSize = 80;
        [Range(0, 1f)]
        public float cloudShadowsStrength = 0.6f;

        public void Start()
        {
            directionalLight = GetComponent<Light>();
        }

        public void UpdateCloudShadowsSettings(bool recreateCRT = false) 
        {
            if(cloudShadowsRT != null && recreateCRT)
                RecreateCRT();

            if (directionalLight != null)
            {
                if (cloudShadowsState && cloudShadowsRT != null)
                    directionalLight.cookie = cloudShadowsRT;
                else
                    directionalLight.cookie = null;

                LightUtils.SetLightCookieSize(directionalLight, lightCookieSize);
            }

            if (cloudShadowsMaterial != null)
                cloudShadowsMaterial.SetFloat("_ShadowStrength", cloudShadowsStrength);

            UpdateRTM();
        }

        public void UpdateRTM()
        {
            if (cloudShadowsMaterial != null)
            {
                if(cloudShadowsRT.material != cloudShadowsMaterial)
                    cloudShadowsRT.material = cloudShadowsMaterial;
                if(cloudShadowsRT.initializationMaterial != cloudShadowsMaterial)
                    cloudShadowsRT.initializationMaterial = cloudShadowsMaterial;
            }
        }

        public void RecreateCRT()
        {
            Vector2Int rtSize = GetRTSize();
            cloudShadowsRT.Release();
            cloudShadowsRT.width = rtSize.x;
            cloudShadowsRT.height = rtSize.y;
            cloudShadowsRT.Create();
        }

        public Vector2Int GetRTSize()
        {
            Vector2Int rtSize;

            if (cloudShadowsRTSize == RenderTextureSize._32)
                rtSize = new Vector2Int(32, 32);
            else if (cloudShadowsRTSize == RenderTextureSize._64)
                rtSize = new Vector2Int(64, 64);
            else if (cloudShadowsRTSize == RenderTextureSize._128)
                rtSize = new Vector2Int(128, 128);
            else if (cloudShadowsRTSize == RenderTextureSize._256)
                rtSize = new Vector2Int(256, 256);
            else if (cloudShadowsRTSize == RenderTextureSize._512)
                rtSize = new Vector2Int(512, 512);
            else if (cloudShadowsRTSize == RenderTextureSize._1024)
                rtSize = new Vector2Int(1024, 1024);
            else if (cloudShadowsRTSize == RenderTextureSize._2048)
                rtSize = new Vector2Int(2048, 2048);
            else
                rtSize = new Vector2Int(4096, 4096);

            return rtSize;
        }
    }
}
