using UnityEngine;
using UnityEditor;

namespace Nicrom.Constants
{
    public static class CONSTANT
    {
        public static Color CategoryColor
        {
            get
            {
                if (EditorGUIUtility.isProSkin)
                {
                    return ColorDarkGray;
                }
                else
                {
                    return ColorLightGray;
                }
            }
        }

        public static Color TopLineColor
        {
            get
            {
                if (EditorGUIUtility.isProSkin)
                {
                    return new Color(0.15f, 0.15f, 0.15f, 1.0f);
                }
                else
                {
                    return new Color(0.65f, 0.65f, 0.65f, 1.0f);
                }
            }
        }

        public static Color FoldoutHeaderColor
        {
            get
            {
                if (EditorGUIUtility.isProSkin)
                {
                    return new Color(0.9f, 0.9f, 0.9f, 1.0f);
                }
                else
                {
                    return new Color(0.9f, 0.9f, 0.9f, 1.0f);
                }
            }
        }

        public static Color BottomLineColor
        {
            get
            {
                if (EditorGUIUtility.isProSkin)
                {
                    return new Color(0.18f, 0.18f, 0.18f, 1.0f);
                }
                else
                {
                    return new Color(0.72f, 0.72f, 0.72f, 1.0f);
                }
            }
        }

        public static Color ColorDarkGray
        {
            get {
                return new Color(0.195f, 0.195f, 0.195f, 1.0f);
            }
        }

        public static Color ColorLightGray
        {
            get
            {
                return new Color(0.75f, 0.75f, 0.75f, 1.0f);
            }
        }

        public static Color BackgroundColor
        {
            get
            {
                return new Color(0.9f, 0.9f, 0.9f, 1.0f);
            }
        }

        //public static GUIStyle TitleStyle
        //{
        //    get
        //    {
        //        GUIStyle guiStyle = new GUIStyle("label")
        //        {
        //            richText = true,
        //            alignment = TextAnchor.MiddleCenter
        //        };

        //        return guiStyle;
        //    }
        //}

        //public static GUIStyle HeaderStyle
        //{
        //    get
        //    {
        //        GUIStyle guiStyle = new GUIStyle("label")
        //        {
        //            richText = true,
        //            fontStyle = FontStyle.Bold,
        //            alignment = TextAnchor.MiddleLeft
        //        };

        //        return guiStyle;
        //    }
        //}
    }
}

