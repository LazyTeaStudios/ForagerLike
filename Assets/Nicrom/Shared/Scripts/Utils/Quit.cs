using UnityEngine;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace Nicrom
{
    public class Quit : MonoBehaviour
    {
        public bool quitInEditor = false;
        private float count = 10f;

        // Update is called once per frame
        void Update()
        {
#if UNITY_EDITOR
            count += Time.deltaTime;

            if (Input.GetKeyDown("escape"))
            {
                if (count < 2.5f && quitInEditor)
                    EditorApplication.isPlaying = false;
                
                count = 0;
            }
#else
            if (Input.GetKeyDown(KeyCode.End))
                Application.Quit();
#endif
        }
    }
}
