using UnityEngine;
using System.IO;
using System;
#if UNITY_EDITOR
using UnityEditor;
#endif 

namespace Nicrom
{
    public class ScriptableObject_Menu
    {
#if UNITY_EDITOR
        const string envProfileName = "New Environment Profile";
        const string windProfileName = "New Wind Profile";

        [MenuItem("Assets/Create/Nicrom/Environment Profile", false, 101)]
        public static void CreateEnvironmentProfile()
        {
            ScriptableObject so = ScriptableObject.CreateInstance<EnvironmentProfile>();
            CreateAsset(so, envProfileName);
        }

        [MenuItem("Assets/Create/Nicrom/Wind Profile", false, 102)]
        public static void CreateWindProfile()
        {
            ScriptableObject so = ScriptableObject.CreateInstance<WindProfile>();
            CreateAsset(so, windProfileName);
        }

        public static void CreateAsset(ScriptableObject so, string baseName, bool focus = true)
        {
            Type type = System.Reflection.MethodBase.GetCurrentMethod().DeclaringType;
            string folder;

#if UNITY_6000_3_OR_NEWER
            folder = AssetDatabase.GetAssetPath(Selection.activeEntityId);
#else
            folder = AssetDatabase.GetAssetPath(Selection.activeInstanceID);
#endif
            if (Path.GetExtension(folder) != "") folder = Path.GetDirectoryName(folder);
            if (folder == "") folder = "Assets";

            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            string name = folder + "/" + baseName + ".asset";
            int id = 0;

            while (AssetDatabase.LoadAssetAtPath(name, type) != null)
            {
                id += 1;
                name = folder + "/" + baseName + id + ".asset";
            }

            AssetDatabase.CreateAsset(so, name);
            AssetDatabase.SaveAssets();

            if (focus)
            {
                EditorUtility.FocusProjectWindow();
                Selection.activeObject = so;
            }
        }       
#endif
    }
}
